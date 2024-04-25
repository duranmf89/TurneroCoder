USE turnero;

-- INSERTS de datos en la DB

-- Registros en Tabla Deportes
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Futbol');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Tenis');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Paddle');
INSERT INTO turnero.Deportes (nombre_deporte) VALUES ('Squash');

-- SELECT * FROM DEPORTES;

-- Registros en Tabla Estados_Reservas
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Pendiente', 'Reserva creada pero aún no ha sido confirmada.');
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Confirmada', 'Reserva ha sido confirmada por el usuario o el sistema.');
INSERT INTO Estados_Reservas (nombre_estado, descripcion) VALUES ('Cancelada', 'Reserva ha sido cancelada por usuario o sistema por alguna razón.');

-- SELECT * FROM estados_reservas;

-- Registros en Tabla usuarios
INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
VALUES
('Juan', 'Pérez', '43098345', 'juan@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('María', 'Gómez', '23456789', 'maria@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Carlos', 'Rodríguez', '34567890', 'carlos@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Ana', 'Martínez', '45678901', 'ana@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Luis', 'García', '36789012', 'luis@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Laura', 'Fernández', '37890123', 'laura@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Javier', 'López', '38901234', 'javier@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Andrea', 'Sánchez', '29812345', 'andrea@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Pablo', 'Torres', '40129456', 'pablo@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Marta', 'Díaz', '41334667', 'marta@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Diego', 'Ruiz', '31226344', 'diego@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Lucía', 'Navarro', '42364455', 'lucia@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Sergio', 'Romero', '23455566', 'sergio@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Paula', 'Jiménez', '44546677', 'paula@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Andrés', 'González', '35665488', 'andres@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Roberto', 'Hernández', '36765499', 'roberto@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Elena', 'Santos', '37885640', 'elena@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Hugo', 'Moreno', '38993241', 'hugo@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Carolina', 'Castillo', '39098342', 'carolina@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Martín', 'Rojas', '40198363', 'martin@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Silvia', 'Alvarez', '21298344', 'silvia@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Jorge', 'Góngora', '42309365', 'jorge@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Natalia', 'Medina', '33497266', 'natalia@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Alejandro', 'Suárez', '44502647', 'alejandro@example.com', 'contraseña123', 'contraseña123', CURDATE()),
('Florencia', 'López', '4568738', 'florencia@example.com', 'contraseña123', 'contraseña123', CURDATE());

-- SELECT * FROM usuarios;
-- SELECT * FROM LogGeneral;



-- Registros en Tabla Equipos
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Pumas', '../assets/img/logo/pumas_logo.png');
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Galaxies', '../assets/img/logo/Galaxies_logo.png');
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Inter Miami', '../assets/img/logo/Inter_miami_logo.png');
INSERT INTO Equipos (nombre_equipo, avatar) VALUES ('Juventus', '../assets/img/logo/Juventus_logo.png');

-- SELECT * FROM equipos;

-- Registros en Tabla Eventos
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Colegio de abogados', '2024-04-10');
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Primavera Mujeres', '2024-05-15');
INSERT INTO Eventos (nombre_evento, fecha) VALUES ('Torneo Paleta de oro', '2024-06-20');

-- SELECT * FROM eventos;

-- Registros en Tabla Canchas 

-- Canchas de Futbol
INSERT INTO Canchas (id_deporte, nombre_cancha, hora_semana, hora_fin_semana, dia_semana, disponible)
VALUES (
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Futbol'), -- trae al pimer registro con un select el id del deporte cuyo nombre es "Futbol"
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
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Tenis'), -- trae al pimer registro con un select el id del deporte cuyo nombre es "Tenis"
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
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Paddle'), -- trae al pimer registro con un select el id del deporte cuyo nombre es "Padle"
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
    (SELECT id_deporte FROM Deportes WHERE nombre_deporte = 'Squash'), -- trae al pimer registro con un select el id del deporte cuyo nombre es "Squash"
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

-- SELECT * FROM canchas;

-- Registros en Tabla Reservas

INSERT INTO Reservas (id_usuario, id_cancha, fecha_creacion, fecha_reserva, hora_reserva, id_estado, id_usuario_reservante, id_usuario_aceptante)
VALUES 
(2, 1, NOW(), '2024-03-04', '20:00:00', 2, 2, NULL),
(5, 3, NOW(), '2024-03-16', '19:00:00', 2, 5, NULL),
(7, 6, NOW(), '2024-03-20', '20:00:00', 2, 7, NULL),
(3, 4, NOW(), '2024-03-22', '21:00:00', 1, 3, NULL),
(8, 7, NOW(), '2024-03-28', '19:00:00', 2, 8, NULL),
(4, 9, NOW(), '2024-04-03', '18:00:00', 1, 4, NULL),
(10, 1, NOW(), '2024-04-05', '17:00:00', 2, 10, NULL),
(12, 3, NOW(), '2024-04-05', '15:00:00', 2, 12, NULL),
(4, 2, NOW(), '2024-04-10', '19:00:00', 3, 4, NULL),
(8, 8, NOW(), '2024-04-10', '20:00:00', 3, 8, NULL);

-- SELECT * FROM Reservas;

-- Registros en Tabla intermedia Usuarios_Equipos

INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (7, 1); 
INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (3, 4); 
INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (10, 2); 
INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (12, 4); 
INSERT INTO Usuarios_Equipos (id_usuario, id_equipo)
VALUES (8, 3); 

-- select * from Usuarios_Equipos;

-- Registros en Tabla Reviews

INSERT INTO Reviews (id_usuario, id_cancha, fecha, calificacion, comentario)
VALUES (
    3, 
    1, 
    curdate(), 
    4, -- se debe escribir un numero entre 1 y 5 ya que la tabla Reviews, el campo calificacion tiene la propiedad ENUM con esas limitaciones.
    'Excelente cancha, muy bien mantenida.' 
);
INSERT INTO Reviews (id_usuario, id_cancha, fecha, calificacion, comentario)
VALUES (
    14, 
    5, 
    curdate(), 
    5, -- se debe escribir un numero entre 1 y 5 ya que la tabla Reviews, el campo calificacion tiene la propiedad ENUM con esas limitaciones.
    'Muy buena experiencia en la cancha' 
);

-- SELECT * from Reviews;

-- Registros en Tabla Pagos

INSERT INTO Pagos (id_usuario, monto, fecha)
VALUES 
(2, 4800.00, NOW()),
(3, 3500.00, NOW()),
(5, 2000.00, NOW()),
(8, 5500.00, NOW()),
(4, 4200.00, NOW()),
(6, 4800.00, NOW()),
(3, 3000.00, NOW()),
(7, 3700.00, NOW()),
(4, 6000.00, NOW()),
(1, 4300.00, NOW()),
(9, 2500.00, NOW()),
(11, 3800.00, NOW()),
(4, 3200.00, NOW()),
(14, 4900.00, NOW()),
(10, 5100.00, NOW());


-- select * from pagos;

-- Registros en Tabla Equipamientos

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

-- select * from equipamiento;

-- Registros en Tabla Notificaciones

INSERT INTO Notificaciones (id_usuario, mensaje, fecha)
VALUES 
    (8, 'Recordá que mañana tenes una reserva', NOW()),        
    (9, 'Actualización de horario sobre tu evento próximo', NOW()),   
    (3, 'Oferta especial para tu próximo alquiler de cancha', NOW()),
    (4, 'Tu pago se realizó con éxito', NOW()), 
    (5, 'Tu reserva ha sido confirmada', NOW()); 

-- select * from notificaciones;

-- Registros en Tabla Tarifas

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

-- select * from tarifas;

