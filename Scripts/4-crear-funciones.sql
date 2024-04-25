USE turnero;

-- CREAR FUNCION FN_Contar_Reservas_Por_Mes (ingresan los parametros mes(int) año(int)
-- ContarReservasPorMes: Esta función cuenta el número de reservas realizadas en un mes y año específicos. Toma dos parámetros: el mes (como un entero) y el año (también como un entero). Luego, utiliza una consulta SQL para contar las reservas en la tabla Reservas que coincidan con el mes y el año proporcionados. Retorna el número total de reservas encontradas.
DELIMITER //

DROP FUNCTION IF EXISTS FN_Contar_Reservas_Por_Mes //

CREATE FUNCTION FN_Contar_Reservas_Por_Mes (mes INT, año INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_reservas INT;

    SELECT COUNT(*) INTO cantidad_reservas
    FROM Reservas
    WHERE MONTH(fecha_creacion) = mes AND YEAR(fecha_creacion) = año;

    RETURN cantidad_reservas;
END //

DELIMITER ;

-- Cuenta de reservas por mes, consulta:
-- SELECT FN_Contar_Reservas_Por_Mes(4, 2024);

-- --------

-- CREAR FUNCION FN_Contar_Usuarios_Registrados_Por_Mes
-- Contar Usuarios Registrados Por Mes: Esta función cuenta el número de usuarios registrados en un mes y año específicos. Al igual que la función anterior, toma dos parámetros: el mes y el año. Utiliza una consulta SQL para contar los usuarios en la tabla Usuarios que se registraron en el mes y año proporcionados. Retorna el número total de usuarios registrados encontrados.
DELIMITER //

DROP FUNCTION IF EXISTS FN_Contar_Usuarios_Registrados_Por_Mes //

CREATE FUNCTION FN_Contar_Usuarios_Registrados_Por_Mes (mes INT, año INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_usuarios INT;

    SELECT COUNT(*) INTO cantidad_usuarios
    FROM Usuarios
    WHERE MONTH(fecha_registro) = mes AND YEAR(fecha_registro) = año;

    RETURN cantidad_usuarios;
END //

DELIMITER ;

-- EJEMPLO:
-- SELECT FN_Contar_Usuarios_Registrados_Por_Mes(4, 2024);
