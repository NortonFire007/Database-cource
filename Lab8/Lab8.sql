DROP TABLE IF EXISTS task_assignees;
DROP TABLE IF EXISTS files;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE tasks (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    project_id INT,
    author_id INT,
    task_description TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE task_assignees (
    assignment_id INT PRIMARY KEY,
    task_id INT,
    assignee_id INT,
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE files (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    url VARCHAR(255),
    project_id INT NULL,
    task_id INT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);

INSERT INTO users (id, name) VALUES
(1, 'Анна'),
(2, 'Петро'),
(3, 'Марія');

INSERT INTO projects (id, name) VALUES
(1, 'Розробка сайту'),
(2, 'Вивчення нової функціональності'),
(3, 'Підготовка презентації');

INSERT INTO tasks (id, name, project_id, author_id, task_description) VALUES
(1, 'Створити головну сторінку', 1, 1, 'Створити макет та HTML-кодування'),
(2, 'Написати технічну документацію', 3, 2, 'Описати функціональність та вимоги до презентації'),
(3, 'Вивчити нові методи', 2, 3, 'Ознайомитися з новими можливостями');

INSERT INTO task_assignees (assignment_id, task_id, assignee_id) VALUES
(1, 1, 2), 
(2, 2, 3),
(3, 3, 1); 