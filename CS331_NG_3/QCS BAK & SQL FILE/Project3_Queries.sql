
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

insert into [DbSecurity].[UserAuthorization]
(GroupMemberLastName,GroupMemberFirstName)
VALUES
('Khandaker','Rahib'),
('Zhong','Benjamin'),
('Lee','Nak Heon'),
('Mesa','Esteban'),
('Fayyaz', 'Mohammad'),
('Maharjan', 'Ashish'),
('Sharif', 'Ahmed'),
('Singh', 'Inderpreet')

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





-- Room Location Table

create schema Location;

create table [Location].[BuildingLocation](
  [BuildingLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationAbv] [udt].[SurrogateKeyString] not null,
  [BuildingLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)



insert into [Location].BuildingLocation
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


create table [Location].[RoomLocation](
  [RoomLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationID] [udt].[SurrogateKeyInt] not null,
  [RoomLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)


insert into [Location].[RoomLocation]
(RoomLocationName, BuildingLocationID)
select distinct([Location]), buildinglocationID from uploadfile.CurrentSemesterCourseOfferings
join [Location].[BuildingLocation] on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))



create schema Department;

create table [Department].[Departments](
  [DepartmentID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [DepartmentAbv] [udt].[SurrogateKeystring] not null,
  [DepartmentName] [udt].[workflowstring] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
);


insert into Department.Departments
(DepartmentName, DepartmentAbv)
SELECT DISTINCT Department, SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))
FROM (
    SELECT DISTINCT (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))) AS DepartmentCode,
        CASE SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))
            WHEN 'ACCT' THEN 'Accounting & Information Systems'
            WHEN 'AFST' THEN 'Africana Studies'
            WHEN 'AMST' THEN 'American Studies'
            WHEN 'ANTH' THEN 'Anthropology'
            WHEN 'ARAB' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ARTH' THEN 'Art'
            WHEN 'ARTS' THEN 'Art'
            WHEN 'ASTR' THEN 'Astronomy'
            WHEN 'BALA' THEN 'Business and Liberal Arts'
            WHEN 'BIOCH' THEN 'Chemistry'
            WHEN 'BIOL' THEN 'Biology'
            WHEN 'BUS' THEN 'Business'
            WHEN 'CESL' THEN 'Academic Support'
            WHEN 'CHEM' THEN 'Chemistry'
            WHEN 'CHIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CLAS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMAL' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMLIT' THEN 'Comparative Literature'
            WHEN 'CO-OP' THEN 'Cooperative Education'
            WHEN 'CSCI' THEN 'Computer Science'
            WHEN 'CUNBA' THEN 'Hispanic Languages and Literatures'
            WHEN 'DANCE' THEN 'Dance'
            WHEN 'DRAM' THEN 'Drama, Theatre & Dance'
            WHEN 'EAST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ECON' THEN 'Economics'
            WHEN 'ECP' THEN 'Educational and Community Programs'
            WHEN 'ECPCE' THEN 'Educational and Community Programs'
            WHEN 'ECPEL' THEN 'Educational and Community Programs'
            WHEN 'ECPSE' THEN 'Educational and Community Programs'
            WHEN 'ECPSP' THEN 'Educational and Community Programs'
            WHEN 'EECE' THEN 'Elementary and Early Childhood Education'
            WHEN 'ENGL' THEN 'English'
            WHEN 'ENSCI' THEN 'Earth and Environmental Sciences'
            WHEN 'EURO' THEN 'European Studies'
            WHEN 'FNES' THEN 'Family, Nutrition and Exercise Sciences'
            WHEN 'FREN' THEN 'European Languages & Literature'
            WHEN 'GEOL' THEN 'Earth and Environmental Sciences'
            WHEN 'GERM' THEN 'European Languages & Literature'
            WHEN 'GREEK' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'GRKMD' THEN 'European Languages & Literature'
            WHEN 'GRKST' THEN 'Byzantine & Mod Greek Studies'
            WHEN 'HEBRW' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'HIST' THEN 'History'
            WHEN 'HMNS' THEN 'Honors in the Mathematical and Natural Sciences'
            WHEN 'HNRS' THEN 'Macaulay Honors College'
            WHEN 'HSS' THEN 'Honors in the Social Sciences'
            WHEN 'HTH' THEN 'Honors in the Humanities'
            WHEN 'IRST' THEN 'Provost Office'
            WHEN 'ITAL' THEN 'European Languages & Literature'
            WHEN 'JAZZ' THEN 'Jazz'
            WHEN 'JEWST' THEN 'Jewish Studies'
            WHEN 'JOURN' THEN 'Journalism'
            WHEN 'JPNS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'KOR' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LABST' THEN 'Labor Studies'
            WHEN 'LATIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LBLST' THEN 'Liberal Studies'
            WHEN 'LBSCI' THEN 'Library Science'
            WHEN 'LCD' THEN 'Linguistics and Communication Disorders'
            WHEN 'LIBR' THEN 'Library'
            WHEN 'MATH' THEN 'Mathematics'
            WHEN 'MEDST' THEN 'Media Studies'
            WHEN 'MES' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'MUSIC' THEN 'Aaron Copland School of Music'
            WHEN 'PHIL' THEN 'Philosophy'
            WHEN 'PHYS' THEN 'Physics'
            WHEN 'PORT' THEN 'Hispanic Languages and Literatures'
            WHEN 'PSCI' THEN 'Political Science'
            WHEN 'PSYCH' THEN 'Psychology'
            WHEN 'RLGST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'RM' THEN 'Economics'
            WHEN 'RUSS' THEN 'European Languages & Literature'
            WHEN 'SEEK' THEN 'SEEK Program'
            WHEN 'SEYS' THEN 'Secondary Education and Youth Service'
            WHEN 'SEYSL' THEN 'Secondary Education and Youth Service'
            WHEN 'SOC' THEN 'Sociology'
            WHEN 'SPAN' THEN 'Hispanic Literature & Language'
            WHEN 'SPST' THEN 'Special Studies'
            WHEN 'STABD' THEN 'Study Abroad'
            WHEN 'STPER' THEN 'Student Personnel'
            WHEN 'URBST' THEN 'Urban Studies'
            WHEN 'WGS' THEN 'Women and Gender Studies'
            ELSE 'Unknown' --Cert,Mam,Perm
        END AS Department
    FROM Uploadfile.CurrentSemesterCourseOfferings
) AS b
join Uploadfile.CurrentSemesterCourseOfferings on DepartmentCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))




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



