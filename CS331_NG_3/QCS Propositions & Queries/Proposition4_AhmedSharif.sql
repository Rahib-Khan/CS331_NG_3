-- ===========================================================================================
-- Author:		<Ahmed>
-- Create date: <5/13/2024>
-- Description:	<Proposition #4 Find the courses with the highest and lowest enrollments>
-- ===========================================================================================
SELECT c.CourseCode, 
       c.Description,
       MAX(cl.Enrollment) AS MaxEnrollment,
       MIN(cl.Enrollment) AS MinEnrollment
FROM Course.Course c
LEFT JOIN Course.Class cl ON c.CourseID = cl.ClassID
GROUP BY c.CourseCode, c.Description
ORDER BY MaxEnrollment DESC, MinEnrollment ASC;
