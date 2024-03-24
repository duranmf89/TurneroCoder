-- FUNCTION CONTAR RESERVAS POR FECHA (ingresan los parametros mes(int) anio(int)

DELIMITER //

DROP FUNCTION IF EXISTS ContarReservasPorMes //

CREATE FUNCTION ContarReservasPorMes (mes INT, anio INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_reservas INT;

    SELECT COUNT(*) INTO cantidad_reservas
    FROM Reservas
    WHERE MONTH(fecha) = mes AND YEAR(fecha) = anio;

    RETURN cantidad_reservas;
END //

DELIMITER ;

-- Cuenta de reservas por mes, consulta:
-- SELECT ContarReservasPorMes(4, 2024);

-- FUNCTION CONTAR USUARIOS REGISTRADOS POR MES
DELIMITER //

DROP FUNCTION IF EXISTS ContarUsuariosRegistradosPorMes //

CREATE FUNCTION ContarUsuariosRegistradosPorMes (mes INT, anio INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_usuarios INT;

    SELECT COUNT(*) INTO cantidad_usuarios
    FROM Usuarios
    WHERE MONTH(fecha_registro) = mes AND YEAR(fecha_registro) = anio;

    RETURN cantidad_usuarios;
END //

DELIMITER ;

-- EJEMPLO:
SELECT ContarUsuariosRegistradosPorMes(4, 2024);
