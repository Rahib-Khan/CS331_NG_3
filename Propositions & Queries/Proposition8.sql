-- =================================================================================================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description: Proposition #8 - Find all instructors with last name Smith except instructor with name John Smith. 
-- =================================================================================================================
SELECT * from Department.Instructor
where FullName like '%smith%'
EXCEPT
SELECT * from Department.Instructor
where FullName like '%john%'