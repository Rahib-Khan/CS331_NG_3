-- ADDFOREIGNKEYSTOQUEENSCLASSSCHEDULE DB
-- Ben

CREATE PROCEDURE [Project3].[AddForeignKeysToQueensClassSchedule]

    @UserAuthorizationKey INT

AS
BEGIN

    ALTER TABLE [Course].[Class]
		ADD 
    		CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES [Department].[Instructor] (InstructorId),
				CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
      
    ALTER TABLE [Course].[Course]
    ADD 
  			CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Course].[ModeOfInstruction]
 		ADD 
  			CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
    
    ALTER TABLE [Course].[CourseClassMode]
		ADD 
    	CONSTRAINT [CourseId] FOREIGN KEY (CourseId)
      REFERENCES [Course].[Course] (CourseId),
			CONSTRAINT [ModeId] FOREIGN KEY (ModeId)
      REFERENCES [Course].[ModeOfInstruction] (ModeId),
			CONSTRAINT [ClassId] FOREIGN KEY (ClassId) 
      REFERENCES [Course].[Class] (ClassId),
  		CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[Instructor]
    ADD 
    	CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[InstructorDepartment]
    ADD
    	CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[Department]
    ADD 
    	CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Location].[BuildingLocation]
		ADD CONSTRAINT [ClassId] FOREIGN KEY (ClassId)
    		REFERENCES [Course].[Class] (ClassId),
   			CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Location].[RoomLocation] 
		ADD CONSTRAINT [BuildingId] FOREIGN KEY (BuildingId) 
    		REFERENCES [Location].[BuildingLocation] (BuildingLocationId),
   			CONSTRAINT [UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepDescription = 'Add Foreign Keys to QueensClassSchedule DB', @UserAuthorizationKey = @UserAuthorizationKey;

END
