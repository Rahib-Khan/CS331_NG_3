
-- =============================================
-- Author:		<Ahmed, Ashish, Ben, Esteban, Inderpreet, Mohammed, Nak, Rahib>
-- Create date: <5/12/2024>
-- Description:	<Creating all the User Defined Datatypes>
-- =============================================

-- Created [Udt] Schema
CREATE SCHEMA [Udt];

-- Created for all PKs and FKs and definite integer values in QCS db Adding datatype for ID values in all tables
CREATE TYPE [Udt].[SurrogateKeyInt] FROM [int] NULL
-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization] Adding datatype for StartingDateTime/EndDateTime Attribute 
CREATE TYPE [Udt].[DateAdded] FROM Datetime2(7) NOT NULL
-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization] Adding datatype for ClassTime Attribute
CREATE TYPE [Udt].[ClassTime] FROM nchar(5) NOT NULL
-- Created for [DbSecurity].[UserAuthorization] Adding datatype for IndividualProject Attribute
CREATE TYPE [Udt].[IndividualProject] FROM nvarchar (60) NOT NULL
-- Created for [Process].[WorkFlowSteps] & [DbSecurity].[UserAuthorization] Adding datatype for all name related attributes
CREATE TYPE [Udt].[LastName] FROM nvarchar(35) NOT NULL
CREATE TYPE [Udt].[FirstName] FROM nvarchar(20) NOT NULL
CREATE TYPE [Udt].[GroupName] FROM nvarchar(20) NOT NULL

-- Created for [Process].[WorkflowSteps] Line 81 Adding datatype for WorkFlowStepsDescription in WorkFlowSteps Table 
CREATE TYPE [Udt].[WorkFlowString] from NVARCHAR(100) not null
-- Created for [Process].[WorkflowSteps] Line 82 Adding datatype for WorkFlowStepsTableRowCount in WorkFlowSteps Table
CREATE TYPE [Udt].[RowCount] from [int] not null

--Created for [Course].[Course] Line 101 Adding datatype for Section in Course Table	
CREATE TYPE [Udt].[SurrogateKeyString] from NVARCHAR(30) not null

--Created for [Course].[Class] Line 366 Adding datatype for Time in Class Table
CREATE TYPE [Udt].[ClassDuration] FROM NVARCHAR(30) NOT NULL;
--Created for [Course].[Class] Line 368 Adding datatype for Hours in Class Table
create type [Udt].[SurrogateKeyFloat] from FLOAT not null


