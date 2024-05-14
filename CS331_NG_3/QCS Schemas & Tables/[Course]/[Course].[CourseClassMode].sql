-- Bridge Table Connecting All tables in Course Schema
Create Table [Course].[CoursesCLassMode](
  [CourseId] [udt].[SurrogateKeyInt],
  [ClassID] [udt].[SurrogateKeyInt],
  [ModeID] [udt].[SurrogateKeyInt],
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME()
  PRIMARY Key (ClassID,CourseID, Modeid),
  FOREIGN Key (ClassID) REFERENCES [Course].[Class],
  FOREIGN Key (CourseId) REFERENCES [Course].[course],
  FOREIGN Key (ModeID) REFERENCES [Course].[Mode_Of_Instruction]
)



INSERT INTO Course.CoursesCLassMode
(
    ClassID,
    CourseId,
    ModeID
)
SELECT Distinct ClassID, Courseid, a.ModeID
FROM Uploadfile.CurrentSemesterCourseOfferings
JOIN [Course].[Class] ON ClassCode = code
JOIN [Course].[Course] ON CourseCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)
JOIN [Course].[Mode_Of_Instruction] a ON [ModeName] = [Mode of Instruction]