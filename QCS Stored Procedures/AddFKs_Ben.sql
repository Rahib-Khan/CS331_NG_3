SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ben>
-- Create date: <5/12/2024>
-- Description:	<Add Foreign Keys to QueensClassSchedule DB >
-- =============================================
ALTER PROCEDURE [Project3].[AddForeignKeysToQueensClassSchedule]

    @UserAuthorizationKey INT

AS
BEGIN

    ALTER TABLE [Course].[Class]
		ADD 
    		CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES [Department].[Instructor] (InstructorId),
				CONSTRAINT [FK_Class_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
      
    ALTER TABLE [Course].[Course]
    ADD 
  			CONSTRAINT [FK_Course_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Course].[Mode_Of_Instruction]
 		ADD 
  			CONSTRAINT [FK_MOI_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
    
    ALTER TABLE [Course].[CoursesClassMode]
		ADD 
    	CONSTRAINT [CourseId] FOREIGN KEY (CourseId)
      REFERENCES [Course].[Course] (CourseId),
			CONSTRAINT [ModeId] FOREIGN KEY (ModeId)
      REFERENCES [Course].[Mode_Of_Instruction] (ModeId),
			CONSTRAINT [ClassId] FOREIGN KEY (ClassId) 
      REFERENCES [Course].[Class] (ClassId),
  		CONSTRAINT [FK_CourseBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[Instructor]
    ADD 
    	CONSTRAINT [FK_Instructor_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

      ALTER TABLE [Department].[Departments]
    ADD 
    	CONSTRAINT [FK_Department_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[InstructorDepartment]
    ADD
        CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES Department.Instructor (InstructorID),
        CONSTRAINT [DepartmentID] FOREIGN KEY (DepartmentId)
        REFERENCES Department.Departments (DepartmentID),
    	CONSTRAINT [FK_DepBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)


		ALTER TABLE [Location].[BuildingLocation]
		ADD 
   			CONSTRAINT [FK_Building_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	    REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Location].[RoomLocation] 
		ADD CONSTRAINT [BuildingLocationID] FOREIGN KEY (BuildingLocationID) 
    		REFERENCES [Location].[BuildingLocation] (BuildingLocationId),
   			CONSTRAINT [FK_Room_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Add Foreign Keys to QueensClassSchedule DB', 
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END
GO
