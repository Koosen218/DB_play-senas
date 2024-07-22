-- Tabla Etapas:

DELIMETER //

-- Create
CREATE PROCEDURE CreateEtapa(IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), p_imagen_url VARCHAR(1000))
BEGIN
    INSERT INTO Etapas (nombre, descripcion, imagen_url) VALUES (p_nombre, p_descripcion, p_imagen_url);
END //

-- Read
CREATE PROCEDURE ReadEtapa(IN p_id_etapa INT)
BEGIN
    SELECT * FROM Etapas WHERE id_etapa = p_id_etapa;
END //

-- Update
CREATE PROCEDURE UpdateEtapa(IN p_id_etapa INT, IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), p_imagen_url VARCHAR(1000))
BEGIN
    UPDATE Etapas SET nombre = p_nombre, descripcion = p_descripcion, imagen_url = p_imagen_url WHERE id_etapa = p_id_etapa;
END //

-- Delete
CREATE PROCEDURE DeleteEtapa(IN p_id_etapa INT)
BEGIN
    DELETE FROM Etapas WHERE id_etapa = p_id_etapa;
END //

DELIMITER ;






-- Tabla Niveles:

DELIMETER //

-- Create
CREATE PROCEDURE CreateNivel(IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), IN p_etapa INT, IN p_exp INT)
BEGIN
    INSERT INTO Niveles (nombre, descripcion, etapa, exp) VALUES (p_nombre, p_descripcion, p_etapa, p_exp);
END //

-- Read
CREATE PROCEDURE ReadNivel(IN p_id_nivel INT)
BEGIN
    SELECT * FROM Niveles WHERE id_nivel = p_id_nivel;
END //

-- Update
CREATE PROCEDURE UpdateNivel(IN p_id_nivel INT, IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), IN p_etapa INT, IN p_exp INT)
BEGIN
    UPDATE Niveles SET nombre = p_nombre, descripcion = p_descripcion, etapa = p_etapa, exp = p_exp WHERE id_nivel = p_id_nivel;
END //

-- Delete
CREATE PROCEDURE DeleteNivel(IN p_id_nivel INT)
BEGIN
    DELETE FROM Niveles WHERE id_nivel = p_id_nivel;
END //

DELIMITER ;







-- Tabla Lecciones:

DELIMETER //

-- Create
CREATE PROCEDURE CreateLeccion(IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), IN p_imagen_url VARCHAR(500), IN p_video_url VARCHAR(500), IN p_nivel INT)
BEGIN
    INSERT INTO Lecciones (nombre, descripcion, imagen_url, video_url, nivel) VALUES (p_nombre, p_descripcion, p_imagen_url, p_video_url, p_nivel);
END //

-- Read
CREATE PROCEDURE ReadLeccion(IN p_id_leccion INT)
BEGIN
    SELECT * FROM Lecciones WHERE id_leccion = p_id_leccion;
END //

-- Update
CREATE PROCEDURE UpdateLeccion(IN p_id_leccion INT, IN p_nombre VARCHAR(50), IN p_descripcion VARCHAR(500), IN p_imagen_url VARCHAR(500), IN p_video_url VARCHAR(500), IN p_nivel INT)
BEGIN
    UPDATE Lecciones SET nombre = p_nombre, descripcion = p_descripcion, imagen_url = p_imagen_url, video_url = p_video_url, nivel = p_nivel WHERE id_leccion = p_id_leccion;
END //

-- Delete
CREATE PROCEDURE DeleteLeccion(IN p_id_leccion INT)
BEGIN
    DELETE FROM Lecciones WHERE id_leccion = p_id_leccion;
END //

DELIMITER ;


-- Tabla Preguntas:

DELIMETER //

-- Create
CREATE PROCEDURE CreatePregunta(IN p_pregunta VARCHAR(100), IN p_imagen_url VARCHAR(500), IN p_nivel INT, IN p_tipo INT)
BEGIN
    INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES (p_pregunta, p_imagen_url, p_nivel, p_tipo);
END //

-- Read
CREATE PROCEDURE ReadPregunta(IN p_id_pregunta INT)
BEGIN
    SELECT * FROM Preguntas WHERE id_pregunta = p_id_pregunta;
END //

-- Update
CREATE PROCEDURE UpdatePregunta(IN p_id_pregunta INT, IN p_pregunta VARCHAR(100), IN p_imagen_url VARCHAR(500), IN p_nivel INT, IN p_tipo INT)
BEGIN
    UPDATE Preguntas SET pregunta = p_pregunta, imagen_url = p_imagen_url, nivel = p_nivel, tipo = p_tipo WHERE id_pregunta = p_id_pregunta;
END //

-- Delete
CREATE PROCEDURE DeletePregunta(IN p_id_pregunta INT)
BEGIN
    DELETE FROM Preguntas WHERE id_pregunta = p_id_pregunta;
END //

DELIMITER ;

-- Tabla Respuestas:

DELIMETER //

