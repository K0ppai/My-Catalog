CREATE TABLE item(
 id INT GENERATED ALWAYS AS IDENTITY,
 genre_id INT REFERENCES genre(id),
 author_id INT REFERENCES author(id),
 label_id INT REFERENCES label(id),
 publish_date DATE,
 archived boolean
 PRIMARY KEY (id));

 CREATE TABLE game(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer boolean,
  last_played_at DATE,
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  archived boolean,
  PRIMARY KEY (id)
 );

 CREATE TABLE author(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(250)
   last_name VARCHAR(250)
   PRIMARY KEY (id)
 );

CREATE TABLE
  music_albums (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    genre_id INT,
    label_id INT,
    author_id INT,
    on_spotify BOOLEAN,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id),
    CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels (id),
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors (id)
  );

CREATE TABLE
  genres (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY (id)
  );