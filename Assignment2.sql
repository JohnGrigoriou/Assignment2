CREATE DATABASE trainersdb;

USE trainersdb;

CREATE TABLE `trainer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into trainer (first_name, last_name, subject) values ('George', 'Iraklidis', 'Java'),
														    ('George', 'Rigopoulos', 'SQL'),
														    ('George', 'Pasparakis', 'C#'),
														    ('Spyros', 'Mauros', 'Java'),
														    ('Tasos', 'Lelakis', 'Java'),
														    ('George', 'Takakis', 'HTML'),
                                                            ('Panos', 'Bozas', 'Bootstrap'),
                                                            ('Alex', 'Mitropoulos', 'jQuery');
