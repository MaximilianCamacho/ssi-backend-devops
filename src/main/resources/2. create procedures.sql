USE ssi;

PRINT 'Start';
GO

/*procedure to create incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[create_incident_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_incident_type];
END
GO
CREATE PROCEDURE [dbo].[create_incident_type]
(
    @name VARCHAR(50),
    @description VARCHAR(100),
    @incident_type_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[incident_type](name, description)
    VALUES(@name, @description);
    SELECT @incident_type_id = @@IDENTITY;
    PRINT @incident_type_id;
END
GO

PRINT 'Procedure create_incident_type was created successfully'
GO


/*procedure to update incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[update_incident_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_incident_type];
END
GO
CREATE PROCEDURE [dbo].[update_incident_type]
(
	@id INT,
    @name VARCHAR(50),
    @description VARCHAR(100),
	@is_deleted BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident_type] 
	SET name = @name,
	description = @description,
	is_deleted = @is_deleted
	WHERE id = @id;
END
GO

PRINT 'Procedure update_incident_type was created successfully'
GO


/*procedure to delete incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[delete_incident_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_incident_type];
END
GO
CREATE PROCEDURE [dbo].[delete_incident_type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident_type] 
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_incident_type was created successfully'
GO

/*procedure to get incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_incident_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_incident_type];
END
GO
CREATE PROCEDURE [dbo].[get_incident_type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_type]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_incident_type was created successfully'
GO


/*procedure to get all incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_incident_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_incident_type];
END
GO
CREATE PROCEDURE [dbo].[get_all_incident_type]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_type]
END
GO

PRINT 'Procedure get_all_incident_type was created successfully'
GO

/*procedure to create incident*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_incident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_incident];
END
GO
CREATE PROCEDURE [dbo].[create_incident]
(
    @accident_date DATE,
    @accident_day VARCHAR(255),
    @accident_site VARCHAR(255),
    @accident_time VARCHAR(255),
    @affected_part VARCHAR(255),
    @working_turn VARCHAR(255),
    @employee_id INT,
    @incident_agent_id INT,
    @incident_type_id INT,
    @lesion_type_id INT,
    @incident_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[incident](accident_date, accident_day, accident_site, accident_time, affected_part, is_deleted, working_turn, employee_id, incident_agent_id, incident_type_id, lesion_type_id)
    VALUES(@accident_date, @accident_day, @accident_site, @accident_time, @affected_part, 0, @working_turn, @employee_id, @incident_agent_id, @incident_type_id, @lesion_type_id);
    SELECT @incident_id = @@IDENTITY;
END
GO

PRINT 'Procedure create_incident was created successfully'
GO


/*procedure to update incident*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[update_incident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_incident];
END
GO
CREATE PROCEDURE [dbo].[update_incident]
(
	@id INT,
    @accident_date DATE,
    @accident_day VARCHAR(255),
    @accident_site VARCHAR(255),
    @accident_time VARCHAR(255),
    @affected_part VARCHAR(255),
    @working_turn VARCHAR(255),
    @employee_id INT,
    @incident_agent_id INT,
    @incident_type_id INT,
    @lesion_type_id INT,
	@is_deleted BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident]
	SET accident_date = @accident_date,
	accident_day = @accident_day,
	accident_site = @accident_site,
	accident_time = @accident_time,
	affected_part = @affected_part,
	working_turn = @working_turn,
	employee_id = @employee_id,
	incident_agent_id = @incident_agent_id,
	incident_type_id = @incident_type_id,
	lesion_type_id = @lesion_type_id,
	is_deleted = @is_deleted
	WHERE id = @id;
END
GO

PRINT 'Procedure update_incident was created successfully'
GO


/*procedure to delete incident*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_incident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_incident];
END
GO
CREATE PROCEDURE [dbo].[delete_incident]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident]
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_incident was created successfully'
GO


/*procedure to get incident*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_incident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_incident];
END
GO
CREATE PROCEDURE [dbo].[get_incident]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_incident was created successfully'
GO


/*procedure to get all incident*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_incident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_incident];
END
GO
CREATE PROCEDURE [dbo].[get_all_incident]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident]
END
GO

PRINT 'Procedure get_all_incident was created successfully'
GO


/*procedure to create employee_type*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_employee_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_employee_type];
END
GO
CREATE PROCEDURE [dbo].[create_employee_type]
(
    @description VARCHAR(255),
    @name VARCHAR(255),
    @employee_type_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[employee_type](description, name)
    VALUES(@description, @name);
    SELECT @employee_type_id = @@IDENTITY;
END
GO

PRINT 'Procedure create_employee_type was created successfully'
GO


/*procedure to update employee_type*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[update_employee_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_employee_type];
END
GO
CREATE PROCEDURE [dbo].[update_employee_type]
(
	@id INT,
    @description VARCHAR(255),
    @name VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[employee_type]
	SET description = @description,
	name = @name
	WHERE id = @id;
END
GO

PRINT 'Procedure update_employee_type was created successfully'
GO


/*procedure to get employee_type*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_employee_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_employee_type];
END
GO
CREATE PROCEDURE [dbo].[get_employee_type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[employee_type]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_employee_type was created successfully'
GO


/*procedure to get all employee_type*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_employee_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_employee_type];
END
GO
CREATE PROCEDURE [dbo].[get_all_employee_type]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[employee_type]
END
GO

PRINT 'Procedure get_all_employee_type was created successfully'
GO

/*procedure to delete employeeType*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_employee_Type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_employee_Type];
END
GO
CREATE PROCEDURE [dbo].[delete_employee_Type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[employee_type]
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_employee_type was created successfully'
GO

/*procedure to create area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_area]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_area];
END
GO
CREATE PROCEDURE [dbo].[create_area]
(
    @codigo VARCHAR(255),
    @description VARCHAR(255),
	@name VARCHAR(255),
    @area_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[area](codigo, is_deleted, description, name)
    VALUES(@codigo, 0, @description, @name);
    SELECT @area_id = @@IDENTITY;
END
GO

PRINT 'Procedure create_area was created successfully'
GO


/*procedure to update area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[update_area]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_area];
END
GO
CREATE PROCEDURE [dbo].[update_area]
(
	@id INT,
    @description VARCHAR(255),
    @name VARCHAR(255),
	@codigo VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[area]
	SET description = @description,
	name = @name,
	codigo = @codigo
	WHERE id = @id;
END
GO

PRINT 'Procedure update_area was created successfully'
GO


/*procedure to get area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_area]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_area];
END
GO
CREATE PROCEDURE [dbo].[get_area]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[area]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_area was created successfully'
GO


/*procedure to get all area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_area]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_area];
END
GO
CREATE PROCEDURE [dbo].[get_all_area]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[area]
END
GO

PRINT 'Procedure get_all_area was created successfully'
GO


/*procedure to create incident_tag*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_incident_tag]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_incident_tag];
END
GO
CREATE PROCEDURE [dbo].[create_incident_tag]
(
    @name VARCHAR(50),
    @incident_tag_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[incident_tag](name)
    VALUES(@name);
    SELECT @incident_tag_id = @@IDENTITY;
    PRINT @incident_tag_id;
END
GO

PRINT 'Procedure create_incident_tag was created successfully'
GO


/*procedure to update incident_tag*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[update_incident_tag]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_incident_tag];
END
GO
CREATE PROCEDURE [dbo].[update_incident_tag]
(
	@id INT,
  @name VARCHAR(50)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident_tag]
	  SET name = @name
	  WHERE id = @id;
END
GO

PRINT 'Procedure update_incident_tag was created successfully'
GO

/*procedure to get incident_tag*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_incident_tag]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_incident_tag];
END
GO
CREATE PROCEDURE [dbo].[get_incident_tag]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_tag]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_incident_tag was returned'
GO


/*procedure to get all incident_type*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_incident_tag]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_incident_tag];
END
GO
CREATE PROCEDURE [dbo].[get_all_incident_tag]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_tag]
END
GO

PRINT 'Procedure get_all_incident_tag was returned'
GO


/*procedure to create incident_incident_tag*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_incident_incident_tag]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_incident_incident_tag];
END
GO
CREATE PROCEDURE [dbo].[create_incident_incident_tag]
(
    @incident_id int,
    @incident_tag_id int
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    DECLARE @incidentId int, @incidentTagId int
    SELECT @incidentid = id FROM incident WHERE id=@incident_id
    SELECT @incidentTagId = id FROM incident_tag WHERE id=@incident_tag_id
    IF(@incidentId is not null AND @incidentTagId is not null)
    BEGIN
      INSERT INTO [dbo].[incident_incident_tag](incident_id, incident_tags_id)
      VALUES(@incidentid, @incidentTagId);
    END
END
GO

PRINT 'Procedure create_incident_incident_tag was created successfully'
GO

/*
*******************************************************************************
**                            Change History
*******************************************************************************
**  table  capacity
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 25/06/2018 Henry  J . Calani A.   Initial version
*******************************************************************************/


