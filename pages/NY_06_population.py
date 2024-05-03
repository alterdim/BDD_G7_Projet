import streamlit as st
import pandas as pd
import altair as alt
from urllib.error import URLError



from common import *

sql_population = """
    SELECT borough, CONCAT('', year), population 
    FROM borough_hist_population
"""

connection = connect_to_db()
df1 = pd.read_sql(sql_population, connection)
chart_data = generate_2d_dataframe(df1)

st.set_page_config(page_title="DataFrame Demo", page_icon="📊")

st.markdown("# New York Boroughs population from 1790")
st.sidebar.header("New York Boroughs population from 1790")
st.write(
    """This demo shows how to use `st.write` to visualize Pandas DataFrames.
(Data courtesy of the [UN Data Explorer](http://data.un.org/Explorer.aspx).)"""
)


try:
    df = chart_data
    list_borough = st.multiselect(
        "Choose borough", list(df.index), list(df.index)[:3]  # ["Brooklyn", "Manhattan"]
    )
    if not list_borough:
        st.error("Please select at least one borough.")
    else:
        data = df.loc[list_borough]
        #data /= 1.0
        st.write("### Borough Population", data.sort_index())
        data = data.T.reset_index()
        data = pd.melt(data, id_vars=["index"]).rename(
            columns={"index": "year", "value": "Population", "variable":"Borough"}
        )
        chart = (
            alt.Chart(data)
            .mark_area(opacity=0.3)
            .encode(
                x="year:T",
                y=alt.Y("Population:Q", stack=None),
                color="Borough:N",
            )
        )
        st.altair_chart(chart, use_container_width=True)
except URLError as e:
    st.error(
        """
        **This demo requires internet access.**
        Connection error: %s
    """
        % e.reason
    )
