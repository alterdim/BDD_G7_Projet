import streamlit as st
import mysql.connector
import pandas as pd
from common import *

dbname = "b8syyge5j3lftmivshyv"

def get_movies():
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM film"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

def filter_movies_gender(gender_id):
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM film WHERE genre1 = %d OR genre2 = %d"
    data = pd.read_sql(query, connection, params=(gender_id,))
    connection.close()
    return data

def get_genders():
    connection = connect_to_db2(dbname)
    query = "SELECT nom_genre FROM genre"
    data = pd.read_sql(query, connection)
    print(data)
    connection.close()
    return data

if st.button('Afficher Cinémas'):
    products_df = get_movies()
    st.write(products_df)

    
#  Interface utilisateur de Streamlit
st.title("Vos cinémas")

# Recherche de film par genre(s)
st.subheader("Rechercher un film par genre")
movie_genders = get_genders()
product_id2 = st.selectbox("Genre", movie_genders)

