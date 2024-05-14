SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/12/2024>
-- Description:	<Creating the DBsecurity Table>
-- =============================================
CREATE TABLE [DbSecurity].[UserAuthorization](
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[ClassTime] [udt].[ClassTime] NULL,
	[IndividualProject] [udt].[IndividualProject] NULL,
	[GroupMemberLastName] [udt].[LastName] NOT NULL,
	[GroupMemberFirstName] [udt].[FirstName] NOT NULL,
	[GroupName] [udt].[GroupName] NOT NULL,
	[DateAdded] [udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('7:45') FOR [ClassTime]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('PROJECT 3') FOR [IndividualProject]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('GROUP NG_3') FOR [GroupName]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

insert into [DbSecurity].[UserAuthorization]
(GroupMemberLastName,GroupMemberFirstName)
VALUES
('Khandaker','Rahib'),
('Zhong','Benjamin'),
('Lee','Nak Heon'),
('Mesa','Esteban'),
('Fayyaz', 'Mohammad'),
('Maharjan', 'Ashish'),
('Sharif', 'Ahmed'),
('Singh', 'Inderpreet')