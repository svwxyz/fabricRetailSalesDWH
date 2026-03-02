------------------------
------Bronze Layer------
------------------------
if EXISTS(
    SELECT 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'bronze'
    and t.name = 'retail_b'
)
begin 
    drop table bronze.retail_b
end


select * 
into bronze.retail_b
from UpcomingSrc.raw.src t
where Date > (SELECT last_uploaded from bronze.wtr where table_name = 'retail')

update bronze.wtr
set last_uploaded = (select max(Date) from bronze.retail_b)
where table_name = 'retail'

select * from bronze.retail_b







