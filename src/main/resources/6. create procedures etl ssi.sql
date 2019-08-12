USE ssi;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN
EXEC('CREATE SCHEMA ETL')
END

PRINT 'DROP TABLES';
GO


IF OBJECT_ID('[ETL].[TableMigration]', 'U') IS NOT NULL
	DROP TABLE [ETL].[TableMigration];
	PRINT 'DROP TABLE TABLEMIGRATION';

CREATE TABLE [ETL].[TableMigration](
	[IDMigration] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LatestChange] [bigint] NOT NULL CONSTRAINT [DF_Migration]  DEFAULT ((0)),
 CONSTRAINT [PK_Migration] PRIMARY KEY CLUSTERED 
(
	[IDMigration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'CREATE TABLE MIGRATION';
GO

IF  EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE 
        object_id = OBJECT_ID(N'[ETL].[GetDatabaseRowVersion]')
         AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DROP FUNCTION [ETL].[GetDatabaseRowVersion]
END
GO

CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO

/******************************************************************************
**  Name: ETL.GetTableMigrationLatestRowVersion
**  Desc: 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE 
        object_id = OBJECT_ID(N'[ETL].[GetTableMigrationLatestRowVersion]')
         AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
DROP FUNCTION [ETL].[GetTableMigrationLatestRowVersion];
END
GO

CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion]
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;

	SELECT @last = LatestChange
	FROM [ETL].[TableMigration]
	WHERE TableName = @table;

  RETURN @last;
END
GO

/******************************************************************************
**  Name: ETL.GetTableMigrationLatestRowVersion
**  Desc: 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[GetIncidentDetailChangesByRowVersion]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[GetIncidentDetailChangesByRowVersion];
END
GO

CREATE PROCEDURE [ETL].[GetIncidentDetailChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT i.[id]
		  ,i.[working_turn]
		  ,i.[accident_site]
		  ,it.name
		  ,ia.name
		  ,lt.type
	FROM [dbo].[incident]          i
	LEFT OUTER JOIN incident_type it ON (i.incident_type_id = it.id)
	LEFT OUTER JOIN incident_agent ia ON (i.incident_agent_id = ia.id)
	LEFT OUTER JOIN lesion_type lt ON (i.incident_agent_id = lt.id)
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
GO


/******************************************************************************
**  Name: ETL.GetEmployeeChangesByRowVersion
**  Desc: 
**  Called By SQL Job ETL
**
**  Author: Edwin ROjas
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[GetEmployeeChangesByRowVersion]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[GetEmployeeChangesByRowVersion];
END
GO

CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	SELECT e.[id]
		  ,e.[first_name] + ' ' + e.[last_name]
		  ,e.[ci]
		  ,e.[phone]
		  ,et.[name]
		  ,perinf.[registration_date]
	FROM [dbo].[employee]          e
	LEFT OUTER JOIN employee_type et ON (e.employee_type_id = et.id)
	LEFT OUTER JOIN personal_information perinf ON (e.id = perinf.employee_id)
	WHERE e.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND e.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)

GO

/******************************************************************************
**  Name: ETL.GetIncidentChangesByRowVersion
**  Desc: 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[GetIncidentChangesByRowVersion]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[GetIncidentChangesByRowVersion];
END
GO
CREATE PROCEDURE [ETL].[GetIncidentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT incident_detail_id = i.[id]
	      ,employee_id    = e.[id]
		  ,date        = i.[accident_date]
	FROM [dbo].[incident]           i
	INNER JOIN [dbo].[employee]           e ON (i.employee_id =e.id)
	WHERE i.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND i.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO

/******************************************************************************
**  Name: ETL.UpdateTableMigration
**  Desc: 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[UpdateTableMigration]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[UpdateTableMigration];
END
GO

CREATE PROCEDURE [ETL].[UpdateTableMigration]
(
  @tableName VARCHAR(50),
  @current     BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE [ETL].[TableMigration]
	SET LatestChange = @current
	WHERE TableName = @tableName;
GO


IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[PullDataToDatawarehouse]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[PullDataToDatawarehouse];
END
GO
GO

CREATE PROCEDURE [ETL].[PullDataToDatawarehouse]
(
  @table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DWssi].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
GO


PRINT 'Initialize Table Migration...';
INSERT INTO [ETL].[TableMigration]([TableName]
								  ,[LatestChange])
VALUES ('IncidentDetail',0)
	  ,('Employee',0)
	  ,('Incident',0);
GO
PRINT 'Table Migration initialization done...';

