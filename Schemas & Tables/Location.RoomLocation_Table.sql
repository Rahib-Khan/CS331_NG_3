SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashish>
-- Create date: <5/12/2024>
-- Description:	<Creating the Room Location Table>
-- =============================================
CREATE TABLE [Location].[RoomLocation](
	[RoomLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[BuildingLocationID] [udt].[SurrogateKeyInt] NOT NULL,
	[RoomLocationName] [udt].[SurrogateKeyString] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[RoomLocation] ADD PRIMARY KEY CLUSTERED 
(
	[RoomLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Location].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Location].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Location].[RoomLocation]  WITH CHECK ADD  CONSTRAINT [BuildingLocationID] FOREIGN KEY([BuildingLocationID])
REFERENCES [Location].[BuildingLocation] ([BuildingLocationID])
GO
ALTER TABLE [Location].[RoomLocation] CHECK CONSTRAINT [BuildingLocationID]
GO
ALTER TABLE [Location].[RoomLocation]  WITH CHECK ADD  CONSTRAINT [FK_Room_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Location].[RoomLocation] CHECK CONSTRAINT [FK_Room_UserAuthorizationKey]
GO
