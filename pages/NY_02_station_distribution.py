# streamlit_app.py

import pandas as pd
from common import *

connection = connect_to_db()

sql_count_stations1 = """
    SELECT s.borough , count(*) AS nb
    FROM station s 
    GROUP BY s.borough 
    ORDER BY borough
"""

df1 = pd.read_sql(sql_count_stations1, connection)
chart_data1 = generate_1d_dataframe(df1)


sql_count_stations2 = """
    SELECT sl.line_code, s.borough , count(*) AS nb 
    FROM station_line sl , station s 
    WHERE sl.station_id  = s.station_id
    GROUP BY sl.line_code , s.borough 
    ORDER BY line_code, borough
"""


chart_data2 = pd.read_sql(sql_count_stations2, connection)
chart_data2 = generate_2d_dataframe(chart_data2)

st.header("Stations distribution by borough")
st.bar_chart(chart_data1,  height=200)

st.write("Dataframe :")
chart_data1

st.header("Stations distribution by line and borough")
st.bar_chart(chart_data2)

st.write("Dataframe :")
chart_data2
