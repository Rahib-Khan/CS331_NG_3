-- ======================================================================================
-- Author:		<Rahib & Ben>
-- Create date: <5/13/2024>
-- Description:	<Missing Location Anomaly>
-- ======================================================================================
USE QueensClassSchedule
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Location = 'Unknown '
WHERE Location LIKE 'Unknown' 
