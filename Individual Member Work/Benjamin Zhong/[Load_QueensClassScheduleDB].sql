-- LOAD QUEENS CLASS SCHEDULE PROCEDURE
-- Ben + Nak
CREATE PROCEDURE [Project3].[LoadQueensClassScheduleDB]

	@UserAuthorizationKey INT
  
AS
BEGIN 
		
    EXEC [Project3].[DropForeignKeysFromQueensClass]
    EXEC [Project3].[ShowTableStatusRowCount]
    EXEC [Project3].[TruncateData]
    EXEC [Project3].[ShowTableStatusRowCount]
    EXEC [Project3].[LoadCourse]
    EXEC [Project3].[LoadDepartment]
    EXEC [Project3].[LoadLocation]
	  EXEC [Project3].[ShowTableStatusRowCount]
    EXEC [Project3].[AddForeignKeysToQueensClassSchedule]
    EXEC [Project3].[TrackWorkFlow]
    
		EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = "Load QueensClassSchedule DB", @UserAuthorizationKey = @UserAuthorizationKey;
END
