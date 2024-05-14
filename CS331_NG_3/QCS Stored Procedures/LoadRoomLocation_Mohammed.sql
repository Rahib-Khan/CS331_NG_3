-- Mohammad Fayyaz 
CREATE PROCEDURE [Project3].[Load_RoomLocation]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    
    INSERT INTO [Location].Room_Location
    (RoomLocation_ID, RoomName, BuildingLocation_ID)
    SELECT DISTINCT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), 
        COALESCE(NULLIF(RoomName, ''), 'Unknown'), 
        BuildingLocation_ID 
    FROM 
        uploadfile.CurrentSemesterCourseOfferings
    WHERE 
        RoomName IS NOT NULL;

    
    EXEC [Process].[usp_TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into RoomLocation table';
END;
