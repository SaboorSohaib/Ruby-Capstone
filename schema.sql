CREATE TABLE item(
id              INT GENERATED ALWAYS AS IDENTITY,
publish_date    DATE,
archived        BOOLEAN DEFAULT FALSE,
genre_id        INT  REFERENCES genre (id),
author_id       INT  REFERENCES author(id),
lable_id        INT  REFERENCES lable(id),
PRIMARY KEY (id)
);

CREATE TABLE lable(
id             INT GENERATED ALWAYS AS IDENTITY,
title          VARCHAR(100),
color          VARCHAR(100),
PRIMARY KEY (id)
);

CREATE TABLE genre(
id             INT GENERATED ALWAYS AS IDENTITY,
name           VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE author(
id            INT GENERATED ALWAYS AS IDENTITY,
first_name    VARCHAR(50),
last_name     VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE book(
id           INT GENERATED ALWAYS AS IDENTITY,
publish_date DATE,
archived     BOOLEAN,
publisher    VARCHAR(50),
cover_state  VARCHAR(20),
lable_id     INT REFERENCES lable (id),
PRIMARY KEY (id)
);

CREATE TABLE musicalbum(
id            INT GENERATED ALWAYS AS IDENTITY,
publish_date  DATE,
archived      BOOLEAN,
on_spotify    BOOLEAN,
genre_id      INT REFERENCES genre (id),
PRIMARY KEY (id)
);

CREATE TABLE game(
id             INT GENERATED ALWAYS AS IDENTITY,
publish_date   DATE,
archived       BOOLEAN,
multiplayer    VARCHAR(50),
last_played_at DATE,
author_id      INT REFERENCES author (id),
PRIMARY KEY (id)
);


CREATE INDEX genre_id_index ON item(genre_id ASC);
CREATE INDEX lable_id_index ON item(lalble_id ASC);
CREATE INDEX author_id_index ON item(author_id ASC);