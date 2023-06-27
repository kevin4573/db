CREATE DATABASE blog_db

--USERS
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
  	lastname VARCHAR(50),
  	email VARCHAR(50)
);

INSERT INTO users (firstname, lastname, email)
VALUES('kevin', 'macalupu', 'kevin@gmail.com'),
		('jose', 'andres', 'jose@gmail.com'),
		('luis', 'ariza', 'luis@gmail.com');
SELECT * FROM users

--POSTS
CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	creator_id INT,
	title VARCHAR(80),
	text VARCHAR(150)
)

INSERT INTO posts (creator_id, title, text)
VALUES(1, 'Lunes por que lo odiamos tanto?', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
		(2, 'Por que amamos los viernes?', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
		(3, 'Por que los domingos nos estristecen?','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
		(4, 'Mira aqui los tips que tenemos para ti','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
		(5, 'Horoscopo','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit');

SELECT * FROM posts

--LIKES
CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	post_id INT REFERENCES posts(id)
)

INSERT INTO likes (user_id, post_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (1, 4),
       (2, 5);
SELECT posts.*, users.firstname, users.lastname, users.email
FROM posts
JOIN users ON posts.creator_id = users.id;

SELECT posts.*, users.firstname, users.lastname, users.email
FROM posts
JOIN likes ON posts.id = likes.post_id
JOIN users ON likes.user_id = users.id;