----------------    Procedimientos almacenados Capacity  ------------------
PRINT 'Start of Script Execution....';
GO

-- procedure to create capacity.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[create_capacity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[create_capacity]
END
GO

/****
************************************************************************
************    CREATE PROCEDURE  CREATE    ****************************
************                                ****************************
************         FOR CAPACITY           ****************************
************************************************************************
****/

CREATE PROCEDURE [dbo].[create_capacity]
(
	 @name VARCHAR(50)
	,@description VARCHAR(50)
	,@is_deleted  bit
	,@id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[Capacity](name
								,description
								,is_deleted
								,id)
	VALUES (@name
			,@description
			,@is_deleted
			,@id);

	SELECT @id = @@IDENTITY;
	PRINT @id;
END
GO
PRINT 'Procedure [dbo].[Capacity] created'
GO



/****
**************************************************************************
************     PROCEDURE  GET  CAPACITY  ****************************
************                                  ****************************
************         FOR CAPACITY  ID             ****************************
**************************************************************************
****/


/*procedure to get area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_capacity]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_capacity];
END
GO
CREATE PROCEDURE [dbo].[get_capacity]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[capacity]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_capacity was created successfully'
GO


/****
************************************************************************
************    CREATE PROCEDURE  UPDATE    ****************************
************                                ****************************
************         FOR CAPACITY           ****************************
************************************************************************
****/

-- Update Calacity  procedure.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[update_capacity]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[update_capacity]
END
GO
PRINT 'Procedure [dbo].[update_capacity] created complete'
GO

CREATE PROCEDURE [dbo].[update_capacity]
(

	 @id INT
	,@name VARCHAR(50)
	,@description VARCHAR(50)
	,@is_deleted  bit
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[capacity] SET  name = @name
								,description = @description
								,is_deleted = @is_deleted
						     	WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[update_capacity] update complete'
GO


/****
**************************************************************************
************     PROCEDURE  GET ALL CAPACITY  ****************************
************                                  ****************************
************         FOR CAPACITY             ****************************
**************************************************************************
****/

IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_capacity]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_capacity];
END
GO

CREATE PROCEDURE [dbo].[get_all_Capacity]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[capacity]
END
GO

PRINT 'Procedure get_all_capcity was created successfully  complete'
GO

/****
**************************************************************************
************     PROCEDURE  DELETE            ****************************
************                                  ****************************
************         FOR CAPACITY             ****************************
**************************************************************************
****/


IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_capacity]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_capacity];
END
GO

