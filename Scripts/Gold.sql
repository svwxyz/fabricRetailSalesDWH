---------------------
------Gold Layer-----
---------------------

---------------------
------Dim Date-----
---------------------
if not EXISTS(
    select 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'gold' 
    and t.name = 'DimDate'
)
begin 
    CREATE table gold.DimDate(
        date_key BIGINT IDENTITY,
        [Date] date)
end

---------------------
-----Insert Rows-----
---------------------

insert into gold.DimDate
select DISTINCT s.Date
from silver.retail_s s
left join gold.DimDate g
on s.Date = g.Date
where g.Date is null

---------------------
-----DIM LOCATION----
---------------------

if not EXISTS(
    select 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'gold' 
    and t.name = 'DimLocation'
)
begin 
    CREATE table gold.DimLocation(
        Location_key BIGINT IDENTITY ,
        city varchar(200) )
end

---------------------
-----Insert Rows-----
---------------------

insert into gold.DimLocation
select distinct s.City 
from silver.retail_s s
left join gold.DimLocation g
on s.City = g.city 
where g.city is null

---------------------
------DIM DRIEVR-----
---------------------

if not EXISTS(
    select 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'gold' 
    and t.name = 'DimDriver'
)
begin 
    CREATE table gold.DimDriver(
        driver_key BIGINT IDENTITY,
        DriverID VARCHAR(200))
end


---------------------
-----Insert Rows-----
---------------------

insert into gold.DimDriver
select distinct s.DriverID
from silver.retail_s s
left join gold.DimDriver g
on s.DriverID = g.DriverID
where g.DriverID is null


---------------------
------DIM Payment----
---------------------

if not EXISTS(
    select 1 
    from sys.schemas s 
    join sys.tables t 
    on s.schema_id = t.schema_id 
    where s.name = 'gold' 
    and t.name = 'DimPayment'
)
begin 
    CREATE table gold.DimPayment(
        payment_key BIGINT IDENTITY,
        PaymentType varchar(200))
end

---------------------
-----Insert Rows-----
---------------------

insert into gold.DimPayment
select distinct s.PaymentType
from silver.retail_s s
left join gold.DimPayment g
on s.PaymentType = g.PaymentType
where g.PaymentType is null

---------------------
------FACT TABLE-----
---------------------

IF not exists(
    select 1 
    from sys.schemas s
    join sys.tables t
    on s.schema_id = t.schema_id 
    where s.name = 'gold'
    and t.name = 'FactRetail'
)
begin 
        create table gold.FactRetail
        (
            fact_key BIGINT identity,
            tripid varchar(200) ,
            date_key BIGINT,
            location_key BIGINT ,
            driver_key BIGINT ,
            payment_key BIGINT,
            DistanceKM decimal(10,2),
            FareAmount decimal(10,2)
        )
end 


---------------------
-----Insert Rows-----
---------------------

insert into gold.FactRetail
select 
    s.TripId,
    dd.date_key,
    dl.Location_key,
    ddr.driver_key,
    dp.payment_key,
    s.DistanceKM,
    s.FareAmount
from silver.retail_s s
left join gold.DimDate dd on s.Date = dd.Date
left join gold.DimLocation dl on dl.city = s.City
left join gold.DimDriver ddr on ddr.DriverID = s.DriverID
left join gold.DimPayment dp on dp.PaymentType = s.PaymentType
left join gold.FactRetail ft on s.TripId = ft.tripid 
where ft.tripid is null


select * 
from gold.DimPayment





