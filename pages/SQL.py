import streamlit as st
import mysql.connector
import pandas as pd
from common import *
dbname = "b8syyge5j3lftmivshyv"
#  Interface utilisateur de Streamlit
st.title("Recherche de séances")

def sql_test1():
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

tests = {"Les cinémas qui diffusent les films italiens pour lesquels l'âge minimal est de 12 ans":'''
SELECT DISTINCT l.nom
FROM lieu l
JOIN salle s ON s.lieu_id = l.lieu_id
JOIN seance s2 ON s2.salle_id = s.salle_id
JOIN film f ON f.film_id = s2.film_id
WHERE f.pays LIKE "%Italie%" AND f.age_minimal = 12''',
"Les réalisateurs qui ont joué dans leur propre film, ainsi que le nom du dit film":
'''SELECT realisateur, titre
FROM film f
WHERE FIND_IN_SET(f.acteur1, f.realisateur) > 0
OR FIND_IN_SET(f.acteur2, f.realisateur) > 0''',
"Les films et leurs genres avec une date de sortie en janvier 2024, qui sont encore diffusés entre le 13 et 19 mai":
'''SELECT f.titre, GROUP_CONCAT(DISTINCT g.nom_genre SEPARATOR ', ') AS genres
FROM seance s
JOIN film f ON f.film_id = s.film_id
LEFT JOIN film_genre fg ON fg.film_id = f.film_id
LEFT JOIN genre g ON g.genre_id = fg.genre_id
WHERE f.date_sortie BETWEEN '2024-01-01' AND '2024-01-31'
AND s.date_seance BETWEEN '2024-05-13' AND '2024-05-19'
GROUP BY f.titre''',
"Les films d'animation sortis en l'an 2000":
'''SELECT f.titre
FROM film f
JOIN film_genre fg ON fg.film_id = f.film_id
JOIN genre g ON g.genre_id = fg.genre_id
WHERE g.nom_genre = 'Dessin animé' AND f.date_sortie BETWEEN
'2000-01-01' AND '2000-12-31' ''',
"Le nombre moyen de séances d'un film sorti le 8 mai 2024 entre sa sortie et le 14 mai, par cinéma":
'''WITH seance_nb AS(
SELECT f.titre, s2.lieu_id, COUNT(*) AS Nb
FROM seance s
JOIN film f ON f.film_id = s.film_id
JOIN salle s2 ON s2.salle_id = s.salle_id
WHERE f.date_sortie = '2024-05-08' AND s.date_seance BETWEEN
'2024-05-08' AND '2024-05-14'
GROUP BY s.film_id, s2.lieu_id)
SELECT l.nom, AVG(Nb) AS nombre_moyen_de_seances_pour_un_nouveau_film
FROM seance_nb
JOIN lieu l ON l.lieu_id = seance_nb.lieu_id
GROUP BY seance_nb.lieu_id''',
"Tous les films suisses sortis au 21ème siècle":
'''SELECT titre
FROM film f
WHERE date_sortie >= 2001-01-01 AND pays LIKE '%Suisse%' ''',
"Les acteurs jouant dans plusieurs films, triés par nombre de films joués":
'''SELECT acteur, COUNT(*) as nb_film
FROM (
SELECT f.acteur1 AS acteur
FROM film f
UNION ALL
SELECT f.acteur2 AS acteur
FROM film f
) AS acteurs
WHERE acteur IS NOT NULL
GROUP BY acteur
HAVING nb_film > 1;''',
"Les séances du 17 mai à partir de 17h en VO avec Drame en genre":
'''SELECT f.titre, s.heure_seance, l.nom, s2.nom_salle, s2.prix_plein,
s2.prix_reduit, s2.prix_enfant
FROM seance s
JOIN film f ON f.film_id = s.film_id
JOIN film_genre fg ON fg.film_id = f.film_id
JOIN genre g ON g.genre_id = fg.genre_id
JOIN salle s2 ON s2.salle_id = s.salle_id
JOIN lieu l ON l.lieu_id = s2.lieu_id
WHERE g.nom_genre ='Drame' AND s.date_seance = '2024-05-17'
AND s.heure_seance >= '17:00' AND s.vo = true''',
"Le nombre moyen de séances par jour par cinéma du 13 au 19 mai":
'''WITH nb_jour AS (
SELECT l.nom, s.date_seance, COUNT(*) AS nb
FROM seance s
JOIN salle s2 ON s2.salle_id = s.salle_id
JOIN lieu l ON l.lieu_id = s2.lieu_id
WHERE s.date_seance BETWEEN '2024-05-13' AND '2024-05-19'
GROUP BY l.nom, s.date_seance
)
SELECT nom, AVG(nb) AS moyenne_par_jour
FROM nb_jour
GROUP BY nb_jour.nom''',
"Les cinq plus grandes salles de cinéma":
'''SELECT l.nom, s.nom_salle, s.capacite
FROM salle s
JOIN lieu l ON l.lieu_id = s.lieu_id
ORDER BY s.capacite DESC
LIMIT 5;''',
"Le nombre de films sortis en 2024 par genre":
'''SELECT g.nom_genre, COUNT(*) AS nb
FROM film_genre fg
JOIN genre g ON g.genre_id = fg.genre_id
JOIN film f ON f.film_id = fg.film_id
WHERE f.date_sortie BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY g.nom_genre
ORDER BY nb ASC'''}

movieSel = st.selectbox("Requêtes SQL numéro", tests)

if st.button('Tester la requête'):
    connection = connect_to_db2(dbname)
    query = tests[movieSel]
    data = pd.read_sql(query, connection)
    connection.close()
    st.write(data)