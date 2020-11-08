-------------------------------------------------------
-- Descricao: view com a resposta da 5ª análise
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_analysis05
as
select
    case
        when day_of_week(date_trip) = 6 then 'Saturday'
        when day_of_week(date_trip) = 7 then 'Sunday'
    end day_week,
    round(avg(date_diff('minute', pickup_datetime, dropoff_datetime)), 2) avg_trip_minutes
from
    tb_taxi_trips
where
    day_of_week(date_trip) in (6, 7)
group by 1;