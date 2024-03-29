IF db_id('ssi') IS NOT NULL
	PRINT 'db exists'
ELSE
	CREATE DATABASE ssi;
go

PRINT 'start creation schema to database ssi';
/*drop tables*/
PRINT 'drop tables';

USE [ssi]
GO

IF OBJECT_ID('[dbo].[personal_information]', 'U') IS NOT NULL
	DROP TABLE [dbo].[personal_information];

IF OBJECT_ID('[dbo].[area]', 'U') IS NOT NULL
	DROP TABLE [dbo].[area];

IF OBJECT_ID('[dbo].[assignment]', 'U') IS NOT NULL
	DROP TABLE [dbo].[assignment];

IF OBJECT_ID('[dbo].[material]', 'U') IS NOT NULL
	DROP TABLE [dbo].[material];

IF OBJECT_ID('[dbo].[material_type]', 'U') IS NOT NULL
	DROP TABLE [dbo].[material_type];

IF OBJECT_ID('[dbo].[store]', 'U') IS NOT NULL
	DROP TABLE [dbo].[store];

IF OBJECT_ID('[dbo].[responsibility]', 'U') IS NOT NULL
	DROP TABLE [dbo].[responsibility];

IF OBJECT_ID('[dbo].[employee_capacities]', 'U') IS NOT NULL
	DROP TABLE [dbo].[employee_capacities];

IF OBJECT_ID('[dbo].[capacity]', 'U') IS NOT NULL
	DROP TABLE [dbo].[capacity];

IF OBJECT_ID('[dbo].[incident_incident_tag]', 'U') IS NOT NULL
	DROP TABLE [dbo].[incident_incident_tag];

IF OBJECT_ID('[dbo].[incident_tag]', 'U') IS NOT NULL
	DROP TABLE [dbo].[incident_tag];

IF OBJECT_ID('[dbo].[incident]', 'U') IS NOT NULL
	DROP TABLE [dbo].[incident];

IF OBJECT_ID('[dbo].[incident_type]', 'U') IS NOT NULL
	DROP TABLE [dbo].[incident_type];

IF OBJECT_ID('[dbo].[lesion_type]', 'U') IS NOT NULL
	DROP TABLE [dbo].[lesion_type];

IF OBJECT_ID('[dbo].[incident_agent]', 'U') IS NOT NULL
	DROP TABLE [dbo].[incident_agent];

IF OBJECT_ID('[dbo].[employee]', 'U') IS NOT NULL
	DROP TABLE [dbo].[employee];

IF OBJECT_ID('[dbo].[employee_type]', 'U') IS NOT NULL
	DROP TABLE [dbo].[employee_type];

IF OBJECT_ID('[dbo].[user_role]', 'U') IS NOT NULL
	DROP TABLE [dbo].[user_role];

IF OBJECT_ID('[dbo].[role]', 'U') IS NOT NULL
	DROP TABLE [dbo].[role];

IF OBJECT_ID('[dbo].[user_login]', 'U') IS NOT NULL
	DROP TABLE [dbo].[user_login];

IF OBJECT_ID('[dbo].[person]', 'U') IS NOT NULL
	DROP TABLE [dbo].[person];

PRINT ' TABLES DROPPED';
GO 


CREATE TABLE [dbo].[area](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_area PRIMARY KEY(id)
)
GO
PRINT 'table area was created successfully';
GO

CREATE TABLE [dbo].[capacity](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_capacity PRIMARY KEY(id)
)
GO
PRINT 'table capacity was created successfully';
GO

CREATE TABLE [dbo].[employee_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_employee_type PRIMARY KEY(id)
)
GO
PRINT 'table employee_type was created successfully';
GO

CREATE TABLE [dbo].[employee](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[birth_date] [datetime2](7) NULL,
	[ci] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[last_name] [varchar](255) NULL,
	[phone] [bigint] NULL,
	[salary] [float] NULL,
	[employee_type_id] [bigint] NULL,
	CONSTRAINT pk_employee PRIMARY KEY(id),
	CONSTRAINT fk_employee_employee_type FOREIGN KEY([employee_type_id]) REFERENCES [dbo].[employee_type] ([id])
)
GO
PRINT 'table employee was created successfully';
GO

CREATE TABLE [dbo].[employee_capacities](
	[employee_id] [bigint] NOT NULL,
	[capacities_id] [bigint] NOT NULL,
	CONSTRAINT fk_employee_capacities_employee FOREIGN KEY([employee_id]) REFERENCES [dbo].[employee] ([id]),
	CONSTRAINT fk_employee_capacities_capacity FOREIGN KEY([capacities_id]) REFERENCES [dbo].[capacity] ([id])
)
GO
PRINT 'table employee_capacities was created successfully';
GO

CREATE TABLE [dbo].[incident_agent](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_deleted] [bit] NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_incident_agent PRIMARY KEY(id)
)
GO
PRINT 'table incident_agent was created successfully';
GO

CREATE TABLE [dbo].[lesion_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[type] [varchar](255) NULL,
	CONSTRAINT pk_lesion_type PRIMARY KEY(id)
)
GO
PRINT 'table lesion_type was created successfully';
GO

CREATE TABLE [dbo].[incident_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_incident_type PRIMARY KEY(id)
)
GO
PRINT 'table incident_type was created successfully';
GO

