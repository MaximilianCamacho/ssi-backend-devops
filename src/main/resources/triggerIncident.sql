/*creacion de la tabla para auditoria*/
PRINT 'create table auditory incident';
GO
if OBJECT_ID('dbo.IncidentHistory', 'U') is not null
	drop table dbo.IncidentHistory;
BEGIN
CREATE TABLE dbo.IncidentHistory(
	id INT NOT NULL IDENTITY(1,1),
	tableName VARCHAR(100) NOT NULL,
	columnName VARCHAR(100) NOT NULL,
	actionType VARCHAR(20),
	oldValue VARCHAR(300),
	newValue VARCHAR(300),
	modifyDate DATE NOT NULL,
	constraint pk_IncidentHistory primary key(id)
)
END
GO

/*creacion del trigger para auditoria de datos tabla incident*/
IF OBJECT_ID ('Auditory_Incident_trigger', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER [dbo].[Auditory_Incident_trigger];
END
GO

CREATE TRIGGER dbo.Auditory_Incident_trigger ON dbo.incident FOR INSERT, UPDATE, DELETE
AS

DECLARE @bit int ,
        @field int ,
        @maxfield int ,
        @char int ,
        @fieldname varchar(128) ,
        @TableName varchar(128) ,
        @PKCols varchar(1000) ,
        @sql varchar(2000),
        @UpdateDate varchar(21) ,
        @UserName varchar(128) ,
        @Type varchar(20) ,
        @PKSELECT varchar(1000)

SELECT @TableName = 'incident'
-- Fecha
SELECT @UpdateDate = convert(varchar(8), getdate(), 112) + ' ' + convert(varchar(12), getdate(), 114)

SET NoCount ON

-- Identificar que evento se esta ejecutando (Insert, Update o Delete)
--en base a cursores especiales (inserted y deleted)
if exists (SELECT * FROM inserted)
  if exists (SELECT * FROM deleted) --Si es un update
    SELECT @Type = 'UPDATE'
  else                              --Si es un insert
    SELECT @Type = 'INSERT'
else                                --si es un delete
    SELECT @Type = 'DELETE'

-- Obtenemos la lista de columnas de los cursores
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Obtener las columnas de llave primaria
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
    JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
WHERE pk.TABLE_NAME = @TableName AND pk.CONSTRAINT_TYPE = 'PRIMARY KEY'

-- Obtener la llave primaria y columnas para la inserci�n en la tabla de auditoria
SELECT
 @PKSELECT = coalesce(@PKSelect+'+','') + '''<' + COLUMN_NAME + '=''+convert(varchar(100),coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''>'''
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
 JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
  ON c.TABLE_NAME = pk.TABLE_NAME AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 WHERE pk.TABLE_NAME = @TableName
  AND CONSTRAINT_TYPE = 'PRIMARY KEY'

if @PKCols is null --<-- Este trigger solo funciona si la tabla tiene llave primaria
 BEGIN
  RAISERROR('no PK on table %s', 16, -1, @TableName)
  RETURN
 END

--Loop para armar el query de insercion en la tabla de log.
--Un registro por cada campo afectado.
SELECT
 @field = 0,
 @maxfield = max(ORDINAL_POSITION)
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = @TableName

while @field < @maxfield
 BEGIN
  SELECT @field = min(ORDINAL_POSITION)
   FROM INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_NAME = @TableName and ORDINAL_POSITION > @field
  SELECT @bit = (@field - 1 )% 8 + 1
  SELECT @bit = power(2,@bit - 1)
  SELECT @char = ((@field - 1) / 8) + 1
  if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('INSERT','DELETE')
   BEGIN

     SELECT @fieldname = COLUMN_NAME
      FROM INFORMATION_SCHEMA.COLUMNS
	  WHERE TABLE_NAME = @TableName and ORDINAL_POSITION = @field
    /*para insertar el dato modificado en la tabla de auditoria*/
     SELECT @sql = 'insert incidentHistory (actionType, tableName, columnName, oldValue, newValue, modifyDate)'
     SELECT @sql = @sql + 	' SELECT ''' + @Type + ''''
     SELECT @sql = @sql + 	',''' + @TableName + ''''
     SELECT @sql = @sql + 	',''' + @fieldname + ''''
     SELECT @sql = @sql + 	',convert(varchar(1000),d.' + @fieldname + ')'
     SELECT @sql = @sql + 	',convert(varchar(1000),i.' + @fieldname + ')'
     SELECT @sql = @sql + 	',''' + @UpdateDate + ''''
     SELECT @sql = @sql + 	' from #ins i full outer join #del d'
     SELECT @sql = @sql + 	@PKCols
     SELECT @sql = @sql + 	' where i.' + @fieldname + ' <> d.' + @fieldname
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is null and  d.' + @fieldname + ' is not null)'
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is not null and  d.' + @fieldname + ' is null)'
     exec (@sql)

   END
 END

SET NoCount OFF
GO


