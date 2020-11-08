insert into trd_nyc_taxi_trips.tb_taxi_trips
select
    a.vendor_id,
    cast(substr(replace(a.pickup_datetime, 'T', ' '), 1, 19) as timestamp) as pickup_datetime,
    cast(substr(replace(a.dropoff_datetime, 'T', ' '), 1, 19) as timestamp) as dropoff_datetime,
    a.passenger_count,
    a.trip_distance,
    a.pickup_longitude,
    a.pickup_latitude,
    a.rate_code,
    a.store_and_fwd_flag,
    a.dropoff_longitude,
    a.dropoff_latitude,
    a.payment_type,
    a.fare_amount,
    a.surcharge,
    a.tip_amount,
    a.tolls_amount,
    a.total_amount,
    cast(substr(replace(a.pickup_datetime, 'T', ' '), 1, 10) as date) as date_trip
from
    lz_nyc_taxi_trips.tb_taxi_trips a
where
    cast(substr(replace(a.pickup_datetime, 'T', ' '), 1, 10) as date) =
        date_add('day', -1, current_date)