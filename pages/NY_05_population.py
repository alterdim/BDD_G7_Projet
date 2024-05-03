import streamlit as st
import pandas as pd

from common import *

st.header("New York Boroughs population from 1790 ")

sql_population = """
    SELECT CONCAT('year ', year), borough, population 
    FROM borough_hist_population
"""

connection = connect_to_db()
df1 = pd.read_sql(sql_population, connection)
chart_data = generate_2d_dataframe(df1)

st.line_chart(chart_data)
