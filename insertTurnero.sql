-- INSERT de datos en la DB
-- 1 Tabla Deportes
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Futbol');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Tenis');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Paddle');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Squash');

SELECT * FROM DEPORTES;

-- 2 Tabla Estados_Reservas
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Pendiente', 'Reserva creada pero aún no ha sido confirmada.');
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Confirmada', 'Reserva ha sido confirmada por el usuario o el sistema.');
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Cancelada', 'Reserva ha sido cancelada por usuario o sistema por alguna razón.');

select * from estados_reservas;

-- 3 Tabla usuarios
INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
VALUES
('Juan', 'Pérez', '12345678', 'juan@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('María', 'Gómez', '23456789', 'maria@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Carlos', 'Rodríguez', '34567890', 'carlos@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Ana', 'Martínez', '45678901', 'ana@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Luis', 'García', '56789012', 'luis@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Laura', 'Fernández', '67890123', 'laura@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Javier', 'López', '78901234', 'javier@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Andrea', 'Sánchez', '89012345', 'andrea@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Pablo', 'Torres', '90123456', 'pablo@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Marta', 'Díaz', '01234567', 'marta@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Diego', 'Ruiz', '11223344', 'diego@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Lucía', 'Navarro', '22334455', 'lucia@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Sergio', 'Romero', '33445566', 'sergio@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Paula', 'Jiménez', '44556677', 'paula@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Andrés', 'González', '55667788', 'andres@example.com', 'contraseña123', 'contraseña123', CURDATE());

select * from usuarios;


-- 4 Tabla Equipos
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Equipo A', '/ruta/a/avatar_equipo_A.png');
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Equipo B', '/ruta/b/avatar_equipo_B.png');
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Equipo C', '/ruta/c/avatar_equipo_C.png');

select * from equipos;

-- 5 Tabla Eventos
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Colegio de abogados', '2024-04-10');
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Primavera Mujeres', '2024-05-15');
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Paleta de oro', '2024-06-20');

select * from eventos;

-- 6 Tabla Canchas 
-- Canchas de Futbol
INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Futbol'),
    'Futbol 11',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Futbol'),
    'Futbol 7',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Futbol'),
    'Futbol 5',
    NULL,
    NULL,
    NULL,
    0
);

-- Canchas de Tenis
INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Tenis'),
    'Alta',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Tenis'),
    'Baja',
    NULL,
    NULL,
    NULL,
    0
);

-- Canchas de Paddle
INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Paddle'),
    'Cancha 1',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Paddle'),
    'Cancha 2',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Paddle'),
    'Cancha 3',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Paddle'),
    'Cancha 4',
    NULL,
    NULL,
    NULL,
    0
);

-- Canchas de Squash
INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Squash'),
    'Cancha A',
    NULL,
    NULL,
    NULL,
    0
);

INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Squash'),
    'Cancha B',
    NULL,
    NULL,
    NULL,
    0
);

select * from canchas;

-- 7 Tabla Reservas
INSERT INTO Reservas (id_usuario, id_cancha, fecha, hora_semana, hora_fin_semana, id_estado, id_usuario_reservante, id_usuario_aceptante, dia_semana)
VALUES (
    1, 
    1, 
    '2024-04-01', 
    NULL, 
    '12:00:00', 
    1, 
    1, 
    NULL, 
    'Lunes' 
);

INSERT INTO Reservas (id_usuario, id_cancha, fecha, hora_semana, hora_fin_semana, id_estado, id_usuario_reservante, id_usuario_aceptante, dia_semana)
VALUES (
    2, 
    2, 
    '2024-04-02', 
    '14:00:00', 
    NULL, 
    1, 
    2, 
    NULL, 
    'Martes' 
);

INSERT INTO Reservas (id_usuario, id_cancha, fecha, hora_semana, hora_fin_semana, id_estado, id_usuario_reservante, id_usuario_aceptante, dia_semana)
VALUES (
    3, 
    3, 
    '2024-04-03', 
    NULL, 
    '18:00:00', 
    1, 
    3, 
    NULL, 
    'Miércoles' 
);

