CREATE TABLE item(
id    INT GENERATED ALWAYS AS IDENTITY,
publish_date    DATE,
archived   BOOLEAN DEFAULT FALSE,
genre_id   INT  REFERENCES genre (id),
author_id  INT  REFERENCES author(id),
lable_id   INT  REFERENCES lable(id),
PRIMARY KEY (id)
);

CREATE TABLE lable(
id          INT GENERATED ALWAYS AS IDENTITY,
title       VARCHAR(100),
color       VARCHAR(100),
PRIMARY KEY (id)
);

CREATE TABLE genre(
id        INT GENERATED ALWAYS AS IDENTITY,
name      VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE author(
id       INT GENERATED ALWAYS AS IDENTITY,
first_name  VARCHAR(50),
last_name   VARCHAR(50),
PRIMARY KEY (id)
);