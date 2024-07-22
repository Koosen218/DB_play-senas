-- Crear procedimiento crear_usuario

DELIMITER //

CREATE OR REPLACE PROCEDURE crear_usuario(
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
END //
DELIMITER;

-- Crear procedimiento iniciar_sesion
DELIMITER //

CREATE OR REPLACE PROCEDURE iniciar_sesion (
    IN p_email VARCHAR(50),
    IN p_contra VARCHAR(50)
)
BEGIN
    DECLARE user_id INT;

    -- Intenta obtener el id del usuario con las credenciales proporcionadas
    SELECT id_usuario INTO user_id
    FROM Usuarios
    WHERE email = p_email AND contra = p_contra;

    -- Comprueba si se encontró un usuario
    IF user_id IS NULL THEN
        SELECT 0 AS mensaje;
    ELSE
        SELECT * FROM Usuarios WHERE id_usuario = user_id;
    END IF;
END //

DELIMITER ;


CALL iniciar_sesion('A.Lopez@email.com', '789');

-- Crear procedimiento incrementar_Exp
DELIMITER //


CREATE OR REPLACE PROCEDURE incrementar_Exp(
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



DELIMITER //


CREATE OR REPLACE PROCEDURE actualizar_usuario(
  IN p_id INT,
  IN p_nombre VARCHAR(50),
  IN p_apellido VARCHAR(50),
  IN p_foto_perfil VARCHAR(1000)
)
BEGIN
UPDATE Usuarios
SET nombre = p_nombre, apellido = p_apellido, foto_perfil = p_foto_perfil
WHERE id_usuario = p_id;
END //


DELIMITER;






