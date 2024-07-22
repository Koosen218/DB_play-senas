mariadb -u root -p




mysql -h mariadb-17648-0.cloudclusters.net -P 17664 -u <username> -p

mysql -h mariadb-17648-0.cloudclusters.net -P 17664 -u hampao -p --ssl-verify-server-cert=OFF

show DATABASES;

CREATE OR REPlACE DATABASE `juegos_senas`;
USE `juegos_senas`
SHOW TABLES;

DROP TABLE IF EXISTS Etapas;
CREATE TABLE IF NOT EXISTS Etapas (
    id_etapa INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    imagen_url VARCHAR(500) NULL,
    descripcion VARCHAR(500) NOT NULL,
    CONSTRAINT Etapas_IdEtapa_PK PRIMARY KEY (id_etapa)
);

INSERT INTO Etapas (nombre, descripcion, imagen_url) VALUES
('Abecedario', 'Etapa que cubre el aprendizaje del abecedario en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721616108/abecedario_lcfoag.png'),
('Números', 'Etapa que cubre el aprendizaje de los números en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721616132/numero_pp4cp2.png'),
('Palabras de Relación', 'Etapa que cubre el aprendizaje de palabras de relación en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721616134/relacion_u2ocqf.jpg'),
('Colores', 'Etapa que cubre el aprendizaje de los colores en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721616130/colores_icrjyd.jpg');

SELECT * FROM Etapas;



SHOW TABLES;

