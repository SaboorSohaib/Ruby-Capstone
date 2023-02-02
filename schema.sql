CREATE TABLE item(
id    INT GENERATED ALWAYS AS IDENTITY,
publish_date    DATE,
archived   BOOLEAN DEFAULT FALSE,
genre_id   INT  REFERENCES genre (id),
author_id  INT  REFERENCES author(id),
lable_id   INT  REFERENCES lable(id),
PRIMARY KEY (id)
);