USE ssi;
GO

/**********************************************************************************************
**	Name: CreateMaterialType
**	Desc: Created Material Type
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('CreateMaterialType') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE CreateMaterialType;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE CreateMaterialType
(
	@name_materialType VARCHAR(255)
	,@id BIGINT OUTPUT
	--,@mesage varchar(150) output
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DECLARE @name_type varchar(255) = (SELECT name_type FROM [dbo].[material_type] WHERE name_type = @name_materialType)
	IF @name_type IS NOT NULL
	BEGIN
		DECLARE @datos varchar(250) = (select name_type from [dbo].[material_type] where name_type=@name_materialType)
		PRINT 'SQLServer> Ya tiene registrado ese matrial type...!'+char(13)+'SQLServer> Material Type:'+' '+@datos;
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[material_type](name_type) VALUES (@name_materialType);
		SET @id = @@IDENTITY;
	END

END
GO
PRINT 'SQLServer> Execution procedure CreateMaterialType successfully...';
GO

/**********************************************************************************************
**	Name: UpdateMaterialType
**	Desc: Update Material Type
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('UpdateMaterialType') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE UpdateMaterialType;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE UpdateMaterialType
(
	@materialTypeID BIGINT
	,@new_materialTypeName VARCHAR(255)
	,@id BIGINT OUTPUT
	--,@mesage varchar(250) output
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DECLARE @name varchar(255) = (SELECT name_type FROM [dbo].[material_type] WHERE id=@materialTypeID)
	IF @new_materialTypeName IS NOT NULL and @new_materialTypeName <> ''
	BEGIN
		UPDATE [dbo].[material_type]
		SET name_type = @new_materialTypeName
		WHERE id = @materialTypeID;
		--SET @id = @@IDENTITY;
		select @id = id FROM [dbo].[material_type] WHERE id = @materialTypeID;

	END
	ELSE
	BEGIN
		PRINT'SQLServer> Si desea modificar material type el dato debe ser diferente de '+char(13)+'SQLServer> '''+@new_materialTypeName+''' '+', NULL'+char(13)+'SQLServer> Si desea update verifique el dato a modificar.';
	END

END
GO
PRINT 'SQLServer> Execution procedure UpdateMaterialType successfully...';
GO

/**********************************************************************************************
**	Name: DeleteMaterialType
**	Desc: Delete Material Type
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('DeleteMaterialType') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE DeleteMaterialType;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE DeleteMaterialType
(
	@materialTypeID BIGINT
	--,@mesage varchar(250) output
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	DECLARE @relationship BIGINT = (SELECT m.material_type_id
											FROM [dbo].[material_type] as mt
											JOIN [dbo].[material] as m on (mt.id=m.material_type_id)
											WHERE m.material_type_id=@materialTypeID);
	DECLARE @relationship2 BIGINT = (SELECT id FROM [dbo].[material_type] WHERE id=@materialTypeID);
	IF @relationship IS NULL and @relationship2 > 0
	BEGIN
		DELETE FROM [dbo].[material_type]
		output deleted.id
		WHERE id = @materialTypeID;
		--SET @mesage = 'SQLServer> MaterialType de elimino con exito...!';
	END
	ELSE
	BEGIN
		PRINT 'SQLServer> No se puede eliminar tiene relationship con Tabla Material o no existe el MaterialType...!';
	END
END
GO
PRINT 'SQLServer> Execution procedure DeleteMaterialType successfully...';
GO

/**********************************************************************************************
**	Name: GetAllMaterialType
**	Desc: Get all list the Material Type
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('GetAllMaterialType') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE GetAllMaterialType;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE GetAllMaterialType
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[material_type]
	--ET @mesage = 'SQLServer> No se puede eliminar tiene relationship con Tabla Material o no existe el MaterialType...!';
END
GO
PRINT 'SQLServer> Execution procedure GatAllteMaterialType successfully...';
GO

/**********************************************************************************************
**	Name: GetMaterialTypeById
**	Desc: Get Material Type for Id
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('GetMaterialTypeById') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE GetMaterialTypeById;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE GetMaterialTypeById
(
	@materialTypeID bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[material_type] WHERE id = @materialTypeID;
	--ET @mesage = 'SQLServer> No se puede eliminar tiene relationship con Tabla Material o no existe el MaterialType...!';
END
GO
PRINT 'SQLServer> Execution procedure GetMaterialTypeById successfully...';
GO

/**********************************************************************************************
**	Name: GetStoreById
**	Desc: Get Store for Id
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
--GetStoreById-----------------------------------------
IF OBJECT_ID('GetStoreById') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE GetStoreById;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE GetStoreById
(
	@StoreID int output
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	select @StoreID=id from [dbo].[store] where id = @StoreID;
END
GO
PRINT 'SQLServer> Execution procedure GetStoreById successfully...';
GO

/**********************************************************************************************
**	Name: LoadStockStore
**	Desc: If exist Store record increments the stock else insert a new record the Store with stock
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('LoadStockStore') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE LoadStockStore;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE LoadStockStore
(
	@name_store varchar(150)
	,@stock int
	,@materialID bigint
	,@StoreID bigint output
	--,@mesage varchar(250) output
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	--declare @id_mat int;
	IF @name_store IS NOT NULL and  @stock IS NOT NULL
	BEGIN
		IF (select id from [dbo].[store] where materialID = @materialID) is not null
		BEGIN
			UPDATE [dbo].[store]
			SET stock = (stock + @stock)
			output inserted.id
			WHERE id = (select id from [dbo].[store] where materialID = @materialID);
		END
		ELSE
		BEGIN
			insert into [dbo].[store] (name,stock,materialID) values(@name_store,@stock,@materialID);
			SET @StoreID = @@IDENTITY;
		END

	END
	ELSE
	BEGIN
		PRINT 'SQLServer> Si desea cargar Equipos de Seguridad al Store es necesario ingresar NameStore, Stock...!';
	END
END
GO
PRINT 'SQLServer> Execution procedure LoadStore successfully...';
GO

/**********************************************************************************************
**	Name: DecrementQuantityStore
**	Desc: Decrements the stock when segurity material is assigned to the Employee
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 25/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 25/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/

IF OBJECT_ID('DecrementQuantityStore') IS NOT NULL
BEGIN
	print 'SQLServer> Preparando para la ejecucion de procedimiento almacenado...';
	DROP PROCEDURE DecrementQuantityStore;
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
ELSE
BEGIN
	print 'SQLServer> Ejecutando el procedimiento almacenado...';
END
GO

CREATE PROCEDURE DecrementQuantityStore
(
	@quantity int
	,@materialID bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	IF (select id from [dbo].[store] where materialID = @materialID) is not null
	BEGIN
		IF (select stock from [dbo].[store] where materialID = @materialID)>=@quantity
		BEGIN
			UPDATE [dbo].[store]
			SET stock = (stock - @quantity)
			output inserted.id
			WHERE id = (select id from [dbo].[store] where materialID = @materialID);
		END
		ELSE
		BEGIN
			PRINT 'SQLServer> No tiene material la cantidad diponible en Store...';
		END
	END
	ELSE
	BEGIN
		PRINT 'SQLServer> No tiene material en Store...';
	END

END
GO
PRINT 'SQLServer> Execution procedure LoadStore successfully...';
GO


