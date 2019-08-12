/**********************************************************************************************
**	Name: TG_InsertUpdateDeleteAssignment
**	Desc: Trigger para INSERT, UPDATE y DELETE en AssignmentHistory
**
**	Called by: Portal
**
**	Author: Maximiliano Casto Camacho Hidalgo
**
**	Date: 30/06/2018
***********************************************************************************************
**					  				Change History
***********************************************************************************************
**	Date:	 		Author:						Description:
** ----------	------------------------	---------------------------------------------------
** 30/06/2018	Maximiliano Camacho H.		Initial version
**********************************************************************************************/
IF OBJECT_ID('TG_InsertUpdateDeleteAssignment') IS NOT NULL
BEGIN	
	PRINT 'SQLServer> Preparando para la ejecucion de Trigger...';
	DROP TRIGGER TG_InsertUpdateDeleteAssignment;
	PRINT 'SQLServer> Ejecutando el Trigger...';	
END
ELSE
BEGIN
	PRINT 'SQLServer> Ejecutando el Trigger...';
END
GO

CREATE TRIGGER TG_InsertUpdateDeleteAssignment
ON [dbo].[assignment]
FOR INSERT, UPDATE, DELETE
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
DECLARE
@ip_address varchar(30)
,@action varchar(20) 

,@assignmentID bigint
,@assignmentDate date
,@quantity int
,@employeeID bigint
,@materialID bigint

,@assignmentIDOLd bigint
,@assignmentDateOld date
,@quantityOld int
,@employeeIDOld bigint
,@materialIDOld bigint
BEGIN
	IF EXISTS(SELECT * FROM inserted)
	BEGIN
		IF EXISTS(SELECT * FROM deleted) --Si es un update
		BEGIN
			SELECT @action='UPDATE';			
			SET @ip_address = (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
			SELECT top 1 @assignmentIDOld=deleted.id,@assignmentDateOld=deleted.assignment_date,@quantityOld=deleted.quantity,@employeeIDOld=deleted.employee_id,@materialIDOld=deleted.material_id from deleted;
			SELECT top 1 @assignmentID=inserted.id,@assignmentDate=inserted.assignment_date,@quantity=inserted.quantity,@employeeID=inserted.employee_id,@materialID=inserted.material_id from inserted;

			INSERT INTO [dbo].[AssignmentHistory] (
				[UsersAddress],[PerformedAction],[HistoryDate]
				,[AssignmentIDOld],[AssignmentDateOld],[QuantityOld],[EmployeeIDOld],[MaterialIDOld]
				,[AssignmentIDNew],[AssignmentDateNew],[QuantityNew],[EmployeeIDNew],[MaterialIDNew]
			) VALUES(
					@ip_address,@action,GETDATE()
					,@assignmentIDOld,@assignmentDateOld,@quantityOld,@employeeIDOld,@materialIDOld
					,@assignmentID,@assignmentDate,@quantity,@employeeID,@materialID
			);

		END
		ELSE --Si es un insert
		BEGIN                              
			SELECT @action='INSERT';
			SET @ip_address = (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
			(select top 1 @assignmentID=inserted.id,@assignmentDate=inserted.assignment_date,@quantity=inserted.quantity,@employeeID=inserted.employee_id,@materialID=inserted.material_id from inserted);
			INSERT INTO [dbo].[AssignmentHistory] (
				[UsersAddress],[PerformedAction],[HistoryDate]
				,[AssignmentIDOld],[AssignmentDateOld],[QuantityOld],[EmployeeIDOld],[MaterialIDOld]
				,[AssignmentIDNew],[AssignmentDateNew],[QuantityNew],[EmployeeIDNew],[MaterialIDNew]
			) VALUES(
					@ip_address,@action,GETDATE()
					,NULL,NULL,NULL,NULL,NULL
					,@assignmentID,@assignmentDate,@quantity,@employeeID,@materialID
			);
		END
	END
	ELSE  --si es un delete
	BEGIN                                
		SELECT @action='DELETE';
		SET @ip_address = (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
		SELECT top 1 @assignmentIDOld=deleted.id,@assignmentDateOld=deleted.assignment_date,@quantityOld=deleted.quantity,@employeeIDOld=deleted.employee_id,@materialIDOld=deleted.material_id from deleted;
		SELECT top 1 @assignmentID=inserted.id,@assignmentDate=inserted.assignment_date,@quantity=inserted.quantity,@employeeID=inserted.employee_id,@materialID=inserted.material_id from inserted;

		INSERT INTO [dbo].[AssignmentHistory] (
			[UsersAddress],[PerformedAction],[HistoryDate]
			,[AssignmentIDOld],[AssignmentDateOld],[QuantityOld],[EmployeeIDOld],[MaterialIDOld]
			,[AssignmentIDNew],[AssignmentDateNew],[QuantityNew],[EmployeeIDNew],[MaterialIDNew]
		) VALUES(
				@ip_address,@action,GETDATE()
				,@assignmentIDOld,@assignmentDateOld,@quantityOld,@employeeIDOld,@materialIDOld
				,@assignmentID,@assignmentDate,@quantity,@employeeID,@materialID
		);
	END
END
GO
