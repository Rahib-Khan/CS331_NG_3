-- Mohammad Fayyaz
CREATE PROCEDURE [Project3].[TruncateData]
AS
BEGIN
    SET NOCOUNT ON;

    -- Truncate Room Location Table
    TRUNCATE TABLE [Location].Room_Location;

    -- Truncate Building Location Table
    TRUNCATE TABLE [Location].Building_Location;

    -- Truncate Department Table
    TRUNCATE TABLE [Department].Department;

    -- Truncate Instructor Table
    TRUNCATE TABLE [Department].Instructor;

    -- Truncate Course Mode of Instruction Table
    TRUNCATE TABLE [Course].Mode_Of_Instruction;

    -- Truncate Course Table
    TRUNCATE TABLE [Course].Course;

    PRINT 'All specified tables have been truncated successfully.';
END;
