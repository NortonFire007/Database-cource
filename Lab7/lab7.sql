DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('admin', 'user') NOT NULL
);

DROP TABLE IF EXISTS NewsCategories;
CREATE TABLE NewsCategories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS News;
CREATE TABLE News (
  news_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  publication_date DATE NOT NULL,
  category_id INT,
  user_id INT,
  FOREIGN KEY (category_id) REFERENCES NewsCategories(category_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

DROP TABLE IF EXISTS Comments;
CREATE TABLE Comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text TEXT NOT NULL,
  comment_date DATETIME NOT NULL,
  news_id INT,
  user_id INT,
  FOREIGN KEY (news_id) REFERENCES News(news_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

DROP TABLE IF EXISTS ArticleRatings;
CREATE TABLE ArticleRatings (
  rating_id INT AUTO_INCREMENT PRIMARY KEY,
  rating_value INT CHECK (rating_value >= 1 AND rating_value <= 5) NOT NULL,
  news_id INT,
  user_ip VARCHAR(255) NOT NULL,
  FOREIGN KEY (news_id) REFERENCES News(news_id)
);