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