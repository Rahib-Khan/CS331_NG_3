-- =================================================================================================================
-- Author:		<Esteban>
-- Create date: <5/13/2024>
-- Description: Proposition #12 - Shows how many classes are in each Mode of Instruction
-- =================================================================================================================
SELECT 
    moi.ModeName,
    COUNT(*) AS NumberOfClasses
FROM Course.Mode_Of_Instruction moi
JOIN Course.CoursesCLassMode ccm ON moi.ModeID = ccm.ModeID
GROUP BY moi.ModeName
ORDER BY NumberOfClasses DESC