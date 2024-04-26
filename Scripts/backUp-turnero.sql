-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: turnero
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Canchas`
--

DROP TABLE IF EXISTS `Canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canchas` (
  `id_cancha` int NOT NULL AUTO_INCREMENT,
  `id_deporte` int NOT NULL,
  `nombre_cancha` varchar(255) NOT NULL,
  `hora_semana` time DEFAULT NULL,
  `hora_fin_semana` time DEFAULT NULL,
  `dia_semana` varchar(10) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cancha`),
  KEY `id_deporte` (`id_deporte`),
  CONSTRAINT `canchas_ibfk_1` FOREIGN KEY (`id_deporte`) REFERENCES `Deportes` (`id_deporte`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canchas`
--

LOCK TABLES `Canchas` WRITE;
/*!40000 ALTER TABLE `Canchas` DISABLE KEYS */;
INSERT INTO `Canchas` VALUES (1,1,'Futbol 11',NULL,NULL,NULL,0),(2,1,'Futbol 7',NULL,NULL,NULL,0),(3,1,'Futbol 5',NULL,NULL,NULL,0),(4,2,'Alta',NULL,NULL,NULL,0),(5,2,'Baja',NULL,NULL,NULL,0),(6,3,'Cancha 1',NULL,NULL,NULL,0),(7,3,'Cancha 2',NULL,NULL,NULL,0),(8,3,'Cancha 3',NULL,NULL,NULL,0),(9,3,'Cancha 4',NULL,NULL,NULL,0),(10,4,'Cancha A',NULL,NULL,NULL,0),(11,4,'Cancha B',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `Canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deportes`
--

DROP TABLE IF EXISTS `Deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deportes` (
  `id_deporte` int NOT NULL AUTO_INCREMENT,
  `nombre_deporte` varchar(255) NOT NULL,
  PRIMARY KEY (`id_deporte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deportes`
--

LOCK TABLES `Deportes` WRITE;
/*!40000 ALTER TABLE `Deportes` DISABLE KEYS */;
INSERT INTO `Deportes` VALUES (1,'Futbol'),(2,'Tenis'),(3,'Paddle'),(4,'Squash');
/*!40000 ALTER TABLE `Deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamiento`
--

DROP TABLE IF EXISTS `Equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamiento` (
  `id_equipamiento` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(255) NOT NULL,
  `id_cancha` int NOT NULL,
  PRIMARY KEY (`id_equipamiento`),
  KEY `id_cancha` (`id_cancha`),
  CONSTRAINT `equipamiento_ibfk_1` FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamiento`
--

LOCK TABLES `Equipamiento` WRITE;
/*!40000 ALTER TABLE `Equipamiento` DISABLE KEYS */;
INSERT INTO `Equipamiento` VALUES (1,'2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco',1),(2,'2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco',2),(3,'2 pelotas de Fútbol, 1 silvato de arbitro, 3 redes de arco',3),(4,'2 redes de Tenis',4),(5,'2 redes de Tenis',5),(6,'1 red, 2 Paletas de Pádel, 3 pelotas de padel',6),(7,'1 red, 2 Paletas de Pádel, 3 pelotas de padel',7),(8,'1 red, 2 Paletas de Pádel, 3 pelotas de padel',8),(9,'1 red, 2 Paletas de Pádel, 3 pelotas de padel',9),(10,'2 pelotas de Squash',10),(11,'2 pelotas de Squash',11);
/*!40000 ALTER TABLE `Equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipos`
--

DROP TABLE IF EXISTS `Equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipos`
--

LOCK TABLES `Equipos` WRITE;
/*!40000 ALTER TABLE `Equipos` DISABLE KEYS */;
INSERT INTO `Equipos` VALUES (1,'Pumas','../assets/img/logo/pumas_logo.png'),(2,'Galaxies','../assets/img/logo/Galaxies_logo.png'),(3,'Inter Miami','../assets/img/logo/Inter_miami_logo.png'),(4,'Juventus','../assets/img/logo/Juventus_logo.png');
/*!40000 ALTER TABLE `Equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados_Reservas`
--

DROP TABLE IF EXISTS `Estados_Reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados_Reservas` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` enum('Pendiente','Confirmada','Cancelada') NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados_Reservas`
--

LOCK TABLES `Estados_Reservas` WRITE;
/*!40000 ALTER TABLE `Estados_Reservas` DISABLE KEYS */;
INSERT INTO `Estados_Reservas` VALUES (1,'Pendiente','Reserva creada pero aún no ha sido confirmada.'),(2,'Confirmada','Reserva ha sido confirmada por el usuario o el sistema.'),(3,'Cancelada','Reserva ha sido cancelada por usuario o sistema por alguna razón.');
/*!40000 ALTER TABLE `Estados_Reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eventos`
--

DROP TABLE IF EXISTS `Eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eventos`
--

LOCK TABLES `Eventos` WRITE;
/*!40000 ALTER TABLE `Eventos` DISABLE KEYS */;
INSERT INTO `Eventos` VALUES (1,'Torneo Colegio de abogados','2024-04-10'),(2,'Torneo Primavera Mujeres','2024-05-15'),(3,'Torneo Paleta de oro','2024-06-20');
/*!40000 ALTER TABLE `Eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logEvents`
--

DROP TABLE IF EXISTS `logEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logEvents` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tipo_accion` varchar(20) DEFAULT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `correo_anterior` varchar(60) DEFAULT NULL,
  `correo_nuevo` varchar(60) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logEvents`
--

LOCK TABLES `logEvents` WRITE;
/*!40000 ALTER TABLE `logEvents` DISABLE KEYS */;
INSERT INTO `logEvents` VALUES (1,'UPDATE','Usuarios','charlyrod@example.com','carlitosrod@example.com','root@localhost','2024-04-24 19:40:06'),(2,'UPDATE','Usuarios','carlitosrod@example.com','charlyrod@example.com','root@localhost','2024-04-24 19:40:06');
/*!40000 ALTER TABLE `logEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logGeneral`
--

DROP TABLE IF EXISTS `logGeneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logGeneral` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tipo_accion` varchar(20) DEFAULT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `apellido_usuario` varchar(255) DEFAULT NULL,
  `dni_usuario` varchar(20) DEFAULT NULL,
  `correo_usuario` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logGeneral`
--

LOCK TABLES `logGeneral` WRITE;
/*!40000 ALTER TABLE `logGeneral` DISABLE KEYS */;
/*!40000 ALTER TABLE `logGeneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificaciones`
--

DROP TABLE IF EXISTS `Notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificaciones` (
  `id_notificacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `mensaje` text,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificaciones`
--

LOCK TABLES `Notificaciones` WRITE;
/*!40000 ALTER TABLE `Notificaciones` DISABLE KEYS */;
INSERT INTO `Notificaciones` VALUES (1,8,'Recordá que mañana tenes una reserva','2024-04-24 19:31:22'),(2,9,'Actualización de horario sobre tu evento próximo','2024-04-24 19:31:22'),(3,3,'Oferta especial para tu próximo alquiler de cancha','2024-04-24 19:31:22'),(4,4,'Tu pago se realizó con éxito','2024-04-24 19:31:22'),(5,5,'Tu reserva ha sido confirmada','2024-04-24 19:31:22');
/*!40000 ALTER TABLE `Notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos`
--

DROP TABLE IF EXISTS `Pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos`
--

LOCK TABLES `Pagos` WRITE;
/*!40000 ALTER TABLE `Pagos` DISABLE KEYS */;
INSERT INTO `Pagos` VALUES (1,2,4800.00,'2024-04-24 19:31:22'),(2,3,3500.00,'2024-04-24 19:31:22'),(3,5,2000.00,'2024-04-24 19:31:22'),(4,8,5500.00,'2024-04-24 19:31:22'),(5,4,4200.00,'2024-04-24 19:31:22'),(6,6,4800.00,'2024-04-24 19:31:22'),(7,3,3000.00,'2024-04-24 19:31:22'),(8,7,3700.00,'2024-04-24 19:31:22'),(9,4,6000.00,'2024-04-24 19:31:22'),(10,1,4300.00,'2024-04-24 19:31:22'),(11,9,2500.00,'2024-04-24 19:31:22'),(12,11,3800.00,'2024-04-24 19:31:22'),(13,4,3200.00,'2024-04-24 19:31:22'),(14,14,4900.00,'2024-04-24 19:31:22'),(15,10,5100.00,'2024-04-24 19:31:22');
/*!40000 ALTER TABLE `Pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pagos_por_usuario`
--

DROP TABLE IF EXISTS `pagos_por_usuario`;
/*!50001 DROP VIEW IF EXISTS `pagos_por_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pagos_por_usuario` AS SELECT 
 1 AS `dni`,
 1 AS `apellido`,
 1 AS `nombre`,
 1 AS `monto`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Reservas`
--

DROP TABLE IF EXISTS `Reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_cancha` int NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  `fecha_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `id_estado` int NOT NULL,
  `id_usuario_reservante` int NOT NULL,
  `id_usuario_aceptante` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_reservante` (`id_usuario_reservante`),
  KEY `id_usuario_aceptante` (`id_usuario_aceptante`),
  KEY `id_cancha` (`id_cancha`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_usuario_reservante`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_usuario_aceptante`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reservas_ibfk_4` FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`),
  CONSTRAINT `reservas_ibfk_5` FOREIGN KEY (`id_estado`) REFERENCES `Estados_Reservas` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservas`
--

LOCK TABLES `Reservas` WRITE;
/*!40000 ALTER TABLE `Reservas` DISABLE KEYS */;
INSERT INTO `Reservas` VALUES (1,2,1,'2024-04-24 19:31:22','2024-03-04','20:00:00',2,2,NULL),(2,5,3,'2024-04-24 19:31:22','2024-03-16','19:00:00',2,5,NULL),(3,7,6,'2024-04-24 19:31:22','2024-03-20','20:00:00',2,7,NULL),(4,3,4,'2024-04-24 19:31:22','2024-03-22','21:00:00',1,3,NULL),(5,8,7,'2024-04-24 19:31:22','2024-03-28','19:00:00',2,8,NULL),(6,4,9,'2024-04-24 19:31:22','2024-04-03','18:00:00',1,4,NULL),(7,10,1,'2024-04-24 19:31:22','2024-04-05','17:00:00',2,10,NULL),(8,12,3,'2024-04-24 19:31:22','2024-04-05','15:00:00',2,12,NULL),(9,4,2,'2024-04-24 19:31:22','2024-04-10','19:00:00',3,4,NULL),(10,8,8,'2024-04-24 19:31:22','2024-04-10','20:00:00',3,8,NULL);
/*!40000 ALTER TABLE `Reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservas_Historial`
--

DROP TABLE IF EXISTS `Reservas_Historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservas_Historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_usuario_reservante` int NOT NULL,
  `id_usuario_aceptante` int NOT NULL,
  `id_cancha` int NOT NULL,
  `fecha` date NOT NULL,
  `hora_semana` time DEFAULT NULL,
  `hora_fin_semana` time DEFAULT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_usuario_reservante` (`id_usuario_reservante`),
  KEY `id_usuario_aceptante` (`id_usuario_aceptante`),
  KEY `id_cancha` (`id_cancha`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `reservas_historial_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `Reservas` (`id_reserva`),
  CONSTRAINT `reservas_historial_ibfk_2` FOREIGN KEY (`id_usuario_reservante`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reservas_historial_ibfk_3` FOREIGN KEY (`id_usuario_aceptante`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reservas_historial_ibfk_4` FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`),
  CONSTRAINT `reservas_historial_ibfk_5` FOREIGN KEY (`id_estado`) REFERENCES `Estados_Reservas` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservas_Historial`
--

LOCK TABLES `Reservas_Historial` WRITE;
/*!40000 ALTER TABLE `Reservas_Historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservas_Historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservas_por_fecha`
--

DROP TABLE IF EXISTS `reservas_por_fecha`;
/*!50001 DROP VIEW IF EXISTS `reservas_por_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservas_por_fecha` AS SELECT 
 1 AS `fecha_creacion`,
 1 AS `cantidad_reservas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reservas_por_usuario`
--

DROP TABLE IF EXISTS `reservas_por_usuario`;
/*!50001 DROP VIEW IF EXISTS `reservas_por_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservas_por_usuario` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `dni`,
 1 AS `fecha_creacion`,
 1 AS `hora_reserva`,
 1 AS `nombre_cancha`,
 1 AS `id_cancha`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_cancha` int NOT NULL,
  `fecha` date NOT NULL,
  `calificacion` enum('1','2','3','4','5') DEFAULT NULL,
  `comentario` text,
  PRIMARY KEY (`id_review`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cancha` (`id_cancha`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,3,1,'2024-04-24','4','Excelente cancha, muy bien mantenida.'),(2,14,5,'2024-04-24','5','Muy buena experiencia en la cancha');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarifas`
--

DROP TABLE IF EXISTS `Tarifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tarifas` (
  `id_tarifa` int NOT NULL AUTO_INCREMENT,
  `id_cancha` int NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`),
  KEY `id_cancha` (`id_cancha`),
  CONSTRAINT `tarifas_ibfk_1` FOREIGN KEY (`id_cancha`) REFERENCES `Canchas` (`id_cancha`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarifas`
--

LOCK TABLES `Tarifas` WRITE;
/*!40000 ALTER TABLE `Tarifas` DISABLE KEYS */;
INSERT INTO `Tarifas` VALUES (1,1,45000.00),(2,2,30000.00),(3,3,20000.00),(4,4,12000.00),(5,5,12000.00),(6,6,10000.00),(7,7,10000.00),(8,8,10000.00),(9,9,10000.00),(10,10,7000.00),(11,11,7000.00);
/*!40000 ALTER TABLE `Tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `contrasena_confirm` varchar(255) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Juan','Pérez','43098345','juan@example.com','contraseña123','contraseña123','2024-04-24'),(2,'María','Gómez','23456789','maria@example.com','contraseña123','contraseña123','2024-04-24'),(3,'Carlos','Rodríguez','34567890','charlyrod@example.com','contraseña123','contraseña123','2024-04-24'),(4,'Ana','Martínez','45678901','ana@example.com','contraseña123','contraseña123','2024-04-24'),(5,'Luis','García','36789012','luis@example.com','contraseña123','contraseña123','2024-04-24'),(6,'Laura','Fernández','37890123','laura@example.com','contraseña123','contraseña123','2024-04-24'),(7,'Javier','López','38901234','javier@example.com','contraseña123','contraseña123','2024-04-24'),(8,'Andrea','Sánchez','29812345','andrea@example.com','contraseña123','contraseña123','2024-04-24'),(9,'Pablo','Torres','40129456','pablo@example.com','contraseña123','contraseña123','2024-04-24'),(10,'Marta','Díaz','41334667','marta@example.com','contraseña123','contraseña123','2024-04-24'),(11,'Diego','Ruiz','31226344','diego@example.com','contraseña123','contraseña123','2024-04-24'),(12,'Lucía','Navarro','42364455','lucia@example.com','contraseña123','contraseña123','2024-04-24'),(13,'Sergio','Romero','23455566','sergio@example.com','contraseña123','contraseña123','2024-04-24'),(14,'Paula','Jiménez','44546677','paula@example.com','contraseña123','contraseña123','2024-04-24'),(15,'Andrés','González','35665488','andres@example.com','contraseña123','contraseña123','2024-04-24'),(16,'Roberto','Hernández','36765499','roberto@example.com','contraseña123','contraseña123','2024-04-24'),(17,'Elena','Santos','37885640','elena@example.com','contraseña123','contraseña123','2024-04-24'),(18,'Hugo','Moreno','38993241','hugo@example.com','contraseña123','contraseña123','2024-04-24'),(19,'Carolina','Castillo','39098342','carolina@example.com','contraseña123','contraseña123','2024-04-24'),(20,'Martín','Rojas','40198363','martin@example.com','contraseña123','contraseña123','2024-04-24'),(21,'Silvia','Alvarez','21298344','silvia@example.com','contraseña123','contraseña123','2024-04-24'),(22,'Jorge','Góngora','42309365','jorge@example.com','contraseña123','contraseña123','2024-04-24'),(23,'Natalia','Medina','33497266','natalia@example.com','contraseña123','contraseña123','2024-04-24'),(24,'Alejandro','Suárez','44502647','alejandro@example.com','contraseña123','contraseña123','2024-04-24'),(25,'Florencia','López','4568738','florencia@example.com','contraseña123','contraseña123','2024-04-24');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_LOG_Usuarios` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO logGeneral (tipo_accion, tabla_afectada, usuario, nombre_usuario, apellido_usuario, dni_usuario, correo_usuario)
    VALUES ('INSERT', 'Usuarios', CURRENT_USER(), NEW.nombre, NEW.apellido, NEW.dni, NEW.correo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_UPDATE_CORREO` BEFORE UPDATE ON `usuarios` FOR EACH ROW BEGIN
        IF OLD.correo != NEW.correo THEN
        INSERT INTO logEvents (correo_anterior, correo_nuevo, tipo_accion, tabla_afectada, usuario)
        VALUES (OLD.correo, NEW.correo, 'UPDATE', 'Usuarios', CURRENT_USER());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `usuarios_con_mas_de_un_equipo`
--

DROP TABLE IF EXISTS `usuarios_con_mas_de_un_equipo`;
/*!50001 DROP VIEW IF EXISTS `usuarios_con_mas_de_un_equipo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuarios_con_mas_de_un_equipo` AS SELECT 
 1 AS `apellido`,
 1 AS `nombre`,
 1 AS `equipos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Usuarios_Equipos`
--

DROP TABLE IF EXISTS `Usuarios_Equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios_Equipos` (
  `id_usuario_equipo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_equipo` int NOT NULL,
  PRIMARY KEY (`id_usuario_equipo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `usuarios_equipos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `usuarios_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `Equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_Equipos`
--

LOCK TABLES `Usuarios_Equipos` WRITE;
/*!40000 ALTER TABLE `Usuarios_Equipos` DISABLE KEYS */;
INSERT INTO `Usuarios_Equipos` VALUES (1,7,1),(2,3,4),(3,10,2),(4,12,4),(5,8,3);
/*!40000 ALTER TABLE `Usuarios_Equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_reservas`
--

DROP TABLE IF EXISTS `vista_reservas`;
/*!50001 DROP VIEW IF EXISTS `vista_reservas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_reservas` AS SELECT 
 1 AS `id_reserva`,
 1 AS `usuario_creador`,
 1 AS `usuario_aceptante`,
 1 AS `id_cancha`,
 1 AS `nombre_cancha`,
 1 AS `fecha_creacion`,
 1 AS `fecha_reserva`,
 1 AS `hora_reserva`,
 1 AS `estado_reserva`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'turnero'
--

--
-- Dumping routines for database 'turnero'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_Contar_Reservas_Por_Mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Contar_Reservas_Por_Mes`(mes INT, año INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad_reservas INT;

    SELECT COUNT(*) INTO cantidad_reservas
    FROM Reservas
    WHERE MONTH(fecha_creacion) = mes AND YEAR(fecha_creacion) = año;

    RETURN cantidad_reservas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_Contar_Usuarios_Registrados_Por_Mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Contar_Usuarios_Registrados_Por_Mes`(mes INT, año INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad_usuarios INT;

    SELECT COUNT(*) INTO cantidad_usuarios
    FROM Usuarios
    WHERE MONTH(fecha_registro) = mes AND YEAR(fecha_registro) = año;

    RETURN cantidad_usuarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Consultar_Pagos_Por_DNI_Y_Rango_Fechas`(
    IN dni_usuario VARCHAR(20),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT Usuarios.apellido, Usuarios.nombre, Pagos.fecha, Pagos.monto
    FROM Pagos
    JOIN Usuarios ON Pagos.id_usuario = Usuarios.id_usuario
    WHERE Usuarios.dni = dni_usuario
    AND DATE(Pagos.fecha) BETWEEN fecha_inicio AND fecha_fin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Generar_Reporte_Ingresos_Por_Mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Generar_Reporte_Ingresos_Por_Mes`(
    IN fecha_inicio DATE, 
    IN fecha_fin DATE
)
BEGIN
    SELECT YEAR(Pagos.fecha) AS año,
           MONTH(Pagos.fecha) AS mes,
           SUM(Pagos.monto) AS ingresos_totales
    FROM Pagos
    WHERE Pagos.fecha BETWEEN fecha_inicio AND fecha_fin
    GROUP BY YEAR(Pagos.fecha), MONTH(Pagos.fecha)
    ORDER BY YEAR(Pagos.fecha), MONTH(Pagos.fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GestionarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GestionarUsuario`(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_dni VARCHAR(20),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_contrasena_confirm VARCHAR(255),
    IN p_fecha_registro DATE
)
BEGIN
    DECLARE user_exists INT;
    DECLARE email_exists INT;

    -- Verificar si el usuario ya existe por su DNI
    SELECT COUNT(*) INTO user_exists FROM Usuarios WHERE dni = p_dni;

    -- Verificar si el correo electrónico ya está en uso
    SELECT COUNT(*) INTO email_exists FROM Usuarios WHERE correo = p_correo;

    IF user_exists > 0 THEN
        -- Si el usuario existe por DNI, devolver mensaje
        SELECT 'El usuario con el DNI proporcionado ya está registrado.' AS mensaje;
    ELSEIF email_exists > 0 THEN
        -- Si el correo electrónico está en uso, devolver mensaje
        SELECT 'El correo electrónico proporcionado ya está en uso.' AS mensaje;
    ELSE
        -- Si el usuario no existe, insertar el registro
        INSERT INTO Usuarios (nombre, apellido, dni, correo, contrasena, contrasena_confirm, fecha_registro)
        VALUES (p_nombre, p_apellido, p_dni, p_correo, p_contrasena, p_contrasena_confirm, p_fecha_registro);
        SELECT 'Usuario insertado correctamente.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `pagos_por_usuario`
--

/*!50001 DROP VIEW IF EXISTS `pagos_por_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pagos_por_usuario` AS select `usuarios`.`dni` AS `dni`,`usuarios`.`apellido` AS `apellido`,`usuarios`.`nombre` AS `nombre`,`pagos`.`monto` AS `monto`,`pagos`.`fecha` AS `fecha` from (`pagos` join `usuarios` on((`pagos`.`id_usuario` = `usuarios`.`id_usuario`))) order by `pagos`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservas_por_fecha`
--

/*!50001 DROP VIEW IF EXISTS `reservas_por_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservas_por_fecha` AS select `reservas`.`fecha_creacion` AS `fecha_creacion`,count(0) AS `cantidad_reservas` from `reservas` group by `reservas`.`fecha_creacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservas_por_usuario`
--

/*!50001 DROP VIEW IF EXISTS `reservas_por_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservas_por_usuario` AS select `usuarios`.`nombre` AS `nombre`,`usuarios`.`apellido` AS `apellido`,`usuarios`.`dni` AS `dni`,`reservas`.`fecha_creacion` AS `fecha_creacion`,`reservas`.`hora_reserva` AS `hora_reserva`,`canchas`.`nombre_cancha` AS `nombre_cancha`,`reservas`.`id_cancha` AS `id_cancha` from ((`reservas` join `usuarios` on((`reservas`.`id_usuario` = `usuarios`.`id_usuario`))) join `canchas` on((`reservas`.`id_cancha` = `canchas`.`id_cancha`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_con_mas_de_un_equipo`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_con_mas_de_un_equipo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_con_mas_de_un_equipo` AS select `usuarios`.`apellido` AS `apellido`,`usuarios`.`nombre` AS `nombre`,group_concat(`equipos`.`nombre_equipo` separator ',') AS `equipos` from ((`usuarios` join `usuarios_equipos` on((`usuarios`.`id_usuario` = `usuarios_equipos`.`id_usuario`))) join `equipos` on((`usuarios_equipos`.`id_equipo` = `equipos`.`id_equipo`))) group by `usuarios`.`apellido`,`usuarios`.`nombre` having (count(`usuarios_equipos`.`id_equipo`) > 1) order by `usuarios`.`apellido`,`usuarios`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_reservas`
--

/*!50001 DROP VIEW IF EXISTS `vista_reservas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_reservas` AS select `reservas`.`id_reserva` AS `id_reserva`,concat(`Usuarios_creador`.`nombre`,' ',`Usuarios_creador`.`apellido`) AS `usuario_creador`,concat(`Usuarios_aceptante`.`nombre`,' ',`Usuarios_aceptante`.`apellido`) AS `usuario_aceptante`,`canchas`.`id_cancha` AS `id_cancha`,`canchas`.`nombre_cancha` AS `nombre_cancha`,`reservas`.`fecha_creacion` AS `fecha_creacion`,`reservas`.`fecha_reserva` AS `fecha_reserva`,`reservas`.`hora_reserva` AS `hora_reserva`,`estados_reservas`.`nombre_estado` AS `estado_reserva` from ((((`reservas` join `usuarios` `Usuarios_creador` on((`reservas`.`id_usuario` = `Usuarios_creador`.`id_usuario`))) left join `usuarios` `Usuarios_aceptante` on((`reservas`.`id_usuario_aceptante` = `Usuarios_aceptante`.`id_usuario`))) join `canchas` on((`reservas`.`id_cancha` = `canchas`.`id_cancha`))) join `estados_reservas` on((`reservas`.`id_estado` = `estados_reservas`.`id_estado`))) order by `reservas`.`fecha_creacion` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 17:52:19