DROP TABLE IF EXISTS Niveles;
CREATE TABLE IF NOT EXISTS Niveles (
    id_nivel INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    etapa INT NOT NULL,
    exp INT NOT NULL,
    CONSTRAINT Niveles_IdNivel_PK PRIMARY KEY (id_nivel),
    CONSTRAINT Niveles_EtapasId_FK FOREIGN KEY (etapa) REFERENCES Etapas(id_etapa) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Asumiendo que el id_etapa para 'Abecedario' es 1, para 'Números' es 2, para 'Palabras de Relación' es 3 y para 'Colores' es 4.

-- Niveles para la etapa 'Abecedario'
INSERT INTO Niveles (nombre, descripcion, etapa, exp) VALUES
('Nivel 1', 'Rango de letras de A a E en el abecedario en lenguaje de señas.', 1, 0),
('Nivel 2', 'Rango de letras de F a K en el abecedario en lenguaje de señas.', 1, 10),
('Nivel 3', 'Rango de letras de L a O en el abecedario en lenguaje de señas.', 1, 20),
('Nivel 4', 'Rango de letras de P a T en el abecedario en lenguaje de señas.', 1, 30),
('Nivel 5', 'Rango de letras de U a Z en el abecedario en lenguaje de señas.', 1, 40);

-- Niveles para la etapa 'Números'
INSERT INTO Niveles (nombre, descripcion, etapa, exp) VALUES
('Nivel 1', 'Rango de números del 1 al 9 en lenguaje de señas.', 2, 50),
('Nivel 2', 'Rango de números del 10 al 13 en lenguaje de señas.', 2, 60),
('Nivel 3', 'Rango de números del 20 al 40 en lenguaje de señas.', 2, 70),
('Nivel 4', 'Rango de números del 100 al 1000 en lenguaje de señas.', 2, 80);

-- Niveles para la etapa 'Palabras de Relación'
INSERT INTO Niveles (nombre, descripcion, etapa, exp) VALUES
('Nivel 1', 'Palabras básicas en lenguaje de señas: Hola, Adiós, Cómo estás, Bien, Ayúdeme .', 3, 90),
('Nivel 2', 'Palabras comunes en lenguaje de señas: Fácil, Difícil, Comprendo, Gracias, De nada.', 3, 100),
('Nivel 3', 'Palabras avanzadas en lenguaje de señas: Yo me llamo, Mi nombre, Mal, Malo, Nadie.', 3, 110);

-- Niveles para la etapa 'Colores'
INSERT INTO Niveles (nombre, descripcion, etapa, exp) VALUES
('Nivel 1', 'Colores básicos en lenguaje de señas: Rojo, Azul, Amarillo, Verde.', 4, 120),
('Nivel 2', 'Colores intermedios en lenguaje de señas: Blanco, Celeste, Crema, Gris.', 4, 130),
('Nivel 3', 'Colores avanzados en lenguaje de señas: Morado, Cobre, Plata, Dorado.', 4, 140);
SELECT * FROM Niveles;






SHOW TABLES;

DROP TABLE IF EXISTS Lecciones;
CREATE TABLE IF NOT EXISTS Lecciones (
    id_leccion INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(500),
    video_url VARCHAR(500) NOT NULL,
    nivel INT NOT NULL,
    CONSTRAINT Lecciones_Nivel_FK FOREIGN KEY (nivel) REFERENCES Niveles(id_nivel) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Lecciones_IdLeccion_PK PRIMARY KEY (id_leccion)
);

-- Nivel 1
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Abecedario Nivel 1', 'Lección sobre las letras de la A a la E en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721611686/0721_nys5ya.mp4', 1);

-- Nivel 2
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Abecedario Nivel 2', 'Lección sobre las letras de la F a la K en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721613852/0721_1_jasqlf.mp4', 2);

-- Nivel 3
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Abecedario Nivel 3', 'Lección sobre las letras de la L a la T en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721613739/0721_2_ogkk0z.mp4', 3);

-- Nivel 4
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Abecedario Nivel 4', 'Lección sobre las letras P a la T en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721613737/0721_3_otpnsp.mp4', 4);

-- Nivel 5
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Abecedario Nivel 5', 'Lección sobre las letras U a la Z en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721613837/0721_4_gusllp.mp4', 5);

-- Nivel 6
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Número Nivel 1', 'Lección sobre los números del 1 al 9 en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721612585/0721_5_dkzafr.mp4', 6);

-- Nivel 7
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Número Nivel 2', 'Lección sobre los números del 10 al 19 en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721612518/0721_6_ob1b2v.mp4', 7);

-- Nivel 8
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Número Nivel 3', 'Lección sobre los números del 20 al 90 en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721612522/0721_7_yw0clp.mp4', 8);

-- Nivel 9
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Número Nivel 4', 'Lección sobre los números del 100 al 900 en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721612565/0721_8_oawrdf.mp4', 9);

-- Nivel 10
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Palabras Nivel 1', 'Lección sobre palabras de relacion en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721619152/Etapa3N1_c9mo8h.mp4', 10);

-- Nivel 11
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Palabras Nivel 2', 'Lección sobre palabras de relacion en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721619158/Etapa3N2_e43wlf.mp4', 11);

-- Nivel 12
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Palabras Nivel 3', 'Lección sobre palabras de relacion en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721619222/Etapa3N3_ch6ns2.mp4', 12);

-- Nivel 13
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Colores Nivel 1', 'Lección sobre Colores en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721630634/Etapa4N1_ik5icv.mp4', 13);

-- Nivel 14
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Colores Nivel 2', 'Lección sobre Colores en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721630632/Etapa4N2_h8lzyx.mp4', 14);

-- Nivel 15
INSERT INTO Lecciones (nombre, descripcion, video_url, nivel) VALUES
('Colores Nivel 3', 'Lección sobre Colores en lenguaje de señas.', 'https://res.cloudinary.com/dpizfkmea/video/upload/v1721630636/Etapa4N3_uujcow.mp4', 15);

SELECT * FROM Lecciones;



SHOW TABLES;

DROP TABLE IF EXISTS Preguntas;
CREATE TABLE IF NOT EXISTS Preguntas (
    id_pregunta INT AUTO_INCREMENT,
    pregunta VARCHAR(100) NOT NULL,
    imagen_url VARCHAR(500) NOT NULL,
    nivel INT NOT NULL,
    tipo INT NOT NULL,
    CONSTRAINT Preguntas_nivel_FK FOREIGN KEY (nivel) REFERENCES Niveles(id_nivel) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Preguntas_IdPregunta_PK PRIMARY KEY (id_pregunta)
);
--NIVEL1
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621433/d_kiquot.jpg', 1, 1), -- D
-- Pregunta 2
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621436/e_s3ltmp.jpg', 1, 1), -- E
-- Pregunta 3
('¿Se representa la letra "C" así?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621427/c_hnyxfy.jpg', 1, 2), -- C
-- Pregunta 4
('¿Es este signo para la letra "CH" en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621430/ch_pxi9cq.jpg', 1, 2), -- CH
-- Pregunta 5
('¿Qué letra es esta?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621420/a_unnwmz.jpg', 1, 1), -- A
-- Pregunta 6
('¿Es la letra "B"?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621424/b_owilan.jpg', 1, 2); -- B



--NIVEL2
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621439/f_jzzoil.jpg', 2, 1), -- F
-- Pregunta 2
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621456/k_jl3uga.jpg', 2, 1), -- K
-- Pregunta 3
('¿Se representa la letra "Ñ" así?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621443/g_mtjs3q.jpg', 2, 2), -- G
-- Pregunta 4
('¿Es este signo para la letra "I" en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621449/i_xxx4vv.jpg', 2, 2), -- I
-- Pregunta 5
('¿Qué letra es esta?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621452/j_ufxtkb.jpg', 2, 1), -- J
-- Pregunta 6
('¿Es la letra "H"?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621446/h_auo9dz.jpg', 2, 2); -- H


--NIVEL3
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621375/o_lp3zmv.jpg', 3, 1), -- O
-- Pregunta 2
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621459/l_hfnrcu.jpg', 3, 1), -- L
-- Pregunta 3
('¿Se representa la letra "Ñ" así?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621372/%C3%B1_q1uyco.jpg', 3, 2), -- Ñ
-- Pregunta 4
('¿Es este signo para la letra "N" en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621370/n_virfid.jpg', 3, 2), -- N
-- Pregunta 5
('¿Qué letra es esta?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621365/ll_yxzd4f.jpg', 3, 1), -- LL
-- Pregunta 6
('¿Es la letra "M"?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621367/m_pzvrxt.jpg', 3, 2);-- M



--NIVEL4
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621378/p_dicbbo.jpg', 4, 1), -- P
-- Pregunta 2
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621395/t_czkwdr.jpg', 4, 1), -- T
-- Pregunta 3
('¿Se representa la letra "RR" así?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621387/rr_csbfss.jpg', 4, 2), -- RR
-- Pregunta 4
('¿Es este signo para la letra "Q" en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621381/q_crkpap.jpg', 4, 2), -- Q
-- Pregunta 5
('¿Qué letra es esta?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621391/s_rnuisb.jpg', 4, 1), -- S
-- Pregunta 6
('¿Es la letra "R"?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621384/r_kl8tpv.jpg', 4, 2);-- R


--NIVEL5
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621413/y_xjqe5l.jpg', 5, 1), -- Y
-- Pregunta 2
('¿Cuál es esta letra en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621417/z_darzgl.jpg', 5, 1), -- Z
-- Pregunta 3
('¿Se representa la letra "U" así?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621399/u_flza1i.jpg', 5, 2), -- U
-- Pregunta 4
('¿Es este signo para la letra "W" en lenguaje de señas?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621406/w_rlri87.jpg', 5, 2), -- W
-- Pregunta 5
('¿Qué letra es esta?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621410/x_upwj1q.jpg', 5, 1), -- X
-- Pregunta 6
('¿Es la letra "V"?', 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721621402/v_miup4v.jpg', 5, 2);-- V


--etapa2
--nivel6          1-9

INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES

('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/2_vrwttn.png', 6, 1), --   2
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/5_gilof4.png', 6, 1), --   5
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/3_m2c4fw.png', 6, 1), --   3
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/6_az1woq.png', 6, 1), --   6
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/8_i19xra.png', 6, 1), --   8
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624828/1_dquzs4.png', 6, 1); --   1

--nivel 7 {10 - 13}

INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624909/10_fo6b8f.png', 7, 1), --   10
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624910/12_rdn6ds.png', 7, 1), --   12
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624909/11_ipnpig.png', 7, 1), --   11
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624912/13_n5issh.png', 7, 1), --   13
('¿Se representa el número "13" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624910/12_rdn6ds.png', 7, 2), --   12
('¿Se representa el número "13" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721624912/13_n5issh.png', 7, 2); --   13

--nivel8 [20, 30, 40]
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES

('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625072/30_zc24yk.png', 8, 1), --   30
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625071/20_hie0s3.png', 8, 1), --   20
('¿Se representa el número "20" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625072/30_zc24yk.png', 8, 2), --   30
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625071/40_twgmyk.png', 8, 1), --   40
('¿Se representa el número "30" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625071/20_hie0s3.png', 8, 2), --   20
('¿Se representa el número "40" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625071/40_twgmyk.png', 8, 2); --   40

--nivel9 [100, 200, 300]

INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES

('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625161/100_prqiv0.png', 9, 1), --   100
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625158/200_rrsmpm.png', 9, 1), --   200
('¿Se representa el número "200" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625159/300_zuwuyb.png', 9, 2), --   300
('¿Cuál es este número en lenguaje de señas?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625161/100_prqiv0.png', 9, 1), --   100
('¿Se representa el número "200" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625158/200_rrsmpm.png', 9, 2), --   200
('¿Se representa el número "300" así?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625159/300_zuwuyb.png', 9, 2); --   300


--NIVEL 10
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('Esta seña corresponde a: ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625474/Adios_qidu6b.png', 10, 1), -- Adiós
-- Pregunta 2
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625478/Bien_czacwu.png', 10, 1), -- Bien
-- Pregunta 3
('¿Esta seña significa "Hola"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625474/Hola_a9t5li.png', 10, 2), -- Hola
-- Pregunta 4
('¿Esta seña corresponde a "Ayúdeme"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625473/Como_estas_y4tmrd.png', 10, 2), -- Cómo estás
-- Pregunta 5
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625474/Hola_a9t5li.png', 10, 1), -- Hola
-- Pregunta 6
('¿Es la seña para decir "Cómo estás"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625477/Ayudenme_y9miuy.png', 10, 2);-- Ayúdeme

--NIVEL 11
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('Esta seña corresponde a: ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625606/Dificil_xocvtw.png', 11, 1), -- Difícil
-- Pregunta 2
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625605/De_nada_eo6xto.png', 11, 1), -- De nada
-- Pregunta 3
('¿Esta seña significa "Comprendo"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625474/Hola_a9t5li.png', 11, 2), -- Hola
-- Pregunta 4
('¿Esta seña corresponde a "Gracias"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625601/Facil_ve0np3.png', 11, 2), -- Fácil
-- Pregunta 5
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625601/Gracias_q8n856.png', 11, 1), -- Gracias
-- Pregunta 6
('¿Es la seña para decir "Fácil"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625601/Facil_ve0np3.png', 11, 2);-- Fácil

--NIVEL 12
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('Esta seña corresponde a: ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625708/Mal_m3ks8e.png', 12, 1), -- Mal
-- Pregunta 2
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625710/Malo_vibumi.png', 12, 1), -- Malo
-- Pregunta 3
('¿Esta seña significa "Mi Nombre"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625704/Yo_me_llamo_th6m9e.png', 12, 2), -- Yo me llamo
-- Pregunta 4
('¿Esta seña corresponde a "Nadie"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625713/Mi_nombre_q8zl9s.png', 12, 2), -- Mi nombre
-- Pregunta 5
('¿Que palabra es esta seña?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625704/Yo_me_llamo_th6m9e.png', 12, 1), -- Yo me llamo
-- Pregunta 6
('¿Es la seña para decir "Nadie"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625605/De_nada_eo6xto.png', 12, 2);-- De nada


--NIVEL 13
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
('¿Esta seña significa "Verde" ?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625834/Rojo_lxuwyo.png', 13, 2),
('¿Esta seña significa "Amarillo"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625833/Azul_crdcqs.png', 13, 2),
('¿Esta seña significa "Rojo"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625842/Amarillo_qtetw4.png', 13, 2),
('¿Esta seña significa "Rojo"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625840/Verde_iv3pfm.png', 13, 2),
('¿Esta seña significa "Azul"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625842/Amarillo_qtetw4.png', 13, 2),
('¿Esta seña significa "Amarillo"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625833/Azul_crdcqs.png', 13, 2);

--NIVEL 14
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Esta seña significa "Blanco"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625840/Verde_iv3pfm.png', 14, 2),
-- Pregunta 2
('¿Esta seña significa "Gris"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625950/Blanco_p1lxar.png', 14, 2), 
-- Pregunta 3
('Esta seña corresponde a:  ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625957/Crema_cg8yga.png', 14, 1), 
-- Pregunta 4
('Esta seña corresponde a ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625950/Blanco_p1lxar.png', 14, 1), 
-- Pregunta 5
('Esta seña scorresponde a ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625955/Celeste_gvbwft.png', 14, 1), 
-- Pregunta 6
('¿Esta seña significa "Gris"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625947/Gris_dwy0mc.png', 14, 2); 

--NIVEL 15
INSERT INTO Preguntas (pregunta, imagen_url, nivel, tipo) VALUES
-- Pregunta 1
('¿Esta seña significa "Morado"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625834/Rojo_lxuwyo.png', 15, 2), 
-- Pregunta 2
('¿Esta seña significa "Dorado"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625842/Amarillo_qtetw4.png', 15, 2), 
-- Pregunta 3
('¿Esta seña significa "Cobre"?', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721625955/Celeste_gvbwft.png', 15, 2), 
-- Pregunta 4
('Esta seña corresponde a: "Dorado"', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721626091/Dorado_rftngy.png', 15, 2), 
-- Pregunta 5
('Esta seña corresponde a: "Morado" ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721626077/Morado_enyr5p.png', 15, 2), 
-- Pregunta 6
('¿Esta seña significa "Plata"? ', 'https://res.cloudinary.com/dohyqqpyb/image/upload/v1721626083/Plata_vljhv2.png', 15, 2); 



SELECT * FROM Preguntas;



SHOW TABLES;

DROP TABLE IF EXISTS Respuestas;
CREATE TABLE IF NOT EXISTS Respuestas (
    id_respuesta INT AUTO_INCREMENT,
    respuesta VARCHAR(50) NOT NULL,
    correcta BOOLEAN NOT NULL,
    pregunta INT NOT NULL,
    CONSTRAINT Respuestas_Pregunta_FK FOREIGN KEY (pregunta) REFERENCES Preguntas(id_pregunta) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Opciones_IdRespuesta_PK PRIMARY KEY (id_respuesta)
);
SHOW TABLES;

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuesta 1
('A', FALSE, 1),
-- Respuesta 2
('B', FALSE, 1),
-- Respuesta 3
('C', FALSE, 1),
-- Respuesta 4
('D', TRUE, 1);


INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuesta 1
('A', FALSE, 2),
-- Respuesta 2
('B', FALSE, 2),
-- Respuesta 3
('C', FALSE, 2),
-- Respuesta 4
('E', TRUE, 2);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 3),
('Falso', FALSE, 3);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 4),
('Falso', FALSE, 4);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('A', TRUE, 5),
('B', FALSE, 5),
('C', FALSE, 5),
('D', FALSE, 5);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 6),
('Falso', FALSE, 6);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('F', TRUE, 7),
('A', FALSE, 7),
('E', FALSE, 7),
('C', FALSE, 7);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('K', TRUE, 8),
('G', FALSE, 8),
('H', FALSE, 8),
('L', FALSE, 8);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', FALSE, 9),
('Falso', TRUE, 9);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 10),
('Falso', FALSE, 10);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('J', TRUE, 11),
('I', FALSE, 11),
('K', FALSE, 11),
('L', FALSE, 11);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 12),
('Falso', FALSE, 12);
INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('O', TRUE, 13),
('A', FALSE, 13),
('E', FALSE, 13),
('C', FALSE, 13);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('L', TRUE, 14),
('M', FALSE, 14),
('N', FALSE, 14),
('Ñ', FALSE, 14);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 15),
('Falso', FALSE, 15);
INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 16),
('Falso', FALSE, 16);


INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('LL', TRUE, 17),
('L', FALSE, 17),
('M', FALSE, 17),
('N', FALSE, 17);


INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 18),
('Falso', FALSE, 18);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('P', TRUE, 19),
('Q', FALSE, 19),
('R', FALSE, 19),
('S', FALSE, 19);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('T', TRUE, 20),
('U', FALSE, 20),
('V', FALSE, 20),
('W', FALSE, 20);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 21),
('Falso', FALSE, 21);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 22),
('Falso', FALSE, 22);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('S', TRUE, 23),
('T', FALSE, 23),
('U', FALSE, 23),
('V', FALSE, 23);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 24),
('Falso', FALSE, 24);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Y', TRUE, 25),
('Z', FALSE, 25),
('U', FALSE, 25),
('V', FALSE, 25);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Z', TRUE, 26),
('X', FALSE, 26),
('Y', FALSE, 26),
('W', FALSE, 26);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 27),
('Falso', FALSE, 27);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 28),
('Falso', FALSE, 28);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('X', TRUE, 29),
('Y', FALSE, 29),
('W', FALSE, 29),
('V', FALSE, 29);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
('Cierto', TRUE, 30),
('Falso', FALSE, 30);









--------------------------------------------------
-- etapa 2
INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 6)
('1', FALSE, 31),
('2', TRUE, 31),
('3', FALSE, 31),
('4', FALSE, 31);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 2 (nivel 6)
('1', FALSE, 32),
('3', FALSE, 32),
('5', TRUE, 32),
('6', FALSE, 32);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 3 (nivel 6)
('2', FALSE, 33),
('3', TRUE, 33),
('4', FALSE, 33),
('5', FALSE, 33);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 4 (nivel 6)
('5', FALSE, 34),
('6', TRUE, 34),
('7', FALSE,34),
('8', FALSE, 34);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 5 (nivel 6)
('7', FALSE, 35),
('8', TRUE, 35),
('9', FALSE, 35),
('10', FALSE, 35);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 6 (nivel 6)
('1', TRUE, 36),
('2', FALSE, 36),
('3', FALSE, 36),
('4', FALSE, 36);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 7)
('9', FALSE, 37),
('10', TRUE, 37),
('11', FALSE, 37),
('12', FALSE, 37);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 2 (nivel 7)
('11', FALSE, 38),
('12', TRUE, 38),
('13', FALSE, 38),
('14', FALSE, 38);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 3 (nivel 7)
('10', FALSE, 39),
('11', TRUE, 39),
('12', FALSE, 39),
('13', FALSE, 39);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 4 (nivel 7)
('12', FALSE, 40),
('13', TRUE, 40),
('14', FALSE, 40),
('15', FALSE, 40);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 5 (nivel 7)
('Cierto', FALSE, 41),
('Falso', TRUE, 41);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 6 (nivel 7)
('Cierto', TRUE, 42),
('Falso', FALSE, 42);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 8)
('20', FALSE, 43),
('30', TRUE, 43),
('40', FALSE, 43),
('50', FALSE, 43);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 2 (nivel 8)
('10', FALSE, 44),
('20', TRUE, 44),
('30', FALSE, 44),
('40', FALSE, 44);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 3 (nivel 8)
('Cierto', FALSE, 45),
('Falso', TRUE, 45);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 4 (nivel 8)
('20', FALSE, 46),
('30', FALSE, 46),
('40', TRUE, 46),
('50', FALSE, 46);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 5 (nivel 8)
('Cierto', FALSE, 47),
('Falso', TRUE, 47);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 6 (nivel 8)
('Cierto', TRUE, 48),
('Falso', FALSE, 48);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 9)
('100', TRUE, 49),
('200', FALSE, 49),
('300', FALSE, 49),
('400', FALSE, 49);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 2 (nivel 9)
('100', FALSE, 50),
('200', TRUE, 50),
('300', FALSE, 50),
('400', FALSE, 50);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 3 (nivel 9)
('Cierto', FALSE, 51),
('Falso', TRUE, 51);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 4 (nivel 9)
('100', TRUE, 52),
('200', FALSE, 52),
('300', FALSE, 52),
('400', FALSE, 52);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 5 (nivel 9)
('Cierto', TRUE, 53),
('Falso', FALSE, 53);

INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 6 (nivel 9)
('Cierto', TRUE, 54),
('Falso', FALSE, 54);





-----------------------------------------------------
--etapa 3
INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 10)
('Adiós', TRUE, 55),
('Hola', FALSE, 55),
('Bien', FALSE, 55),
('Ayúdeme', FALSE, 55),

-- Respuestas para Pregunta 2 (nivel 10)
('Hola', FALSE, 56),
('Bien', TRUE, 56),
('Adiós', FALSE, 56),
('Ayúdeme', FALSE, 56),

-- Respuestas para Pregunta 3 (nivel 10)
('Cierto', TRUE, 57),
('Falso', FALSE, 57),

-- Respuestas para Pregunta 4 (nivel 10)
('Cierto', FALSE, 58),
('Falso', TRUE, 58),

-- Respuestas para Pregunta 5 (nivel 10)
('Hola', TRUE, 59),
('Adiós', FALSE, 59),
('Bien', FALSE, 59),
('Ayúdeme', FALSE, 59),

-- Respuestas para Pregunta 6 (nivel 10)
('Cierto', FALSE, 60),
('Falso', TRUE, 60),

-- Respuestas para Pregunta 1 (nivel 11)
('Difícil', TRUE, 61),
('De nada', FALSE, 61),
('Gracias', FALSE, 61),
('Fácil', FALSE, 61),