CREATE PROCEDURE [dbo].[delete_capacity]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    DELETE FROM [dbo].[capacity]
	WHERE id = @id;
END
GO
PRINT 'Procedure delete_capacity was created successfully complete'
GO


/*
*******************************************************************************
**
*******************************************************************************
** Table Personal_Information
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 25/06/2018 Henry  J . Calani A.   Initial version
*******************************************************************************/


----------------    Procedimientos almacenados Capacity  ------------------
PRINT 'Start of Script Execution....';
GO

-- Create InsertMaterial stored procedure.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[create_personal_information]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[create_personal_information]
END
GO

/****
************************************************************************
************       PROCEDURE  CREATE        ****************************
************                                ****************************
************   FOR PERSONAL INFORMATION     ****************************
************************************************************************
****/




CREATE PROCEDURE [dbo].[create_personal_information]
(
	 @legal_name VARCHAR(50)
	,@area_id INT
	,@employee_id INT
	,@registration_date VARCHAR(50)
	,@is_deleted  bit
	,@id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO [dbo].[personal_information](
	 legal_name
	,area_id
	,employee_id
	,registration_date
	,is_deleted
	,id
								)
	VALUES (
	 @legal_name
	,@area_id
	,@employee_id
	,@registration_date
	,@is_deleted
	,@id
	);
  
	SELECT @id = @@IDENTITY;
	PRINT @id;
END
GO
PRINT 'Procedure [dbo].[personal_information] created Final'
GO


/****
***************************************************************************
************    CREATE PROCEDURE  UPDATE       ****************************
************                                   ****************************
************     FOR PERSONAL INFORMATION      ****************************
***************************************************************************
****/

-- Update PersonalInformation  procedure.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[update_personal_information]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[update_personal_information]
END
GO
PRINT 'Procedure [dbo].[personal_information] created complete'
GO


CREATE PROCEDURE [dbo].[update_personal_information]
(
	 @id INT
	,@legal_name VARCHAR(50)
	,@area_id INT
	,@employee_id INT
	,@registration_date VARCHAR(50)
	,@is_deleted  bit


)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[update_personal_information] SET
	                           legal_name = @legal_name
	                           ,area_id  = @area_id
	                           ,employee_id = @employee_id
	                           ,registration_date = @registration_date
	                           ,registration_date = @is_deleted
	                            WHERE id = @id;



END
GO
PRINT 'Procedure [dbo].[personal_information] update complete'
GO


/****
***************************************************************************
************     PROCEDURE  GET ALL CAPACITY   ****************************
************                                   ****************************
************         FOR PERSONAL INFORMATION  ****************************
***************************************************************************
****/


IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_personal_information]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_personal_information];
END
GO


