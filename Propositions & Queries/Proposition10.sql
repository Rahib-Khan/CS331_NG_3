-- =================================================================================================================
-- Author:		<Esteban>
-- Create date: <5/13/2024>
-- Description: Proposition #10 - Shows how many classes each instructor teaches
-- =================================================================================================================
SELECT 
    i.FirstName + ' ' + i.LastName AS InstructorName,
    COUNT(cl.ClassID) AS NumberOfClasses
FROM Department.Instructor i
JOIN Course.Class cl ON i.InstructorID = cl.InstructorID
GROUP BY i.FirstName, i.LastName;