-- Respuestas para Pregunta 2 (nivel 11)
('Hola', FALSE, 62),
('De nada', TRUE, 62),
('Difícil', FALSE, 62),
('Gracias', FALSE, 62),

-- Respuestas para Pregunta 3 (nivel 11)
('Cierto', FALSE, 63),
('Falso', TRUE, 63),

-- Respuestas para Pregunta 4 (nivel 11)
('Cierto', FALSE, 64),
('Falso', TRUE, 64),

-- Respuestas para Pregunta 5 (nivel 11)
('Gracias', TRUE, 65),
('Hola', FALSE, 65),
('De nada', FALSE, 65),
('Difícil', FALSE, 65),

-- Respuestas para Pregunta 6 (nivel 11)
('Cierto', TRUE, 66),
('Falso', FALSE, 66),

-- Respuestas para Pregunta 1 (nivel 12)
('Mal', TRUE, 67),
('Malo', FALSE, 67),
('Yo me llamo', FALSE, 67),
('De nada', FALSE, 67),

-- Respuestas para Pregunta 2 (nivel 12)
('Hola', FALSE, 68),
('Malo', TRUE, 68),
('Mal', FALSE, 68),
('Mi nombre', FALSE, 68),

-- Respuestas para Pregunta 3 (nivel 12)
('Cierto', FALSE, 69),
('Falso', TRUE, 69),

