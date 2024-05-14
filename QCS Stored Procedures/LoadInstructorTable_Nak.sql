SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Instructor table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_InstructorTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    -- Insert into the customer table including the user auth key
		insert into Department.Instructor
		(LastName,FirstName, FullName, UserAuthorizationKey)
		SELECT distinct
    	SUBSTRING([Instructor], 1, CHARINDEX(',', [Instructor]) - 1) AS LastName,
    	SUBSTRING([Instructor], CHARINDEX(',', [Instructor]) + 2, LEN([Instructor]) - CHARINDEX(',', [Instructor]) - 1) AS FirstName,
    	Instructor,
        @UserAuthorizationKey
		FROM 
    Uploadfile.CurrentSemesterCourseOfferings

    SELECT * from Department.Instructor

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Instructor table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
