# BDD PROJET GROUPE 7

L'application est normalement host ici : https://bddg7unige.streamlit.app/ donc à priori il n'y a pas besoin de la build
soi-même. Pour la tester en local, il faut utiliser le fichier cinema.sql et remplacer bddname par cinema dans Films.py et Seances.py.

Installation de Python 3
https://www.python.org/downloads/

Installation de streamlit
https://docs.streamlit.io/get-started/installation/command-line


Créer un environnement à l'aide de venv
Pour activer venv il faut autoriser les scripts sur powershell : exécuter en tant qu'administrateur + Set-ExecutionPolicy Unrestricted -Force

cd myproject
python -m venv .venv


Activez votre environnement
# Windows command prompt
.venv\Scripts\activate.bat

# Windows PowerShell
.venv\Scripts\Activate.ps1

# macOS and Linux
source .venv/bin/activate



Installation de librairies Python utilisées

pip install -r requirements.txt

(equivalent sous forme de commandes “pip install” :
	pip install streamlit     
	pip install pandas
	pip install mysql-connector-python
	pip install mysqlclient
)

Installer la version 23.2.4 DBeaver : https://dbeaver.io/files/23.2.4/
	(ou sinon, sur la version actuelle (24), enlever la ligne "CREATE DATABASE IF NOT EXISTS" et créer la base manuellement)

Création et alimentation de la base de données :
	Lancer le script sql/nyc2.sql  et sql/boutique.sql (création de la base nyc2, des tables et remplissage)


Configuration de la connexion à la BDD : fichier config.json

Lancement de streamlit depuis un terminal (Ex Power Shell):
	streamlit run ./hello.py

Lancer le navigateur à l'adresse http://localhost:8501/






