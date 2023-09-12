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