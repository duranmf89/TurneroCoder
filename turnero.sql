-- Eliminar todas las tablas si existen
DROP TABLE IF EXISTS Reservas_Historial, Reviews, Pagos, Equipamiento, Notificaciones, Tarifas, Eventos, Registros_Acceso, Usuarios_Equipos, Reservas, Estados_Reservas, Canchas, Equipos, Deportes, Usuarios;

-- Crear el esquema 'turnero' si no existe
CREATE SCHEMA IF NOT EXISTS turnero;

-- Utilizar el esquema 'turnero'
USE turnero;

-- Crear tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Crear tabla Deportes
CREATE TABLE IF NOT EXISTS Deportes (
    id_deporte INT PRIMARY KEY AUTO_INCREMENT,
    nombre_deporte VARCHAR(255) NOT NULL
);

-- Crear tabla Canchas
CREATE TABLE IF NOT EXISTS Canchas (
    id_cancha INT PRIMARY KEY AUTO_INCREMENT,
    id_deporte INT NOT NULL,
    nombre_cancha VARCHAR(255) NOT NULL,
    hora_semana TIME,
    hora_fin_semana TIME,
    dia_semana VARCHAR(10),
    disponible BOOLEAN
);

-- Agregar clave foránea a la tabla Canchas
ALTER TABLE Canchas ADD FOREIGN KEY (id_deporte) REFERENCES Deportes(id_deporte);

-- Crear tabla Estados Reservas
CREATE TABLE IF NOT EXISTS Estados_Reservas (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estado VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255)
);

-- Crear tabla Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    hora_semana TIME,
    hora_fin_semana TIME,
    id_estado INT NOT NULL,
    id_usuario_reservante INT NOT NULL,
    id_usuario_aceptante INT NOT NULL,
    dia_semana VARCHAR(10)
);

-- Agregar claves foráneas a la tabla Reservas
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Reservas ADD FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario);

-- Crear tabla Equipos
CREATE TABLE IF NOT EXISTS Equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    avatar VARCHAR(255)
);

-- Crear tabla Usuarios_Equipos
CREATE TABLE IF NOT EXISTS Usuarios_Equipos (
    id_usuario_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_equipo INT NOT NULL
);

-- Agregar claves foráneas a la tabla Usuarios_Equipos
ALTER TABLE Usuarios_Equipos ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Usuarios_Equipos ADD FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo);

-- Crear tabla para el historial de reservas
CREATE TABLE IF NOT EXISTS Reservas_Historial (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    id_usuario_reservante INT NOT NULL,
    id_usuario_aceptante INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    hora_semana TIME,
    id_estado INT NOT NULL
);

-- Agregar claves foráneas a la tabla Reservas_Historial
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado);

-- Crear tabla Reviews en lugar de Reseñas
CREATE TABLE IF NOT EXISTS Reviews (
    id_review INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    calificacion INT,
    comentario TEXT
);

-- Agregar claves foráneas a la tabla Reviews
ALTER TABLE Reviews ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reviews ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);

-- Crear tabla Pagos
CREATE TABLE IF NOT EXISTS Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    monto DECIMAL(10, 2),
    fecha DATE
);

-- Agregar clave foránea a la tabla Pagos
ALTER TABLE Pagos ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);

-- Crear tabla Equipamiento
CREATE TABLE IF NOT EXISTS Equipamiento (
    id_equipamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    id_cancha INT NOT NULL
);

-- Agregar clave foránea a la tabla Equipamiento
ALTER TABLE Equipamiento ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);

-- Crear tabla Notificaciones
CREATE TABLE IF NOT EXISTS Notificaciones (
    id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    mensaje TEXT,
    fecha DATE
);

-- Agregar clave foránea a la tabla Notificaciones
ALTER TABLE Notificaciones ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);

-- Crear tabla Tarifas
CREATE TABLE IF NOT EXISTS Tarifas (
    id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    id_cancha INT NOT NULL,
    monto DECIMAL(10, 2)
);

-- Agregar clave foránea a la tabla Tarifas
ALTER TABLE Tarifas ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);

-- Crear tabla Eventos
CREATE TABLE IF NOT EXISTS Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(255),
    fecha DATE
);

-- Crear tabla Registros_Acceso
CREATE TABLE IF NOT EXISTS Registros_Acceso (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_hora TIMESTAMP
);

-- Agregar clave foránea a la tabla Registros_Acceso
ALTER TABLE Registros_Acceso ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);

-- Deshabilitamos los horarios que no pueden reservarse los días de semana
UPDATE Canchas
SET hora_semana = NULL, hora_fin_semana = NULL
WHERE dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')
  AND hora_semana BETWEEN '09:00:00' AND '15:00:00';
