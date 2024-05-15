-- ==========================================================================================
-- Author:		<Ben>
-- Create date: <5/13/2024>
-- Description:	Proposition #2 Required - How many instructors are in each department?
-- ==========================================================================================

select DepartmentName, count(b.InstructorId) as InstructorCount from Department.Departments a
join Department.InstructorDepartment b  on a.DepartmentID = b.DepartmentID
join Department.Instructor c on c.InstructorID = b.InstructorId
where b.InstructorID <> 676
group by DepartmentName
