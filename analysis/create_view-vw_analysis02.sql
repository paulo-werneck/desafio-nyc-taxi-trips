-------------------------------------------------------
-- Descricao: view com a resposta da 2ª análise
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE OR REPLACE VIEW vw_analysis02
as
select
    t.vendor_id,
    v.name,
    sum(total_amount) as vl_total
from trd_nyc_taxi_trips.tb_taxi_trips t
    join trd_nyc_taxi_trips.tb_vendor_lookup v on
    t.vendor_id = v.vendor_id
group by 1, 2
order by 3 desc
limit 3;