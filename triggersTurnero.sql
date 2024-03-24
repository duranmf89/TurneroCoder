-- TRIGGERS MAS CREACION DE TABLAS DE LOGS

-- Crear la tabla logGeneral

DROP TABLE IF EXISTS logGeneral;
CREATE TABLE logGeneral (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    tipo_accion VARCHAR(20),
    tabla_afectada VARCHAR(50),
    usuario VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER
DELIMITER //

CREATE TRIGGER TRG_LOG_Usuarios
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    INSERT INTO logGeneral (tipo_accion, tabla_afectada, usuario)
    VALUES ('INSERT', 'Usuarios', CURRENT_USER());
END//

DELIMITER ;

-- Insercion de datos para comprobar funcionamiento de tabla de LOGS
INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
VALUES ('Juan', 'Pérez', '34988711', 'juan@example.com', 'contraseña123', 'contraseña123', CURDATE());

SELECT * FROM logGeneral;

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

-- Update del correo para comprobar funcionamiento de tabla de LOGS
UPDATE Usuarios
SET correo = 'juan3@example.com'
WHERE dni = '34988711';

SELECT * FROM logEvents;

