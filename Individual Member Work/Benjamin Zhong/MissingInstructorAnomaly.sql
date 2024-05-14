-- ======================================================================================
-- Author:		<Rahib & Ben>
-- Create date: <5/13/2024>
-- Description:	<Missing Instructor Anomaly>
-- ======================================================================================
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Instructor = 'John, Smith'
WHERE Instructor LIKE ',' 
