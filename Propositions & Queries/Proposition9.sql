-- =================================================================================================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description: Proposition #9 - Find all course abbreviations with education in the Department.
-- =================================================================================================================
SELECT DepartmentAbv
FROM Department.Departments
WHERE DepartmentName LIKE '%Education%'

