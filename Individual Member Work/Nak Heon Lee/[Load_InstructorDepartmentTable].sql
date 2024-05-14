SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Department Bridge table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_DepartmentBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Department.InstructorDepartment
    (
        InstructorId,
        DepartmentId,
        UserAuthorizationKey
    )
    SELECT DISTINCT InstructorId, DepartmentID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN Department.Departments ON DepartmentAbv = (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)))
    JOIN Department.Instructor ON FullName = Instructor

    SELECT * from Department.InstructorDepartment

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
