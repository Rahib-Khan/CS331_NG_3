-- Load RoomLocation Table
-- Author: Mohammad Fayyaz --revised by Nak
CREATE PROCEDURE [Project3].[Load_RoomLocationTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

insert into [Location].[RoomLocation]
(RoomLocationName, BuildingLocationID)
select distinct([Location]), buildinglocationID from uploadfile.CurrentSemesterCourseOfferings
join [Location].[BuildingLocation] on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table';
END