-- Create
CREATE PROCEDURE CreateRespuesta(IN p_respuesta VARCHAR(50), IN p_imagenURL VARCHAR(255), IN p_correcta BOOLEAN, IN p_tipo BOOLEAN, IN p_pregunta INT)
BEGIN
    INSERT INTO Respuestas (respuesta, imagenURL, correcta, tipo, pregunta) VALUES (p_respuesta, p_imagenURL, p_correcta, p_tipo, p_pregunta);
    SELECT LAST_INSERT_ID() AS id_respuesta;
END //

-- Read
CREATE PROCEDURE ReadRespuesta(IN p_id_respuesta INT)
BEGIN
    SELECT * FROM Respuestas WHERE id_respuesta = p_id_respuesta;
END //

-- Update
CREATE PROCEDURE UpdateRespuesta(IN p_id_respuesta INT, IN p_respuesta VARCHAR(50), IN p_imagenURL VARCHAR(255), IN p_correcta BOOLEAN, IN p_tipo BOOLEAN, IN p_pregunta INT)
BEGIN
    UPDATE Respuestas SET respuesta = p_respuesta, imagenURL = p_imagenURL, correcta = p_correcta, tipo = p_tipo, pregunta = p_pregunta WHERE id_respuesta = p_id_respuesta;
END //

-- Delete
CREATE PROCEDURE DeleteRespuesta(IN p_id_respuesta INT)
BEGIN
    DELETE FROM Respuestas WHERE id_respuesta = p_id_respuesta;
END //

DELIMITER ;

-- Tabla Orden_Respuestas:

DELIMETER //

-- Create
CREATE PROCEDURE CreateOrdenRespuesta(IN p_respuesta VARCHAR(50), IN p_pregunta INT, IN p_imagenURL VARCHAR(255), IN p_orden INT)
BEGIN
    INSERT INTO Orden_Respuestas (respuesta, pregunta, imagenURL, orden) VALUES (p_respuesta, p_pregunta, p_imagenURL, p_orden);
    SELECT LAST_INSERT_ID() AS id_orden;
END //

-- Read
CREATE PROCEDURE ReadOrdenRespuesta(IN p_id_orden INT)
BEGIN
    SELECT * FROM Orden_Respuestas WHERE id_orden = p_id_orden;
END //

-- Update
CREATE PROCEDURE UpdateOrdenRespuesta(IN p_id_orden INT, IN p_respuesta VARCHAR(50), IN p_pregunta INT, IN p_imagenURL VARCHAR(255), IN p_orden INT)
BEGIN
    UPDATE Orden_Respuestas SET respuesta = p_respuesta, pregunta = p_pregunta, imagenURL = p_imagenURL, orden = p_orden WHERE id_orden = p_id_orden;
END //

-- Delete
CREATE PROCEDURE DeleteOrdenRespuesta(IN p_id_orden INT)
BEGIN
    DELETE FROM Orden_Respuestas WHERE id_orden = p_id_orden;
END //

DELIMITER ;

-- Tabla Tipo_Usuario:

DELIMETER //

-- Create
CREATE PROCEDURE CreateTipoUsuario(IN p_id_tipo INT, IN p_tipo VARCHAR(50))
BEGIN
    INSERT INTO Tipo_Usuario (id_tipo, tipo) VALUES (p_id_tipo, p_tipo);
END //

-- Read
CREATE PROCEDURE ReadTipoUsuario(IN p_id_tipo INT)
BEGIN
    SELECT * FROM Tipo_Usuario WHERE id_tipo = p_id_tipo;
END //

-- Update
CREATE PROCEDURE UpdateTipoUsuario(IN p_id_tipo INT, IN p_tipo VARCHAR(50))
BEGIN
    UPDATE Tipo_Usuario SET tipo = p_tipo WHERE id_tipo = p_id_tipo;
END //

-- Delete
CREATE PROCEDURE DeleteTipoUsuario(IN p_id_tipo INT)
BEGIN
    DELETE FROM Tipo_Usuario WHERE id_tipo = p_id_tipo;
END //

DELIMITER ;

-- Tabla Usuarios:

DELIMETER //

-- Create
CREATE PROCEDURE CreateUsuario(IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_email VARCHAR(50), IN p_contra VARCHAR(50), IN p_foto_perfil VARCHAR(400), IN p_tipo INT)
BEGIN
    INSERT INTO Usuarios (nombre, apellido, email, contra, foto_perfil, tipo) VALUES (p_nombre, p_apellido, p_email, p_contra, p_foto_perfil, p_tipo);
    SELECT LAST_INSERT_ID() AS id_usuario;
END //

-- Read
CREATE PROCEDURE ReadUsuario(IN p_id_usuario INT)
BEGIN
    SELECT * FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

-- Update
CREATE PROCEDURE UpdateUsuario(IN p_id_usuario INT, IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_email VARCHAR(50), IN p_contra VARCHAR(50), IN p_foto_perfil VARCHAR(400), IN p_tipo INT, IN p_exp INT)
BEGIN
    UPDATE Usuarios SET nombre = p_nombre, apellido = p_apellido, email = p_email, contra = p_contra, foto_perfil = p_foto_perfil, tipo = p_tipo, exp = p_exp WHERE id_usuario = p_id_usuario;
END //

-- Delete
CREATE PROCEDURE DeleteUsuario(IN p_id_usuario INT)
BEGIN
    DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;