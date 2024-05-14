CREATE TABLE [Location].[BuildingLocation](
  [BuildingLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [BuildingLocationAbv] [udt].[SurrogateKeyString] not null,
  [BuildingLocationName] [udt].[SurrogateKeyString] not null,
  [UserAuthorizationKey] [Udt].[SurrogateKeyInt] null,
  [DateAdded] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
  [DateOfLastUpdate] [udt].[DateAdded] NULL DEFAULT SYSDATETIME(),
)



insert into [Location].BuildingLocation
(BuildingLocationAbv,BuildingLocationName)
select distinct(SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1))),
    case (SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1)))
        when 'IB' then 'I Building'
        when 'GC' then 'Gertz Center'
        when 'QH' then 'Queens Hall'
        when 'SU' then 'Student Union'
        when 'RA' then 'Rathhaus Hall'
        when 'MU' then 'Music Building'
        when 'KY' then 'Keily Hall'
        when 'RZ' then 'Razran Hall'
        when 'SB' then 'Science Building'
        when 'CH' then 'Colwin Hall'
        when 'HH' then 'Honors Hall'
        when 'AR' then 'Alumni Hall'
        when 'DY' then 'Delany Hall'
        when 'PH' then 'Powdermaker Hall'
        when 'RO' then 'Rosenthal Library'
        when 'FG' then 'FitzGerald Gym'
        when 'CD' then 'Colden Auditorium'
        when 'KG' then 'King Hall'
        when 'JH' then 'Jefferson Hall'
        when 'RE' then 'Remsen Hall'
        when 'KP' then 'Klapper Hall'
        when 'GT' then 'Goldstein Theatre'
        when 'GB' then 'G Building'
        else 'Unknown'
    end as Building
from uploadfile.CurrentSemesterCourseOfferings