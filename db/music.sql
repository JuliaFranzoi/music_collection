DROP TABLE IF EXISTS artists;
#DROP TABLE IF EXISTS records;

CREATE TABLE artists(
  id serial8 primary key,
  name varchar(255)
);

-- CREATE TABLE records(
--   id serial8 primary key,
--   record_name varchar(255),
--   artist_id_id INT4 references artist(id)
-- );