CREATE TABLE Department.InstructorDepartment
(
	[InstructorId] [Udt].[SurrogateKeyInt],
	[DepartmentId] [Udt].[SurrogateKeyInt],
    [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
    [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
    [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME()
	PRIMARY KEY ([InstructorId], [DepartmentId]),
	FOREIGN KEY ([InstructorId]) REFERENCES Department.Instructor,
	FOREIGN KEY ([DepartmentId]) REFERENCES Department.Departments
)

INSERT INTO Department.InstructorDepartment
(
    InstructorId,
    DepartmentId
)
SELECT DISTINCT InstructorId, DepartmentID
FROM Uploadfile.CurrentSemesterCourseOfferings
JOIN Department.Departments ON DepartmentAbv = (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)))
JOIN Department.Instructor ON FullName = Instructor


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



CREATE TABLE [Course].[Mode_Of_Instruction]
(
  [ModeID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [ModeName] [udt].[workflowstring] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
);


INSERT INTO Course.Mode_Of_Instruction
(
    ModeName
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
  [InstructorID] [Udt].[SurrogateKeyInt] null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)

insert into Course.Class
    (Enrollment, [Limit], Section, ClassCode, [Days], [Time], [Hours], [Credits],InstructorID  )
    select Enrolled, [Limit], Sec, Code, [Day], [Time], 
    (SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(',', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1)),
    (SUBSTRING([Course (hr, crd)], CHARINDEX(')', [Course (hr, crd)]) - 1, 1)),
    InstructorID
    from Uploadfile.CurrentSemesterCourseOfferings a
    JOIN Department.Instructor ON FullName = Instructor


-- Bridge Table Connecting All tables in Course Schema
Create Table [Course].CoursesCLassMode(
  [CourseId] [udt].[SurrogateKeyInt],
  [ClassID] [udt].[SurrogateKeyInt],
  [ModeID] [udt].[SurrogateKeyInt],
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME()
  PRIMARY Key (ClassID,CourseID, Modeid),
  FOREIGN Key (ClassID) REFERENCES [Course].[Class],
  FOREIGN Key (CourseId) REFERENCES [Course].[course],
  FOREIGN Key (ModeID) REFERENCES [Course].[Mode_Of_Instruction]
)



INSERT INTO Course.CoursesCLassMode
(
    ClassID,
    CourseId,
    ModeID
)
SELECT Distinct ClassID, Courseid, a.ModeID
FROM Uploadfile.CurrentSemesterCourseOfferings
JOIN [Course].[Class] ON ClassCode = code
JOIN [Course].[Course] ON CourseCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)
JOIN [Course].[Mode_Of_Instruction] a ON [ModeName] = [Mode of Instruction]

--- Creating all the stored procedures





create schema [Project3];
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Tracking workflow>
-- =============================================
CREATE PROCEDURE [Project3].[TrackWorkFlow]

    @UserAuthorizationKey INT,
    @WorkFlowStepsDescription NVARCHAR(100),
    @WorkflowStepsTableRowCount INT

AS
BEGIN

    INSERT INTO Process.WorkFlowSteps
        (WorkflowStepsDescription, UserAuthorizationKey, WorkflowStepsTableRowCount)
    VALUES(@WorkFlowStepsDescription, @UserAuthorizationKey, @WorkflowStepsTableRowCount);


END
GO


go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The course table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_CourseTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    insert into Course.Course
    (CourseCode,[Description], UserAuthorizationKey) 
    select distinct(SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)),
    [Description],
    @UserAuthorizationKey
    from Uploadfile.CurrentSemesterCourseOfferings


    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The class table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_ClassTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    insert into Course.Class
    (Enrollment, [Limit], Section, ClassCode, [Days], [Time], [Hours], [Credits],InstructorID, UserAuthorizationKey  )
    select Enrolled, [Limit], Sec, Code, [Day], [Time], 
    (SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(',', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1)),
    (SUBSTRING([Course (hr, crd)], CHARINDEX(')', [Course (hr, crd)]) - 1, 1)),
    InstructorID,
    @UserAuthorizationKey
    from Uploadfile.CurrentSemesterCourseOfferings a
    JOIN Department.Instructor ON FullName = Instructor

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Class table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The MOI table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_ModeOfInstruction]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Mode_Of_Instruction
    (
        ModeName,
        UserAuthorizationKey
    )
    SELECT distinct[Mode Of Instruction], @UserAuthorizationKey FROM Uploadfile.CurrentSemesterCourseOfferings

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into MOI table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The course bridge table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_CourseBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.CoursesCLassMode
    (
        ClassID,
        CourseId,
        ModeID,
        UserAuthorizationKey
    )
    SELECT Distinct ClassID, Courseid, a.ModeID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN [Course].[Class] ON ClassCode = code
    JOIN [Course].[Course] ON CourseCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)
    JOIN [Course].[Mode_Of_Instruction] a ON [ModeName] = [Mode of Instruction]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/13/2024>
