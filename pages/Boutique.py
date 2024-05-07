import streamlit as st
import mysql.connector
import pandas as pd
from common import *

# Fonction pour se connecter à la base de données

dbname = "b8syyge5j3lftmivshyv"

# Fonction pour obtenir des produits de la base de données
def get_products():
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM produit"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

# Fonction pour obtenir un produit unique par identifiant
def get_product_by_id(product_id):
    connection = connect_to_db2(dbname)
    query = "SELECT * FROM produit WHERE IDProduit = %s"
    data = pd.read_sql(query, connection, params=(product_id,))
    connection.close()
    return data

#  Interface utilisateur de Streamlit
st.title('Votre Boutique')

# Button pour afficher les produits
if st.button('Afficher Produits'):
    products_df = get_products()
    st.write(products_df)

# Fonction pour obtenir un produit unique par identifiant
st.subheader("Rechercher un produit par identifiant")
query = "SELECT IDProduit FROM produit"
connection = connect_to_db2(dbname)
product_ids = pd.read_sql(query, connection)
product_id = st.text_input("Entrez l'identifiant du produit", '')
product_id2 = st.selectbox("TEst", product_ids)
if st.button('Trouver le produit'):
    if product_id:
        try:
            product_df = get_product_by_id(product_id2)
            if product_df.empty:
                st.write("Aucun produit trouvé avec cet identifiant:", product_id)
            else:
                st.write(product_df)
        except ValueError:
            st.error("Veuillez entrer un identifiant valide..")
    else:
        st.error("Veuillez entrer un identifiant de produit")
