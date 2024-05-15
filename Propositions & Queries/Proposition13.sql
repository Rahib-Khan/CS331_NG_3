
-- =================================================================================================================
-- Author:		<Inderpreet>
-- Create date: <5/13/2024>
-- Description: Proposition #13 Required - Show all advanced courses (More than 3 Hours)
-- =================================================================================================================
SELECT DISTINCT
    c.CourseCode,
    [Description],
    [Hours],Credits
FROM Course.Class a 
join Course.CoursesCLassMode b on a.ClassID = b.classid
join Course.Course c on b.CourseId = c.CourseID
join  Department.Instructor d on a.instructorid = d.InstructorID
WHERE [Hours] > 3;

