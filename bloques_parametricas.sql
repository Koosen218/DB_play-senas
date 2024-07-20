--bloques para llenar tablas parametricas


--llenar la tabla de tipos de usuario
DELIMITER $$

CREATE PROCEDURE Insert_Tipo_Usuario()
BEGIN
    DECLARE v_id_tipo INT;
    DECLARE v_tipo VARCHAR(50);

    -- Insertar 'Regular'
    SET v_id_tipo = 1;
    SET v_tipo = 'Regular';
    INSERT INTO Tipo_Usuario (id_tipo, tipo) VALUES (v_id_tipo, v_tipo);

    -- Insertar 'Administrador'
    SET v_id_tipo = 2;
    SET v_tipo = 'Administrador';
    INSERT INTO Tipo_Usuario (id_tipo, tipo) VALUES (v_id_tipo, v_tipo);
END $$

DELIMITER ;


CALL Insert_Tipo_Usuario();
SELECT * FROM Tipo_Usuario;














-- --prueba de consulta de 

-- INSERT INTO Etapas (id_etapa, nombre, descripcion) VALUES
-- (1, 'Primera Etapa', 'Descripción de la primera etapa');

-- INSERT INTO Niveles (id_nivel, nombre, descripcion, etapa, exp) VALUES
-- (1, 'Nivel 1', 'Descripción del nivel 1', 1, 100);


-- INSERT INTO Tipo_Preguntas (id_tipo, tipo) VALUES
-- (1, 'Escoge la respuesta correcta'),
-- (2, 'Ordena la respuesta'),
-- (3, 'Cierto y Falso');

-- INSERT INTO Preguntas (id_pregunta, pregunta, imagen_url, nivel, tipo) VALUES
-- (1, '¿Cuál es la capital de Francia?', 'img1.jpg', 1, 1),
-- (2, 'Ordena los planetas.', 'img2.jpg', 1, 2),
-- (3, 'La Tierra es plana.', 'img3.jpg', 1, 3);


-- INSERT INTO Respuestas (id_respuesta, respuesta, imagenURL, correcta, tipo, pregunta) VALUES
-- (1, 'París', 'img1_1.jpg', TRUE, FALSE, 1),
-- (2, 'Londres', 'img1_2.jpg', FALSE, FALSE, 1),
-- (3, 'Madrid', 'img1_3.jpg', FALSE, FALSE, 1),
-- (4, 'Berlín', 'img1_4.jpg', FALSE, FALSE, 1),
-- (5, 'Verdadero', 'img3_1.jpg', FALSE, TRUE, 3),
-- (6, 'Falso', 'img3_2.jpg', TRUE, TRUE, 3);


-- INSERT INTO Orden_Respuestas (id_orden, respuesta, pregunta, imagenURL, orden) VALUES
-- (1, 'Mercurio', 2, 'img2_1.jpg', 1),
-- (2, 'Venus', 2, 'img2_2.jpg', 2),
-- (3, 'Tierra', 2, 'img2_3.jpg', 3),
-- (4, 'Marte', 2, 'img2_4.jpg', 4);


//consuta para traer las preguntas y respuestas de un nivel especifico
SELECT
    p.id_pregunta,
    p.pregunta AS Pregunta,
    p.tipo AS TipoPregunta,
    p.imagen_url AS ImagenPregunta,
    r.id_respuesta AS IdRespuesta,
    CASE
        WHEN tp.tipo = 'Escoge la respuesta correcta' THEN
            MAX(CASE WHEN r.correcta = TRUE THEN r.respuesta ELSE NULL END)
        ELSE NULL
    END AS RespuestaCorrecta,
    CASE
        WHEN tp.tipo = 'Escoge la respuesta correcta' THEN
            GROUP_CONCAT(CASE WHEN r.correcta = FALSE THEN r.respuesta ELSE NULL END ORDER BY r.id_respuesta ASC SEPARATOR ', ')
        ELSE NULL
    END AS RespuestasIncorrectas,
    CASE
        WHEN tp.tipo = 'Ordena la respuesta' THEN
            GROUP_CONCAT(o.respuesta ORDER BY o.orden ASC SEPARATOR ', ')
        ELSE NULL
    END AS RespuestasOrdenadas,
    CASE
        WHEN tp.tipo = 'Ordena la respuesta' THEN
            GROUP_CONCAT(o.orden ORDER BY o.orden ASC SEPARATOR ', ')
        ELSE NULL
    END AS OrdenRespuestas,
    CASE
        WHEN tp.tipo = 'Cierto y Falso' THEN
            MAX(CASE WHEN r.correcta = TRUE THEN r.respuesta ELSE NULL END)
        ELSE NULL
    END AS RespuestaCierto,
    CASE
        WHEN tp.tipo = 'Cierto y Falso' THEN
            MAX(CASE WHEN r.correcta = FALSE THEN r.respuesta ELSE NULL END)
        ELSE NULL
    END AS RespuestaFalso
FROM
    Preguntas p
    JOIN Tipo_Preguntas tp ON p.tipo = tp.id_tipo
    LEFT JOIN Respuestas r ON p.id_pregunta = r.pregunta AND tp.tipo IN ('Escoge la respuesta correcta', 'Cierto y Falso')
    LEFT JOIN Orden_Respuestas o ON p.id_pregunta = o.pregunta AND tp.tipo = 'Ordena la respuesta'
WHERE
    p.nivel = 1
GROUP BY
    p.id_pregunta, p.pregunta, p.tipo, p.imagen_url;



SELECT
    p.id_pregunta,
    p.pregunta AS Pregunta,
    p.tipo AS TipoPregunta,
    p.imagen_url AS ImagenPregunta,
    r.id_respuesta AS IdRespuesta,
    r.respuesta AS Respuesta,
    r.imagenURL AS ImagenRespuesta,
    r.correcta AS Correcta,
    o.respuesta AS RespuestaOrdenada,
    o.orden AS Orden
FROM
    Preguntas p
    JOIN Tipo_Preguntas tp ON p.tipo = tp.id_tipo
    LEFT JOIN Respuestas r ON p.id_pregunta = r.pregunta AND tp.tipo IN ('Escoge la respuesta correcta', 'Cierto y Falso')
    LEFT JOIN Orden_Respuestas o ON p.id_pregunta = o.pregunta AND tp.tipo = 'Ordena la respuesta'
WHERE
    p.nivel = 1;





SELECT * FROM Etapas WHERE id_etapa = idEtapa;


