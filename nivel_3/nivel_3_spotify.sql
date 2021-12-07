CREATE DATABASE  IF NOT EXISTS `spotify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spotify`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `publicacion` date DEFAULT NULL,
  `id_cancion` int DEFAULT NULL,
  `thumbnail` blob,
  PRIMARY KEY (`id_album`),
  KEY `fk_cancion_album_idx` (`id_cancion`),
  CONSTRAINT `fk_cancion_album` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `thumbnail` blob,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_followers`
--

DROP TABLE IF EXISTS `artista_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_followers` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_artista` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_usuario_follow_idx` (`id_usuario`),
  KEY `fk_usuario_artista_idx` (`id_artista`),
  CONSTRAINT `fk_usuario_artista` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  CONSTRAINT `fk_usuario_follow` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_followers`
--

LOCK TABLES `artista_followers` WRITE;
/*!40000 ALTER TABLE `artista_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `id_cancion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `id_artista` int DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `reproducciones` int DEFAULT NULL,
  PRIMARY KEY (`id_cancion`),
  KEY `fk_artista_cancion_idx` (`id_artista`),
  CONSTRAINT `fk_artista_cancion` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_album` int DEFAULT NULL,
  `id_cancion` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_usuario_fav_idx` (`id_usuario`),
  KEY `fk_album_fav_idx` (`id_album`),
  KEY `fk_cancion_idx` (`id_cancion`),
  CONSTRAINT `fk_album_fav` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  CONSTRAINT `fk_cancion` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_usuario_fav` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_premium`
--

DROP TABLE IF EXISTS `pago_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_premium` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_usuario_premium` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_pago_premium_idx` (`id_usuario_premium`),
  CONSTRAINT `fk_pago_premium` FOREIGN KEY (`id_usuario_premium`) REFERENCES `usuarios_premium` (`id_premium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_premium`
--

LOCK TABLES `pago_premium` WRITE;
/*!40000 ALTER TABLE `pago_premium` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `username_paypal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `delete_date` date DEFAULT NULL,
  `estado` enum('activa','eliminada') DEFAULT NULL,
  `cancion` int DEFAULT NULL,
  `cancion2` int DEFAULT NULL,
  `cancion3` int DEFAULT NULL,
  `cancion4` int DEFAULT NULL,
  `cancion5` int DEFAULT NULL,
  `cancion6` int DEFAULT NULL,
  `cancion7` int DEFAULT NULL,
  `cancion8` int DEFAULT NULL,
  `cancion9` int DEFAULT NULL,
  `cancion10` int DEFAULT NULL,
  `cancion11` int DEFAULT NULL,
  `cancion12` int DEFAULT NULL,
  `cancion13` int DEFAULT NULL,
  `cancion14` int DEFAULT NULL,
  `cancion15` int DEFAULT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `fk_playlist_cancion_idx` (`cancion`),
  KEY `fk_c1_idx` (`cancion2`),
  KEY `fk_c3_idx` (`cancion3`),
  KEY `fk_c4_idx` (`cancion4`),
  KEY `fk_c5_idx` (`cancion5`),
  KEY `fk_c6_idx` (`cancion6`),
  KEY `fk_c7_idx` (`cancion7`),
  KEY `fk_c8_idx` (`cancion8`),
  KEY `fk_c9_idx` (`cancion9`),
  KEY `fk_c10_idx` (`cancion10`),
  KEY `fk_c11_idx` (`cancion11`),
  KEY `fk_c12_idx` (`cancion12`),
  KEY `fk_c13_idx` (`cancion13`),
  KEY `fk_14_idx` (`cancion14`),
  KEY `fk_15_idx` (`cancion15`),
  KEY `fk_usuario_playlist_idx` (`id_usuario`),
  CONSTRAINT `fk_14` FOREIGN KEY (`cancion14`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_15` FOREIGN KEY (`cancion15`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c10` FOREIGN KEY (`cancion10`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c11` FOREIGN KEY (`cancion11`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c12` FOREIGN KEY (`cancion12`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c13` FOREIGN KEY (`cancion13`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c2` FOREIGN KEY (`cancion2`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c3` FOREIGN KEY (`cancion3`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c4` FOREIGN KEY (`cancion4`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c5` FOREIGN KEY (`cancion5`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c6` FOREIGN KEY (`cancion6`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c7` FOREIGN KEY (`cancion7`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c8` FOREIGN KEY (`cancion8`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_c9` FOREIGN KEY (`cancion9`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_cancion_playlist` FOREIGN KEY (`cancion`) REFERENCES `canciones` (`id_cancion`),
  CONSTRAINT `fk_usuario_playlist` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_compartida`
--

DROP TABLE IF EXISTS `playlist_compartida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_compartida` (
  `id_playshare` int NOT NULL AUTO_INCREMENT,
  `id_playlist` int DEFAULT NULL,
  `modificacion` date DEFAULT NULL,
  `miembro1` int DEFAULT NULL,
  `miembro2` int DEFAULT NULL,
  `mienbro3` int DEFAULT NULL,
  `miembro4` int DEFAULT NULL,
  `miembre5` int DEFAULT NULL,
  PRIMARY KEY (`id_playshare`),
  KEY `fk_play_playshare_idx` (`id_playlist`),
  KEY `fk_usuario_playshare_idx` (`miembro1`),
  KEY `fk_u_ps2_idx` (`miembro2`),
  KEY `fk_u_ps3_idx` (`mienbro3`),
  KEY `fk_u_ps4_idx` (`miembro4`),
  KEY `fk_u_p5_idx` (`miembre5`),
  CONSTRAINT `fk_play_playshare` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id_playlist`),
  CONSTRAINT `fk_u_p5` FOREIGN KEY (`miembre5`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_u_ps2` FOREIGN KEY (`miembro2`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_u_ps3` FOREIGN KEY (`mienbro3`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_u_ps4` FOREIGN KEY (`miembro4`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_usuario_playshare` FOREIGN KEY (`miembro1`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_compartida`
--

LOCK TABLES `playlist_compartida` WRITE;
/*!40000 ALTER TABLE `playlist_compartida` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_compartida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_credito`
--

DROP TABLE IF EXISTS `tarjeta_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_credito` (
  `id_tc` int NOT NULL AUTO_INCREMENT,
  `num_tc` tinyint DEFAULT NULL,
  `caducidad_ano` tinyint DEFAULT NULL,
  `caducidad_mes` tinyint DEFAULT NULL,
  `codigo_seguridad` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_tc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_credito`
--

LOCK TABLES `tarjeta_credito` WRITE;
/*!40000 ALTER TABLE `tarjeta_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tipo`
--

DROP TABLE IF EXISTS `usuario_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_tipo` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tipo`
--

LOCK TABLES `usuario_tipo` WRITE;
/*!40000 ALTER TABLE `usuario_tipo` DISABLE KEYS */;
INSERT INTO `usuario_tipo` VALUES (1,'free'),(2,'premium');
/*!40000 ALTER TABLE `usuario_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_usuario_tipo` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_nacimietno` date DEFAULT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_tipo_idx` (`id_usuario_tipo`),
  CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`id_usuario_tipo`) REFERENCES `usuario_tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_datos`
--

DROP TABLE IF EXISTS `usuarios_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_datos` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `password` varchar(17) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_usuario_datos_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario_datos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_datos`
--

LOCK TABLES `usuarios_datos` WRITE;
/*!40000 ALTER TABLE `usuarios_datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_premium`
--

DROP TABLE IF EXISTS `usuarios_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_premium` (
  `id_premium` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `alta_servicio` date DEFAULT NULL,
  `renovacion` date DEFAULT NULL,
  `forma_pago` enum('tarjeta credito','paypal') DEFAULT NULL,
  `id_tc` int DEFAULT NULL,
  `id_paypal` int DEFAULT NULL,
  PRIMARY KEY (`id_premium`),
  KEY `fk_usuario_premium_idx` (`id_usuario`),
  KEY `fk_tc_premium_idx` (`id_tc`),
  KEY `fk_paypal_premium_idx` (`id_paypal`),
  CONSTRAINT `fk_paypal_premium` FOREIGN KEY (`id_paypal`) REFERENCES `paypal` (`id_registro`),
  CONSTRAINT `fk_tc_premium` FOREIGN KEY (`id_tc`) REFERENCES `tarjeta_credito` (`id_tc`),
  CONSTRAINT `fk_usuario_premium` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_premium`
--

LOCK TABLES `usuarios_premium` WRITE;
/*!40000 ALTER TABLE `usuarios_premium` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_premium` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02 19:31:23
