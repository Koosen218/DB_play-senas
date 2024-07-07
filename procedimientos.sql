USE juegos_senas;
DELIMITER //
CREATE OR REPLACE PROCEDURE crear_usuario(
  IN _nombre VARCHAR(50),
  IN _apellido VARCHAR(50),
  IN _email VARCHAR(50),
  IN _contra VARCHAR(50),
  IN _foto_perfil VARCHAR(400),
  IN _tipo VARCHAR(50)
)
DECLARE
  INSERT INTO Tipo_Usuario (nombre, apellido, email, contra, _foto_perfil, tipo) VALUES (_nombre, _apellido, _email, _contra, _foto_perfil, _tipo);

  
BEGIN
END//
DELIMITER;