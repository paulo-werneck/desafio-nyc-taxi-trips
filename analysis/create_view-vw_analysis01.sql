-------------------------------------------------------
-- Descricao: view com a resposta da 1ª análise
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_analysis01
as
select round(avg(trip_distance), 2) as avg_distanced
from trd_nyc_taxi_trips.tb_taxi_trips
where passenger_count <= 2;