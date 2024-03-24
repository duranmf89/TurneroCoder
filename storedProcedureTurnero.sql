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

-- EJEMPLO DE LLAMADA
-- CALL GenerarReporteIngresosPorMes('2023-01-01', '2023-12-31');