CREATE TABLE [dbo].[incident](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[accident_date] [datetime2](7) NULL,
	[accident_day] [varchar](255) NULL,
	[accident_site] [varchar](255) NULL,
	[accident_time] [varchar](255) NULL,
	[affected_part] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[working_turn] [varchar](255) NULL,
	[employee_id] [bigint] NULL,
	[incident_agent_id] [bigint] NULL,
	[incident_type_id] [bigint] NULL,
	[lesion_type_id] [bigint] NULL,
	CONSTRAINT pk_incident PRIMARY KEY(id),
	CONSTRAINT fk_incident_incident_agent FOREIGN KEY([incident_agent_id]) REFERENCES [dbo].[incident_agent] ([id]),
	CONSTRAINT fk_incident_lesion_type FOREIGN KEY([lesion_type_id]) REFERENCES [dbo].[lesion_type] ([id]),
	CONSTRAINT fk_incident_incident_type FOREIGN KEY([incident_type_id]) REFERENCES [dbo].[incident_type] ([id]),
	CONSTRAINT fk_incident_employee FOREIGN KEY([employee_id]) REFERENCES [dbo].[employee] ([id])
)
GO
PRINT 'table incident was created successfully';
GO

CREATE TABLE [dbo].[incident_tag](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	CONSTRAINT pk_incident_tag PRIMARY KEY(id)
)
GO
PRINT 'table incident_tag was created successfully';
GO

CREATE TABLE [dbo].[incident_incident_tag](
	[incident_id] [bigint] NOT NULL,
	[incident_tags_id] [bigint] NOT NULL,
	CONSTRAINT fk_incident_incident_tag_incident FOREIGN KEY([incident_id]) REFERENCES [dbo].[incident] ([id]),
	CONSTRAINT fk_incident_incident_tag_incident_tag FOREIGN KEY([incident_tags_id]) REFERENCES [dbo].[incident_tag] ([id])
)
GO
PRINT 'table incident_incident_tag was created successfully';
GO

CREATE TABLE [dbo].[material_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name_type] [varchar](255) NULL,
	CONSTRAINT pk_material_type PRIMARY KEY(id)
)
GO
PRINT 'table material_type was created successfully';
GO

CREATE TABLE [dbo].[material](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[material_description] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[vida_util] [bigint] NULL,
	[material_type_id] [bigint] NULL,
	[material_id] [bigint] NULL,
	CONSTRAINT pk_material PRIMARY KEY(id),
	CONSTRAINT fk_material_material_type FOREIGN KEY([material_type_id]) REFERENCES [dbo].[material_type] ([id])
	/*,CONSTRAINT fk_material_store FOREIGN KEY([material_id]) REFERENCES [dbo].[store] ([id])*/
)
GO
PRINT 'table material was created successfully';
GO

CREATE TABLE [dbo].[store](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[materialID] [bigint] NOT NULL,
	[name] [varchar](255) NULL,
	[stock] [int] NULL,
	CONSTRAINT pk_store PRIMARY KEY(id),
	CONSTRAINT fk_store_material FOREIGN KEY ([materialID]) REFERENCES [dbo].[material] ([id])
)
GO
PRINT 'table store was created successfully';
GO

CREATE TABLE [dbo].[assignment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[assignment_date] [datetime2](7) NULL,
	[quantity] [int] NULL,
	[employee_id] [bigint] NULL,
	[material_id] [bigint] NULL,
	CONSTRAINT pk_assignment PRIMARY KEY(id),
	CONSTRAINT fk_assignment_employee FOREIGN KEY([employee_id]) REFERENCES [dbo].[employee] ([id]),
	CONSTRAINT fk_assignment_material FOREIGN KEY([material_id]) REFERENCES [dbo].[material] ([id])
)
GO
PRINT 'table assignment was created successfully';
GO

CREATE TABLE [dbo].[person](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[birth_date] [datetime2](7) NULL,
	[ci] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	CONSTRAINT pk_person PRIMARY KEY(id)
)
GO
PRINT 'table person was created successfully';
GO

CREATE TABLE [dbo].[personal_information](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_deleted] [bit] NULL,
	[legal_name] [varchar](255) NULL,
	[registration_date] [datetime2](7) NULL,
	[area_id] [bigint] NULL,
	[employee_id] [bigint] NULL,
	CONSTRAINT pk_personal_information PRIMARY KEY(id),
	CONSTRAINT fk_personal_information_employee FOREIGN KEY([employee_id]) REFERENCES [dbo].[employee] ([id]),
	CONSTRAINT fk_personal_information_area FOREIGN KEY([area_id]) REFERENCES [dbo].[area] ([id])
)
GO
PRINT 'table personal_information was created successfully';
GO

CREATE TABLE [dbo].[responsibility](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NULL,
	[name] [varchar](255) NULL,
	[employee_type_id] [bigint] NULL,
	CONSTRAINT pk_responsibility PRIMARY KEY(id),
	CONSTRAINT fk_responsibility_employee_type FOREIGN KEY([employee_type_id]) REFERENCES [dbo].[employee_type] ([id])
)
GO
PRINT 'table responsibility was created successfully';
GO

CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[role_name] [varchar](255) NULL,
	CONSTRAINT pk_role PRIMARY KEY(id)
)
GO
PRINT 'table role was created successfully';
GO

CREATE TABLE [dbo].[user_login](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[person_id] [bigint] NULL,
	CONSTRAINT pk_user_login PRIMARY KEY(id),
	CONSTRAINT fk_user_login_person FOREIGN KEY([person_id]) REFERENCES [dbo].[person] ([id])
)
GO
PRINT 'table user_login was created successfully';
GO

CREATE TABLE [dbo].[user_role](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	CONSTRAINT fk_user_role_role FOREIGN KEY([role_id]) REFERENCES [dbo].[role] ([id]),
	CONSTRAINT fk_user_role_user_login FOREIGN KEY([user_id]) REFERENCES [dbo].[user_login] ([id])
)
GO
PRINT 'table user_role was created successfully';
GO
