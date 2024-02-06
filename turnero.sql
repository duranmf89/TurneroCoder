-- Crear el esquema 'turnero' si no existe
CREATE SCHEMA IF NOT EXISTS turnero;

-- Utilizar el esquema 'turnero'
USE turnero;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    contrasena VARCHAR(255)
);

-- Crear tabla Deportes
CREATE TABLE Deportes (
    id_deporte INT PRIMARY KEY AUTO_INCREMENT,
    nombre_deporte VARCHAR(255)
);

-- Crear tabla Canchas
CREATE TABLE Canchas (
    id_cancha INT PRIMARY KEY AUTO_INCREMENT,
    id_deporte INT,
    nombre_cancha VARCHAR(255),
    hora_semana TIME,
    hora_fin_semana TIME,
    dia_semana VARCHAR(10),
    disponible BOOLEAN,
    FOREIGN KEY (id_deporte) REFERENCES Deportes(id_deporte)
);

-- Crear tabla Estados Reservas
CREATE TABLE Estados_Reservas (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estado VARCHAR(255),
    descripcion VARCHAR(255)
);

-- Crear tabla Reservas
CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_cancha INT,
    fecha DATE,
    hora_semana TIME,
    hora_fin_semana TIME,
    id_estado INT,
    id_usuario_reservante INT,
    id_usuario_aceptante INT,
    dia_semana VARCHAR(10),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha),
    FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado),
    FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Equipos
CREATE TABLE Equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255),
    avatar VARCHAR(255)
);

-- Crear tabla Usuarios_Equipos
CREATE TABLE Usuarios_Equipos (
    id_usuario_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_equipo INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Crear tabla para el historial de reservas
CREATE TABLE Reservas_Historial (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT,
    id_usuario_reservante INT,
    id_usuario_aceptante INT,
    id_cancha INT,
    fecha DATE,
    hora_semana TIME,
    id_estado INT,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),
    FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha),
    FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado)
);

-- Crear tabla Reviews en lugar de Reseñas
CREATE TABLE Reviews (
    id_review INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_cancha INT,
    fecha DATE,
    calificacion INT,
    comentario TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha)
);

-- Crear tabla Pagos
CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    monto DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Equipamiento
CREATE TABLE Equipamiento (
    id_equipamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255),
    id_cancha INT,
    FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha)
);

-- Crear tabla Notificaciones
CREATE TABLE Notificaciones (
    id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    mensaje TEXT,
    fecha DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Tarifas
CREATE TABLE Tarifas (
    id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    id_cancha INT,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha)
);

-- Crear tabla Eventos
CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(255),
    fecha DATE
);

-- Crear tabla Registros_Acceso
CREATE TABLE Registros_Acceso (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    fecha_hora TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
-- Deshabilitamos los horarios que no pueden reservarse los días de semana
UPDATE Canchas
SET hora_semana = NULL, hora_fin_semana = NULL
WHERE dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')
  AND hora_semana BETWEEN '09:00:00' AND '15:00:00';
