USE [SSI]


/*==============================================================*/
/* Table: AUDITORIA      Para Personal Information              */
/*==============================================================*/
PRINT 'create table history_Personal_Information';
GO
if OBJECT_ID('dbo.history_Personal_Information', 'U') is not null
	drop table dbo.history_Personal_Information;
BEGIN
CREATE TABLE [dbo].[history_Personal_Information](
	CODIGO_AU INT IDENTITY(1,1)  PRIMARY KEY,
	USUARIO_AU VARCHAR(150) NOT NULL,
	TABLA VARCHAR(150) NOT NULL,
	ACCION VARCHAR(150) NOT NULL,
	REGISTRO VARCHAR(152) NOT NULL,
	NOMBRE VARCHAR(150) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
	EMPLOYEE_ID VARCHAR(50),
	IS_DELETED BIT NULL,
	FECHA_HORA DATETIME NOT NULL
)
END
GO
/*****************************************************************************************
**	Name:	[tg_Personal_Information_Insert]
**			[tg_Personal_Information_Update]
**			[tg_Personal_Information_Deleted]
**	Desc: Trigger para insertar, actualizar, eliminar el historial del PersonalInformation
**
**	Called by: Portal
**
**	Author: Marco Herrera Patzi, Henry Calani A. 
**
**	Date: 30/06/2018
****************************************
**		Change Personal Information
****************************************
**	Date:	 		Author:									Description:
** ----------	------------------------	---------------------------------------------------
** 01/07/2018	Marco Herrera Patzi, Henry Calani A.		Initial version
**********************************************************************************************/	
/*==============================================================*/
/* Trigger: Insertar     Para Personal Information              */
/*==============================================================*/
IF OBJECT_ID ('tg_Personal_Information_Insert') IS NOT NULL   
BEGIN
	print 'SQLServer> Preparando para la ejecucion de Trigger...';
    DROP TRIGGER [dbo].[tg_Personal_Information_Insert];
END
GO
CREATE TRIGGER  [tg_Personal_Information_Insert]
ON [dbo].[personal_information]
FOR INSERT 
	AS
BEGIN
	IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @CurrDate DATETIME = GETUTCDATE();
	BEGIN
		INSERT history_Personal_Information SELECT 'USUARIO_SISTENA'
		,'personal_Information','INSERT NEW REGISTER'
		,'OPERATION INSERT',RTRIM(legal_name), 
		 i.area_id, i.employee_id, 0, GETDATE() from inserted i
		END;
   END;

GO
/*==============================================================*/
/* Trigger: Actualizar                                          */
/*==============================================================*/
IF OBJECT_ID ('tg_Personal_Information_Update') IS NOT NULL   
BEGIN
	print 'SQLServer> Preparando para la ejecucion de Trigger...';
    DROP TRIGGER [dbo].[tg_Personal_Information_Update];
END
GO
	CREATE trigger [tg_Personal_Information_Update]
	ON [dbo].[personal_information]
	FOR UPDATE
	AS
BEGIN
	IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @CurrDate DATETIME = GETUTCDATE();
	BEGIN
		INSERT history_Personal_Information SELECT 'USUARIO_SISTENA'
		,'personal_Information','UPDATE REGISTER'
		,'OPERATION UPDATE',RTRIM(legal_name), 
		i.area_id, i.employee_id, 0, GETDATE() from inserted i
		END;
   END;

GO
/*==============================================================*/
/* Trigger: Eliminar  Para Personal Information                                            */
/*==============================================================*/
IF OBJECT_ID ('tg_Personal_Information_Deleted') IS NOT NULL   
BEGIN
	print 'SQLServer> Preparando para la ejecucion de Trigger...';
    DROP TRIGGER [dbo].[tg_Personal_Information_Deleted];
END
GO
	CREATE trigger [tg_Personal_Information_Deleted]
	ON [dbo].[personal_information]
	FOR DELETE
	AS
BEGIN
	IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @CurrDate DATETIME = GETUTCDATE();

	BEGIN
		INSERT history_Personal_Information SELECT 'USUARIO_SISTENA'
		,'personal_Information','DELETED REGISTER','OPERATION DELETE'
		,RTRIM(legal_name), 
		d.area_id , d.employee_id,1, GETDATE() from deleted d
		END;
   END;

GO

/*==============================================================*/
/* INSERTAR EN LA TABLA PERSONAL INFORMATION                    */
/*==============================================================*/
/*
DECLARE @CurrDate DATETIME = GETUTCDATE();
INSERT into personal_information VALUES ('0','RECURSOS HUMANOS',@CurrDate ,'2','6')
INSERT into personal_information VALUES ('0','RECURSOS HUMANOS',@CurrDate ,'3','3')
GO
*/
/*==============================================================*/
/* ACTUALIZAR EN LA TABLA PERSONAL INFORMATION                  */
/*==============================================================*/
/*
UPDATE personal_information SET legal_name='SUSANA BARRETO' 
			WHERE employee_id='6'
UPDATE personal_information SET employee_id ='4' 
			WHERE employee_id='6'
GO
*/
/*==============================================================*/
/* ELIMINAR EN LA TABLA PERSONAL INFORMATION                    */
/*==============================================================*/
/*
DELETE FROM personal_information WHERE employee_id='4'
GO
*/
/*==============================================================*/
/* LISTAR TABLA HISTORY PERSONAL INFORMATION                    */
/*==============================================================*/
/*
SELECT TOP 100 *
FROM [ssi].[dbo].[history_Personal_Information]
*/
