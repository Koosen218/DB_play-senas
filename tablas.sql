mariadb -u root -p
show DATABASES;

CREATE OR REPlACE DATABASE `juegos_seniales`;
USE `juegos_seniales`

SHOW TABLES;


CREATE OR REPLACE TABLE Usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  contra VARCHAR(50) NOT NULL, -- password
  CONSTRAINT `PK_Usuarios_id` PRIMARY KEY (id_usuario)
);

SHOW TABLES;


CREATE OR REPLACE TABLE `puntajes` (
  id_uauario INT NOT NULL,
  puntaje INT DEFAULT 0
);