-- Respuestas para Pregunta 4 (nivel 12)
('Cierto', FALSE, 70),
('Falso', TRUE, 70),

-- Respuestas para Pregunta 5 (nivel 12)
('Yo me llamo', TRUE, 71),
('Mi nombre', FALSE, 71),
('Nadie', FALSE, 71),
('De nada', FALSE, 71),

-- Respuestas para Pregunta 6 (nivel 12)
('Cierto', FALSE, 72),
('Falso', TRUE, 72);




--------------------------------------------------
--etapa 4
INSERT INTO Respuestas (respuesta, correcta, pregunta) VALUES
-- Respuestas para Pregunta 1 (nivel 13)
('Cierto', FALSE, 73),
('Falso', TRUE, 73),

-- Respuestas para Pregunta 2 (nivel 13)
('Cierto', FALSE, 74),
('Falso', TRUE, 74),

-- Respuestas para Pregunta 3 (nivel 13)
('Cierto', FALSE, 75),
('Falso', TRUE, 75),

-- Respuestas para Pregunta 4 (nivel 13)
('Cierto', FALSE, 76),
('Falso', TRUE, 76),

-- Respuestas para Pregunta 5 (nivel 13)
('Cierto', FALSE, 77),
('Falso', TRUE, 77),

-- Respuestas para Pregunta 6 (nivel 13)
('Cierto', FALSE, 78),
('Falso', TRUE, 78),