CREATE PROCEDURE [dbo].[get_all_personal_information]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[personal_information]
END
GO

PRINT 'Procedure get_all_personal_information was created successfully  complete'
GO



/****
***************************************************************************
************     PROCEDURE  DELETE             ****************************
************                                   ****************************
************         FOR PERSONAL INFORMATION  ****************************
***************************************************************************
****/


IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_personal_information]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_personal_information];
END
GO

/****
**************************************************************************
************     PROCEDURE  GET  CAPACITY  ****************************
************                                  ****************************
************         FOR CAPACITY  ID             ****************************
**************************************************************************
****/


/*procedure to get area*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_personal_information]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_personal_information];
END
GO
CREATE PROCEDURE [dbo].[get_personal_information]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[get_personal_information]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_personal_information was created successfully'
GO




/****
***************************************************************************
************     PROCEDURE  DELETE             ****************************
************                                   ****************************
************         FOR PERSONAL INFORMATION  ****************************
***************************************************************************
****/


IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_personal_information]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_personal_information];
END
GO



/****
**************************************************************************
************     PROCEDURE  DELETE             ****************************
************                                   ****************************
************         FOR PERSONAL INFORMATION  ****************************
***************************************************************************
****/


CREATE PROCEDURE [dbo].[delete_personal_information]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    DELETE FROM [dbo].[personal_information]
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_personal_information was created successfully complete'
GO

