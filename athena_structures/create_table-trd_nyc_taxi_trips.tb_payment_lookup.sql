-------------------------------------------------------
-- Descricao: Script para criacao da tabela target de cadastro das formas de pagamentos
    -- na área de "trusted zone" do data lake
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE EXTERNAL TABLE trd_nyc_taxi_trips.tb_payment_lookup
(
    payment_type        string COMMENT 'forma de pagamento',
    payment_lookup      string COMMENT 'forma de pagamento normalizada'
)
COMMENT 'Tabela de cadastro das formas de pagamento'
STORED AS PARQUET
LOCATION
    's3://bkt-trusted-zone/trd_nyc_taxi_trips/tb_payment_lookup/';