-- Description:	<ShowTableRowCount>
-- =============================================
go
CREATE PROCEDURE [Project3].[ShowTableStatusRowCount]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 'Course' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Course]
    UNION ALL
    SELECT 'Class' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Class]
    UNION ALL
    SELECT 'Mode_Of_Instruction' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Mode_Of_Instruction]
    UNION ALL
    SELECT 'Departments' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Departments]
    UNION ALL
    SELECT 'Instructor' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Instructor]
    UNION ALL
    SELECT 'InstructorDepartment' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[InstructorDepartment]
    UNION ALL
    SELECT 'BuildingLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[BuildingLocation]
    UNION ALL
    SELECT 'RoomLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[RoomLocation]
    UNION ALL
    SELECT 'CoursesClassMode' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[CoursesClassMode];

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkFlowStepsDescription = 'ShowTableRowCount',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

    SET NOCOUNT OFF;
END;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/13/2024>
-- Description:	<Drop Foreign Keys to QueensClassSchedule DB>
-- =============================================

CREATE PROCEDURE [Project3].[DropForeignKeysFromQueensClassSchedule]
    @UserAuthorizationKey INT
AS
BEGIN
    ALTER TABLE [Course].[Class]
    DROP CONSTRAINT IF EXISTS InstructorID, FK_Class_UserAuthorizationKey;

    ALTER TABLE [Course].[Course]
    DROP CONSTRAINT IF EXISTS  FK_Course_UserAuthorizationKey;

    ALTER TABLE [Course].[Mode_Of_Instruction]
    DROP CONSTRAINT IF EXISTS  FK_MOI_UserAuthorizationKey;

    ALTER TABLE [Course].[CoursesClassMode]
    DROP CONSTRAINT IF EXISTS  Classid, Modeid, Courseid, FK_CourseBridge_UserAuthorizationKey;

    ALTER TABLE [Department].[Instructor]
    DROP CONSTRAINT IF EXISTS  FK_Instructor_UserAuthorizationKey;

    ALTER TABLE [Department].[Departments]
    DROP CONSTRAINT IF EXISTS  FK_Department_UserAuthorizationKey;

    ALTER TABLE [Department].[InstructorDepartment]
    DROP CONSTRAINT IF EXISTS  InstructorID, DepartmentID, FK_DepBridge_UserAuthorizationKey;

    ALTER TABLE [Location].[BuildingLocation]
    DROP CONSTRAINT IF EXISTS Classid, FK_Building_UserAuthorizationKey;

    ALTER TABLE [Location].[RoomLocation]
    Drop CONSTRAINT if EXISTS BuildingLocationID, FK_Room_UserAuthorizationKey

    -- now we just log the work :D
    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Drop Foreign Keys from QueensClassSchedule DB',
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/13/2024>
-- Description:	<Add Foreign Keys to QueensClassSchedule DB>
-- =============================================

