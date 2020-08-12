/* Criando Filmes */
INSERT INTO movies
VALUES ("A Volta Dos Que Não Foram", 2018);
INSERT INTO movies
VALUES ("A Cura", 2021);
INSERT INTO movies
VALUES ("Pandemia", 2020);
INSERT INTO movies
VALUES ("Um Programador Muito Louco", 2022);
INSERT INTO movies
VALUES ("MYSQL x Postgress", 2020);
/* Criando Genêros */
INSERT INTO genres (label)
VALUES ("Ação");
INSERT INTO genres (label)
VALUES ("Comédia");
INSERT INTO genres (label)
VALUES ("Romance");
INSERT INTO genres (label)
VALUES ("Documentário");
INSERT INTO genres (label)
VALUES ("Terror");
/* criando genero dos filmes */
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (1, 1);
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (2, 3);
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (3, 4);
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (3, 5);
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (4, 2);
INSERT INTO movie_genres (movie_id, genre_id)
VALUES (5, 4);
/* Criando pessoas */
INSERT INTO people (firstName, lastName)
VALUES ("John", "Doe");
INSERT INTO people (firstName, lastName)
VALUES ("Vladmir", "Putin");
INSERT INTO people (firstName, lastName)
VALUES ("Leonardo", "DiCaprio");
INSERT INTO people (firstName, lastName)
VALUES ("Michael", "Stonebraker");
INSERT INTO people (firstName, lastName)
VALUES ("Edgar", "Frank Codd");
INSERT INTO people (firstName, lastName)
VALUES ("Allan", "Larson");
INSERT INTO people (firstName, lastName)
VALUES ("Thiago", "Magano");
INSERT INTO people (firstName, lastName)
VALUES ("Corona Virus", "Covid19");
/* Criando Papeis */
INSERT INTO role_types(label)
VALUES("Ator");
INSERT INTO role_types(label)
VALUES("Diretor");
INSERT INTO role_types(label)
VALUES("Roteirista");
/* Criando Equipes */
/* A volta dos que não foram */
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(1, 1, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(1, 1, 2);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(1, 1, 3);
/* A Cura */
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(2, 3, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(2, 2, 2);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(2, 8, 3);
/* Pandemia */
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(3, 8, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(3, 8, 2);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(3, 8, 3);
/* Um programador muito louco */
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(4, 7, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(4, 7, 2);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(4, 7, 3);
/* Mysql x Postgress */
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(5, 4, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(5, 6, 1);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(5, 5, 2);
INSERT INTO casting (movie_id, people_id, movie_role_id)
VALUES(5, 5, 3);