-- Respuestas para Pregunta 1 (nivel 14)
('Cierto', FALSE, 79),
('Falso', TRUE, 79),

-- Respuestas para Pregunta 2 (nivel 14)
('Cierto', FALSE, 80),
('Falso', TRUE, 80),

-- Respuestas para Pregunta 3 (nivel 14)
('Blanco', FALSE, 81),
('Crema', TRUE, 81),
('Gris', FALSE, 81),
('Verde', FALSE, 81),

-- Respuestas para Pregunta 4 (nivel 14)
('Crema', FALSE, 82),
('Blanco', TRUE, 82),
('Gris', FALSE, 82),
('Verde', FALSE, 82),

-- Respuestas para Pregunta 5 (nivel 14)
('Crema', FALSE, 83),
('Celeste', TRUE, 83),
('Gris', FALSE, 83),
('Verde', FALSE, 83),

-- Respuestas para Pregunta 6 (nivel 14)
('Cierto', TRUE, 84),
('Falso', FALSE, 84),

-- Respuestas para Pregunta 1 (nivel 15)
('Cierto', FALSE, 85),
('Falso', TRUE, 85),

-- Respuestas para Pregunta 2 (nivel 15)
('Cierto', FALSE, 86),
('Falso', TRUE, 86),

-- Respuestas para Pregunta 3 (nivel 15)
('Cierto', FALSE, 87),
('Falso', TRUE, 87),

