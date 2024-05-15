﻿USE [master]
GO
/****** Object:  Database [QueensClassSchedule]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE DATABASE [QueensClassSchedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QC2019', FILENAME = N'/var/opt/mssql/data/QueensClassScheduleCurrentSemester.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QC2019_log', FILENAME = N'/var/opt/mssql/log/QueensClassScheduleCurrentSemester_0.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QueensClassSchedule] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QueensClassSchedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QueensClassSchedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QueensClassSchedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QueensClassSchedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET RECOVERY FULL 
GO
ALTER DATABASE [QueensClassSchedule] SET  MULTI_USER 
GO
ALTER DATABASE [QueensClassSchedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QueensClassSchedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QueensClassSchedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QueensClassSchedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QueensClassSchedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QueensClassSchedule', N'ON'
GO
ALTER DATABASE [QueensClassSchedule] SET QUERY_STORE = OFF
GO
USE [QueensClassSchedule]
GO
/****** Object:  User [student]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE USER [student] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EC3\thehitman]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE USER [EC3\thehitman] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BiStudent]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE USER [BiStudent] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [student]
GO
ALTER ROLE [db_owner] ADD MEMBER [EC3\thehitman]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BiStudent]
GO
/****** Object:  Schema [Course]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Course]
GO
/****** Object:  Schema [DbSecurity]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [DbSecurity]
GO
/****** Object:  Schema [Department]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Department]
GO
/****** Object:  Schema [GroupNameProject3]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [GroupNameProject3]
GO
/****** Object:  Schema [Location]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Location]
GO
/****** Object:  Schema [process]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [process]
GO
/****** Object:  Schema [Project3]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Project3]
GO
/****** Object:  Schema [udt]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [udt]
GO
/****** Object:  Schema [Uploadfile]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Uploadfile]
GO
/****** Object:  Schema [Utils]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [Utils]
GO
/****** Object:  Schema [YourLastName]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE SCHEMA [YourLastName]
GO
/****** Object:  UserDefinedDataType [udt].[ClassDuration]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[ClassDuration] FROM [nvarchar](30) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[ClassTime]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[ClassTime] FROM [nchar](5) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[DateAdded]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[DateAdded] FROM [datetime2](7) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[FirstName]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[FirstName] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[GroupName]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[GroupName] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[IndividualProject]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[IndividualProject] FROM [nvarchar](60) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[LastName]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[LastName] FROM [nvarchar](35) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[Rowcount]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[Rowcount] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[SurrogateKeyFloat]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[SurrogateKeyFloat] FROM [float] NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[SurrogateKeyInt]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[SurrogateKeyInt] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [udt].[SurrogateKeyString]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[SurrogateKeyString] FROM [nvarchar](30) NOT NULL
GO
/****** Object:  UserDefinedDataType [udt].[workflowstring]    Script Date: 5/14/2024 7:06:22 PM ******/
CREATE TYPE [udt].[workflowstring] FROM [nvarchar](100) NOT NULL
GO
/****** Object:  UserDefinedFunction [dbo].[JSONHierarchy]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[JSONHierarchy]
(
    @JSONData varchar(max)
  , @Parent_object_ID int = null
  , @MaxObject_id int = 0
  , @type int = null
)
returns @ReturnTable table
(											  
	-- https://www.red-gate.com/simple-talk/blogs/consuming-hierarchical-json-documents-sql-server-using-openjson/?utm_source=simpletalk&utm_medium=pubemail&utm_content=20171010-slota1&utm_term=simpletalkmain 
	--
    Element_ID int identity(1, 1) primary key /* internal surrogate primary key gives the order of parsing and the list order */
  , SequenceNo int null                       /* the sequence number in a list */
  , Parent_ID int                             /* if the element has a parent then it is in this column. The document is the ultimate parent, so you can get the structure from recursing from the document */
  , Object_ID int                             /* each list or object has an object id. This ties all elements to a parent. Lists are treated as objects here */
  , Name nvarchar(2000)                       /* the name of the object */
  , StringValue nvarchar(max) not null        /*the string representation of the value of the element. */
  , ValueType varchar(10) not null            /* the declared type of the value represented as a string in StringValue*/
)
as
begin
    --the types of JSON
    declare @null    int = 0
          , @string  int = 1
          , @int     int = 2
          , @boolean int = 3
          , @array   int = 4
          , @object  int = 5;

    declare @OpenJSONData table
    (
        sequence int identity(1, 1)
      , [key] varchar(200)
      , Value varchar(max)
      , type int
    );

    declare @key       varchar(200)
          , @Value     varchar(max)
          , @Thetype   int
          , @ii        int
          , @iiMax     int
          , @NewObject int
          , @firstchar char(1);

    insert into @OpenJSONData
    (
        [key]
      , Value
      , type
    )
    select [Key]
         , Value
         , Type
    from openjson(@JSONData);
    select @ii    = 1
         , @iiMax = scope_identity();
    select @firstchar
        = --the first character to see if it is an object or an array
        substring(
                     @JSONData
                   , patindex(
                                 '%[^' + char(0) + '- ' + char(160) + ']%'
                               , ' ' + @JSONData + '!' collate SQL_Latin1_General_CP850_BIN
                             ) - 1
                   , 1
                 );
    if @type is null
       and @firstchar in ( '[', '{' )
    begin
        insert into @ReturnTable
        (
            SequenceNo
          , Parent_ID
          , Object_ID
          , Name
          , StringValue
          , ValueType
        )
        select 1
             , null
             , 1
             , '-'
             , ''
             , case @firstchar
                   when '[' then
                       'array'
                   else
                       'object'
               end;
        select @type             = case @firstchar
                                       when '[' then
                                           @array
                                       else
                                           @object
                                   end
             , @Parent_object_ID = 1
             , @MaxObject_id     = coalesce(@MaxObject_id, 1) + 1;
    end;
    while (@ii <= @iiMax)
    begin
        --OpenJSON renames list items with 0-nn which confuses the consumers of the table
        select @key     = case
                              when [key] like '[0-9]%' then
                                  null
                              else
                                  [key]
                          end
             , @Value   = Value
             , @Thetype = type
        from @OpenJSONData
        where sequence = @ii;

        if @Thetype in ( @array, @object ) --if we have been returned an array or object
        begin
            select @MaxObject_id = coalesce(@MaxObject_id, 1) + 1;
            --just in case we have an object or array returned
            insert into @ReturnTable --record the object itself
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , @MaxObject_id
                 , @key
                 , ''
                 , case @Thetype
                       when @array then
                           'array'
                       else
                           'object'
                   end;

            insert into @ReturnTable --and return all its children
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , [Name]
              , StringValue
              , ValueType
            )
            select SequenceNo
                 , Parent_ID
                 , Object_ID
                 , [Name]
                 , StringValue
                 , ValueType
            from dbo.JSONHierarchy(@Value, @MaxObject_id, @MaxObject_id, @type);
            select @MaxObject_id = max(Object_ID) + 1
            from @ReturnTable;
        end;
        else
            insert into @ReturnTable
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , null
                 , @key
                 , @Value
                 , case @Thetype
                       when @string then
                           'string'
                       when @null then
                           'null'
                       when @int then
                           'int'
                       when @boolean then
                           'boolean'
                       else
                           'int'
                   end;

        select @ii = @ii + 1;
    end;

    return;
