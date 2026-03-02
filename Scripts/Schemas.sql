----------------------
--------Bronze--------
----------------------

if not EXISTS(
    select 1 
    from sys.schemas 
    where name = 'bronze'
)
begin 
    EXEC('create SCHEMA bronze')
end

----------------------
--------Silver--------
----------------------

if not EXISTS(
    select 1 
    from sys.schemas 
    where name = 'silver'
)
begin 
    EXEC('create SCHEMA silver')
end


----------------------
--------Gold--------
----------------------

if not EXISTS(
    select 1 
    from sys.schemas 
    where name = 'gold'
)
begin 
    EXEC('create SCHEMA gold')
end
