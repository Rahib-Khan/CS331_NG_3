SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashish & Ahmed>
-- Create date: <5/12/2024>
-- Description:	<Creating the Building Table>
-- =============================================
CREATE TABLE [Location].[BuildingLocation](
	[BuildingLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[BuildingLocationAbv] [udt].[SurrogateKeyString] NOT NULL,
	[BuildingLocationName] [udt].[SurrogateKeyString] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[BuildingLocation] ADD PRIMARY KEY CLUSTERED 
(
	[BuildingLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Location].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Location].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Location].[BuildingLocation]  WITH CHECK ADD  CONSTRAINT [FK_Building_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Location].[BuildingLocation] CHECK CONSTRAINT [FK_Building_UserAuthorizationKey]
GO
