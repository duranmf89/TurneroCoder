-- Crear el esquema 'turnero' si no existe
DROP SCHEMA IF EXISTS turnero;
CREATE SCHEMA IF NOT EXISTS turnero;

-- Utilizar el esquema 'turnero'
USE turnero;

-- Crear tabla Usuarios 
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    contrasena_confirm VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL,
    id_evento INT
);

-- Crear tabla Deportes
DROP TABLE IF EXISTS Deportes;
CREATE TABLE IF NOT EXISTS Deportes (
    id_deporte INT PRIMARY KEY AUTO_INCREMENT,
    nombre_deporte VARCHAR(255) NOT NULL
);

-- Crear tabla Canchas
DROP TABLE IF EXISTS Canchas;
CREATE TABLE IF NOT EXISTS Canchas (
    id_cancha INT PRIMARY KEY AUTO_INCREMENT,
    id_deporte INT NOT NULL,
    nombre_cancha VARCHAR(255) NOT NULL,
    hora_semana TIME,
    hora_fin_semana TIME,
    dia_semana VARCHAR(10),
    disponible BOOLEAN
);

DROP TABLE IF EXISTS Estados_Reservas;
CREATE TABLE IF NOT EXISTS Estados_Reservas (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estado ENUM('Pendiente', 'Confirmada', 'Cancelada') NOT NULL,
    descripcion VARCHAR(255)
);

-- Descripcion campos:
-- Pendiente: Cuando la reserva está creada pero aún no ha sido confirmada.
-- Confirmada: Cuando la reserva ha sido confirmada por el usuario o el sistema.
-- Cancelada: Cuando la reserva ha sido cancelada por alguna razón.


-- Crear tabla Reservas (TABLA DE HECHOS)
DROP TABLE IF EXISTS Reservas;
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    hora_semana TIME,
    hora_fin_semana TIME,
    id_estado INT NOT NULL,
    id_usuario_reservante INT NOT NULL,
    id_usuario_aceptante INT,
    dia_semana VARCHAR(10)
);

-- Crear tabla Equipos
DROP TABLE IF EXISTS Equipos;
CREATE TABLE IF NOT EXISTS Equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    avatar VARCHAR(255)
);

-- Crear tabla Usuarios_Equipos
DROP TABLE IF EXISTS Usuarios_Equipos;
CREATE TABLE IF NOT EXISTS Usuarios_Equipos (
    id_usuario_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_equipo INT NOT NULL
);

-- Crear tabla para el historial de reservas
DROP TABLE IF EXISTS Reservas_Historial;
CREATE TABLE IF NOT EXISTS Reservas_Historial (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    id_usuario_reservante INT NOT NULL,
    id_usuario_aceptante INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    hora_semana TIME,
    hora_fin_semana TIME,
    id_estado INT NOT NULL
);

-- Crear tabla Reviews en lugar de Reseñas
DROP TABLE IF EXISTS Reviews;
CREATE TABLE IF NOT EXISTS Reviews (
    id_review INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    calificacion INT,
    comentario TEXT
);

-- Crear tabla Pagos (TABLA TRANSACCIONAL)
DROP TABLE IF EXISTS Pagos;
CREATE TABLE IF NOT EXISTS Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    monto DECIMAL(10, 2),
    fecha DATE
);

-- Crear tabla Equipamiento
DROP TABLE IF EXISTS Equipamiento;
CREATE TABLE IF NOT EXISTS Equipamiento (
    id_equipamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    id_cancha INT NOT NULL
);

-- Crear tabla Notificaciones
DROP TABLE IF EXISTS Notificaciones;
CREATE TABLE IF NOT EXISTS Notificaciones (
    id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    mensaje TEXT,
    fecha DATE
);

-- Crear tabla Tarifas
DROP TABLE IF EXISTS Tarifas;
CREATE TABLE IF NOT EXISTS Tarifas (
    id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    id_cancha INT NOT NULL,
    monto DECIMAL(10, 2)
);

-- Crear tabla Eventos
DROP TABLE IF EXISTS  Eventos;
CREATE TABLE IF NOT EXISTS Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(255),
    fecha DATE
);


-- Agregar claves foráneas y relaciones
ALTER TABLE Usuarios ADD FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento);
ALTER TABLE Canchas ADD FOREIGN KEY (id_deporte) REFERENCES Deportes(id_deporte);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Reservas ADD FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Usuarios_Equipos ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Usuarios_Equipos ADD FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Reservas_Historial ADD FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado);
ALTER TABLE Reviews ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reviews ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Pagos ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Equipamiento ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Notificaciones ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Tarifas ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);

-- Deshabilitamos los horarios que no pueden reservarse los días de semana
UPDATE Canchas
SET hora_semana = NULL, hora_fin_semana = NULL
WHERE dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')
  AND hora_semana BETWEEN '09:00:00' AND '15:00:00';
