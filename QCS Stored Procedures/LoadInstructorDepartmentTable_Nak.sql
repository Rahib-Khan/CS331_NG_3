-- Load InstructorDepartment Table
-- Author: Nak Heon Lee
CREATE PROCEDURE [Project3].[Load_InstructorDepartmentTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    -- Insert into the customer table including the user auth key
INSERT INTO Department.InstructorDepartment
(
    InstructorId,
    DepartmentId
)
SELECT DISTINCT InstructorId, DepartmentID
FROM Uploadfile.CurrentSemesterCourseOfferings
JOIN Department.Departments ON DepartmentAbv = (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)))
JOIN Department.Instructor ON FullName = Instructor

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into InstructorDepartment table';
END
