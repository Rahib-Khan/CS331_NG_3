SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ben, Rahib, Nak, Mohammed>
-- Create date: <5/12/2024>
-- Description:	<Loading data into Department table>
-- =============================================
ALTER PROCEDURE [Project3].[Load_DepartmentTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

-- Insert into the customer table including the user auth key
insert into Department.Departments
(DepartmentName, DepartmentAbv, UserAuthorizationKey)
SELECT DISTINCT Department, SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)), @UserAuthorizationKey
FROM (
    SELECT DISTINCT (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))) AS DepartmentCode,
        CASE SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))
            WHEN 'ACCT' THEN 'Accounting & Information Systems'
            WHEN 'AFST' THEN 'Africana Studies'
            WHEN 'AMST' THEN 'American Studies'
            WHEN 'ANTH' THEN 'Anthropology'
            WHEN 'ARAB' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ARTH' THEN 'Art'
            WHEN 'ARTS' THEN 'Art'
            WHEN 'ASTR' THEN 'Astronomy'
            WHEN 'BALA' THEN 'Business and Liberal Arts'
            WHEN 'BIOCH' THEN 'Chemistry'
            WHEN 'BIOL' THEN 'Biology'
            WHEN 'BUS' THEN 'Business'
            WHEN 'CESL' THEN 'Academic Support'
            WHEN 'CHEM' THEN 'Chemistry'
            WHEN 'CHIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CLAS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMAL' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'CMLIT' THEN 'Comparative Literature'
            WHEN 'CO-OP' THEN 'Cooperative Education'
            WHEN 'CSCI' THEN 'Computer Science'
            WHEN 'CUNBA' THEN 'Hispanic Languages and Literatures'
            WHEN 'DANCE' THEN 'Dance'
            WHEN 'DRAM' THEN 'Drama, Theatre & Dance'
            WHEN 'EAST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'ECON' THEN 'Economics'
            WHEN 'ECP' THEN 'Educational and Community Programs'
            WHEN 'ECPCE' THEN 'Educational and Community Programs'
            WHEN 'ECPEL' THEN 'Educational and Community Programs'
            WHEN 'ECPSE' THEN 'Educational and Community Programs'
            WHEN 'ECPSP' THEN 'Educational and Community Programs'
            WHEN 'EECE' THEN 'Elementary and Early Childhood Education'
            WHEN 'ENGL' THEN 'English'
            WHEN 'ENSCI' THEN 'Earth and Environmental Sciences'
            WHEN 'EURO' THEN 'European Studies'
            WHEN 'FNES' THEN 'Family, Nutrition and Exercise Sciences'
            WHEN 'FREN' THEN 'European Languages & Literature'
            WHEN 'GEOL' THEN 'Earth and Environmental Sciences'
            WHEN 'GERM' THEN 'European Languages & Literature'
            WHEN 'GREEK' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'GRKMD' THEN 'European Languages & Literature'
            WHEN 'GRKST' THEN 'Byzantine & Mod Greek Studies'
            WHEN 'HEBRW' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'HIST' THEN 'History'
            WHEN 'HMNS' THEN 'Honors in the Mathematical and Natural Sciences'
            WHEN 'HNRS' THEN 'Macaulay Honors College'
            WHEN 'HSS' THEN 'Honors in the Social Sciences'
            WHEN 'HTH' THEN 'Honors in the Humanities'
            WHEN 'IRST' THEN 'Provost Office'
            WHEN 'ITAL' THEN 'European Languages & Literature'
            WHEN 'JAZZ' THEN 'Jazz'
            WHEN 'JEWST' THEN 'Jewish Studies'
            WHEN 'JOURN' THEN 'Journalism'
            WHEN 'JPNS' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'KOR' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LABST' THEN 'Labor Studies'
            WHEN 'LATIN' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'LBLST' THEN 'Liberal Studies'
            WHEN 'LBSCI' THEN 'Library Science'
            WHEN 'LCD' THEN 'Linguistics and Communication Disorders'
            WHEN 'LIBR' THEN 'Library'
            WHEN 'MATH' THEN 'Mathematics'
            WHEN 'MEDST' THEN 'Media Studies'
            WHEN 'MES' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'MUSIC' THEN 'Aaron Copland School of Music'
            WHEN 'PHIL' THEN 'Philosophy'
            WHEN 'PHYS' THEN 'Physics'
            WHEN 'PORT' THEN 'Hispanic Languages and Literatures'
            WHEN 'PSCI' THEN 'Political Science'
            WHEN 'PSYCH' THEN 'Psychology'
            WHEN 'RLGST' THEN 'Classical, Middle East & Asian Languages'
            WHEN 'RM' THEN 'Economics'
            WHEN 'RUSS' THEN 'European Languages & Literature'
            WHEN 'SEEK' THEN 'SEEK Program'
            WHEN 'SEYS' THEN 'Secondary Education and Youth Service'
            WHEN 'SEYSL' THEN 'Secondary Education and Youth Service'
            WHEN 'SOC' THEN 'Sociology'
            WHEN 'SPAN' THEN 'Hispanic Literature & Language'
            WHEN 'SPST' THEN 'Special Studies'
            WHEN 'STABD' THEN 'Study Abroad'
            WHEN 'STPER' THEN 'Student Personnel'
            WHEN 'URBST' THEN 'Urban Studies'
            WHEN 'WGS' THEN 'Women and Gender Studies'
            ELSE 'Unknown' --Cert,Mam,Perm
        END AS Department
    FROM Uploadfile.CurrentSemesterCourseOfferings
) AS b
join Uploadfile.CurrentSemesterCourseOfferings on DepartmentCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))

    select * from Department.Departments
    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Department table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
