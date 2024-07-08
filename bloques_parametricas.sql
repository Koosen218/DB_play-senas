--bloques para llenar tablas parametricas


--llenar la tabla de tipos de usuario
DELIMITER //

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
END //

DELIMITER ;


CALL Insert_Tipo_Usuario();
SELECT * FROM Tipo_Usuario;
