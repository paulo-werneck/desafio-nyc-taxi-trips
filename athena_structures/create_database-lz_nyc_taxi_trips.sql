-------------------------------------------------------
-- Descricao: Script para criacao do database de viagens de taxi em Nova York
    -- na área de "landing zone" do data lake
-- Autor: Paulo Werneck
-- Data: 05-11-2020
-------------------------------------------------------

CREATE DATABASE lz_nyc_taxi_trips
COMMENT "Script para criacao do database de viagens de taxi em Nova York na área de landing zone do data lake"
LOCATION 's3://bkt-landing-zone/lz_nyc_taxi_trips/';