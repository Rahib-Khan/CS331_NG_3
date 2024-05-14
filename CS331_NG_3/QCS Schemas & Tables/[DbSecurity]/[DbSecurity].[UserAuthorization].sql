CREATE TABLE [DbSecurity].[UserAuthorization]
(
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ClassTime] [Udt].[ClassTime] NULL DEFAULT ('7:45'),
	[IndividualProject] [Udt].[IndividualProject] NULL DEFAULT('PROJECT 3'),
	[GroupMemberLastName] [Udt].[LastName] NOT NULL,
	[GroupMemberFirstName] [Udt].[FirstName] NOT NULL,
	[GroupName] [Udt].[GroupName] NOT NULL DEFAULT ('GROUP NG_3'),
	[DateAdded] [Udt].[DateAdded] NULL DEFAULT SYSDATETIME()
)

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