/****
*********************************************************************************
*/
/*procedure to create material*/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CreateMaterial]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CreateMaterial]
END
GO
CREATE PROCEDURE [dbo].[CreateMaterial]
(
	@name VARCHAR(50),
	@vidaUtil INT,
	@materialDescription VARCHAR(100),
	@materialTypeID INT,
	@materialID INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[material](name
								,vida_util
								,material_description
								,material_type_id)
	VALUES (@name
			,@vidaUtil
			,@materialDescription
			,@materialTypeID);

	SELECT @materialID = @@IDENTITY;
	PRINT @materialID;
END
GO
PRINT 'Procedure [dbo].[CreateMaterial] created'
GO

/*procedure to update material*/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateMaterial]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateMaterial]
END
GO
PRINT 'Procedure [dbo].[UpdateMaterial] created'
GO
CREATE PROCEDURE [dbo].[UpdateMaterial]
(
	@id INT,
	@name VARCHAR(50),
	@vidaUtil INT,
	@materialDescription VARCHAR(100),
	@materialTypeID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[material] SET name = @name
								,vida_util = @vidaUtil
								,material_description = @materialDescription
								,material_type_id = @materialTypeID
							WHERE id = @id;
END
GO
PRINT 'Procedure [dbo].[UpdateMaterial] created'
GO

/*procedure to get all material*/
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_material]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_material];
END
GO
CREATE PROCEDURE [dbo].[get_all_material]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[material]
END
GO

PRINT 'Procedure get_all_materials was created successfully'
GO

/*procedure to delete material by id*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_material]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_material];
END
GO
CREATE PROCEDURE [dbo].[delete_material]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    DELETE FROM [dbo].[material]
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_material was created successfully'
GO

/*procedure to create assignment*/
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CreateAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CreateAssignment]
END
GO
CREATE PROCEDURE [dbo].[CreateAssignment]
(
	@id INT OUTPUT,
	@assignment_date DATETIME = GETDATE,
	@quantity INT,
	@employee_id INT,
	@material_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[assignment](assignment_date
								,quantity
								,employee_id
								,material_id)
	VALUES (@assignment_date
			,@quantity
			,@employee_id
			,@material_id);

	SELECT @id = @@IDENTITY;
	PRINT @id;
END
GO
PRINT 'Procedure [dbo].[CreateAssignment] created successfully'
GO


/*procedure to get all assignment*/

IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GetAllAssignment]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAllAssignment]
END
GO

CREATE PROCEDURE [dbo].[GetAllAssignment]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT * FROM [dbo].[assignment]
END
GO
PRINT 'Procedure [dbo].[GetAllAssignment] created successfully'
GO

/*procedure to create employee*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[create_employee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_employee];
END
GO
CREATE PROCEDURE [dbo].[create_employee]
(
    @adress VARCHAR(255),
    @birth_date DATE,
	@ci VARCHAR(255),
	@email VARCHAR(255),
	@first_name VARCHAR(255),
	@gender VARCHAR(255),
	@last_name VARCHAR(255),
	@phone INT,
	@salary FLOAT,
	@employee_type_id INT,
    @id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[employee](address, birth_date, ci, email, first_name, gender, is_deleted, last_name, phone, salary, employee_type_id)
    VALUES(@adress, @birth_date, @ci, @email, @first_name, @gender, 0, @last_name, @phone, @salary, @employee_type_id);
    SELECT @id = @@IDENTITY;
END
GO

PRINT 'Procedure create_employee was created successfully'
GO


/*procedure to update employee*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[update_employee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_employee];
END
GO
CREATE PROCEDURE [dbo].[update_employee]
(
	@id INT,
    @adress VARCHAR(255),
    @birth_date DATE,
	@ci VARCHAR(255),
	@email VARCHAR(255),
	@first_name VARCHAR(255),
	@gender VARCHAR(255),
	@last_name VARCHAR(255),
	@phone INT,
	@salary FLOAT,
	@employee_type_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[employee]
	SET address = @adress,
	birth_date = @birth_date,
	ci = @ci,
	email = @email,
	first_name = @first_name,
	gender = @gender,
	last_name = @last_name,
	phone = @phone,
	salary = @salary,
	employee_type_id = @employee_type_id
	WHERE id = @id;
END
GO

PRINT 'Procedure update_employee was created successfully'
GO


/*procedure to delete employee*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[delete_employee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_employee];
END
GO
CREATE PROCEDURE [dbo].[delete_employee]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[employee]
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_employee was created successfully'
GO

/*procedure to get employee*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_employee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_employee];
END
GO
CREATE PROCEDURE [dbo].[get_employee]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[employee]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_employee was created successfully'
GO


/*procedure to get all employee*/
IF EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_employee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_employee];
END
GO
CREATE PROCEDURE [dbo].[get_all_employee]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[employee]
END
GO

