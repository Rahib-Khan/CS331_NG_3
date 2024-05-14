-- ======================================================================================
-- Author:		<Ahmed & Ashish>
-- Create date: <5/13/2024>
-- Description:	<Proposition #6 Calculates the enrollment rate percentage for each class>
-- ======================================================================================
SELECT 
    cl.Section, 
    cl.Enrollment, 
    cl.Limit, 
    ROUND((CAST(cl.Enrollment AS FLOAT) / NULLIF(cl.Limit, 0)) * 100, 2) AS EnrollmentRate
FROM 
    Course.Class cl