CREATE PROCEDURE [Project3].[AddForeignKeysToQueensClassSchedule]

    @UserAuthorizationKey INT

AS
BEGIN

    ALTER TABLE [Course].[Class]
		ADD 
    		CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES [Department].[Instructor] (InstructorId),
				CONSTRAINT [FK_Class_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
      
    ALTER TABLE [Course].[Course]
    ADD 
  			CONSTRAINT [FK_Course_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Course].[Mode_Of_Instruction]
 		ADD 
  			CONSTRAINT [FK_MOI_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
    
    ALTER TABLE [Course].[CoursesClassMode]
		ADD 
    	CONSTRAINT [CourseId] FOREIGN KEY (CourseId)
      REFERENCES [Course].[Course] (CourseId),
			CONSTRAINT [ModeId] FOREIGN KEY (ModeId)
      REFERENCES [Course].[Mode_Of_Instruction] (ModeId),
			CONSTRAINT [ClassId] FOREIGN KEY (ClassId) 
      REFERENCES [Course].[Class] (ClassId),
  		CONSTRAINT [FK_CourseBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[Instructor]
    ADD 
    	CONSTRAINT [FK_Instructor_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

      ALTER TABLE [Department].[Departments]
    ADD 
    	CONSTRAINT [FK_Department_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[InstructorDepartment]
    ADD
        CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES Department.Instructor (InstructorID),
        CONSTRAINT [DepartmentID] FOREIGN KEY (DepartmentId)
        REFERENCES Department.Departments (DepartmentID),
    	CONSTRAINT [FK_DepBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)


		ALTER TABLE [Location].[BuildingLocation]
		ADD 
   			CONSTRAINT [FK_Building_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	    REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Location].[RoomLocation] 
		ADD CONSTRAINT [BuildingLocationID] FOREIGN KEY (BuildingLocationID) 
    		REFERENCES [Location].[BuildingLocation] (BuildingLocationId),
   			CONSTRAINT [FK_Room_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Add Foreign Keys to QueensClassSchedule DB', 
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Department  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_DepartmentTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

-- Insert into the customer table including the user auth key
insert into Department.Departments
(DepartmentName, DepartmentAbv, UserAuthorizationKey)
SELECT DISTINCT Department, SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)), @UserAuthorizationKey
FROM (
    SELECT DISTINCT (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))) AS DepartmentCode,
        CASE SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))
            WHEN 'ACCT' THEN 'Accounting & Information Systems'
            WHEN 'AFST' THEN 'Africana Studies'
            WHEN 'AMST' THEN 'American Studies'
            WHEN 'ANTH' THEN 'Anthropology'
            WHEN 'ARAB' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ARTH' THEN 'Art'
            WHEN 'ARTS' THEN 'Art'
            WHEN 'ASTR' THEN 'Astronomy'
            WHEN 'BALA' THEN 'Business and Liberal Arts'
            WHEN 'BIOCH' THEN 'Chemistry'
            WHEN 'BIOL' THEN 'Biology'
            WHEN 'BUS' THEN 'Business'
            WHEN 'CESL' THEN 'Academic Support'
            WHEN 'CHEM' THEN 'Chemistry'
            WHEN 'CHIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CLAS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMAL' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMLIT' THEN 'Comparative Literature'
            WHEN 'CO-OP' THEN 'Cooperative Education'
            WHEN 'CSCI' THEN 'Computer Science'
            WHEN 'CUNBA' THEN 'Hispanic Languages and Literatures'
            WHEN 'DANCE' THEN 'Dance'
            WHEN 'DRAM' THEN 'Drama, Theatre & Dance'
            WHEN 'EAST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ECON' THEN 'Economics'
            WHEN 'ECP' THEN 'Educational and Community Programs'
            WHEN 'ECPCE' THEN 'Educational and Community Programs'
            WHEN 'ECPEL' THEN 'Educational and Community Programs'
            WHEN 'ECPSE' THEN 'Educational and Community Programs'
            WHEN 'ECPSP' THEN 'Educational and Community Programs'
            WHEN 'EECE' THEN 'Elementary and Early Childhood Education'
            WHEN 'ENGL' THEN 'English'
            WHEN 'ENSCI' THEN 'Earth and Environmental Sciences'
            WHEN 'EURO' THEN 'European Studies'
            WHEN 'FNES' THEN 'Family, Nutrition and Exercise Sciences'
            WHEN 'FREN' THEN 'European Languages & Literature'
            WHEN 'GEOL' THEN 'Earth and Environmental Sciences'
            WHEN 'GERM' THEN 'European Languages & Literature'
            WHEN 'GREEK' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'GRKMD' THEN 'European Languages & Literature'
            WHEN 'GRKST' THEN 'Byzantine & Mod Greek Studies'
            WHEN 'HEBRW' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'HIST' THEN 'History'
            WHEN 'HMNS' THEN 'Honors in the Mathematical and Natural Sciences'
            WHEN 'HNRS' THEN 'Macaulay Honors College'
            WHEN 'HSS' THEN 'Honors in the Social Sciences'
            WHEN 'HTH' THEN 'Honors in the Humanities'
            WHEN 'IRST' THEN 'Provost Office'
            WHEN 'ITAL' THEN 'European Languages & Literature'
            WHEN 'JAZZ' THEN 'Jazz'
            WHEN 'JEWST' THEN 'Jewish Studies'
            WHEN 'JOURN' THEN 'Journalism'
            WHEN 'JPNS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'KOR' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LABST' THEN 'Labor Studies'
            WHEN 'LATIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LBLST' THEN 'Liberal Studies'
            WHEN 'LBSCI' THEN 'Library Science'
            WHEN 'LCD' THEN 'Linguistics and Communication Disorders'
            WHEN 'LIBR' THEN 'Library'
            WHEN 'MATH' THEN 'Mathematics'
            WHEN 'MEDST' THEN 'Media Studies'
            WHEN 'MES' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'MUSIC' THEN 'Aaron Copland School of Music'
            WHEN 'PHIL' THEN 'Philosophy'
            WHEN 'PHYS' THEN 'Physics'
            WHEN 'PORT' THEN 'Hispanic Languages and Literatures'
            WHEN 'PSCI' THEN 'Political Science'
            WHEN 'PSYCH' THEN 'Psychology'
            WHEN 'RLGST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'RM' THEN 'Economics'
            WHEN 'RUSS' THEN 'European Languages & Literature'
            WHEN 'SEEK' THEN 'SEEK Program'
            WHEN 'SEYS' THEN 'Secondary Education and Youth Service'
            WHEN 'SEYSL' THEN 'Secondary Education and Youth Service'
            WHEN 'SOC' THEN 'Sociology'
            WHEN 'SPAN' THEN 'Hispanic Literature & Language'
            WHEN 'SPST' THEN 'Special Studies'
            WHEN 'STABD' THEN 'Study Abroad'
            WHEN 'STPER' THEN 'Student Personnel'
            WHEN 'URBST' THEN 'Urban Studies'
            WHEN 'WGS' THEN 'Women and Gender Studies'
            ELSE 'Unknown' --Cert,Mam,Perm
        END AS Department
    FROM Uploadfile.CurrentSemesterCourseOfferings
) AS b
join Uploadfile.CurrentSemesterCourseOfferings on DepartmentCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Department table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Instructor  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_InstructorTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    -- Insert into the customer table including the user auth key
		insert into Department.Instructor
		(LastName,FirstName, FullName, UserAuthorizationKey)
		SELECT distinct
    	SUBSTRING([Instructor], 1, CHARINDEX(',', [Instructor]) - 1) AS LastName,
    	SUBSTRING([Instructor], CHARINDEX(',', [Instructor]) + 2, LEN([Instructor]) - CHARINDEX(',', [Instructor]) - 1) AS FirstName,
    	Instructor,
        @UserAuthorizationKey
		FROM 
    Uploadfile.CurrentSemesterCourseOfferings

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Instructor table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Department Bridge  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_DepartmentBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Department.InstructorDepartment
    (
        InstructorId,
        DepartmentId,
        UserAuthorizationKey
    )
    SELECT DISTINCT InstructorId, DepartmentID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN Department.Departments ON DepartmentAbv = (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)))
    JOIN Department.Instructor ON FullName = Instructor

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashish>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Building Location Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_BuildingLocation]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

   
    insert into [Location].BuildingLocation
    (BuildingLocationAbv,BuildingLocationName, UserAuthorizationKey)
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
        end as Building,
        @UserAuthorizationKey
    from uploadfile.CurrentSemesterCourseOfferings

  
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into BuildingLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashish>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Room Location Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_RoomLocationTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    insert into [Location].[RoomLocation]
    (RoomLocationName, BuildingLocationID, UserAuthorizationKey)
    select distinct([Location]), buildinglocationID, @UserAuthorizationKey from uploadfile.CurrentSemesterCourseOfferings
    join [Location].[BuildingLocation] on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Truncate  Data>
