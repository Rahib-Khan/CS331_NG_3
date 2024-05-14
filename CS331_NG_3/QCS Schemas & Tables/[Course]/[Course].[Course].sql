CREATE TABLE [Course].[Course]
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