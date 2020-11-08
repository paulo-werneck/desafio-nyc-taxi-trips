-------------------------------------------------------
-- Descricao: Script para criacao da tabela de cadastro das empresas de taxi
    -- na área de "landing zone" do data lake
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE EXTERNAL TABLE lz_nyc_taxi_trips.tb_vendor_lookup
(
    vendor_id           string COMMENT 'id da empresa de taxi',
    name                string COMMENT 'noma da empresa de taxi',
    address             string COMMENT 'endereco da empresa de taxi',
    city                string COMMENT 'cidade da empresa de taxi',
    state               string COMMENT 'estado da empresa de taxi',
    zip                 int    COMMENT 'zip code da empresa de taxi',
    country             string COMMENT 'cidade da empresa de taxi',
    contact             string COMMENT 'contato da empresa de taxi (e-mail / telefone)',
    sn_current          string COMMENT 'flag de cadastro mais recente'
)
COMMENT 'Tabela de cadastro das empresas de taxi'
ROW FORMAT SERDE
    'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
    ("separatorChar" = ",", "quoteChar"="\"")
LOCATION
    's3://bkt-landing-zone/vendor_lookup/'
TBLPROPERTIES
    ("skip.header.line.count"="1");