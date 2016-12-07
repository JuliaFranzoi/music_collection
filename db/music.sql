DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id serial8 primary key,
  name varchar(255)
);

CREATE TABLE records(
  id serial8 primary key,
  title varchar(255),
  artist_id INT4 references artists(id)
);