-- Respuestas para Pregunta 4 (nivel 15)
('Cierto', TRUE, 88),
('Falso', FALSE, 88),

-- Respuestas para Pregunta 5 (nivel 15)
('Cierto', TRUE, 89),
('Falso', FALSE, 89),

-- Respuestas para Pregunta 6 (nivel 15)
('Cierto', TRUE, 90),
('Falso', FALSE, 90);





----------------------------------------------------

SHOW TABLES;
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE IF NOT EXISTS Usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  contra VARCHAR(50) NOT NULL, -- password
  foto_perfil VARCHAR(400) DEFAULT 'https://res.cloudinary.com/dpizfkmea/image/upload/v1721618485/logoDefaulf_opzjoq.jpg',
  tipo INT NOT NULL,
  exp INT NOT NULL DEFAULT 0,
  CONSTRAINT `PK_Usuarios_id` PRIMARY KEY (id_usuario)
);

SHOW TABLES;


INSERT INTO Usuarios (nombre, apellido, email, contra, tipo, exp) VALUES
('Carlos', 'González', 'carlos.gonzalez@example.com', 'password123',  1, 10),
('Ana', 'Martínez', 'ana.martinez@example.com', 'password123',  2, 20),
('Luis', 'Pérez', 'luis.perez@example.com', 'password123',  1, 15),
('María', 'López', 'maria.lopez@example.com', 'password123',  2, 25),
('Jorge', 'Sánchez', 'jorge.sanchez@example.com', 'password123',  1, 30),
('Lucía', 'Ramírez', 'lucia.ramirez@example.com', 'password123',  2, 35),
('Pedro', 'Torres', 'pedro.torres@example.com', 'password123', 1, 5),
('Carmen', 'Flores', 'carmen.flores@example.com', 'password123', 2, 40),
('Juan', 'Hernández', 'juan.hernandez@example.com', 'password123', 1, 50),
('Sofía', 'Díaz', 'sofia.diaz@example.com', 'password123', 2, 45),
('Ricardo', 'Vargas', 'ricardo.vargas@example.com', 'password123',  1, 60),
('Elena', 'Mendoza', 'elena.mendoza@example.com', 'password123',  2, 55),
('Manuel', 'Cruz', 'manuel.cruz@example.com', 'password123',  1, 70),
('Paula', 'Gutiérrez', 'paula.gutierrez@example.com', 'password123', 2, 65);

SELECT * FROM Usuarios;





-- borrar todo para levantar nuevamente
-- Desactivar las verificaciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar las tablas
DROP TABLE IF EXISTS Usuarios;
DROP TABLE IF EXISTS Respuestas;
DROP TABLE IF EXISTS Preguntas;
DROP TABLE IF EXISTS Lecciones;
DROP TABLE IF EXISTS Niveles;
DROP TABLE IF EXISTS Etapas;

-- Volver a activar las verificaciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;







