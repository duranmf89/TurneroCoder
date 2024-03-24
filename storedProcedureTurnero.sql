-- STORED PROCEDURE DE REPORTE DE INGRESOS POR MES.
DELIMITER //

DROP PROCEDURE IF EXISTS GenerarReporteIngresosPorMes //

CREATE PROCEDURE GenerarReporteIngresosPorMes (
    IN fecha_inicio DATE, 
    IN fecha_fin DATE
)
BEGIN
    SELECT YEAR(Pagos.fecha) AS anio,
           MONTH(Pagos.fecha) AS mes,
           SUM(Pagos.monto) AS ingresos_totales
    FROM Pagos
    WHERE Pagos.fecha BETWEEN fecha_inicio AND fecha_fin
    GROUP BY YEAR(Pagos.fecha), MONTH(Pagos.fecha)
    ORDER BY YEAR(Pagos.fecha), MONTH(Pagos.fecha);
END //

DELIMITER ;

-- EJEMPLO DE LLAMADA (se muestra en los registros los ingresos($) por mes y año. Una fila por mes)
-- CALL GenerarReporteIngresosPorMes('2023-01-01', '2023-12-31');

-- STORED PROCEDURE CONSULTA PAGOS POR DNI Y FECHA

DELIMITER //

DROP PROCEDURE IF EXISTS ConsultarPagosPorUsuarioYFecha //

CREATE PROCEDURE ConsultarPagosPorUsuarioYFecha (
    IN dni_usuario VARCHAR(20),
    IN fecha_consulta DATE
)
BEGIN
    SELECT Usuarios.apellido, Usuarios.nombre, Pagos.fecha, Pagos.monto
    FROM Pagos
    JOIN Usuarios ON Pagos.id_usuario = Usuarios.id_usuario
    WHERE Usuarios.dni = dni_usuario AND Pagos.fecha = fecha_consulta;
END //

DELIMITER ;

-- EJEMPLO:
-- CALL ConsultarPagosPorUsuarioYFecha('12345678', '2024-03-25');

