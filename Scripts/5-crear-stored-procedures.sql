USE turnero;

-- PROCEDIMIENTOS ALMACENADOS

-- CREAR PROCEDIMIENTO ALMACENADO SP_GestionarUsuario
-- Descripción: Este procedimiento almacenado se utiliza para gestionar el registro de nuevos usuarios en el sistema de la empresa. Al recibir los datos de un nuevo empleado, el procedimiento verifica si el DNI y el correo electrónico proporcionados ya existen en la base de datos. Si alguno de ellos ya está en uso, el procedimiento devuelve un mensaje indicando que el usuario ya está registrado con esos datos y no se realiza ninguna acción adicional. Si tanto el DNI como el correo electrónico son únicos, el procedimiento registra al nuevo usuario en la base de datos. Esto garantiza que no haya duplicados de información y mantiene la integridad de los registros de los empleados en el sistema.
DELIMITER //
DROP PROCEDURE IF EXISTS SP_GestionarUsuario;//
CREATE PROCEDURE SP_GestionarUsuario(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_dni VARCHAR(20),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_contrasena_confirm VARCHAR(255),
    IN p_fecha_registro DATE
)
BEGIN
    DECLARE user_exists INT;
    DECLARE email_exists INT;

    -- Verificar si el usuario ya existe por su DNI
    SELECT COUNT(*) INTO user_exists FROM Usuarios WHERE dni = p_dni;

    -- Verificar si el correo electrónico ya está en uso
    SELECT COUNT(*) INTO email_exists FROM Usuarios WHERE correo = p_correo;

    IF user_exists > 0 THEN
        -- Si el usuario existe por DNI, devolver mensaje
        SELECT 'El usuario con el DNI proporcionado ya está registrado.' AS mensaje;
    ELSEIF email_exists > 0 THEN
        -- Si el correo electrónico está en uso, devolver mensaje
        SELECT 'El correo electrónico proporcionado ya está en uso.' AS mensaje;
    ELSE
        -- Si el usuario no existe, insertar el registro
        INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
        VALUES (p_nombre, p_apellido, p_dni, p_correo, p_contrasena, p_contrasena_confirm, p_fecha_registro);
        SELECT 'Usuario insertado correctamente.' AS mensaje;
    END IF;
END //

DELIMITER ;

-- EJEMPLO: Al insertar nuevamente el usuario con el mismo mail aparece el msje y no se inserta. Lo mismo para el correo electronico.
-- CALL SP_GestionarUsuario('Roman', 'Palomares', '348983843', 'romanp@example.com', 'abc12345', 'abc12345', CURDATE());
-- Si se ejecuta otra vez saldra el mensajes de que el usuario ya esta creado y no se volvera a insertar.


-- CREAR PROCEDIMIENTO ALMACENADO SP_Generar_Reporte_Ingresos_Por_Mes
-- Descripción: Este stored procedure genera un informe de los ingresos totales por mes dentro de un rango de fechas especificado.
DELIMITER //

DROP PROCEDURE IF EXISTS SP_Generar_Reporte_Ingresos_Por_Mes //

CREATE PROCEDURE SP_Generar_Reporte_Ingresos_Por_Mes (
    IN fecha_inicio DATE, 
    IN fecha_fin DATE
)
BEGIN
    SELECT YEAR(Pagos.fecha) AS año,
           MONTH(Pagos.fecha) AS mes,
           SUM(Pagos.monto) AS ingresos_totales
    FROM Pagos
    WHERE Pagos.fecha BETWEEN fecha_inicio AND fecha_fin
    GROUP BY YEAR(Pagos.fecha), MONTH(Pagos.fecha)
    ORDER BY YEAR(Pagos.fecha), MONTH(Pagos.fecha);
END //

DELIMITER ;

-- EJEMPLO DE LLAMADA (se muestra en los registros los ingresos($) por mes y año. Una fila por mes)
-- CALL SP_Generar_Reporte_Ingresos_Por_Mes('2024-01-01', '2024-05-31');

-- --------

-- CREAR PROCEDIMIENTO ALMACENADO SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas
-- Descripción: Este stored procedure consulta los pagos realizados por un usuario específico en una fecha determinada.
DELIMITER //

DROP PROCEDURE IF EXISTS SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas //

CREATE PROCEDURE SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas (
    IN dni_usuario VARCHAR(20),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT Usuarios.apellido, Usuarios.nombre, Pagos.fecha, Pagos.monto
    FROM Pagos
    JOIN Usuarios ON Pagos.id_usuario = Usuarios.id_usuario
    WHERE Usuarios.dni = dni_usuario
    AND DATE(Pagos.fecha) BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;

-- EJEMPLO:
-- CALL SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas('45678901', '2024-01-01','2024-05-01');
