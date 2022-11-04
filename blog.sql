CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "descrption" varchar,
  "author" varchar NOT NULL,
  "content" text,
  "user_id" int NOT NULL
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "content" text,
  "post_id" int
);

CREATE TABLE "rel_post_tags" (
  "id" SERIAL PRIMARY KEY,
  "post_id" int,
  "tag_id" int
);

ALTER TABLE "posts" ADD FOREIGN KEY ("id") REFERENCES "user" ("id");

ALTER TABLE "rel_post_tags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "rel_post_tags" ADD FOREIGN KEY ("tag_id") REFERENCES "tags" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

insert into "user" (name, email, "password") values 
('Juan','patatata@gmail.com', 'patataa43' ),
('Pedro','pasdasdas@gmail.com', 'adasdasda'),
('María', 'agsgsgs@gmail.com', 'adadada');

insert into "posts" (title, descrption, author, "content", "user_id") values
('no sé', 'como cocinar un huevo', 'juan', 'hay que hervir el agua... ', '1'),
('la era del hielo', 'reseña de película', 'Pedro', 'God, peli god... ', '2');

insert into "tags" (name) values 
('receta'),
('reseña'),
('pelicula'),
('divertido'),
('tutorial');

insert into "comments" ("content", post_id ) values
('buena receta', '1'),
('haz otra más', '1'),
('mala reseña', '2'),
('más recetas', '1'),
('buena peli', '2');