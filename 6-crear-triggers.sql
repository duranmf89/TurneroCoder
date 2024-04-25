USE turnero;

-- TRIGGERS Y CREACION DE TABLAS DE LOGS

-- Crear la tabla logGeneral
DROP TABLE IF EXISTS logGeneral;
CREATE TABLE logGeneral (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    tipo_accion VARCHAR(20),
    tabla_afectada VARCHAR(50),
    nombre_usuario VARCHAR(255),
    apellido_usuario VARCHAR(255),
    dni_usuario VARCHAR(20),
    correo_usuario VARCHAR(255),
    usuario VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER
DROP TRIGGER IF EXISTS TRG_LOG_Usuarios;
DELIMITER //
CREATE TRIGGER TRG_LOG_Usuarios
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    INSERT INTO logGeneral (tipo_accion, tabla_afectada, usuario, nombre_usuario, apellido_usuario, dni_usuario, correo_usuario)
    VALUES ('INSERT', 'Usuarios', CURRENT_USER(), NEW.nombre, NEW.apellido, NEW.dni, NEW.correo);
END//

DELIMITER ;

-- SELECT * FROM logGeneral;

-- Crear la Tabla logEvents
DROP TABLE IF EXISTS logEvents;
CREATE TABLE logEvents (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    tipo_accion VARCHAR(20),
    tabla_afectada VARCHAR(50),
    correo_anterior VARCHAR(60),
    correo_nuevo VARCHAR(60),
    usuario VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- TRIGGER
DROP TRIGGER IF EXISTS TRG_UPDATE_CORREO;
DELIMITER //
CREATE TRIGGER TRG_UPDATE_CORREO
BEFORE UPDATE ON Usuarios
FOR EACH ROW
BEGIN
        IF OLD.correo != NEW.correo THEN
        INSERT INTO logEvents (correo_anterior, correo_nuevo, tipo_accion, tabla_afectada, usuario)
        VALUES (OLD.correo, NEW.correo, 'UPDATE', 'Usuarios', CURRENT_USER());
    END IF;
END//

DELIMITER ;

-- Update del correo para comprobar funcionamiento de tabla de LOGS (hacer esto luego de hacer el insert)
UPDATE Usuarios
SET correo = 'carlitosrod@example.com'
WHERE dni = '34567890';

UPDATE Usuarios
SET correo = 'charlyrod@example.com'
WHERE dni = '34567890';

-- Cuando vemos la tabla logEvents podemos ver como se ha modificado dos veces el mail. Se puede rescatar incluso el primero
-- SELECT * FROM logEvents;
-- SELECT * FROM Usuarios;