IF db_id('DWssi') IS NOT NULL
	PRINT 'db exists'
ELSE
	CREATE DATABASE DWssi;
go

USE [DWssi];
GO

PRINT 'start creation schema to database ssi';
PRINT 'drop tables';

IF OBJECT_ID('[dbo].[FactIncident]', 'U') IS NOT NULL
	DROP TABLE [dbo].[FactIncident];
	PRINT 'DROP TABLE FACTINCIDENT';
	GO
GO

IF OBJECT_ID('[dbo].[DimIncidentDetail]', 'U') IS NOT NULL
	DROP TABLE [dbo].[DimIncidentDetail];
	PRINT 'DROP TABLE DIMINCIDENTDETAIL';
	GO
GO

IF OBJECT_ID('[dbo].[DimEmployee]', 'U') IS NOT NULL
	DROP TABLE [dbo].[DimEmployee];
	PRINT 'DROP TABLE DIMEMPLOYEE';
	GO
GO

IF OBJECT_ID('[ETL].[IncidentDetail]', 'U') IS NOT NULL
	DROP TABLE [ETL].[IncidentDetail];
	PRINT 'DROP TABLE INCIDENTDETAIL';
GO

IF OBJECT_ID('[ETL].[Incident]', 'U') IS NOT NULL
	DROP TABLE [ETL].[Incident];
	PRINT 'DROP TABLE INCIDENT';
GO

IF OBJECT_ID('[ETL].[Employee]', 'U') IS NOT NULL
	DROP TABLE [ETL].[Employee];
	PRINT 'DROP TABLE EMPLOYEE';
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN
EXEC('CREATE SCHEMA ETL')
END

CREATE TABLE [dbo].[DimIncidentDetail](
	[id] [int] NOT NULL,
	[incident_type] [varchar](255) NOT NULL,
	[incident_agent] [varchar](255) NOT NULL,
	[lesion_type] [varchar](255) NOT NULL,
	[working_turn] [varchar](255) NOT NULL,
	[accident_site] [varchar](255) NOT NULL,
 CONSTRAINT [PK_DimIncidentDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'CREATE TABLE DIMINCIDENTDETAIL';
GO

CREATE TABLE [dbo].[DimEmployee](
	[id] [int] NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[ci] [varchar](50) NOT NULL,
	[phone] [int] NOT NULL,
	[employee_type] [varchar](255) NOT NULL,
	[registration_date] [date] NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
PRINT 'CREATE TABLE DIMEMPLOYEE';
GO

CREATE TABLE [dbo].[FactIncident](
	[incident_detail_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	CONSTRAINT [FK_DimIncident] FOREIGN KEY([incident_detail_id]) REFERENCES [dbo].[DimIncidentDetail] ([id]),
	CONSTRAINT [FK_DimEmployee] FOREIGN KEY([employee_id]) REFERENCES [dbo].[DimEmployee] ([id]),
 CONSTRAINT [PK_FactIncident] PRIMARY KEY CLUSTERED 
(
	[incident_detail_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
PRINT 'CREATE TABLE FACTINCIDENT';
GO

CREATE TABLE [ETL].[IncidentDetail](
	[id] [int] NOT NULL,
	[incident_type] [varchar](255) NULL,
	[incident_agent] [varchar](255) NULL,
	[lesion_type] [varchar](255) NULL,
	[working_turn] [varchar](255) NULL,
	[accident_site] [varchar](255) NULL
) ON [PRIMARY]
GO
PRINT 'CREATE TABLE INCIDENTDETAIL';
GO

CREATE TABLE [ETL].[Employee](
	[id] [int] NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[ci] [varchar](50) NOT NULL,
	[phone] [int] NOT NULL,
	[employee_type] [varchar](255) NOT NULL,
	[registration_date] [date] NULL,
) ON [PRIMARY]
GO
PRINT 'CREATE TABLE EMPLOYEE';
GO

CREATE TABLE [ETL].[Incident](
	[incident_detail_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[date] [date] NOT NULL,
) ON [PRIMARY]
GO
PRINT 'CREATE TABLE INCIDENT';
GO

/******************************************************************************
**  Name: ETL.DW_MergeIncidentDetail
**  Desc: Merges Source ETL.IncidentDetail changes into Destination dbo.DimIncidentDetail table. 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeIncidentDetail]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeIncidentDetail];
END
GO
CREATE PROCEDURE [ETL].[DW_MergeIncidentDetail]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimIncidentDetail] AS target
	USING [ETL].[IncidentDetail] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [incident_type]   = ISNULL (source.[incident_type], 'N/A')
			,[incident_agent] = ISNULL (source.[incident_agent], 'N/A')
			,[lesion_type] = ISNULL (source.[lesion_type], 'N/A')
			,[working_turn] = ISNULL (source.[working_turn], 'N/A')
			,[accident_site] = ISNULL (source.[accident_site], 'N/A')
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [id]
		,[incident_type]
		,[incident_agent]
		,[lesion_type]
		,[working_turn]
		,[accident_site]
	  )
	  VALUES
	  (
		source.[id]
		,ISNULL (source.[incident_type], 'N/A')
		,ISNULL (source.[incident_agent], 'N/A')
		,ISNULL (source.[lesion_type], 'N/A')
		,ISNULL (source.[working_turn], 'N/A')
		,ISNULL (source.[accident_site], 'N/A')		
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeIncident
**  Desc: Merges Source ETL.Incident changes into Destination dbo.DimIncident table. 
**  Called By SQL Job ETL
**
**  Author: Guido Llanos
**
**  Created: 7/4/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeIncident]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeIncident];
END
GO
CREATE PROCEDURE [ETL].[DW_MergeIncident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[FactIncident] AS target
	USING [ETL].[Incident] AS source
	ON
	(
	  target.[incident_detail_id] = source.[incident_detail_id]
	  AND target.[employee_id] = source.[employee_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [date]         = source.[date]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[incident_detail_id]
		,[employee_id]
		,[date]
	  )
	  VALUES
	  (
		source.[incident_detail_id]
		,source.[employee_id]
		,source.[date]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeIncidentDetail
**  Desc: Merges Source ETL.IncidentDetail changes into Destination dbo.DimIncidentDetail table. 
**  Called By SQL Job ETL
**
**  Author: Edwin Rojas
**
**  Created: 7/5/2018
******************************************************************************/
IF EXISTS (SELECT * 
FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[ETL].[DW_MergeEmployee]')
AND type IN (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeEmployee];
END
GO
CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[id]     = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [full_name]    = ISNULL(source.[full_name], 'N/A')
		 , [ci] = ISNULL(source.[ci], 'N/A')
		 , [phone] = ISNULL(source.[phone], 0)
		 , [employee_type] = ISNULL(source.[employee_type], 'N/A')
		 , [registration_date] = source.[registration_date]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[id]
		,[full_name]
		,[ci]
		,[phone]
		,[employee_type]
		,[registration_date]
	  )
	  VALUES
	  (
		source.[id]
		,source.[full_name]
		,source.[ci]
		,source.[phone]
		,source.[employee_type]
		,source.[registration_date]		
	  );
END
GO