PRINT 'Procedure get_all_employee was created successfully'
GO

/*procedure to create incident_agent*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[create_incident_agent]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_incident_agent];
END
GO
CREATE PROCEDURE [dbo].[create_incident_agent]
(
    @name VARCHAR(50),
    @id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[incident_agent](name, is_deleted)
    VALUES(@name, 0);
    SELECT @id = @@IDENTITY;
END
GO

PRINT 'Procedure create_incident_agent was created successfully'
GO


/*procedure to update incident_agent*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[update_incident_agent]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_incident_agent];
END
GO


CREATE PROCEDURE [dbo].[update_incident_agent]
(
	@id INT,
    @name VARCHAR(255),
 	@is_deleted BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident_agent] 
	SET name = @name,
	is_deleted = @is_deleted
	WHERE id = @id;
END
GO

PRINT 'Procedure update_incident_agent was created successfully'
GO


/*procedure to delete incident_agent*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[delete_incident_agent]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_incident_agent];
END
GO
CREATE PROCEDURE [dbo].[delete_incident_agent]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[incident_agent] 
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_incident_agent was created successfully'
GO


/*procedure to get incident_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_incident_agent]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_incident_agent];
END
GO
CREATE PROCEDURE [dbo].[get_incident_agent]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_agent]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_incident_agent was created successfully'
GO


/*procedure to get all incident_agent*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_incident_agent]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_incident_agent];
END
GO


CREATE PROCEDURE [dbo].[get_all_incident_agent]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[incident_agent]
END
GO

PRINT 'Procedure get_all_incident_agent was created successfully'
GO

/*procedure to create lesion_type*/

IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[create_lesion_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[create_lesion_type];
END
GO


CREATE PROCEDURE [dbo].[create_lesion_type]
(
    @type VARCHAR(50),
    @description VARCHAR(100),
    @lesion_type_id INT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[lesion_type](type, description, is_deleted)
    VALUES(@type, @description, 0);
    SELECT @lesion_type_id = @@IDENTITY;
END
GO

PRINT 'Procedure create_lesion_type was created successfully'
GO


/*procedure to update lesion_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[update_lesion_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[update_lesion_type];
END
GO


CREATE PROCEDURE [dbo].[update_lesion_type]
(
	@id INT,
    @type VARCHAR(50),
    @description VARCHAR(100),
	@is_deleted BIT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[lesion_type] 
	SET type = @type,
	description = @description,
	is_deleted = @is_deleted
	WHERE id = @id;
END
GO

PRINT 'Procedure update_lesion_type was created successfully'
GO



/*procedure to delete lesion_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[delete_lesion_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[delete_lesion_type];
END
GO
CREATE PROCEDURE [dbo].[delete_lesion_type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[lesion_type] 
	SET is_deleted = 1
	WHERE id = @id;
END
GO

PRINT 'Procedure delete_lesion_type was created successfully'
GO



/*procedure to get lesion_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_lesion_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_lesion_type];
END
GO


CREATE PROCEDURE [dbo].[get_lesion_type]
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[lesion_type]
	WHERE id = @id;
END
GO

PRINT 'Procedure get_lesion_type was created successfully'
GO


/*procedure to get all lesion_type*/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[get_all_lesion_type]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[get_all_lesion_type];
END
GO
CREATE PROCEDURE [dbo].[get_all_lesion_type]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT * FROM [dbo].[lesion_type]
END
GO

PRINT 'Procedure get_all_lesion_type was created successfully'
GO