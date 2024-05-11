import streamlit as st
import mysql.connector
import pandas as pd
from common import *

dbname = "b8syyge5j3lftmivshyv"

# Fonction pour obtenir des produits de la base de données
def get_movies():
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM film"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

#  Interface utilisateur de Streamlit
st.title("Vos cinémas")