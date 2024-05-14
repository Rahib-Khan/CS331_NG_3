create table [Location].[RoomLocation](
  [RoomLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationID] [udt].[SurrogateKeyInt] not null,
  [RoomLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)


insert into [Location].[RoomLocation]
(RoomLocationName, BuildingLocationID)
select distinct([Location]), buildinglocationID from uploadfile.CurrentSemesterCourseOfferings
join [Location].[BuildingLocation] on buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))