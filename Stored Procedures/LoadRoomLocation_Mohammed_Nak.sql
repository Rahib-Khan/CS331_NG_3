SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Mohammed>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Room Location table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_RoomLocationTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    insert into [Location].[RoomLocation]
    (RoomLocationName, BuildingLocationID, UserAuthorizationKey)
    select distinct([Location]), buildinglocationID, @UserAuthorizationKey from uploadfile.CurrentSemesterCourseOfferings
    join [Location].[BuildingLocation] on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))

    SELECT * from [Location].RoomLocation

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
