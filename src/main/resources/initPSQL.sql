DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS motos;
DROP TABLE IF EXISTS user_has_cars;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 1000;

CREATE TABLE users
(
  id         INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  login      VARCHAR NOT NULL,
  email      VARCHAR NOT NULL,
  password   VARCHAR NOT NULL,
  registered TIMESTAMP DEFAULT now(),
  role       VARCHAR DEFAULT 'ROLE_USER'
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE cars
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  brand       VARCHAR NOT NULL,
  model       VARCHAR NOT NULL,
  transmition VARCHAR NOT NULL,
  color       VARCHAR NOT NULL,
  engine      VARCHAR NOT NULL,
  frame       VARCHAR NOT NULL,
  agregate    VARCHAR NOT NULL,
  img1        VARCHAR ,
  img2        VARCHAR ,
  img3        VARCHAR ,
  added       TIMESTAMP DEFAULT now(),

  year        INTEGER NOT NULL,
  price       INTEGER NOT NULL,
  odo         INTEGER NOT NULL,
  view        INTEGER NOT NULL,

  skin        BOOLEAN,
  castdisk    BOOLEAN,
  aircondition BOOLEAN

);

CREATE TABLE user_has_cars
(
  user_id INTEGER NOT NULL,
  car_id  INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (car_id) REFERENCES cars (id) ON DELETE CASCADE
);