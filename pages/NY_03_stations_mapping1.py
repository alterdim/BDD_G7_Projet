import streamlit as st
import pandas as pd
from common import *

sqlStations = """
    SELECT station_id, stop_name, coord_longitude, coord_latitude 
    FROM station
"""

connection = connect_to_db()
df = pd.read_sql(sqlStations, connection)

df['lon'] = [cnvrtCoord(x) for x in df['coord_longitude'].tolist()]
df['lat'] = [cnvrtCoord(x) for x in df['coord_latitude'].tolist()]

map_data = pd.DataFrame( df, columns=['lat', 'lon'])
st.image('mta.jpeg', caption='MTA - NY City Subway ', width =450)
st.header("Location of NY subway stations")
st.map(map_data, zoom=9)
