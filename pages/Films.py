import streamlit as st
import mysql.connector
import pandas as pd
from common import *
dbname = "b8syyge5j3lftmivshyv"
#  Interface utilisateur de Streamlit
st.title("Recherche de films")


def get_movies():
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM film"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

def filter_movies_gender(gender_id):
    connection = connect_to_db2(dbname)
    query = "SELECT film.titre, film.duree, film.date_sortie, film.pays, film.acteur1, film.acteur2, film.realisateur, film.age_minimal from film, film_genre WHERE film_genre.genre_id  = %s and film.film_id  = film_genre.film_id "
    data = pd.read_sql(query, connection, params=(gender_id,))
    connection.close()
    return data
def filter_movies(gender_id=0, acteur=""):
    alreadywhere = False
    baseQuery = '''SELECT distinct film.titre, film.duree, film.date_sortie, 
    film.pays, film.acteur1, film.acteur2, film.realisateur, 
    film.age_minimal from film, film_genre WHERE film.film_id = film_genre.film_id'''
    connection = connect_to_db2(dbname)

    #GENRE ID
    if (gender_id != 0):
        baseQuery+= " AND "
        baseQuery+= ("film_genre.genre_id  = " + str(gender_id))

    # ACTEUR
    if (acteur != ""):
        acteur = '"' + acteur + '"'
        baseQuery+= " AND "
        baseQuery += ("film.acteur1 = " + acteur + " OR film.acteur2 = " + acteur)

    print(baseQuery)
    data = pd.read_sql(baseQuery, connection)
    
    connection.close()
    return data

# Damn, this is terrible code. I hope i never have to deal with pandas like that ever again.

def get_genders_dictionary():
    connection = connect_to_db2(dbname)
    query = "SELECT nom_genre, genre_id FROM genre"
    data = pd.read_sql(query, connection)
    connection.close()
    return dict((v, k) for k, v in data.to_dict()["nom_genre"].items())

def get_actors():
    connection = connect_to_db2(dbname)
    query = "select acteur1 from film where acteur1 is not null union select acteur2 from film where acteur2 is not null order by acteur1 asc"
    data = pd.read_sql(query, connection)
    connection.close()
    return data


# Recherche de film par genre(s)
movie_genders = get_genders_dictionary()
movie_genders[""] = -1
mvigenderSel = st.selectbox("Genre", movie_genders.keys(), index=18)
mvicntrySel = st.selectbox("Acteur/Actrice", get_actors())

if st.button('Rechercher'):
    genderid = movie_genders.get(mvigenderSel)
    products_df = filter_movies(genderid+1, mvicntrySel)

    st.write(products_df)



    


