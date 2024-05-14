-- ---------------------------------------*****************************************************-------------------------------------------------- 
 
-- Author: Esteban Mesa & Rahib Khandaker
-- Procedure: [Project3].[DropForeignKeysFromQueensClassSchedule]
-- Create date: 05, 12, 2024
-- Description: Drop Foreign key
-- ---------------------------------------*****************************************************--------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Project3].[DropForeignKeysFromQueensClassSchedule]
    @UserAuthorizationKey INT
AS
BEGIN
    ALTER TABLE [Course].[Class]
    DROP CONSTRAINT IF EXISTS InstructorID, FK_Class_UserAuthorizationKey;

    ALTER TABLE [Course].[Course]
    DROP CONSTRAINT IF EXISTS  FK_Course_UserAuthorizationKey;

    ALTER TABLE [Course].[Mode_Of_Instruction]
    DROP CONSTRAINT IF EXISTS  FK_MOI_UserAuthorizationKey;

    ALTER TABLE [Course].[CoursesClassMode]
    DROP CONSTRAINT IF EXISTS  Classid, Modeid, Courseid, FK_CourseBridge_UserAuthorizationKey;

    ALTER TABLE [Department].[Instructor]
    DROP CONSTRAINT IF EXISTS  FK_Instructor_UserAuthorizationKey;

    ALTER TABLE [Department].[Departments]
    DROP CONSTRAINT IF EXISTS  FK_Department_UserAuthorizationKey;

    ALTER TABLE [Department].[InstructorDepartment]
    DROP CONSTRAINT IF EXISTS  InstructorID, DepartmentID, FK_DepBridge_UserAuthorizationKey;

    ALTER TABLE [Location].[BuildingLocation]
    DROP CONSTRAINT IF EXISTS Classid, FK_Building_UserAuthorizationKey;

    ALTER TABLE [Location].[RoomLocation]
    Drop CONSTRAINT if EXISTS BuildingLocationID, FK_Room_UserAuthorizationKey

    -- now we just log the work :D
    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Drop Foreign Keys from QueensClassSchedule DB',
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO
