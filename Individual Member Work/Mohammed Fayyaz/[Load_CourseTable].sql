SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Course table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_CourseTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    insert into Course.Course
    (CourseCode,[Description], UserAuthorizationKey) 
    select distinct(SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)),
    [Description],
    @UserAuthorizationKey
    from Uploadfile.CurrentSemesterCourseOfferings

    Select * from Course.Course

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
