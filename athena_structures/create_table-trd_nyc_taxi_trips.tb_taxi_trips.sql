-------------------------------------------------------
-- Descricao: Script para criacao da tabela target de viagens de taxi em Nova York
    -- na área de "trusted zone" do data lake
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE EXTERNAL TABLE trd_nyc_taxi_trips.tb_taxi_trips
(
  vendor_id           string COMMENT 'id da empresa de taxi',
  pickup_datetime     timestamp COMMENT 'data e hora de inicio da corrida',
  dropoff_datetime    timestamp COMMENT 'data e hora de termino da corrido',
  passenger_count     smallint COMMENT 'numero de passageiros transportados na corrida',
  trip_distance       double COMMENT 'distancia percorrida na corrida',
  pickup_longitude    double COMMENT 'longitude do local de inicio da corrida',
  pickup_latitude     double COMMENT 'latitude do local de inicio da corrida',
  rate_code           string,
  store_and_fwd_flag  string,
  dropoff_longitude   double COMMENT 'longitude do local de termino da corrida',
  dropoff_latitude    double COMMENT 'latitude do local de termino da corrida',
  payment_type        string COMMENT 'forma de pagamento da corrida',
  fare_amount         decimal(20,2) COMMENT 'valor da tarifa da corrida',
  surcharge           decimal(20,2) COMMENT 'valor de acrescimo/sobretaxa a tarifa',
  tip_amount          decimal(20,2) COMMENT 'valor da gorjeta',
  tolls_amount        decimal(20,2) COMMENT 'valor dos pedágios',
  total_amount        decimal(20,2) COMMENT 'valor total'
)
COMMENT 'Tabela com os dados de viagens de taxi em Nova York'
PARTITIONED BY (date_trip date)
STORED AS PARQUET
LOCATION
  's3://bkt-trusted-zone/trd_nyc_taxi_trips/tb_taxi_trips/';