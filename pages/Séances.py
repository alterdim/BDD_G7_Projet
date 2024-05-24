import streamlit as st
import mysql.connector
import pandas as pd
from common import *
dbname = "b8syyge5j3lftmivshyv"
#  Interface utilisateur de Streamlit
st.title("Recherche de séances")

def get_movies():
    connection = connect_to_db2(dbname)
    query = "SELECT titre FROM film"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

def search_seance(titre):
    connection = connect_to_db2(dbname)
    query = '''select film.titre, lieu.nom, seance.heure_seance, seance.salle_id, seance.vo, 
    salle.screenx, salle.imax, salle.prix_plein, salle.prix_reduit, salle.prix_enfant  from salle, lieu, 
    seance, film where seance.salle_id  = salle.salle_id and lieu.lieu_id = salle.lieu_id and seance.film_id = film.film_id and film.titre = "''' + titre + '"'
    print(query)
    data = pd.read_sql(query, connection)
    connection.close()
    return data

movieSel = st.selectbox("Film", get_movies())

if st.button('Rechercher des séances'):
    data = search_seance(movieSel)
    st.write(data)