end;
GO
/****** Object:  UserDefinedFunction [dbo].[DatabaseObjects]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DatabaseObjects]
/**
    Summary: >
      lists out the full names, schemas and (where appropriate)
      the owner of the object.
    Author: PhilFactor
    Date: 10/9/2017
    Examples:
       - Select * from dbo.DatabaseObjects('2123154609,960722475,1024722703')
    Returns: >
      A table with the id, name of object and so on.
            **/
(
    @ListOfObjectIDs varchar(max)
)
returns table
--WITH ENCRYPTION|SCHEMABINDING, ..
as
return
(
    select object_id
         , schema_name(schema_id) + '.' + coalesce(object_name(parent_object_id) + '.', '') + name as name
    from sys.objects as ob
        inner join openjson(N'[' + @ListOfObjectIDs + N']')
            on convert(int, Value) = ob.object_id
);
GO
/****** Object:  View [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint] AS
SELECT  CONCAT(tbl.TABLE_SCHEMA, '.', tbl.TABLE_NAME) AS FullyQualifiedTableName ,
        tbl.TABLE_SCHEMA AS SchemaName ,
        tbl.TABLE_NAME AS TableName ,
        col.COLUMN_NAME AS ColumnName ,
        col.ORDINAL_POSITION AS OrdinalPosition,
        CONCAT(col.DOMAIN_SCHEMA, '.', col.DOMAIN_NAME) AS FullyQualifiedDomainName ,
        col.DOMAIN_NAME AS DomainName ,
        CASE 
			 WHEN col.DATA_TYPE = 'varchar'
             THEN CONCAT('varchar(', CHARACTER_MAXIMUM_LENGTH, ')')
			 WHEN col.DATA_TYPE = 'nvarchar'
             THEN CONCAT('nvarchar(', CHARACTER_MAXIMUM_LENGTH, ')')
			 WHEN col.DATA_TYPE = 'nchar'
             THEN CONCAT('nchar(', CHARACTER_MAXIMUM_LENGTH, ')')
             WHEN col.DATA_TYPE = 'numeric'
             THEN CONCAT('numeric(', NUMERIC_PRECISION_RADIX, ', ',
                         NUMERIC_SCALE, ')')
             WHEN col.DATA_TYPE = 'decimal'
             THEN CONCAT('decimal(', NUMERIC_PRECISION_RADIX, ', ',
                         NUMERIC_SCALE, ')')
             ELSE col.DATA_TYPE
        END AS DataType ,
        col.IS_NULLABLE AS IsNullable,
        dcn.DefaultName ,
        col.COLUMN_DEFAULT AS DefaultNameDefinition ,
        cc.CONSTRAINT_NAME AS CheckConstraintRuleName,
        cc.CHECK_CLAUSE  AS CheckConstraintRuleNameDefinition
FROM    ( SELECT    TABLE_CATALOG ,
                    TABLE_SCHEMA ,
                    TABLE_NAME ,
                    TABLE_TYPE
          FROM      INFORMATION_SCHEMA.TABLES
          WHERE     ( TABLE_TYPE = 'BASE TABLE' )
        ) AS tbl
        INNER JOIN ( SELECT TABLE_CATALOG ,
                            TABLE_SCHEMA ,
                            TABLE_NAME ,
                            COLUMN_NAME ,
                            ORDINAL_POSITION ,
                            COLUMN_DEFAULT ,
                            IS_NULLABLE ,
                            DATA_TYPE ,
                            CHARACTER_MAXIMUM_LENGTH ,
                            CHARACTER_OCTET_LENGTH ,
                            NUMERIC_PRECISION ,
                            NUMERIC_PRECISION_RADIX ,
                            NUMERIC_SCALE ,
                            DATETIME_PRECISION ,
                            CHARACTER_SET_CATALOG ,
                            CHARACTER_SET_SCHEMA ,
                            CHARACTER_SET_NAME ,
                            COLLATION_CATALOG ,
                            COLLATION_SCHEMA ,
                            COLLATION_NAME ,
                            DOMAIN_CATALOG ,
                            DOMAIN_SCHEMA ,
                            DOMAIN_NAME
                     FROM   INFORMATION_SCHEMA.COLUMNS
                   ) AS col ON col.TABLE_CATALOG = tbl.TABLE_CATALOG
                               AND col.TABLE_SCHEMA = tbl.TABLE_SCHEMA
                               AND col.TABLE_NAME = tbl.TABLE_NAME
        LEFT OUTER JOIN ( SELECT    t.name AS TableName ,
                                    SCHEMA_NAME(s.schema_id) AS SchemaName ,
                                    ac.name AS ColumnName ,
                                    d.name AS DefaultName
                          FROM      sys.all_columns AS ac
                                    INNER JOIN sys.tables AS t ON ac.object_id = t.object_id
                                    INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
                                    INNER JOIN sys.default_constraints AS d ON ac.default_object_id = d.object_id
                        ) AS dcn ON dcn.SchemaName = tbl.TABLE_SCHEMA
                                    AND dcn.TableName = tbl.TABLE_NAME
                                    AND dcn.ColumnName = col.COLUMN_NAME
        LEFT OUTER JOIN ( SELECT    cu.TABLE_CATALOG ,
                                    cu.TABLE_SCHEMA ,
                                    cu.TABLE_NAME ,
                                    cu.COLUMN_NAME ,
                                    c.CONSTRAINT_CATALOG ,
                                    c.CONSTRAINT_SCHEMA ,
                                    c.CONSTRAINT_NAME ,
                                    c.CHECK_CLAUSE
                          FROM      INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
                                    AS cu
                                    INNER JOIN INFORMATION_SCHEMA.CHECK_CONSTRAINTS
                                    AS c ON c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME
                        ) AS cc ON cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA
                                   AND cc.TABLE_NAME = tbl.TABLE_NAME
                                   AND cc.COLUMN_NAME = col.COLUMN_NAME


GO
/****** Object:  Table [Course].[Class]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Course].[Course]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Course].[Course](
	[CourseID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[CourseCode] [udt].[SurrogateKeyString] NULL,
	[Description] [udt].[workflowstring] NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Course].[CoursesCLassMode]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Course].[CoursesCLassMode](
	[CourseId] [udt].[SurrogateKeyInt] NOT NULL,
	[ClassID] [udt].[SurrogateKeyInt] NOT NULL,
	[ModeID] [udt].[SurrogateKeyInt] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[CourseId] ASC,
	[ModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Course].[Mode_Of_Instruction]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Course].[Mode_Of_Instruction](
	[ModeID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[ModeName] [udt].[workflowstring] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DbSecurity].[UserAuthorization]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DbSecurity].[UserAuthorization](
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[ClassTime] [udt].[ClassTime] NULL,
	[IndividualProject] [udt].[IndividualProject] NULL,
	[GroupMemberLastName] [udt].[LastName] NOT NULL,
	[GroupMemberFirstName] [udt].[FirstName] NOT NULL,
	[GroupName] [udt].[GroupName] NOT NULL,
	[DateAdded] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Department].[Departments]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Department].[Departments](
	[DepartmentID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[DepartmentAbv] [udt].[SurrogateKeyString] NOT NULL,
	[DepartmentName] [udt].[workflowstring] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Department].[Instructor]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Department].[Instructor](
	[InstructorID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[FirstName] [udt].[workflowstring] NOT NULL,
	[LastName] [udt].[workflowstring] NOT NULL,
	[FullName] [udt].[workflowstring] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Department].[InstructorDepartment]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Department].[InstructorDepartment](
	[InstructorId] [udt].[SurrogateKeyInt] NOT NULL,
	[DepartmentId] [udt].[SurrogateKeyInt] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC,
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Location].[BuildingLocation]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[BuildingLocation](
	[BuildingLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[BuildingLocationAbv] [udt].[SurrogateKeyString] NOT NULL,
	[BuildingLocationName] [udt].[SurrogateKeyString] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Location].[RoomLocation]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[RoomLocation](
	[RoomLocationID] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[BuildingLocationID] [udt].[SurrogateKeyInt] NOT NULL,
	[RoomLocationName] [udt].[SurrogateKeyString] NOT NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NULL,
	[DateAdded] [udt].[DateAdded] NULL,
	[DateOfLastUpdate] [udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [process].[WorkflowSteps]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [process].[WorkflowSteps](
	[WorkflowStepsKey] [udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[WorkflowStepsDescription] [udt].[workflowstring] NOT NULL,
	[WorkflowStepsTableRowCount] [udt].[Rowcount] NULL,
	[StartingDateTime] [udt].[DateAdded] NULL,
	[EndDateTime] [udt].[DateAdded] NULL,
	[ClassTime] [udt].[ClassTime] NULL,
	[UserAuthorizationKey] [udt].[SurrogateKeyInt] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkflowStepsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Uploadfile].[CurrentSemesterCourseOfferings]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Uploadfile].[CurrentSemesterCourseOfferings](
	[Semester] [varchar](50) NULL,
	[Sec] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Course (hr, crd)] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Day] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Instructor] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Enrolled] [varchar](50) NULL,
	[Limit] [varchar](50) NULL,
	[Mode of Instruction] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[CoursesCLassMode] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[CoursesCLassMode] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Course].[Mode_Of_Instruction] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Course].[Mode_Of_Instruction] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('7:45') FOR [ClassTime]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('PROJECT 3') FOR [IndividualProject]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('GROUP NG_3') FOR [GroupName]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[Departments] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[Departments] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Department].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Department].[InstructorDepartment] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Department].[InstructorDepartment] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Location].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Location].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Location].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [Location].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkflowStepsTableRowCount]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndDateTime]
GO
ALTER TABLE [process].[WorkflowSteps] ADD  DEFAULT ('7:45') FOR [ClassTime]
GO
ALTER TABLE [Uploadfile].[CurrentSemesterCourseOfferings] ADD  CONSTRAINT [DF_CurrentSemesterCourseOfferings_Semester]  DEFAULT ('Current Semester') FOR [Semester]
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
ALTER TABLE [Course].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[Course] CHECK CONSTRAINT [FK_Course_UserAuthorizationKey]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [ClassId] FOREIGN KEY([ClassID])
REFERENCES [Course].[Class] ([ClassID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [ClassId]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [CourseId] FOREIGN KEY([CourseId])
REFERENCES [Course].[Course] ([CourseID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [CourseId]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [FK_CourseBridge_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [FK_CourseBridge_UserAuthorizationKey]
GO
ALTER TABLE [Course].[CoursesCLassMode]  WITH CHECK ADD  CONSTRAINT [ModeId] FOREIGN KEY([ModeID])
REFERENCES [Course].[Mode_Of_Instruction] ([ModeID])
GO
ALTER TABLE [Course].[CoursesCLassMode] CHECK CONSTRAINT [ModeId]
GO
ALTER TABLE [Course].[Mode_Of_Instruction]  WITH CHECK ADD  CONSTRAINT [FK_MOI_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Course].[Mode_Of_Instruction] CHECK CONSTRAINT [FK_MOI_UserAuthorizationKey]
GO
ALTER TABLE [Department].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Department].[Departments] CHECK CONSTRAINT [FK_Department_UserAuthorizationKey]
GO
ALTER TABLE [Department].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Department].[Instructor] CHECK CONSTRAINT [FK_Instructor_UserAuthorizationKey]
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
ALTER TABLE [Location].[BuildingLocation]  WITH CHECK ADD  CONSTRAINT [FK_Building_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Location].[BuildingLocation] CHECK CONSTRAINT [FK_Building_UserAuthorizationKey]
GO
ALTER TABLE [Location].[RoomLocation]  WITH CHECK ADD  CONSTRAINT [BuildingLocationID] FOREIGN KEY([BuildingLocationID])
REFERENCES [Location].[BuildingLocation] ([BuildingLocationID])
GO
ALTER TABLE [Location].[RoomLocation] CHECK CONSTRAINT [BuildingLocationID]
GO
ALTER TABLE [Location].[RoomLocation]  WITH CHECK ADD  CONSTRAINT [FK_Room_UserAuthorizationKey] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO
ALTER TABLE [Location].[RoomLocation] CHECK CONSTRAINT [FK_Room_UserAuthorizationKey]
GO
/****** Object:  StoredProcedure [Project3].[AddForeignKeysToQueensClassSchedule]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ben>
-- Create date: <5/13/2024>
-- Description:	<Add Foreign Keys to QueensClassSchedule DB>
-- =============================================

CREATE PROCEDURE [Project3].[AddForeignKeysToQueensClassSchedule]

    @UserAuthorizationKey INT

AS
BEGIN

    ALTER TABLE [Course].[Class]
		ADD 
    		CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES [Department].[Instructor] (InstructorId),
				CONSTRAINT [FK_Class_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
      
    ALTER TABLE [Course].[Course]
    ADD 
  			CONSTRAINT [FK_Course_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Course].[Mode_Of_Instruction]
 		ADD 
  			CONSTRAINT [FK_MOI_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
        REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)
    
    ALTER TABLE [Course].[CoursesClassMode]
		ADD 
    	CONSTRAINT [CourseId] FOREIGN KEY (CourseId)
      REFERENCES [Course].[Course] (CourseId),
			CONSTRAINT [ModeId] FOREIGN KEY (ModeId)
      REFERENCES [Course].[Mode_Of_Instruction] (ModeId),
			CONSTRAINT [ClassId] FOREIGN KEY (ClassId) 
      REFERENCES [Course].[Class] (ClassId),
  		CONSTRAINT [FK_CourseBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[Instructor]
    ADD 
    	CONSTRAINT [FK_Instructor_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

      ALTER TABLE [Department].[Departments]
    ADD 
    	CONSTRAINT [FK_Department_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Department].[InstructorDepartment]
    ADD
        CONSTRAINT [InstructorID] FOREIGN KEY (InstructorId)
        REFERENCES Department.Instructor (InstructorID),
        CONSTRAINT [DepartmentID] FOREIGN KEY (DepartmentId)
        REFERENCES Department.Departments (DepartmentID),
    	CONSTRAINT [FK_DepBridge_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)


		ALTER TABLE [Location].[BuildingLocation]
		ADD 
   			CONSTRAINT [FK_Building_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	    REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

		ALTER TABLE [Location].[RoomLocation] 
		ADD CONSTRAINT [BuildingLocationID] FOREIGN KEY (BuildingLocationID) 
    		REFERENCES [Location].[BuildingLocation] (BuildingLocationId),
   			CONSTRAINT [FK_Room_UserAuthorizationKey] FOREIGN KEY (UserAuthorizationKey)
      	REFERENCES [DbSecurity].[UserAuthorization] (UserAuthorizationKey)

    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Add Foreign Keys to QueensClassSchedule DB', 
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [Project3].[DropForeignKeysFromQueensClassSchedule]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Esteban :v>
-- Create date: <5/13/2024>
-- Description:	<Drop Foreign Keys to QueensClassSchedule DB>
-- =============================================

CREATE PROCEDURE [Project3].[DropForeignKeysFromQueensClassSchedule]
    @UserAuthorizationKey INT
AS
BEGIN
    ALTER TABLE [Course].[Class]
    DROP CONSTRAINT IF EXISTS InstructorID, FK_Class_UserAuthorizationKey;

    ALTER TABLE [Course].[Course]
    DROP CONSTRAINT IF EXISTS  FK_Course_UserAuthorizationKey;

    ALTER TABLE [Course].[Mode_Of_Instruction]
    DROP CONSTRAINT IF EXISTS  FK_MOI_UserAuthorizationKey;

    ALTER TABLE [Course].[CoursesClassMode]
    DROP CONSTRAINT IF EXISTS  Classid, Modeid, Courseid, FK_CourseBridge_UserAuthorizationKey;

    ALTER TABLE [Department].[Instructor]
    DROP CONSTRAINT IF EXISTS  FK_Instructor_UserAuthorizationKey;

    ALTER TABLE [Department].[Departments]
    DROP CONSTRAINT IF EXISTS  FK_Department_UserAuthorizationKey;

    ALTER TABLE [Department].[InstructorDepartment]
    DROP CONSTRAINT IF EXISTS  InstructorID, DepartmentID, FK_DepBridge_UserAuthorizationKey;

    ALTER TABLE [Location].[BuildingLocation]
    DROP CONSTRAINT IF EXISTS Classid, FK_Building_UserAuthorizationKey;

    ALTER TABLE [Location].[RoomLocation]
    Drop CONSTRAINT if EXISTS BuildingLocationID, FK_Room_UserAuthorizationKey

    -- now we just log the work :D
    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Drop Foreign Keys from QueensClassSchedule DB',
    @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO
/****** Object:  StoredProcedure [Project3].[Load_BuildingLocation]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ashish>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Building Location Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_BuildingLocation]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

   
    INSERT INTO [Location].BuildingLocation
    (BuildingLocationAbv,BuildingLocationName, UserAuthorizationKey)
    SELECT DISTINCT(SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1))),
        CASE (SUBSTRING([Location], 1, CHARINDEX(' ',[Location], 1)))
            WHEN 'IB' THEN 'I Building'
            WHEN 'GC' THEN 'Gertz Center'
            WHEN 'QH' THEN 'Queens Hall'
            WHEN 'SU' THEN 'Student Union'
            WHEN 'RA' THEN 'Rathhaus Hall'
            WHEN 'MU' THEN 'Music Building'
            WHEN 'KY' THEN 'Keily Hall'
            WHEN 'RZ' THEN 'Razran Hall'
            WHEN 'SB' THEN 'Science Building'
            WHEN 'CH' THEN 'Colwin Hall'
            WHEN 'HH' THEN 'Honors Hall'
            WHEN 'AR' THEN 'Alumni Hall'
            WHEN 'DY' THEN 'Delany Hall'
            WHEN 'PH' THEN 'Powdermaker Hall'
            WHEN 'RO' THEN 'Rosenthal Library'
            WHEN 'FG' THEN 'FitzGerald Gym'
            WHEN 'CD' THEN 'Colden Auditorium'
            WHEN 'KG' THEN 'King Hall'
            WHEN 'JH' THEN 'Jefferson Hall'
            WHEN 'RE' THEN 'Remsen Hall'
            WHEN 'KP' THEN 'Klapper Hall'
            WHEN 'GT' THEN 'Goldstein Theatre'
            WHEN 'GB' THEN 'G Building'
            ELSE 'Unknown'
        END AS Building,
        @UserAuthorizationKey
    FROM uploadfile.CurrentSemesterCourseOfferings

	SELECT * FROM [Location].[BuildingLocation]
  
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into BuildingLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

END;
GO
/****** Object:  StoredProcedure [Project3].[Load_ClassTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The class table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_ClassTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Class
    (Enrollment, [Limit], Section, ClassCode, [Days], [Time], [Hours], [Credits],InstructorID, UserAuthorizationKey  )
    SELECT Enrolled, [Limit], Sec, Code, [Day], [Time], 
    (SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(',', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1)),
    (SUBSTRING([Course (hr, crd)], CHARINDEX(')', [Course (hr, crd)]) - 1, 1)),
    InstructorID,
    @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings a
    JOIN Department.Instructor ON FullName = Instructor

	SELECT * FROM [Course].[Class]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Class table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_CourseBridgeTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The course bridge table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_CourseBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.CoursesCLassMode
    (
        ClassID,
        CourseId,
        ModeID,
        UserAuthorizationKey
    )
    SELECT DISTINCT ClassID, Courseid, a.ModeID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN [Course].[Class] ON ClassCode = code
    JOIN [Course].[Course] ON CourseCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)
    JOIN [Course].[Mode_Of_Instruction] a ON [ModeName] = [Mode of Instruction]

	SELECT * FROM [Course].[CoursesCLassMode]


    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_CourseTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The course table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_CourseTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Course
    (CourseCode,[Description], UserAuthorizationKey) 
    SELECT DISTINCT(SUBSTRING([Course (hr, crd)], 1, CHARINDEX('(', [Course (hr, crd)])-1)),
    [Description],
    @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings

	SELECT * FROM [Course].[Course]


    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_DepartmentBridgeTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Department Bridge  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_DepartmentBridgeTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Department.InstructorDepartment
    (
        InstructorId,
        DepartmentId,
        UserAuthorizationKey
    )
    SELECT DISTINCT InstructorId, DepartmentID, @UserAuthorizationKey
    FROM Uploadfile.CurrentSemesterCourseOfferings
    JOIN Department.Departments ON DepartmentAbv = (SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1)))
    JOIN Department.Instructor ON FullName = Instructor

	SELECT * FROM [Department].[InstructorDepartment]


    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into Course Bridge table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_DepartmentTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Department  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_DepartmentTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

-- Insert into the customer table including the user auth key
INSERT INTO Department.Departments
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
JOIN Uploadfile.CurrentSemesterCourseOfferings ON DepartmentCode = SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)], 1))

	SELECT * FROM [Department].[Departments]

	
    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Department table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_InstructorTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Nak>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Instructor  Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_InstructorTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    -- Insert into the customer table including the user auth key
		INSERT INTO Department.Instructor
		(LastName,FirstName, FullName, UserAuthorizationKey)
		SELECT DISTINCT
    	SUBSTRING([Instructor], 1, CHARINDEX(',', [Instructor]) - 1) AS LastName,
    	SUBSTRING([Instructor], CHARINDEX(',', [Instructor]) + 2, LEN([Instructor]) - CHARINDEX(',', [Instructor]) - 1) AS FirstName,
    	Instructor,
        @UserAuthorizationKey
		FROM 
    Uploadfile.CurrentSemesterCourseOfferings

	SELECT * FROM [Department].[Instructor]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription = 'Loading data into Instructor table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_ModeOfInstruction]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load The MOI table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_ModeOfInstruction]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;


    -- Insert into the customer table including the user auth key
    INSERT INTO Course.Mode_Of_Instruction
    (
        ModeName,
        UserAuthorizationKey
    )
    SELECT DISTINCT[Mode Of Instruction], @UserAuthorizationKey FROM Uploadfile.CurrentSemesterCourseOfferings

	SELECT * FROM [Course].[Mode_Of_Instruction]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into MOI table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[Load_RoomLocationTable]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ashish>
-- Create date: <5/13/2024>
-- Description:	<Load Data into Room Location Table>
-- =============================================
CREATE PROCEDURE [Project3].[Load_RoomLocationTable]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO [Location].[RoomLocation]
    (RoomLocationName, BuildingLocationID, UserAuthorizationKey)
    SELECT DISTINCT([Location]), buildinglocationID, @UserAuthorizationKey FROM uploadfile.CurrentSemesterCourseOfferings
    JOIN [Location].[BuildingLocation] ON buildinglocationabv = SUBSTRING([Location], 1, CHARINDEX(' ', [Location], 1))

	SELECT * FROM [Location].[RoomLocation]

    --  Insert the user into the Process.WorkFlowTable
    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [Project3].[LoadData]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Load Data>
-- =============================================
CREATE PROCEDURE [Project3].[LoadData] @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
	    DECLARE @StartingDateTime DATETIME2 = SYSDATETIME();

    --
    --	Drop All of the foreign keys prior to truncating tables
 	--
    EXEC  [Project3].[DropForeignKeysFromQueensClassSchedule] @UserAuthorizationKey = 1;
	--
	--	Check row count before truncation
	EXEC	[Project3].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 1  -- Change -1 to the appropriate UserAuthorizationKey
    --
    --	Always truncate the data
    --
    EXEC  [Project3].[TruncateData] @UserAuthorizationKey = 1;
    --
    --	Load the schema
    --

	
	EXEC  [Project3].[Load_DepartmentTable] @UserAuthorizationKey = 2;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_InstructorTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_DepartmentBridgeTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ModeOfInstruction] @UserAuthorizationKey = 1;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_CourseTable] @UserAuthorizationKey = 6;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ClassTable] @UserAuthorizationKey = 5;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_CourseBridgeTable] @UserAuthorizationKey = 5;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_BuildingLocation] @UserAuthorizationKey = 7;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC [Project3].[Load_RoomLocationTable] @UserAuthorizationKey = 3;  -- Change -1 to the appropriate UserAuthorizationKey
  --
    --	Recreate all of the foreign keys prior after loading
    --
 	--
	--	Check row count before truncation
	EXEC [Project3].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 1  -- Change -1 to the appropriate UserAuthorizationKey
	--
    EXEC [Project3].[AddForeignKeysToQueensClassSchedule] @UserAuthorizationKey = 1;  -- Change -1 to the appropriate UserAuthorizationKey
    --


    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Loading all the Data', @UserAuthorizationKey = @UserAuthorizationKey,
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO
/****** Object:  StoredProcedure [Project3].[ShowTableStatusRowCount]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Project3].[ShowTableStatusRowCount]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 'Course' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Course]
    UNION ALL
    SELECT 'Class' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Class]
    UNION ALL
    SELECT 'Mode_Of_Instruction' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[Mode_Of_Instruction]
    UNION ALL
    SELECT 'Departments' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Departments]
    UNION ALL
    SELECT 'Instructor' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[Instructor]
    UNION ALL
    SELECT 'InstructorDepartment' AS TableName, COUNT(*) AS TotalRowCount FROM [Department].[InstructorDepartment]
    UNION ALL
    SELECT 'BuildingLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[BuildingLocation]
    UNION ALL
    SELECT 'RoomLocation' AS TableName, COUNT(*) AS TotalRowCount FROM [Location].[RoomLocation]
    UNION ALL
    SELECT 'CoursesClassMode' AS TableName, COUNT(*) AS TotalRowCount FROM [Course].[CoursesClassMode];

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkFlowStepsDescription = 'ShowTableRowCount',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [Project3].[TrackWorkFlow]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib>
-- Create date: <5/13/2024>
-- Description:	<Tracking workflow>
-- =============================================
CREATE PROCEDURE [Project3].[TrackWorkFlow]

    @UserAuthorizationKey INT,
    @WorkFlowStepsDescription NVARCHAR(100),
    @WorkflowStepsTableRowCount INT

AS
BEGIN

    INSERT INTO Process.WorkFlowSteps
        (WorkflowStepsDescription, UserAuthorizationKey, WorkflowStepsTableRowCount)
    VALUES(@WorkFlowStepsDescription, @UserAuthorizationKey, @WorkflowStepsTableRowCount);


END
GO
/****** Object:  StoredProcedure [Project3].[TruncateData]    Script Date: 5/14/2024 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Rahib>
-- Create date: <5/13/2024>
-- Description:    <Truncate  Data>
-- =============================================
CREATE PROCEDURE [Project3].[TruncateData]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;
    TRUNCATE table Course.Class;
    TRUNCATE table Course.Course;
    TRUNCATE table Course.Mode_Of_Instruction;
    Truncate Table Course.CoursesClassMode;
    TRUNCATE table Department.Departments;
    TRUNCATE Table Department.Instructor;
    TRUNCATE Table Department.InstructorDepartment;
    TRUNCATE Table [LOCATION].BuildingLocation;
    TRUNCATE Table [Location].[RoomLocation];

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Loading data into RoomLocation table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
USE [master]
GO
ALTER DATABASE [QueensClassSchedule] SET  READ_WRITE 
GO
