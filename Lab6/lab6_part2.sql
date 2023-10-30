DROP TABLE IF EXISTS `Lines`
CREATE TABLE `Lines` (
    `line_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `line_name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `Stations`;
CREATE TABLE `Stations` (
    `station_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `city_name` VARCHAR(255) NOT NULL,
    `station_name` VARCHAR(255) NOT NULL,
    `line_id` INT,
    FOREIGN KEY (`line_id`) REFERENCES `Lines`(`line_id`)
);

DROP TABLE IF EXISTS `Connections`;
CREATE TABLE `Connections` (
    `connection_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `station_id_1` INT,
    `station_id_2` INT,
    `distance` DECIMAL(10, 2) NOT NULL,
    `travel_time` INT NOT NULL,
    `connection_type` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`station_id_1`) REFERENCES `Stations`(`station_id`),
    FOREIGN KEY (`station_id_2`) REFERENCES `Stations`(`station_id`)
);

INSERT INTO `Lines` (`line_name`) VALUES
    ('U1'),
    ('U2'),
    ('U3');

INSERT INTO `Stations` (`city_name`, `station_name`, `line_id`) VALUES
    ('Berlin', 'Alexanderplatz', 1),
    ('Berlin', 'Zoologischer Garten', 2),
    ('Berlin', 'Potsdamer Platz', 2),
    ('Berlin', 'Wittenbergplatz', 1),
    ('Berlin', 'Friedrichstraße', 3);

INSERT INTO `Connections` (`station_id_1`, `station_id_2`, `distance`, `travel_time`, `connection_type`)
VALUES
    (1, 2, 2.5, 5, 'Direct'),
    (2, 3, 1.8, 3, 'Direct'),
    (3, 4, 1.2, 2, 'Direct'),
    (4, 5, 2.0, 4, 'Direct');