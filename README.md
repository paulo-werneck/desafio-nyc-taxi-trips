## NYC - Taxi Trips

This repository aims to solve the proposed test for the position of Data Engineer.

Technologies used:
- AWS S3
- AWS Athena
- AWS Lambda
- Metabase

Proposed Architecture:

![Proposed Architecture](https://geojson-desafio.s3.amazonaws.com/arq.png)

Process description:

1 - The data were ingested at the Data Lake in the Landing Zone;

2 - Three tables were created in Athena mapping the data of the Landing Zone;

2 - Three tables were created in Athena in the Data Lake Trusted Zone, converted into Parquet, with the "trips" table partitioned by the date of the trip;

3 - Thinking of a productive process, a lambda function was created that always runs when a new file arrives in the Landing Zone and starts a process in Athena for loading the tables in the Trusted Zone;

4 - With the data tabulated, partitioned and in an ideal format for queries, analyzes were performed on a Jupyter notebook and also on Metabase, both connected to Athena.