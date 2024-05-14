-- ==============================================================================================
-- Author:		<Ahmed>
-- Create date: <5/13/2024>
-- Description:	<Proposition #5 Find classes where the enrollment is close to reaching the limit atleast 90% enrollment>
-- ==============================================================================================
SELECT c.ClassID, c.Section, c.ClassCode, c.Enrollment, c.Limit
FROM Course.Class c
WHERE c.Enrollment >= (0.9 * c.Limit);
