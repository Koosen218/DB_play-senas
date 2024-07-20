-- Crear procedimiento crear_usuario
DELIMITER //
CREATE PROCEDURE crear_usuario(
  IN p_nombre VARCHAR(50),
  IN p_apellido VARCHAR(50),
  IN p_email VARCHAR(50),
  IN p_contra VARCHAR(50),
  IN p_foto_perfil VARCHAR(400),
  IN p_tipo INT
)
BEGIN
  INSERT INTO Usuarios (nombre, apellido, email, contra, foto_perfil, tipo)
  VALUES (p_nombre, p_apellido, p_email, p_contra, p_foto_perfil, p_tipo);
END//
DELIMITER;

-- Crear procedimiento IniciarSesion
DELIMITER //
CREATE PROCEDURE IniciarSesion (
  IN p_email VARCHAR(50),
  IN p_contra VARCHAR(50),
  OUT p_id_usuario INT
)
BEGIN
  DECLARE user_id INT;
  
  SELECT id_usuario INTO user_id
  FROM Usuarios
  WHERE email = p_email AND contra = p_contra;

  IF user_id IS NULL THEN
    SET p_id_usuario = NULL;
  ELSE
    SET p_id_usuario = user_id;
  END IF;
END//
DELIMITER ;

-- Crear procedimiento incrementar_Exp
DELIMITER //
CREATE PROCEDURE incrementar_Exp(
  IN p_id_usuario INT
)
BEGIN
  UPDATE Usuarios
  SET exp = exp + 10
  WHERE id_usuario = p_id_usuario;
END//
DELIMITER ;

-- Crear procedimiento eliminar_usuario
DELIMITER //
CREATE OR REPLACE PROCEDURE eliminar_usuario(
  IN p_id_usuario INT
)
BEGIN
  DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
END//
DELIMITER ;