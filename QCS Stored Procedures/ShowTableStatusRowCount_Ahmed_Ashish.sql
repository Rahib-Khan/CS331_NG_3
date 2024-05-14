-- ShowTableStatusRowCount 
-- AShish + Ahmed
CREATE PROCEDURE [Project3].[ShowTableStatusRowCount]
@UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 'Course' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Course]
    UNION ALL
    SELECT 'Class' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Class]
    UNION ALL
    SELECT 'Mode_Of_Instruction' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Mode_Of_Instruction]
    UNION ALL
    SELECT 'Departments' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Departments]
    UNION ALL
    SELECT 'Instructor' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Instructor]
    UNION ALL
    SELECT 'InstructorDepartment' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[InstructorDepartment]
    UNION ALL
    SELECT 'BuildingLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[BuildingLocation]
    UNION ALL
    SELECT 'RoomLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[RoomLocation]
    UNION ALL
    SELECT 'CoursesClassMode' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[CoursesClassMode];


    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkFlowStepDescription = 'ShowTableRowCount';

    SET NOCOUNT OFF;
END;
