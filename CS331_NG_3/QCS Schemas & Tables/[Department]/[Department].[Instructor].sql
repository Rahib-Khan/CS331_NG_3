CREATE TABLE [Department].[Instructor]
(
	[InstructorID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [FirstName] [Udt].[WorkFlowString] not NULL,
  [LastName] [Udt].[WorkFlowString] not NULL,
  [FullName] [Udt].[WorkFlowString]not NULL,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] NULL,
	[DateAdded] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
	[DateOfLastUpdate] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME()
)



insert into Department.Instructor
(LastName,FirstName, FullName)
SELECT distinct
    SUBSTRING([Instructor], 1, CHARINDEX(',', [Instructor]) - 1) AS LastName,
    SUBSTRING([Instructor], CHARINDEX(',', [Instructor]) + 2, LEN([Instructor]) - CHARINDEX(',', [Instructor]) - 1) AS FirstName,
    Instructor
FROM 
    Uploadfile.CurrentSemesterCourseOfferings