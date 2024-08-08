use Datawarehouse;
Go

IF OBJECT_ID ( 'surrogate_table_p', 'P' ) IS NOT NULL
    DROP PROCEDURE surrogate_table_p;
GO

CREATE  PROCEDURE surrogate_table_p
    @mappingtable NVARCHAR(128),
    @surr_key NVARCHAR(128),
    @id NVARCHAR(128),
    @dataSource NVARCHAR(128),
    --@sourceSchema NVARCHAR(128),
    --@sourceDatabase NVARCHAR(128),
    @sourceTable NVARCHAR(128)
AS

BEGIN

    DECLARE @sql NVARCHAR(MAX);
    DECLARE @sql2 NVARCHAR(MAX);
    -- check in information schema if the table already exists
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @mappingtable AND TABLE_SCHEMA = 'surrogation')
    --if it doesnt exist create the table
    BEGIN
        -- Create the table in the surrogation schema
        SET @sql = 'CREATE TABLE surrogation.' + QUOTENAME(@mappingtable) + ' (' +
                QUOTENAME(@surr_key) + ' INT IDENTITY(1, 1) PRIMARY KEY, ' +
                QUOTENAME(@id) + ' INT, ' +
                'dataSource VARCHAR(20));'-- DEFAULT ''' + @dataSource + ''');';
    END;
    -- Insert data into the new table from the specified schema and database
    SET @sql2 = 'INSERT INTO surrogation.' + QUOTENAME(@mappingtable) + '(' + 
                QUOTENAME(@id) + ',' +  'dataSource'  + ') ' +
                'SELECT ' + QUOTENAME(@id) +  ', ''' + @dataSource + ''' '  + ' ' +-- ' ''' + @dataSource + ''' ' +
                'FROM '  + 'loading_sources' + '.' + QUOTENAME(@sourceTable) + ' WHERE NOT EXISTS (SELECT 1 
                                                                                 FROM ' + 'surrogation.' + @mappingtable +  
                                                                                 ' WHERE ' + @mappingtable + '.' + @id +
                                                                                 ' = ' + @sourcetable + '.' + @id +
                                                                                 ' AND ' + @mappingtable + '.' + 'dataSource' +
                                                                                 ' = ''' + @dataSource + ''')'

    -- Execute the SQL commands
    EXEC sp_executesql @sql;
    EXEC sp_executesql @sql2;
END;