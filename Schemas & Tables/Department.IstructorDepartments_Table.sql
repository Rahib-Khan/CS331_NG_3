SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nak>
-- Create date: <5/12/2024>
-- Description:	<Creating the Department Bridge Table>
-- =============================================
CREATE TABLE [Department].[InstructorDepartment](
	[InstructorId] [udt].[SurrogateKeyInt] NOT NULL,
	[DepartmentId] [udt].[SurrogateKeyInt] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Department].[InstructorDepartment] ADD PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC,
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Department].[InstructorDepartment] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[InstructorDepartment] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Department].[InstructorDepartment]  WITH CHECK ADD  CONSTRAINT [DepartmentID] FOREIGN KEY([DepartmentId])
REFERENCES [Department].[Departments] ([DepartmentID])
GO
ALTER TABLE [Department].[InstructorDepartment] CHECK CONSTRAINT [DepartmentID]
GO
ALTER TABLE [Department].[InstructorDepartment]  WITH CHECK ADD  CONSTRAINT [FK_DepBridge_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Department].[InstructorDepartment] CHECK CONSTRAINT [FK_DepBridge_UserAuthorizationKey]
GO
ALTER TABLE [Department].[InstructorDepartment]  WITH CHECK ADD  CONSTRAINT [InstructorID] FOREIGN KEY([InstructorId])
REFERENCES [Department].[Instructor] ([InstructorID])
GO
ALTER TABLE [Department].[InstructorDepartment] CHECK CONSTRAINT [InstructorID]
GO
