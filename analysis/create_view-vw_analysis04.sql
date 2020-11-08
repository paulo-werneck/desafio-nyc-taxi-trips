-------------------------------------------------------
-- Descricao: view com a resposta da 4ª análise
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_analysis04
as
    select
        date_trip,
        count(tip_amount) count_tip
    from trd_nyc_taxi_trips.tb_taxi_trips
    where
        date_trip between cast('2012-10-01' as date) and cast('2012-12-31' as date)
        and tip_amount > 0
    group by 1
    order by 1;