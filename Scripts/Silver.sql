------------------------
------Silver Layer------
------------------------

if not EXISTS(
    select 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'silver'
    and t.name = 'retail_s'
)
begin 
    create table silver.retail_s(
        TripId varchar(200),
        [Date] date ,
        City varchar(200),
        DriverID VARCHAR(200),
        DistanceKM DECIMAL(10,2),
        FareAmount DECIMAL(10,2),
        PaymentType VARCHAR(200))
end

INSERT into silver.retail_s(
    TripId,
    [Date],
    City,
    DriverID,
    DistanceKM,
    FareAmount,
    PaymentType)
SELECT
    TripID,
    cast([Date] as date),
    City,
    DriverID,
    cast(DistanceKM as decimal(10,2)),
    cast(FareAmount as decimal(10,2)),
    PaymentType
from bronze.retail_b

select * from silver.retail_s




