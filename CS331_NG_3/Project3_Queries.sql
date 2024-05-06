
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
SET Location = 'Unknown '
WHERE Location LIKE 'Unknown' 



--Limit Exceeded Anomaly
-- Change limit and enrolled columns into int
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Limit = Enrolled + 10
WHERE Enrolled > Limit


select * from Uploadfile.CurrentSemesterCourseOfferings 


--creating dbsecurity datatypes
create schema udt;

CREATE TYPE [Udt].[SurrogateKeyInt] FROM [int] NULL
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

create type [udt].[workflowstring] from NVARCHAR(100) not null
create type [udt].[Rowcount] from [int] not null
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

--Table: Course	
--Author:Rahib
	
--Course Schema tables
create schema Course

--Adding datatype for section in course table	
create type [udt].[SurrogateKeyString] from NVARCHAR(30) not null

create table [Course].[Course]
(
    [CourseID] [udt].[SurrogateKeyInt] identity(1,1) PRIMARY KEY NOT NULL,
    [CourseCode] [udt].[SurrogateKeyString]  null,
    [Description] [udt].[workflowstring]  null,
    [UserAuthorizationKey] [Udt].[SurrogateKeyInt]  null,
    [DateAdded] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
    [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME()
)


--Adding some columns from uploadfile 
insert into Course.Course
(CourseCode,[Description]) 
select distinct(SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)),
[Description] from 
Uploadfile.CurrentSemesterCourseOfferings


--Table:Mode of instruction
-- Author:Nak
CREATE TABLE [Course].[Mode_Of_Instruction]
(
  [ModeID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Name] [udt].[workflowstring] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
);


INSERT INTO Course.Mode_Of_Instruction
(
    Name
)
SELECT distinct[Mode Of Instruction] FROM Uploadfile.CurrentSemesterCourseOfferings



CREATE TYPE [Udt].[ClassDuration] FROM NVARCHAR(30) NOT NULL;

create type [Udt].[SurrogateKeyFloat] from FLOAT not null

--add foreign keys later with a seperate stored procedure
CREATE TABLE [Course].[Class]
(
	[ClassID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Enrollment] [Udt].[SurrogateKeyInt] NULL,
  [Limit] [Udt].[SurrogateKeyInt] NULL,
  [Section] [Udt].[SurrogateKeyString] null,
  [ClassCode] [Udt].[SurrogateKeyString] NULL,
  [Days] [Udt].[SurrogateKeyString] null,
  [Time] [Udt].[ClassDuration] NULL,
  [Hours] [udt].[SurrogateKeyFloat] null,
  [Credits] [udt].[SurrogateKeyInt] null,
  [ModeID] [Udt].[SurrogateKeyInt] null,
  [InstructorID] [Udt].[SurrogateKeyInt] null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)

insert into Course.Class
(Enrollment, [Limit], Section, ClassCode, [Days], [Time], [Hours], [Credits], ModeID  )
select Enrolled, [Limit], Sec, Code, [Day], [Time], 
(SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(',', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1)),
(SUBSTRING([Course (hr, crd)], CHARINDEX(')', [Course (hr, crd)]) - 1, 1)),
ModeID
from Uploadfile.CurrentSemesterCourseOfferings a
join Course.Mode_Of_Instruction b on b.name = a.[Mode of Instruction]

-- Room Location Table

create table RoomLocation(
  [RoomLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationID] [udt].[SurrogateKeyInt] not null,
  [RoomLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)


insert into RoomLocation
(RoomLocationName, BuildingLocationID)
select distinct([Location]), buildinglocationID from uploadfile.CurrentSemesterCourseOfferings
join buildinglocation on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))


create table BuildingLocation(
  [BuildingLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationAbv] [udt].[SurrogateKeyString] not null,
  [BuildingLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)


insert into BuildingLocation
(BuildingLocationAbv,BuildingLocationName)
select distinct(SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1))),
    case (SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1)))
        when 'IB' then 'I Building'
        when 'GC' then 'Gertz Center'
        when 'QH' then 'Queens Hall'
        when 'SU' then 'Student Union'
        when 'RA' then 'Rathhaus Hall'
        when 'MU' then 'Music Building'
        when 'KY' then 'Keily Hall'
        when 'RZ' then 'Razran Hall'
        when 'SB' then 'Science Building'
        when 'CH' then 'Colwin Hall'
        when 'HH' then 'Honors Hall'
        when 'AR' then 'Alumni Hall'
        when 'DY' then 'Delany Hall'
        when 'PH' then 'Powdermaker Hall'
        when 'RO' then 'Rosenthal Library'
        when 'FG' then 'FitzGerald Gym'
        when 'CD' then 'Colden Auditorium'
        when 'KG' then 'King Hall'
        when 'JH' then 'Jefferson Hall'
        when 'RE' then 'Remsen Hall'
        when 'KP' then 'Klapper Hall'
        when 'GT' then 'Goldstein Theatre'
        when 'GB' then 'G Building'
        else 'Unknown'
    end as Building
from uploadfile.CurrentSemesterCourseOfferings

