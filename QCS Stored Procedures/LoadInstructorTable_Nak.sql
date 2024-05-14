-- Load Instructor Table
-- Author: Nak Heon Lee
CREATE PROCEDURE [Project3].[Load_InstructorTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    -- Insert into the customer table including the user auth key
		insert into Department.Instructor
		(LastName,FirstName, FullName)
		SELECT distinct
    	SUBSTRING([Instructor], 1, CHARINDEX(',', [Instructor]) - 1) AS LastName,
    	SUBSTRING([Instructor], CHARINDEX(',', [Instructor]) + 2, LEN([Instructor]) - CHARINDEX(',', [Instructor]) - 1) AS FirstName,
    	Instructor
		FROM 
    Uploadfile.CurrentSemesterCourseOfferings

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Instructor table';
END
