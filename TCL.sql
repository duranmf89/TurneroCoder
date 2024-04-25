USE turnero;

SELECT @@sql_safe_updates;
SELECT @@foreign_key_checks;
SELECT @@autocommit;

SET @@sql_safe_updates = 0;
SET @@foreign_key_checks = 0;
SET @@autocommit = 0;

-- Eliminacion de los ultimos dos registros en la Tabla Pagos:
START TRANSACTION;
DELETE FROM Pagos
ORDER BY fecha DESC
LIMIT 2;
-- ---------------------------------------------

-- Seleccionamos la tabla pagos para verificar que se eliminaron
-- SELECT * FROM PAGOS;
-- ---------------------------------------------

-- Hacemos ROLLBACK para deshacer la eliminacion
-- ROLLBACK;
-- ---------------------------------------------

-- ó hacemos COMMIT para reafirmar la transaccion
-- COMMIT;
-- ---------------------------------------------

-- Script para volver a insertar los registros
-- INSERT INTO Pagos (id_usuario, monto, fecha)
-- VALUES 
-- (14, 4900.00, NOW()),
-- (10, 5100.00, NOW());

-- -----------------------------------------------------------------------------------------------------------------------------------
-- Registros en Tabla usuarios
START TRANSACTION;
-- Inserción de los primeros 4 registros
INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
VALUES
('Diego', 'Ruiz', '31226341', 'diego@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Lucía', 'Navarro', '42364451', 'lucia@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Sergio', 'Romero', '23455561', 'sergio@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Paula', 'Jiménez', '44546671', 'paula@example.com', 'contraseña123', 'contraseña123', CURDATE());

-- Savepoint después de la inserción de los primeros 4 registros
SAVEPOINT SP_lote1;


-- Inserción de los segundos 4 registros
INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
VALUES
('Andrés', 'González', '35665481', 'andres@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Roberto', 'Hernández', '36765491', 'roberto@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Elena', 'Santos', '37885641', 'elena@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Hugo', 'Moreno', '38993242', 'hugo@example.com', 'contraseña123', 'contraseña123', CURDATE());

-- Savepoint después de la inserción de los segundos 4 registros
SAVEPOINT SP_lote2;

-- Eliminamos la insercion de todos los usuarios
-- ROLLBACK;

-- Eliminar la inserción del lote2
-- ROLLBACK TO SP_lote1;

-- Eliminar el savepoint 1: Esto quiere decir que no se podra volver a hacer un ROLLBACK hasta el lote1
-- RELEASE SAVEPOINT SP_lote1;

-- Confirmamos permanentemente la insercion de los usuarios
-- COMMIT;

-- Revisamos la tabla usuarios para verificar la insercion antes y despues de los rollback
-- SELECT * FROM Usuarios;

