USE movie_database;
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
);