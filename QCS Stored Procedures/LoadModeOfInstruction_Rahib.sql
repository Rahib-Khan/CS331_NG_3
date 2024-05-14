SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/12/2024>
-- Description:	<Loading data into MOI table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_ModeOfInstruction]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Mode_Of_Instruction
    (
        ModeName,
        UserAuthorizationKey
    )
    SELECT distinct[Mode Of Instruction], @UserAuthorizationKey FROM Uploadfile.CurrentSemesterCourseOfferings

    SELECT * from Course.Mode_Of_Instruction

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into MOI table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
