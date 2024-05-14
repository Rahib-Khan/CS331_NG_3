CREATE TABLE [Course].[Mode_Of_Instruction]
(
  [ModeID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [ModeName] [udt].[workflowstring] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
);


INSERT INTO Course.Mode_Of_Instruction
(
    ModeName
)
SELECT distinct[Mode Of Instruction] FROM Uploadfile.CurrentSemesterCourseOfferings