-- =============================================
CREATE PROCEDURE [Project3].[TruncateData]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;
    TRUNCATE table Course.Class;
    TRUNCATE table Course.Course;
    TRUNCATE table Course.Mode_Of_Instruction;
    Truncate Table Course.CoursesClassMode;
    TRUNCATE table Department.Departments;
    TRUNCATE Table Department.Instructor;
    TRUNCATE Table Department.InstructorDepartment;
    TRUNCATE Table [LOCATION].BuildingLocation;
    TRUNCATE Table [Location].[RoomLocation];

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load Data>
-- =============================================
CREATE PROCEDURE [Project3].[LoadData] @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
	    DECLARE @StartingDateTime DATETIME2 = SYSDATETIME();

    --
    --	Drop All of the foreign keys prior to truncating tables
 	--
    EXEC  [Project3].[DropForeignKeysFromQueensClassSchedule] @UserAuthorizationKey = 1;
	--
	--	Check row count before truncation
	EXEC	[Project3].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 1  -- Change -1 to the appropriate UserAuthorizationKey
    --
    --	Always truncate the data
    --
    EXEC  [Project3].[TruncateData] @UserAuthorizationKey = 1;
    --
    --	Load the schema
    --

	
	EXEC  [Project3].[Load_DepartmentTable] @UserAuthorizationKey = 2;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_InstructorTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_DepartmentBridgeTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ModeOfInstruction] @UserAuthorizationKey = 1;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_CourseTable] @UserAuthorizationKey = 6;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ClassTable] @UserAuthorizationKey = 5;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_CourseBridgeTable] @UserAuthorizationKey = 5;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_BuildingLocation] @UserAuthorizationKey = 7;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC [Project3].[Load_RoomLocationTable] @UserAuthorizationKey = 3;  -- Change -1 to the appropriate UserAuthorizationKey
  --
    --	Recreate all of the foreign keys prior after loading
    --
 	--
	--	Check row count before truncation
	EXEC [Project3].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 1  -- Change -1 to the appropriate UserAuthorizationKey
	--
    EXEC [Project3].[AddForeignKeysToQueensClassSchedule] @UserAuthorizationKey = 1;  -- Change -1 to the appropriate UserAuthorizationKey
    --


    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Loading all the Data', @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO



