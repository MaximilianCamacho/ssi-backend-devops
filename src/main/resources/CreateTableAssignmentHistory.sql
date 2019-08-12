USE ssi;

IF OBJECT_ID('dbo.AssignmentHistory','U') IS NOT NULL
BEGIN
	DROP TABLE dbo.AssignmentHistory;
END
GO
PRINT 'Start Create...';
GO

CREATE TABLE AssignmentHistory(
  AssignmentHistoryID		BIGINT			IDENTITY(1,1) NOT NULL
  ,UsersAddress			VARCHAR(30)		NOT NULL
  ,PerformedAction		VARCHAR(20)		NOT NULL
  ,HistoryDate			DATE			NOT NULL

  ,AssignmentIDOld		BIGINT			NULL
  ,AssignmentDateOld		DATE			NULL
  ,QuantityOld			INT				NULL
  ,EmployeeIDOld			BIGINT			NULL
  ,MaterialIDOld			BIGINT			NULL

  ,AssignmentIDNew		BIGINT			NULL
  ,AssignmentDateNew		DATE			NULL
  ,QuantityNew			INT				NULL
  ,EmployeeIDNew			BIGINT			NULL
  ,MaterialIDNew			BIGINT			NULL
  ,CONSTRAINT Pk_AssignmentHistory PRIMARY KEY (AssignmentHistoryID)
)
GO
PRINT 'Table AssignmentHistory created successfully.';
GO