select * from reservas;

-- 8 Tabla intermedia Usuarios_Equipos

INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (1, 4); 
INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (2, 5); 

select * from Usuarios_Equipos;

-- 9 Tabla Reviews
INSERT INTO Reviews (id_usuario, id_cancha, fecha, calificacion, comentario)
VALUES (
    1, 
    1, 
    '2024-03-25', 
    4, 
    'Excelente cancha, muy bien mantenida.' 
);

select * from Reviews;

-- 10 Tabla Pagos

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (1, 1700.00, '2024-03-25');

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (2, 2500.00, '2024-03-26');

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (3, 1600.00, '2024-03-27');

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (4, 1300.00, '2024-03-28');

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (5, 3000.00, '2024-03-29');

-- Pagos con funcion fecha NOW()
INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (4, 2700.00, NOW());

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (2, 3500.00, NOW());

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (7, 1800.00, NOW());

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (9, 1900.00, NOW());

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (5, 3100.00, NOW());

-- Modificamos el valor de fecha en Pagos
-- ALTER TABLE Pagos MODIFY COLUMN fecha TIMESTAMP;

-- Hacemos la insercion de datos luego de hacer el ALTER TABLE
INSERT INTO Pagos (id_usuario, monto)
VALUES (5, 4700.00); -- la fecha quedo en null

INSERT INTO Pagos (id_usuario, monto)
VALUES (4, 5500.00); -- la fecha quedo en null

INSERT INTO Pagos (id_usuario, monto)
VALUES (8, 3800.00); -- la fecha quedo en null

INSERT INTO Pagos (id_usuario, monto)
VALUES (1, 2900.00); -- la fecha quedo en null

INSERT INTO Pagos (id_usuario, monto)
VALUES (3, 4100.00); -- la fecha quedo en null

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (9, 4800.00, NOW()); -- se agrega el campo fecha y ahora se carga correctamente en la DB

-- Se ingresa en duro un pago en Febrero para comprobar el reporte del stored procedure 'GenerarReporteIngresosPorMes'.
INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES (1, 1700.00, '2024-02-25');

select * from pagos;

-- Tabla Equipamientos

INSERT INTO Equipamiento (nombre_equipo, id_cancha)
VALUES 
    ('2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco', 1), 
    ('2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco', 2), 
    ('2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco', 3), 
    ('2 redes de Tenis', 4), 
    ('2 redes de Tenis', 5),
    ('1 red, 2 Paletas de Pádel, 3 pelotas de padel', 6),   
    ('1 red, 2 Paletas de Pádel, 3 pelotas de padel', 7), 
    ('1 red, 2 Paletas de Pádel, 3 pelotas de padel', 8), 
    ('1 red, 2 Paletas de Pádel, 3 pelotas de padel', 9), 
    ('2 pelotas de Squash', 10),
    ('2 pelotas de Squash', 11);  

select * from equipamiento;

-- Tabla Notificaciones

INSERT INTO Notificaciones (id_usuario, mensaje, fecha)
VALUES 
    (1, 'Recordá que mañana tenes una reserva', NOW()),        
    (2, 'Actualización de horario sobre tu evento próximo', NOW()),   
    (3, 'Oferta especial para tu próximo alquiler de cancha', NOW()),
    (4, 'Tu pago se realizó con éxito', NOW()), 
    (5, 'Tu reserva ha sido confirmada', NOW()); 

select * from notificaciones;

-- Tabla Tarifas
INSERT INTO Tarifas (id_cancha, monto)
VALUES (1, 45000.00), 
       (2, 30000.00),
       (3, 20000.00),
       (4, 12000.00),
       (5, 12000.00),
       (6, 10000.00), 
       (7, 10000.00), 
       (8, 10000.00), 
       (9, 10000.00), 
       (10, 7000.00), 
       (11, 7000.00);

select * from tarifas;

