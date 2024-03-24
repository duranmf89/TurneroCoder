-- VIEW DE USUARIOS CON MAS DE 1 EQUIPO
DROP VIEW IF EXISTS UsuariosConMasDeUnEquipo;
CREATE VIEW UsuariosConMasDeUnEquipo AS
SELECT Usuarios.apellido, Usuarios.nombre, Equipos.nombre_equipo
FROM Usuarios
JOIN Usuarios_Equipos ON Usuarios.id_usuario = Usuarios_Equipos.id_usuario
JOIN Equipos ON Usuarios_Equipos.id_equipo = Equipos.id_equipo
GROUP BY Usuarios.id_usuario, Usuarios.nombre, Usuarios.apellido
HAVING COUNT(Usuarios_Equipos.id_equipo) > 1
ORDER BY Usuarios.apellido ASC, Usuarios.nombre ASC;

-- Busqueda de un usuario especifico:
-- SELECT * FROM UsuariosConMasDeUnEquipo WHERE apellido = 'Apellido';

-- VIEW RESERVAS POR FECHA
DROP VIEW IF EXISTS ReservasPorFecha;
CREATE VIEW ReservasPorFecha AS
SELECT fecha, COUNT(*) AS cantidad_reservas
FROM Reservas
GROUP BY fecha;

-- Busqueda por abril y mayo:
-- SELECT * FROM ReservasPorFecha WHERE MONTH(fecha) IN (4, 5);

-- VIEW PAGOS POR USUARIO
DROP VIEW IF EXISTS PagosPorUsuario;
CREATE VIEW PagosPorUsuario AS
SELECT Usuarios.apellido, Usuarios.nombre, Pagos.monto, Pagos.fecha
FROM Pagos
JOIN Usuarios ON Pagos.id_usuario = Usuarios.id_usuario
ORDER BY Pagos.fecha DESC;

-- VIEW DE RESERVAS POR USUARIO
DROP VIEW IF EXISTS ReservasPorUsuario;
CREATE VIEW ReservasPorUsuario AS
SELECT Usuarios.nombre, Usuarios.apellido, Usuarios.dni, Reservas.fecha, Reservas.hora_semana, Reservas.hora_fin_semana, Canchas.nombre_cancha, Estados_Reservas.nombre_estado
FROM Reservas
JOIN Usuarios ON Reservas.id_usuario = Usuarios.id_usuario
JOIN Canchas ON Reservas.id_cancha = Canchas.id_cancha
JOIN Estados_Reservas ON Reservas.id_estado = Estados_Reservas.id_estado
ORDER BY Reservas.fecha DESC;


-- Busqueda con DNI:
-- SELECT * FROM ReservasPorUsuario WHERE dni = 'DNIUsuario';



