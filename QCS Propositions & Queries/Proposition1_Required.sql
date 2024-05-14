-- =============================================
-- Author:		<Ahmed>
-- Create date: <5/13/2024>
-- Description: Show all instructors who are teaching in classes in multiple departments
-- =============================================                         

SELECT i.FirstName, i.LastName, COUNT(DISTINCT d.DepartmentName) AS DepartmentCount
FROM Department.Instructor i
JOIN Department.InstructorDepartment id ON i.InstructorID = id.InstructorID
JOIN Department.Departments d ON id.DepartmentID = d.DepartmentID
GROUP BY i.FirstName, i.LastName
HAVING COUNT(DISTINCT d.DepartmentName) > 1
