-------------------------------------------------------
-- Descricao: Script para criacao da tabela de cadastro das formas de pagamentos
    -- na área de "landing zone" do data lake
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE EXTERNAL TABLE lz_nyc_taxi_trips.tb_payment_lookup
(
    payment_type        string COMMENT 'forma de pagamento',
    payment_lookup      string COMMENT 'forma de pagamento normalizada'
)
COMMENT 'Tabela de cadastro das formas de pagamento'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION
    's3://bkt-landing-zone/payment_lookup/'
TBLPROPERTIES
    ("skip.header.line.count"="2");