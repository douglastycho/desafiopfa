DROP DATABASE IF EXISTS nodedb;
CREATE DATABASE nodedb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nodedb;
CREATE TABLE Courses(
    id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(255), 
    PRIMARY KEY(id)
);
INSERT INTO Courses(name) VALUES 
    ('Docker'), 
    ('Padroes e tecnicas avancadas com Git e Github'), 
    ('Integracao Continua'), 
    ('Kubernetes');