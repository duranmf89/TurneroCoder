USE turnero;

-- ---------

-- Crear VIEW Vista_Reservas
-- Esta vista proporciona una lista detallada de todas las reservas, incluyendo información sobre el usuario creador, usuario aceptante (si hay alguno), la cancha reservada, el estado actual de la reserva y demas columnas.
CREATE OR REPLACE VIEW Vista_Reservas AS
SELECT 
    Reservas.id_reserva,
    CONCAT(Usuarios_creador.nombre, ' ', Usuarios_creador.apellido) AS usuario_creador,
    CONCAT(Usuarios_aceptante.nombre, ' ', Usuarios_aceptante.apellido) AS usuario_aceptante,
    Canchas.id_cancha,
    Canchas.nombre_cancha,
    Reservas.fecha_creacion,
    Reservas.fecha_reserva,
    Reservas.hora_reserva,
    Estados_Reservas.nombre_estado AS estado_reserva
FROM 
    Reservas
INNER JOIN 
    Usuarios AS Usuarios_creador ON Reservas.id_usuario = Usuarios_creador.id_usuario 
LEFT JOIN 
    Usuarios AS Usuarios_aceptante ON Reservas.id_usuario_aceptante = Usuarios_aceptante.id_usuario
INNER JOIN 
    Canchas ON Reservas.id_cancha = Canchas.id_cancha
INNER JOIN 
    Estados_Reservas ON Reservas.id_estado = Estados_Reservas.id_estado
ORDER BY 
    Reservas.fecha_creacion DESC;

-- SELECT * FROM Vista_Reservas;

-- ---------

-- Crear VIEW Usuarios_Con_Mas_De_Un_Equipo
-- Usuarios Con Mas De Un Equipo: Esta vista devuelve los usuarios que tienen más de un equipo asociado. La consulta utiliza las tablas Usuarios, Usuarios_Equipos y Equipos, y utiliza la función GROUP_CONCAT para concatenar los nombres de los equipos para cada usuario.
CREATE OR REPLACE VIEW Usuarios_Con_Mas_De_Un_Equipo AS
SELECT Usuarios.apellido, Usuarios.nombre, GROUP_CONCAT(Equipos.nombre_equipo) AS equipos
FROM Usuarios
JOIN Usuarios_Equipos ON Usuarios.id_usuario = Usuarios_Equipos.id_usuario
JOIN Equipos ON Usuarios_Equipos.id_equipo = Equipos.id_equipo
GROUP BY Usuarios.apellido, Usuarios.nombre
HAVING COUNT(Usuarios_Equipos.id_equipo) > 1
ORDER BY Usuarios.apellido ASC, Usuarios.nombre ASC;

-- Busqueda de un usuario especifico:
-- SELECT * FROM Usuarios_Con_Mas_De_Un_Equipo WHERE apellido = 'apellidoDelUsuario';

-- ---------

-- Crear VIEW Reservas_Por_Fecha
-- Reservas Por Fecha: Esta vista cuenta el número de reservas por fecha. Utiliza la tabla Reservas y agrupa las reservas por fecha utilizando la función GROUP BY.
CREATE OR REPLACE VIEW Reservas_Por_Fecha AS
SELECT fecha_creacion, COUNT(*) AS cantidad_reservas
FROM Reservas
GROUP BY fecha_creacion;

-- SELECT * FROM Reservas_Por_Fecha

-- Busqueda por abril y mayo:
-- SELECT * FROM Reservas_Por_Fecha WHERE MONTH(fecha_creacion) IN (4, 5);


-- ---------

-- CREAR VIEW Pagos_Por_Usuario
-- Pagos Por Usuario: Esta vista muestra los pagos realizados por cada usuario, ordenados por fecha de pago descendente. Se une la tabla Pagos con la tabla Usuarios para obtener información sobre los usuarios asociados a cada pago.
CREATE OR REPLACE VIEW Pagos_Por_Usuario AS
SELECT Usuarios.dni, Usuarios.apellido, Usuarios.nombre, Pagos.monto, Pagos.fecha
FROM Pagos
JOIN Usuarios ON Pagos.id_usuario = Usuarios.id_usuario
ORDER BY Pagos.fecha DESC;

-- SELECT * FROM Pagos_Por_Usuario;


-- ---------

-- CREAR VIEW DReservas_Por_Usuario
-- Reservas Por Usuario: Esta vista muestra las reservas realizadas por cada usuario, incluyendo detalles como la fecha, hora, nombre de la cancha y estado de la reserva. Se unen las tablas Reservas, Usuarios, Canchas y Estados_Reservas para obtener la información completa de cada reserva.
CREATE OR REPLACE VIEW Reservas_Por_Usuario AS
SELECT 
    Usuarios.nombre, 
    Usuarios.apellido, 
    Usuarios.dni, 
    Reservas.fecha_creacion, 
    Reservas.hora_reserva,
    Canchas.nombre_cancha,
    Reservas.id_cancha
FROM 
    Reservas
JOIN 
    Usuarios ON Reservas.id_usuario = Usuarios.id_usuario
JOIN 
    Canchas ON Reservas.id_cancha = Canchas.id_cancha;

-- SELECT * FROM Reservas_Por_Usuario

-- Busqueda con DNI:
-- SELECT * FROM Reservas_Por_Usuario WHERE dni = '36789012';