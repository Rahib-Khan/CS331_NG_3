-- ======================================================================================
-- Author:		<Rahib & Ben>
-- Create date: <5/13/2024>
-- Description:	<Missing Day Anomaly>
-- ======================================================================================
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Day = 'U'
WHERE DAY LIKE ''
