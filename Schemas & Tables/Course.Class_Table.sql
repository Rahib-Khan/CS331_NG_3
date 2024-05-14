SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/12/2024>
-- Description:	<Creating the Class Table>
-- =============================================
CREATE TABLE [Course].[Class](
	[ClassID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[Enrollment] [udt].[SurrogateKeyInt] NULL,
	[Limit] [udt].[SurrogateKeyInt] NULL,
	[Section] [udt].[SurrogateKeyString] NULL,
	[ClassCode] [udt].[SurrogateKeyString] NULL,
	[Days] [udt].[SurrogateKeyString] NULL,
	[Time] [udt].[ClassDuration] NULL,
	[Hours] [udt].[SurrogateKeyFloat] NULL,
	[Credits] [udt].[SurrogateKeyInt] NULL,
	[InstructorID] [udt].[SurrogateKeyInt] NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Course].[Class] ADD PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[Class] CHECK CONSTRAINT [FK_Class_UserAuthorizationKey]
GO
ALTER TABLE [Course].[Class]  WITH CHECK ADD  CONSTRAINT [InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [Department].[Instructor] ([InstructorID])
GO
ALTER TABLE [Course].[Class] CHECK CONSTRAINT [InstructorID]
GO
