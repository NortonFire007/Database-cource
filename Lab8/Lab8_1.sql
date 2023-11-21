SET NAMES UTF8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

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
    task_id INT,
    assignee_id INT,
    PRIMARY KEY (task_id, assignee_id),
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE project_user (
    project_id INT,
    assignee_id INT,
    PRIMARY KEY (project_id, assignee_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
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
