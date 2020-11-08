-------------------------------------------------------
-- Descricao: view com a resposta da 3ª análise
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_analysis03
as
with pay_cash as (
    select * from trd_nyc_taxi_trips.tb_payment_lookup
    where payment_lookup = 'Cash'
)
select
    substr(cast(date_trunc('month', date_trip) as varchar), 1, 7) month_trip,
    count(1) count_trips
from
    trd_nyc_taxi_trips.tb_taxi_trips t,
    pay_cash p
where
    t.payment_type = p.payment_type
group by 1
order by 1;