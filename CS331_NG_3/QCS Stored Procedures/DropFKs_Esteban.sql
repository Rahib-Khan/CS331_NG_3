-- ---------------------------------------*****************************************************-------------------------------------------------- 
 
-- Author: Esteban Mesa
-- Procedure: [Project3].[DropForeignKeysFromQueensClassSchedule]
-- Create date: 05, 12, 2024
-- Description: drop foregin key
-- ---------------------------------------*****************************************************--------------------------------------------------

CREATE PROCEDURE [Project3].[DropForeignKeysFromQueensClassSchedule]
    @UserAuthorizationKey INT
AS
BEGIN
 
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_Class_Instructor]') AND parent_object_id = OBJECT_ID(N'[Course].[Class]'))
        ALTER TABLE [Course].[Class] DROP CONSTRAINT [FK_Class_Instructor];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_Class_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Course].[Class]'))
        ALTER TABLE [Course].[Class] DROP CONSTRAINT [FK_Class_UserAuthorization];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_Course_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Course].[Course]'))
        ALTER TABLE [Course].[Course] DROP CONSTRAINT [FK_Course_UserAuthorization];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_ModeOfInstruction_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Course].[ModeOfInstruction]'))
        ALTER TABLE [Course].[ModeOfInstruction] DROP CONSTRAINT [FK_ModeOfInstruction_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_CourseClassMode_Course]') AND parent_object_id = OBJECT_ID(N'[Course].[CourseClassMode]'))
        ALTER TABLE [Course].[CourseClassMode] DROP CONSTRAINT [FK_CourseClassMode_Course];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_CourseClassMode_ModeOfInstruction]') AND parent_object_id = OBJECT_ID(N'[Course].[CourseClassMode]'))
        ALTER TABLE [Course].[CourseClassMode] DROP CONSTRAINT [FK_CourseClassMode_ModeOfInstruction];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_CourseClassMode_Class]') AND parent_object_id = OBJECT_ID(N'[Course].[CourseClassMode]'))
        ALTER TABLE [Course].[CourseClassMode] DROP CONSTRAINT [FK_CourseClassMode_Class];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Course].[FK_CourseClassMode_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Course].[CourseClassMode]'))
        ALTER TABLE [Course].[CourseClassMode] DROP CONSTRAINT [FK_CourseClassMode_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Department].[FK_Instructor_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Department].[Instructor]'))
        ALTER TABLE [Department].[Instructor] DROP CONSTRAINT [FK_Instructor_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Department].[FK_InstructorDepartment_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Department].[InstructorDepartment]'))
        ALTER TABLE [Department].[InstructorDepartment] DROP CONSTRAINT [FK_InstructorDepartment_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Department].[FK_Department_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Department].[Department]'))
        ALTER TABLE [Department].[Department] DROP CONSTRAINT [FK_Department_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Location].[FK_BuildingLocation_Class]') AND parent_object_id = OBJECT_ID(N'[Location].[BuildingLocation]'))
        ALTER TABLE [Location].[BuildingLocation] DROP CONSTRAINT [FK_BuildingLocation_Class];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Location].[FK_BuildingLocation_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Location].[BuildingLocation]'))
        ALTER TABLE [Location].[BuildingLocation] DROP CONSTRAINT [FK_BuildingLocation_UserAuthorization];


    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Location].[FK_RoomLocation_BuildingLocation]') AND parent_object_id = OBJECT_ID(N'[Location].[RoomLocation]'))
        ALTER TABLE [Location].[RoomLocation] DROP CONSTRAINT [FK_RoomLocation_BuildingLocation];

    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Location].[FK_RoomLocation_UserAuthorization]') AND parent_object_id = OBJECT_ID(N'[Location].[RoomLocation]'))
        ALTER TABLE [Location].[RoomLocation] DROP CONSTRAINT [FK_RoomLocation_UserAuthorization];

    -- now we just log the work :D
    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepDescription = 'Drop Foreign Keys from QueensClassSchedule DB', @UserAuthorizationKey = @UserAuthorizationKey;
END;
