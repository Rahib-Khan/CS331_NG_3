-- ======================================================================================
-- Author:		<Rahib & Ben>
-- Create date: <5/13/2024>
-- Description:	<Missing Time Anomaly>
-- ======================================================================================
UPDATE Uploadfile.CurrentSemesterCourseOfferings 
SET Time = '12:00 AM - 12:00 AM'
WHERE TIME LIKE '-' 
