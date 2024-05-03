-- Creation base de données 'boutique'
CREATE DATABASE IF NOT EXISTS boutique;
USE boutique;

-- Creatation la table 'CatégorieProduit' 
CREATE TABLE CatégorieProduit (
    Catégorie VARCHAR(50) PRIMARY KEY,
    Description VARCHAR(255)
) ENGINE=InnoDB;

-- Creation la table 'Produit'
CREATE TABLE Produit (
    IDProduit VARCHAR(50) PRIMARY KEY,
    NomProduit VARCHAR(100),
    Prix DECIMAL(10,2),
    Catégorie VARCHAR(50),
    QuantitéEnStock INT,
    FOREIGN KEY (Catégorie) REFERENCES CatégorieProduit(Catégorie)
) ENGINE=InnoDB;

-- Creation la table 'Client'
CREATE TABLE Client (
    IDClient VARCHAR(50) PRIMARY KEY,
    Prénom VARCHAR(100),
    Nom VARCHAR(100),
    Email VARCHAR(100),
    Adresse VARCHAR(255)
) ENGINE=InnoDB;

-- Creation la table 'Commande'
CREATE TABLE Commande (
    IDCommande VARCHAR(50) PRIMARY KEY,
    IDClient VARCHAR(50),
    DateCommande DATE,
    MontantTotal DECIMAL(10,2),
    FOREIGN KEY (IDClient) REFERENCES Client(IDClient)
) ENGINE=InnoDB;

-- Creattion la table 'DétailCommande'
CREATE TABLE DétailCommande (
    IDCommande VARCHAR(50),
    IDProduit VARCHAR(50),
    QuantitéCommandée INT,
    PRIMARY KEY (IDCommande, IDProduit),
    FOREIGN KEY (IDCommande) REFERENCES Commande(IDCommande),
    FOREIGN KEY (IDProduit) REFERENCES Produit(IDProduit)
) ENGINE=InnoDB;



INSERT INTO CatégorieProduit (Catégorie, Description) VALUES
('Électronique', 'Gadgets et appareils électroniques'),
('Vêtements', 'Vêtements pour hommes et femmes'),
('Livres', 'Livres éducatifs et de loisirs'),
('Meubles', 'Meubles pour la maison'),
('Jouets', 'Jeux et jouets pour enfants'),
('Sac', 'Sacs de divers style, pour divers usages'),
('Chaussures', 'Chaussures pour divers usages'),
('Bricolage', 'Ustensiles pour tous types de travaux ')
;


INSERT INTO Produit (IDProduit, NomProduit, Prix, Catégorie, QuantitéEnStock) VALUES
('P001', 'Ordinateur Portable', 999.99, 'Électronique', 10),
('P002', 'T-shirt', 19.99, 'Vêtements', 50),
('P003', 'Chaise', 49.99, 'Meubles', 15),
('P004', 'Livre de Science', 29.99, 'Livres', 20),
('P005', 'Voiture Jouet', 9.99, 'Jouets', 30),
('P006', 'Telephone Portable', 299.99, 'Electronique', 20),
('P007', 'Sac en cuir Xena', 723.99, 'Sac', 5),
('P008', 'Sac à dos mini 12L', 120.00, 'Sac', 10),
('P009', 'Baskets - All Star Move Canvas', 80.00, 'Chaussures', 5)
;


INSERT INTO Client (IDClient, Prénom, Nom, Email, Adresse) VALUES
('C001', 'Alice', 'Smith', 'alice.smith@example.com', '123 Rue Pomme'),
('C002', 'Bob', 'Jones', 'bob.jones@example.com', '456 Avenue Banane'),
('C003', 'Carol', 'Taylor', 'carol.taylor@example.com', '789 Boulevard Cerise'),
('C004', 'David', 'Brown', 'david.brown@example.com', '012 Route Orange'),
('C005', 'Eve', 'Davis', 'eve.davis@example.com', '345 Allée Melon'),
('C006', 'Estella', 'Marc', 'estella.marc@example.com', '789 Boulevard Banane'),
('C007', 'James', 'Bergson', 'james.bergson@example.com', '516 Rue Mangue');


INSERT INTO Commande (IDCommande, IDClient, DateCommande, MontantTotal) VALUES
('CMD01', 'C001', '2023-10-01', 1019.98),
('CMD02', 'C001', '2023-10-02', 49.99),
('CMD03', 'C002', '2023-10-03', 39.98),
('CMD04', 'C002', '2023-10-04', 999.99),
('CMD05', 'C003', '2023-10-05', 59.98),
('CMD06', 'C003', '2023-10-06', 29.99),
('CMD07', 'C004', '2023-10-07', 1009.98),
('CMD08', 'C004', '2023-10-08', 19.99),
('CMD09', 'C005', '2023-10-09', 9.99),
('CMD10', 'C005', '2023-10-10', 49.99),
('CMD11', 'C005', '2023-10-10', 39.98);


INSERT INTO DétailCommande (IDCommande, IDProduit, QuantitéCommandée) VALUES
('CMD01', 'P001', 1),
('CMD01', 'P002', 1),
('CMD02', 'P003', 1),
('CMD03', 'P002', 2),
('CMD04', 'P001', 1),
('CMD05', 'P002', 2),
('CMD06', 'P004', 1),
('CMD07', 'P001', 1),
('CMD08', 'P002', 1),
('CMD09', 'P005', 1),
('CMD10', 'P003', 1),
('CMD11', 'P002', 2),
('CMD01', 'P007', 1),
('CMD01', 'P009', 1),
('CMD11', 'P008', 1);






