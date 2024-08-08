use Datawarehouse;
Go
IF OBJECT_ID ( 'Surrogation_p', 'P' ) IS NOT NULL
    DROP PROCEDURE Surrogation_p;
GO

CREATE PROCEDURE Surrogation_p
AS
BEGIN
EXEC('
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = ''surrogation'')
BEGIN
    EXEC(''CREATE SCHEMA surrogation'');
END
')
---------------------------------------------------------------------------------------------------------------------------
-- Execute the stored procedure
EXEC('
EXEC dbo.surrogate_table_p
    @mappingtable = ''employeeSurrogation'',
    @surr_key = ''s_emp'',
    @id = ''EmployeeID'',
    @dataSource = ''CompanyDB'',
    --@sourceSchema = ''loading_sources'',
    --@sourceDatabase = ''DataWarehouse2'',
    @sourceTable = ''Employees_temp_company'';

EXEC dbo.surrogate_table_p
    @mappingtable = ''employeeSurrogation'',
    @surr_key = ''s_emp'',
    @id = ''EmployeeID'',
    @dataSource = ''SourceDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Employees_temp_source'';
----------------------------------------------------------------------------------------------------------------------------
 EXEC dbo.surrogate_table_p
    @mappingtable = ''DepartmentSurrogation'',
    @surr_key = ''s_dep'',
    @id = ''DepartmentID'',
    @dataSource = ''CompanyDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Departments_temp_Company'';

EXEC dbo.surrogate_table_p
    @mappingtable = ''DepartmentSurrogation'',
    @surr_key = ''s_dep'',
    @id = ''DepartmentID'',
    @dataSource = ''SourceDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Departments_temp_source'';
----------------------------------------------------------------------------------------------------------------------------
EXEC dbo.surrogate_table_p
    @mappingtable = ''ProjectSurrogation'',
    @surr_key = ''s_proj'',
    @id = ''ProjectID'',
    @dataSource = ''CompanyDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Projects_temp_Company'';

EXEC dbo.surrogate_table_p
    @mappingtable = ''ProjectSurrogation'',
    @surr_key = ''s_proj'',
    @id = ''ProjectID'',
    @dataSource = ''SourceDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Projects_temp_source'';

----------------------------------------------------------------------------------------------------------------------------
EXEC dbo.surrogate_table_p
    @mappingtable = ''AssignmentSurrogation'',
    @surr_key = ''s_assign'',
    @id = ''AssignmentID'',
    @dataSource = ''CompanyDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Assignments_temp_Company'';

EXEC dbo.surrogate_table_p
    @mappingtable = ''AssignmentSurrogation'',
    @surr_key = ''s_assign'',
    @id = ''AssignmentID'',
    @dataSource = ''SourceDB'',
    --@sourceSchema = ''loading_source'',
    --@sourceDatabase = ''SourceDB'',
    @sourceTable = ''Assignments_temp_source'';
');
END;