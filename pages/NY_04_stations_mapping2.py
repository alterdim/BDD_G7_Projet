import streamlit as st
import pandas as pd
import pydeck as pdk
from common import *

st.set_page_config(page_title="Location of NY MTA stations", page_icon="🌍")

st.markdown("Location of NY subway stations")
st.sidebar.header("Location of NY subway stations")
st.write(
    """This demo shows how to use
[`st.pydeck_chart`](https://docs.streamlit.io/develop/api-reference/charts/st.pydeck_chart)
to display geospatial data."""
)

def cnvrtCoord(val) -> float:
    return float(val)


sqlStations = "SELECT station_id, stop_name, coord_longitude, coord_latitude FROM station"

connection = connect_to_db()
df = pd.read_sql(sqlStations, connection)

df['lon'] = [cnvrtCoord(x) for x in df['coord_longitude'].tolist()]
df['lat'] = [cnvrtCoord(x) for x in df['coord_latitude'].tolist()]

st.header("Location of NY subway stations")

ALL_LAYERS = {
        "Station locations": pdk.Layer(
            "HexagonLayer",
            data=df,
            get_position=["coord_longitude", "coord_latitude"],
            radius=200,
            elevation_scale=4,
            elevation_range=[0, 1000],
            extruded=True,
        ),
        "Station Names": pdk.Layer(
            "TextLayer",
            data=df,
            get_position=["coord_longitude", "coord_latitude"],
            get_text="stop_name",
            get_color=[0, 0, 0, 200],
            get_size=7,
            get_alignment_baseline="'bottom'",
        ),
    }
st.sidebar.markdown("### Map Layers")
selected_layers = [
    layer
    for layer_name, layer in ALL_LAYERS.items()
    if st.sidebar.checkbox(layer_name, True)
]
if selected_layers:
    st.pydeck_chart(
        pdk.Deck(
            map_style="mapbox://styles/mapbox/light-v9",
            initial_view_state={
                "latitude": 40.73285,
                "longitude": -73.98612,
                "zoom": 11,
                "pitch": 50,
            },
            layers=selected_layers,
        )
    )
else:
    st.error("Please choose at least one layer above.")



