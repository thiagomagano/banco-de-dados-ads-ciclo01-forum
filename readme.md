# Desenvolvendo um banco de dados

Olá Professor e Colegas

Aqui vai a minha solução para o desafio solicitado.

## Objetivo
Criar um pequeno banco de dados que Armazene filmes e pessoas e associe generos com filmes e filmes com pessoas e seus papeis na equipe.

Modelei o banco movie_database em 6 Tabelas:

- movies (**id**, title, relesead_year) - Filmes
- genres (**id**, label) - Gêneros
- people (**id**, firtsName, lastName) - Pessoas
- role_type (**id**, label) - Tipo de Papel da pessoa no Filme (Ator, Diretor, etc..)
- casting (*movie_id*, *people_id*, *movie_role_id*) - Tabela para associar filmes, pessoas e o papel na equipe.
- movie_genres(*movie_id*, *genre_id*) - Tabela para associar filmes e gêneros

> OBS: Criei o nome das tabelas no banco em inglês porque é uma boa prática de programção escrever as variaveis da forma mais entendível para o maior numero de pessoas possível. 

## 1 - Criando o Banco

Dentro do shell do Mysql ou utilizando o PhpMyAdmin na parte de "SQL":

<code>CREATE DATABASE movie_database;</code>

## 2 - Criando as Tabelas

Script que fiz para a criação das Tabelas:

<code>USE movie_database;
CREATE TABLE movies (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  relesead_year INT(4) NOT NULL
);
CREATE TABLE genres (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  label VARCHAR (255) NOT NULL
);
CREATE TABLE people(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255)
);
CREATE TABLE role_types(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  label VARCHAR(255)
);
CREATE TABLE casting(
  movie_id INT NOT NULL,
  people_id INT NOT NULL,
  movie_role_id INT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (people_id) REFERENCES people(id),
  FOREIGN KEY (movie_role_id) REFERENCES role_types(id)
);
CREATE TABLE movie_genres (
  movie_id int NOT NULL,
  genre_id int NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);</code>

## 3 - Inserindo os dados
Script que utilizei para popular o banco com dados.

<code>/* Criando Filmes */
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
/* Criando gêneros */
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
/* Relacionando generos e filmes */
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
VALUES(5, 5, 3);</code>

> OBS: Todos os dados são fícticios (não liguem para os eastereggs rs)

## 4 - Consultas
Crie duas consultas no banco:

##### 1 - Retornar todos os filmes e seus gêneros.
<code>SELECT title as Título,
  label as Gênero,
  relesead_year as Ano_do_Lançamento
FROM (
    (
      movie_genres
      INNER JOIN genres on genres.id = movie_genres.genre_id
    )
    INNER JOIN movies on movies.id = movie_genres.movie_id
  );</code>
##### 2 - Retornar toda equipe e ordenar pelo título do filme
<code>SELECT title as Título,
  firstName as Nome,
  lastName as Sobrome,
  label as Papel
FROM (
    (
      (
        casting
        INNER JOIN people on people.id = casting.people_id
      )
      INNER JOIN movies on movies.id = casting.movie_id
    )
    INNER JOIN role_types on role_types.id = casting.movie_role_id
  )
ORDER BY movies.id;</code>

## Conclusão

Criei um repositório do GitHub com o backkup do banco de dados já criado e também os scripts SQL que usei para quem quiser dar uma olhada tudo em funcionando diretamente no MYSQL.

https://github.com/thiagomagano/banco-de-dados-ads-ciclo01-forum