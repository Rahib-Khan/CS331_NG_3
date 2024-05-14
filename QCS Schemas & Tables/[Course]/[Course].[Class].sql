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