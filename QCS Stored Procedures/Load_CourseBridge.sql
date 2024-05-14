SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Course Bridge table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_CourseBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.CoursesCLassMode
    (
        ClassID,
        CourseId,
        ModeID,
        UserAuthorizationKey
    )
    SELECT Distinct ClassID, Courseid, a.ModeID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN [Course].[Class] ON ClassCode = code
    JOIN [Course].[Course] ON CourseCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)
    JOIN [Course].[Mode_Of_Instruction] a ON [ModeName] = [Mode of Instruction]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
