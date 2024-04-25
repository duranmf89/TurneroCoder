-- Utilizar el esquema 'turnero'
USE turnero;

-- Usuarios: Almacena información de los usuarios del sistema, incluyendo su nombre, apellido, DNI, correo electrónico, contraseña, confirmación de contraseña y fecha de registro.
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
    fecha_registro DATE NOT NULL
);

-- Deportes: Contiene los distintos deportes disponibles en el sistema.
-- Crear tabla Deportes
DROP TABLE IF EXISTS Deportes;
CREATE TABLE IF NOT EXISTS Deportes (
    id_deporte INT PRIMARY KEY AUTO_INCREMENT,
    nombre_deporte VARCHAR(255) NOT NULL
);

-- Canchas: Describe las canchas disponibles para reservar, incluyendo el deporte al que pertenecen, nombre, horarios de disponibilidad, día de la semana y estado de disponibilidad.
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

-- Estados_Reservas: Define los posibles estados de las reservas: Pendiente, Confirmada o Cancelada.
-- Crear tabla Estados_Reservas
DROP TABLE IF EXISTS Estados_Reservas;
CREATE TABLE IF NOT EXISTS Estados_Reservas (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estado ENUM('Pendiente', 'Confirmada', 'Cancelada') NOT NULL,
    descripcion VARCHAR(255)
);

-- Reservas: Es la tabla principal que almacena las reservas realizadas por los usuarios, incluyendo detalles como la cancha reservada, la fecha, el estado, y los usuarios involucrados.
-- Crear tabla Reservas (TABLA DE HECHOS)
DROP TABLE IF EXISTS Reservas;
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha_creacion TIMESTAMP,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    id_estado INT NOT NULL,
    id_usuario_reservante INT NOT NULL,
    id_usuario_aceptante INT
);

-- Equipos: Guarda información sobre los equipos que pueden existir en el sistema.
-- Crear tabla Equipos
DROP TABLE IF EXISTS Equipos;
CREATE TABLE IF NOT EXISTS Equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    avatar VARCHAR(255)
);

-- Usuarios_Equipos: Establece la relación entre usuarios y equipos, permitiendo a los usuarios pertenecer a uno o varios equipos.
-- Crear tabla Usuarios_Equipos
DROP TABLE IF EXISTS Usuarios_Equipos;
CREATE TABLE IF NOT EXISTS Usuarios_Equipos (
    id_usuario_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_equipo INT NOT NULL
);

-- Reservas_Historial: Registra el historial de las reservas realizadas, incluyendo información como fecha, estado, y usuarios involucrados.
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


-- Reviews: Almacena las reseñas o comentarios que los usuarios hacen sobre las canchas.
-- Crear tabla Reviews en lugar de Reseñas
DROP TABLE IF EXISTS Reviews;
CREATE TABLE IF NOT EXISTS Reviews (
    id_review INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha DATE NOT NULL,
    calificacion ENUM('1', '2', '3', '4', '5'),
    comentario TEXT
);

-- Pagos: Registra las transacciones de pagos realizadas por los usuarios.
-- Crear tabla Pagos (TABLA TRANSACCIONAL)
DROP TABLE IF EXISTS Pagos;
CREATE TABLE IF NOT EXISTS Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    monto DECIMAL(10, 2),
    fecha TIMESTAMP
);

-- Equipamiento: Guarda información sobre el equipamiento disponible en las canchas.
-- Crear tabla Equipamiento
DROP TABLE IF EXISTS Equipamiento;
CREATE TABLE IF NOT EXISTS Equipamiento (
    id_equipamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    id_cancha INT NOT NULL
);

-- Notificaciones: Guarda las notificaciones que se le envian a los usuarios, el mensaje y la fecha.
-- Crear tabla Notificaciones
DROP TABLE IF EXISTS Notificaciones;
CREATE TABLE IF NOT EXISTS Notificaciones (
    id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    mensaje TEXT,
    fecha TIMESTAMP
);

-- Tarifas: Define las tarifas asociadas a las canchas para su uso.
-- Crear tabla Tarifas
DROP TABLE IF EXISTS Tarifas;
CREATE TABLE IF NOT EXISTS Tarifas (
    id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    id_cancha INT NOT NULL,
    monto DECIMAL(10, 2)
);

-- Eventos: Guarda los eventos creados por el club deportivo y la fecha de inicio del evento.
-- Crear tabla Eventos
DROP TABLE IF EXISTS Eventos;
CREATE TABLE IF NOT EXISTS Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(255),
    fecha DATE
);


-- Agregar claves foráneas y relaciones
ALTER TABLE Canchas ADD FOREIGN KEY (id_deporte) REFERENCES Deportes(id_deporte);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_reservante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_usuario_aceptante) REFERENCES Usuarios(id_usuario);
ALTER TABLE Reservas ADD FOREIGN KEY (id_cancha) REFERENCES Canchas(id_cancha);
ALTER TABLE Reservas ADD FOREIGN KEY (id_estado) REFERENCES Estados_Reservas(id_estado);
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


