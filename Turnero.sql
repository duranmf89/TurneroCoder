-- Eliminar las tablas existentes si es que existen
DROP TABLE IF EXISTS Usuarios_Equipos;
DROP TABLE IF EXISTS Equipos;
DROP TABLE IF EXISTS Reservas_Historial;
DROP TABLE IF EXISTS Reservas;
DROP TABLE IF EXISTS Estados_Reservas;
DROP TABLE IF EXISTS Canchas;
DROP TABLE IF EXISTS Deportes;
DROP TABLE IF EXISTS Usuarios;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    contrasena VARCHAR(255)
);

-- Crear tabla Deportes
CREATE TABLE Deportes (
    id_deporte INT PRIMARY KEY,
    nombre_deporte VARCHAR(255)
);

-- Crear tabla Canchas
CREATE TABLE Canchas (
    id_cancha INT PRIMARY KEY,
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
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR(255),
    descripcion VARCHAR(255)
);

-- Crear tabla Reservas
CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY,
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
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    avatar VARCHAR(255)
);

-- Crear tabla Usuarios_Equipos
CREATE TABLE Usuarios_Equipos (
    id_usuario_equipo INT PRIMARY KEY,
    id_usuario INT,
    id_equipo INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Crear tabla para el historial de reservas
CREATE TABLE Reservas_Historial (
    id_historial INT PRIMARY KEY,
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

-- Deshabilitamos los horarios que no pueden reservarse los días de semana
UPDATE Canchas
SET hora_semana = NULL, hora_fin_semana = NULL
WHERE dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')
  AND hora_semana BETWEEN '09:00:00' AND '15:00:00';
