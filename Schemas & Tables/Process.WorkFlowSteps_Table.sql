SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/12/2024>
-- Description:	<Creating the WorkFlowSteps Table>
-- =============================================
CREATE TABLE [process].[WorkflowSteps](
	[WorkflowStepsKey] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[WorkflowStepsDescription] [udt].[workflowstring] NOT NULL,
	[WorkflowStepsTableRowCount] [udt].[Rowcount] NULL,
	[StartingDateTime] [udt].[DateAdded] NULL,
	[EndDateTime] [udt].[DateAdded] NULL,
	[ClassTime] [udt].[ClassTime] NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [process].[WorkflowSteps] ADD PRIMARY KEY CLUSTERED 
(
	[WorkflowStepsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkflowStepsTableRowCount]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ('7:45') FOR [ClassTime]
GO
