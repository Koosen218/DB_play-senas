DELIMITER //

-- Create
CREATE OR REPLACE PROCEDURE CrearEtapa(
    IN p_nombre VARCHAR(50), 
    IN p_descripcion VARCHAR(500), 
    p_imagen_url VARCHAR(1000))
BEGIN
    INSERT INTO Etapas (nombre, descripcion, imagen_url) 
    VALUES (p_nombre, p_descripcion, p_imagen_url);
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE ReadEtapa(
    IN p_id_etapa INT
)
BEGIN
    SELECT *
    FROM Etapas
    WHERE id_etapa = p_id_etapa;
END //

-- Update
CREATE OR REPLACE PROCEDURE UpdateEtapa(
    IN p_id_etapa INT, 
    IN p_nombre VARCHAR(50), 
    IN p_descripcion VARCHAR(500), 
    p_imagen_url VARCHAR(1000))
BEGIN
    UPDATE Etapas 
    SET nombre = p_nombre, 
        descripcion = p_descripcion, 
        imagen_url = p_imagen_url 
    WHERE id_etapa = p_id_etapa;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarEtapa(
    IN p_id_etapa INT
)
BEGIN
    DELETE FROM Etapas
    WHERE id_etapa = p_id_etapa;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE CrearNivel(
    IN p_nombre VARCHAR(50),
    IN p_descripcion VARCHAR(500),
    IN p_etapa INT,
    IN p_exp INT
)
BEGIN
    INSERT INTO Niveles (nombre, descripcion, etapa, exp) 
    VALUES (p_nombre, p_descripcion, p_etapa, p_exp);
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ObtenerNivel(
    IN p_id_nivel INT
)
BEGIN
    SELECT *
    FROM Niveles
    WHERE id_nivel = p_id_nivel;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarNivel(
    IN p_id_nivel INT,
    IN p_nombre VARCHAR(50),
    IN p_descripcion VARCHAR(500),
    IN p_etapa INT,
    IN p_exp INT
)
BEGIN
    UPDATE Niveles
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        etapa = p_etapa,
        exp = p_exp
    WHERE id_nivel = p_id_nivel;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarNivel(
    IN p_id_nivel INT
)
BEGIN
    DELETE FROM Niveles
    WHERE id_nivel = p_id_nivel;
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE CrearLeccion(
    IN p_nombre VARCHAR(50),
    IN p_descripcion VARCHAR(500),
    IN p_video_url VARCHAR(500),
    IN p_nivel INT
)
BEGIN
    INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) 
    VALUES (p_nombre, p_descripcion, p_video_url, p_nivel);
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ObtenerLeccion(
    IN p_id_leccion INT
)
BEGIN
    SELECT *
    FROM Lecciones
    WHERE id_leccion = p_id_leccion;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarLeccion(
    IN p_id_leccion INT,
    IN p_nombre VARCHAR(50),
    IN p_descripcion VARCHAR(500),
    IN p_video_url VARCHAR(500),
    IN p_nivel INT
)
BEGIN
    UPDATE Lecciones
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        video_url = p_video_url,
        nivel = p_nivel
    WHERE id_leccion = p_id_leccion;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarLeccion(
    IN p_id_leccion INT
)
BEGIN
    DELETE FROM Lecciones
    WHERE id_leccion = p_id_leccion;
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE CrearPregunta(
    IN p_pregunta VARCHAR(100),
    IN p_imagen_url VARCHAR(500),
    IN p_nivel INT,
    IN p_tipo INT
)
BEGIN
    INSERT INTO Lecciones (nombre, imagen_url, nivel, tipo) 
    VALUES (p_nombre, p_imagen_url, p_nivel, p_tipo);
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarPregunta(
    IN p_id_pregunta INT,
    IN p_pregunta VARCHAR(100),
    IN p_imagen_url VARCHAR(500),
    IN p_nivel INT,
    IN p_tipo INT
)
BEGIN
    UPDATE Preguntas
    SET pregunta = p_pregunta,
        imagen_url = p_imagen_url,
        nivel = p_nivel,
        tipo = p_tipo
    WHERE id_pregunta = p_id_pregunta;
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarPregunta(
    IN p_id_pregunta INT
)
BEGIN
    DELETE FROM Preguntas
    WHERE id_pregunta = p_id_pregunta;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE CrearRespuesta(
    IN p_respuesta VARCHAR(50),
    IN p_imagen_url VARCHAR(255),
    IN p_correcta BOOLEAN,
    IN p_pregunta INT
)
BEGIN
    INSERT INTO Respuestas (respuesta, correcta, pregunta)
    VALUES (p_respuesta, p_correcta, p_pregunta);
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ObtenerRespuesta(
    IN p_id_respuesta INT
)
BEGIN
    SELECT *
    FROM Respuestas
    WHERE id_respuesta = p_id_respuesta;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarRespuesta(
    IN p_id_respuesta INT,
    IN p_respuesta VARCHAR(50),
    IN p_imagen_url VARCHAR(255),
    IN p_correcta BOOLEAN,
    IN p_pregunta INT
)
BEGIN
    UPDATE Respuestas
    SET respuesta = p_respuesta,
        imagenURL = p_imagen_url,
        correcta = p_correcta,
        pregunta = p_pregunta
    WHERE id_respuesta = p_id_respuesta;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarRespuesta(
    IN p_id_respuesta INT
)
BEGIN
    DELETE FROM Respuestas
    WHERE id_respuesta = p_id_respuesta;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE CrearUsuario(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_contra VARCHAR(50),
    IN p_foto_perfil VARCHAR(400),
    IN p_tipo INT,
    IN p_exp INT
)
BEGIN
    INSERT INTO Usuarios (nombre, apellido, email, contra, foto_perfil, tipo, exp)
    VALUES (p_nombre, p_apellido, p_email, p_contra, p_foto_perfil, p_tipo, p_exp);
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ObtenerUsuario(
    IN p_id_usuario INT
)
BEGIN
    SELECT *
    FROM Usuarios
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarUsuario(
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_contra VARCHAR(50),
    IN p_foto_perfil VARCHAR(400),
    IN p_tipo INT,
    IN p_exp INT
)
BEGIN
    UPDATE Usuarios
    SET nombre = p_nombre,
        apellido = p_apellido,
        email = p_email,
        contra = p_contra,
        foto_perfil = p_foto_perfil,
        tipo = p_tipo,
        exp = p_exp
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarUsuario(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM Usuarios
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE CrearAyuda(
    IN p_pregunta VARCHAR(255), 
    IN p_respuesta TEXT)
BEGIN
    INSERT INTO Ayuda (pregunta, respuesta) 
    VALUES (p_pregunta, p_respuesta);
END //

DELIMITER ;


DELIMITER //

CREATE OR REPLACE PROCEDURE ObtenerAyuda(
    IN p_id INT)
BEGIN
    SELECT * FROM Ayuda WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE ActualizarAyuda(
    IN p_id INT, 
    IN p_pregunta VARCHAR(255), 
    IN p_respuesta TEXT)
BEGIN
    UPDATE Ayuda 
    SET pregunta = p_pregunta, 
        respuesta = p_respuesta 
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE PROCEDURE EliminarAyuda(
    IN p_id INT)
BEGIN
    DELETE FROM Ayuda WHERE id = p_id;
END //

DELIMITER ;
