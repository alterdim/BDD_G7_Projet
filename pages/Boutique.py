import streamlit as st
import mysql.connector
import pandas as pd
from common import *

# Fonction pour se connecter à la base de données


# Fonction pour obtenir des produits de la base de données
def get_products():
    connection = connect_to_db2("boutique")
    query = "SELECT * FROM Produit"
    data = pd.read_sql(query, connection)
    connection.close()
    return data

# Fonction pour obtenir un produit unique par identifiant
def get_product_by_id(product_id):
    connection = connect_to_db2("boutique")
    query = "SELECT * FROM Produit WHERE IDProduit = %s"
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
product_id = st.text_input("Entrez l'identifiant du produit", '')
if st.button('Trouver le produit'):
    if product_id:
        try:
            product_df = get_product_by_id(product_id)
            if product_df.empty:
                st.write("Aucun produit trouvé avec cet identifiant:", product_id)
            else:
                st.write(product_df)
        except ValueError:
            st.error("Veuillez entrer un identifiant valide..")
    else:
        st.error("Veuillez entrer un identifiant de produit")
