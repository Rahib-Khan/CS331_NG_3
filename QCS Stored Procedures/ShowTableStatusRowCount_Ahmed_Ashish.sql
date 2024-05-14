SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashish>
-- Create date: <5/12/2024>
-- Description:	<Shows number of rows in each table>
-- =============================================
ALTER PROCEDURE [Project3].[ShowTableStatusRowCount]
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

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkFlowStepsDescription = 'ShowTableRowCount',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

    SET NOCOUNT OFF;
END;
GO
