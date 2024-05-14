-- ======================================================================================
-- Author:		<Rahib & Ben>
-- Create date: <5/13/2024>
-- Description:	<Limit Exceeded Anomaly - Change limit and enrolled columns into int>
-- ======================================================================================
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Limit = Enrolled + 10
WHERE Enrolled > Limit
