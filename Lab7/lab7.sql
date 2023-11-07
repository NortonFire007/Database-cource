DROP TABLE IF EXISTS article_ratings;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS news_categories;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT(10) unsigned AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE news_categories (
  id INT(10) unsigned AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE news (
  id INT(10) unsigned AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  publication_date DATE NOT NULL,
  category_id INT(10) unsigned,
  author_id INT(10) unsigned NULL,
  FOREIGN KEY (category_id) REFERENCES news_categories(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE comments (
  id INT(10) unsigned AUTO_INCREMENT PRIMARY KEY,
  text TEXT NOT NULL,
  date DATETIME NOT NULL,
  news_id INT(10) unsigned,
  author_id INT(10) unsigned NULL,
  FOREIGN KEY (news_id) REFERENCES news(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE article_ratings (
  id INT(10) unsigned AUTO_INCREMENT PRIMARY KEY,
  value INT(10) unsigned CHECK (value >= 1 AND value <= 5) NOT NULL,
  news_id INT(10) unsigned,
  user_ip VARCHAR(15) NOT NULL,
  FOREIGN KEY (news_id) REFERENCES news(id)
);

INSERT INTO users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3');

INSERT INTO news_categories (name) VALUES
('Category 1'),
('Category 2'),
('Category 3');

INSERT INTO news (title, content, publication_date, category_id, author_id) VALUES
('News Title 1', 'Content for News 1', '2023-11-07', 1, 1),
('News Title 2', 'Content for News 2', '2023-11-08', 2, 2),
('News Title 3', 'Content for News 3', '2023-11-09', 3, 3);

INSERT INTO comments (text, date, news_id, author_id) VALUES
('Comment 1', '2023-11-07 12:00:00', 1, 1),
('Comment 2', '2023-11-08 14:00:00', 2, 2),
('Comment 3', '2023-11-09 16:00:00', 3, 3);

INSERT INTO article_ratings (value, news_id, user_ip) VALUES
(5, 1, '192.168.0.1'),
(4, 2, '192.168.0.2'),
(3, 3, '192.168.0.3');