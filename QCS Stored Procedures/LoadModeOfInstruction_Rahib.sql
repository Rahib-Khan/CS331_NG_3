-- RAHIB
CREATE PROCEDURE [Project3].[Load_ModeOfInstruction]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Mode_Of_Instruction
    (
        ModeName
    )
    SELECT distinct[Mode Of Instruction] FROM Uploadfile.CurrentSemesterCourseOfferings

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into MOI table';
END
