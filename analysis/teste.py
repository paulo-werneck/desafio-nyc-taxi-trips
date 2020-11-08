import awswrangler as wr
import geopandas as gpd
import boto3

session_user_dev = boto3.Session(profile_name='werneck-aws-test_user-dev', region_name="us-east-1")

query = """select vendor_id, pickup_datetime, pickup_longitude, pickup_latitude from tb_taxi_trips
where date_trip between cast('2010-01-01' as date) and cast('2010-12-31' as date)"""

df_lat_long = wr.athena.read_sql_query(query, database='trd_nyc_taxi_trips', boto3_session=session_user_dev)

gdf = gpd.GeoDataFrame(
    df_lat_long, geometry=gpd.points_from_xy(df_lat_long.pickup_longitude, df_lat_long.pickup_latitude))

map_df = gpd.read_file(gpd.datasets.get_path('naturalearth_cities'))

gdf.plot()
print(gdf.head(10))

