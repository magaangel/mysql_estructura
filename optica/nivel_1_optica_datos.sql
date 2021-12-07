CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Raul','Gonzalez','2021-12-04'),(2,'Luisa','Lopez','2021-12-05');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_clientes`
--

DROP TABLE IF EXISTS `datos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_clientes` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_recomendacion` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_cliente_idx` (`id_cliente`),
  KEY `fk_recomendacion_cliente_idx` (`id_recomendacion`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_recomendacion_cliente` FOREIGN KEY (`id_recomendacion`) REFERENCES `recomendacion` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_clientes`
--

LOCK TABLES `datos_clientes` WRITE;
/*!40000 ALTER TABLE `datos_clientes` DISABLE KEYS */;
INSERT INTO `datos_clientes` VALUES (1,1,'independencia, 322',8025,652147362,'raul@email.com',NULL),(2,2,'arago, 120',8030,753961248,'luisa@email.com',1);
/*!40000 ALTER TABLE `datos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_proveedores`
--

DROP TABLE IF EXISTS `datos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_proveedores` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `direccion_calle` varchar(45) DEFAULT NULL,
  `numero_calle` varchar(45) DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `puerta` int DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_datos_idx` (`id_proveedor`),
  CONSTRAINT `fk_datos` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_proveedores`
--

LOCK TABLES `datos_proveedores` WRITE;
/*!40000 ALTER TABLE `datos_proveedores` DISABLE KEYS */;
INSERT INTO `datos_proveedores` VALUES (2,1,'independencia','125','principal',3,'barcleona',8027,'españa',789632541,741256398),(3,2,'arago','480','2',4,'barcelona',8042,'españa',123859674,456968574);
/*!40000 ALTER TABLE `datos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Maria','Lares'),(2,'Jesus','Sanchez');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `id_gafa` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `id_montura` int NOT NULL,
  `graduacion_derecho` double DEFAULT NULL,
  `graduacion_izq` double DEFAULT NULL,
  `color_montura` varchar(45) DEFAULT NULL,
  `color_vidrios` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_gafa`),
  KEY `fk_tipo_montura_idx` (`id_montura`),
  KEY `fk_id_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `fk_tipo_montura` FOREIGN KEY (`id_montura`) REFERENCES `monturas` (`id_montura`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,1,'RayBan',2,0.58,0.75,'negro','transparente',450),(2,2,'Carolina Herrera',1,1,1.5,'dorado','transparentes',500);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monturas`
--

DROP TABLE IF EXISTS `monturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monturas` (
  `id_montura` int NOT NULL AUTO_INCREMENT,
  `tipo_montura` varchar(45) NOT NULL,
  PRIMARY KEY (`id_montura`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monturas`
--

LOCK TABLES `monturas` WRITE;
/*!40000 ALTER TABLE `monturas` DISABLE KEYS */;
INSERT INTO `monturas` VALUES (1,'flotante'),(2,'pasta'),(3,'metalica');
/*!40000 ALTER TABLE `monturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `NIF` varchar(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'gafas_geniales','12345678B'),(2,'gafas a la moda','98741236Y');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendacion`
--

DROP TABLE IF EXISTS `recomendacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendacion` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_recomendacion_idx` (`id_cliente`),
  CONSTRAINT `fk_recomendacion` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendacion`
--

LOCK TABLES `recomendacion` WRITE;
/*!40000 ALTER TABLE `recomendacion` DISABLE KEYS */;
INSERT INTO `recomendacion` VALUES (1,1);
/*!40000 ALTER TABLE `recomendacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_gafa` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_gafa_idx` (`id_gafa`),
  KEY `fk_empleado_idx` (`id_empleado`),
  KEY `fk_cliente_venta_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_gafa` FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id_gafa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1,'2021-12-04'),(2,2,2,2,'2021-12-05');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 20:01:48
