# streamlit_app.py
import pandas as pd
from common import *

def apply_group_color(s):
    #color = 'blue'
    color = s.line_color
    if s.line_color == 'Yellow':
        # Le jaune n'est pas très visible sur du blanc  ...
        color = "#F0C300"
    style = 'color: %s' % color
    return [style]*len(s)



sqlListLines = """
    SELECT list_lines.*
            ,(SELECT stop_name from station where station.station_id = list_lines.first_station_id) AS first_stop
            ,(SELECT stop_name from station where station.station_id = list_lines.last_station_id) AS last_stop
    FROM (
        SELECT line.line_code, line.line_color
            , MIN(s.station_id) AS first_station_id
            , MAX(s.station_id) AS last_station_id
        FROM station_line sl, station s, line
        WHERE s.station_id = sl.station_id and line.line_code  = sl.line_code
        GROUP BY sl.line_code
    ) AS list_lines
    ORDER BY list_lines.line_color, list_lines.line_code;
"""

connection = connect_to_db()
df = pd.read_sql(sqlListLines, connection)

# df
st.image('mta.jpeg', caption='MTA - NY City Subway ', width=650)

st.dataframe(df.style.apply(apply_group_color, axis=1))

