-- Création de la base dominos
CREATE DATABASE IF NOT EXISTS dominos;


-- Sélection de la base, pour que SQL sache dans quelle base il doit créer la table
USE dominos;


-- Création de la table pizzas
CREATE TABLE IF NOT EXISTS pizzas (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    /* Pour la ligne ci-dessus, on peut aussi l'écrire sur deux lignes :
    id TINYINT,
    PRIMARY KEY (id) AUTO_INCREMENT
    */
    nom VARCHAR(20) NOT NULL,
    taille TINYINT,
    prix DECIMAL(4, 2)
);

-- Insertion des données dans la table pizzas
INSERT INTO pizzas
(nom, taille, prix)
VALUES
('4 fromages', 2, 8.90),
('Margherita', 1, 4.90),
('Reine', 3, 10.90);


-- Création de la table ingredients
CREATE TABLE IF NOT EXISTS ingredients (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL
);


-- Création de la table pizzas_ingredients
CREATE TABLE IF NOT EXISTS pizzas_ingredients (
    pizza_id TINYINT,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id),
    ingredient_id TINYINT,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (pizza_id, ingredient_id)
);


-- Exemple de création d'une clé étrangère
-- CREATE TABLE personne (
--     id SMALLINT PRIMARY KEY AUTO_INCREMENT,
--     nom VARCHAR(50),
--     prenom VARCHAR(50),
--     id_voiture SMALLINT, 
--     FOREIGN KEY id_voiture REFERENCES voiture(id)
-- );


