-------------------
----Water Table----
-------------------

if not EXISTS(
    select 1 
    from sys.schemas s
    join sys.tables t 
    on s.schema_id = t.SCHEMA_ID
    where s.name = 'bronze'
    and t.name = 'wtr'
)
begin 
    CREATE table bronze.wtr(
        table_name VARCHAR(200),
        last_uploaded DATE ,
        last_updated DATETIME2(6) )
END

select * from bronze.wtr

INSERT into bronze.wtr
values ('retail','1990-01-01',getdate())
