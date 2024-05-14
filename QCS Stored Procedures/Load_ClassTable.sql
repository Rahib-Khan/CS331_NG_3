SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Class table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_ClassTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    insert into Course.Class
    (Enrollment, [Limit], Section, ClassCode, [Days], [Time], [Hours], [Credits],InstructorID, UserAuthorizationKey  )
    select Enrolled, [Limit], Sec, Code, [Day], [Time], 
    (SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(',', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1)),
    (SUBSTRING([Course (hr, crd)], CHARINDEX(')', [Course (hr, crd)]) - 1, 1)),
    InstructorID,
    @UserAuthorizationKey
    from Uploadfile.CurrentSemesterCourseOfferings a
    JOIN Department.Instructor ON FullName = Instructor

    select * from Course.Class

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Class table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
