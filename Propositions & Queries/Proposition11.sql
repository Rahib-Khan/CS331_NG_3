-- =================================================================================================================
-- Author:		<Esteban>
-- Create date: <5/13/2024>
-- Description: Proposition #11 - Shows average class size by department
-- =================================================================================================================
SELECT 
    d.DepartmentName,
    AVG(cl.Enrollment) AS AverageEnrollment
FROM Department.Departments d
JOIN Department.InstructorDepartment id ON d.DepartmentID = id.DepartmentId 
join Department.Instructor i on i.InstructorID = id.InstructorId
JOIN Course.Class cl ON i.InstructorID = cl.InstructorID
GROUP BY d.DepartmentName
ORDER BY AverageEnrollment DESC

select * from uplaodfile.current