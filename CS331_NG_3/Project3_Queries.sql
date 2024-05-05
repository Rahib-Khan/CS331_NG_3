
--Anomalies


--Day Anomaly
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Day = 'U'
WHERE DAY LIKE ''

--Time Anomaly
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Time = '12:00 AM - 12:00 AM'
WHERE TIME LIKE '-' 

--Blank Instructor Anomaly
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Instructor = 'John, Smith'
WHERE Instructor LIKE ',' 

--Blank Location Anomaly
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Location = 'Unknown'
WHERE Location LIKE '' 



--Limit Exceeded Anomaly
-- Change limit and enrolled columns into int
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Limit = Enrolled + 10
WHERE Enrolled > Limit


select * from Uploadfile.CurrentSemesterCourseOfferings 


--creating dbsecurity datatypes
create schema udt;

CREATE TYPE [Udt].[SuurogateKeyInt] FROM [int] NULL
CREATE TYPE [Udt].[DateAdded] FROM Datetime2(7) NOT NULL
CREATE TYPE [Udt].[ClassTime] FROM nchar(5) NOT NULL
CREATE TYPE [Udt].[IndividualProject] FROM nvarchar (60) NOT NULL
CREATE TYPE [Udt].[LastName] FROM nvarchar(35) NOT NULL
CREATE TYPE [Udt].[FirstName] FROM nvarchar(20) NOT NULL
CREATE TYPE [Udt].[GroupName] FROM nvarchar(20) NOT NULL

-- Create [DbSecurity].[UserAuthorization] table with the User defined datatypes
create schema DbSecurity
CREATE TABLE [DbSecurity].[UserAuthorization]
(
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ClassTime] [Udt].[ClassTime] NULL DEFAULT ('7:45'),
	[IndividualProject] [Udt].[IndividualProject] NULL DEFAULT('PROJECT 3'),
	[GroupMemberLastName] [Udt].[LastName] NOT NULL,
	[GroupMemberFirstName] [Udt].[FirstName] NOT NULL,
	[GroupName] [Udt].[GroupName] NOT NULL DEFAULT ('GROUP NG_3'),
	[DateAdded] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME()
)


--Create Process workflow steps table
create schema process
create table [Process].[WorkflowSteps]
(
    [WorkflowStepsKey] [Udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [WorkflowStepsDescription] [udt].[workflowstring] not null,
    [WorkflowStepsTableRowCount] [udt].[Rowcount] null DEFAULT(0),
    [StartingDateTime] [udt].[DateAdded] null DEFAULT SYSDATETIME(),
    [EndDateTime] [udt].[DateAdded] null DEFAULT SYSDATETIME(),
    [ClassTime] [Udt].[ClassTime] NULL DEFAULT ('7:45'),
    [UserAuthorizationKey] [Udt].[SurrogateKeyInt] not null
)


--Course Schema tables
create schema Course

create type [udt].[SurrogateKeyString] from NVARCHAR(10) not null


create table [Course].[Course]
(
    [CourseID] [udt].[SurrogateKeyInt] identity(1,1) PRIMARY KEY NOT NULL,
    [Description] [udt].[workflowstring]  null,
    [CourseCode] [udt].[SurrogateKeyint]  null,
    [Section] [udt].[SurrogateKeyString]  null,
    [Semester] [udt].[workflowstring]  null,
    --[InstructorID] [udt].[SurrogateKeyInt]  null,
    [UserAuthorizationKey] [Udt].[SurrogateKeyInt]  null,
    [DateAdded] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
    [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME()
)


insert into Course.Course
(CourseCode,Section,[Description],Semester) 
select code,sec,[Description],Semester from Uploadfile.CurrentSemesterCourseOfferings


