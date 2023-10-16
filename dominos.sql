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
("4 fromages", 2, 8.90),
("Margherita", 1, 4.90),
("Reine", 3, 10.90);


-- Création de la table ingredients
CREATE TABLE IF NOT EXISTS ingredients (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL
);


-- Insertion des données dans la table ingrédients
INSERT INTO ingredients
(nom)
VALUES
/* Si on met ("mozarella", "tomate", "jambon") à la place de ce qu'il y a ci-dessous, ne fonctionnera pas car sera considéré comme ligne et non comme colonne */
("mozarella"),
("tomate"),
("jambon"),
("champignon"),
("gorgonzola");



-- Création de la table pizzas_ingredients
CREATE TABLE IF NOT EXISTS pizzas_ingredients (
    pizza_id TINYINT,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id),
    ingredient_id TINYINT,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (pizza_id, ingredient_id)
);


-- Insertion des données dans la table pizzas_ingrédients afin de "lier" les pizzas et les ingrédients
INSERT INTO pizzas_ingredients
(pizza_id, ingredient_id)
VALUES
(1, 1),
(1, 5),
(2, 2),
(2, 1),
(3, 2),
(3, 3),
(3, 4);


-- Exemple de création d'une clé étrangère
-- CREATE TABLE personne (
--     id SMALLINT PRIMARY KEY AUTO_INCREMENT,
--     nom VARCHAR(50),
--     prenom VARCHAR(50),
--     id_voiture SMALLINT, 
--     FOREIGN KEY id_voiture REFERENCES voiture(id)
-- );


-- Exemple de requête pour afficher le nom et le prix des pizzas pour deux personnes
SELECT nom, prix 
FROM pizzas
WHERE taille = 2;

-- Exemple de requête pour afficher les pizzas pour au moins deux personnes ayant un prix inférieur à 10€
SELECT nom 
FROM pizzas
WHERE taille >= 2 AND prix < 10;

-- Exemple de requête pour compter le nombre de pizzas à la carte 
SELECT COUNT(*) AS nb_pizzas
FROM pizzas;

-- Exemple de requête pour maj (augmenter) le prix des pizzas pour 2 personnes
UPDATE pizzas
SET prix = prix*1.1
WHERE taille = 2;


-- Exemple de requête pour obtenir la liste des ingrédients pour chaque pizza
SELECT *
FROM ingredients
INNER JOIN pizzas_ingredients
ON ingredients.id = pizzas_ingredients.ingredient_id 
INNER JOIN pizzas
ON pizzas_ingredients.pizza_id = pizzas.id

