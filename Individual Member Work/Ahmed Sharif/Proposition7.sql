-- ==================================================================================================================================
-- Author:		<Ahmed>
-- Create date: <5/13/2024>
-- Description:	<Proposition #7 Determine the number of courses offered by each department during a specific semester or time period>
-- ==================================================================================================================================
 SELECT 
    D.DepartmentAbv,
    COUNT(*) AS CourseCount
FROM 
    Department.Departments D
INNER JOIN 
    Uploadfile.CurrentSemesterCourseOfferings C
ON 
    D.DepartmentAbv = SUBSTRING(C.[Course (hr, crd)], 1, CHARINDEX(' ', C.[Course (hr, crd)], 1))
GROUP BY 
    D.DepartmentAbv
