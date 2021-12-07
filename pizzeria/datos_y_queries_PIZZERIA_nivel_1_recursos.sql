CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `bebida_producto`
--

DROP TABLE IF EXISTS `bebida_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebida_producto` (
  `id_bebida` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `imagen` varchar(10000) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_bebida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida_producto`
--

LOCK TABLES `bebida_producto` WRITE;
/*!40000 ALTER TABLE `bebida_producto` DISABLE KEYS */;
INSERT INTO `bebida_producto` VALUES (1,'cocacola','refresco de cola','C://users/pizzaguay/cocacola',1.5);
/*!40000 ALTER TABLE `bebida_producto` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Antonio','Banderas'),(2,'Penelope','Cruz'),(3,'Sofia','Vergara');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_cliente`
--

DROP TABLE IF EXISTS `datos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_cliente` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `id_localidad` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_cliente_idx` (`id_cliente`),
  KEY `fk_localidad_cliente_idx` (`id_localidad`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_localidad_cliente` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_cliente`
--

LOCK TABLES `datos_cliente` WRITE;
/*!40000 ALTER TABLE `datos_cliente` DISABLE KEYS */;
INSERT INTO `datos_cliente` VALUES (1,1,'independencia, 320',8012,2),(2,2,'gracia, 220',8020,2),(3,3,'gran via, 120',28001,7);
/*!40000 ALTER TABLE `datos_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_empleados`
--

DROP TABLE IF EXISTS `datos_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_empleados` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `id_tienda` int NOT NULL,
  `id_puesto` int NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_empleado_idx` (`id_empleado`),
  KEY `fk_tienda_empleado_idx` (`id_tienda`),
  KEY `fk_puesto_empleado_idx` (`id_puesto`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_puesto_empleado` FOREIGN KEY (`id_puesto`) REFERENCES `puestos_trabajo` (`id_puesto`),
  CONSTRAINT `fk_tienda_empleado` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_empleados`
--

LOCK TABLES `datos_empleados` WRITE;
/*!40000 ALTER TABLE `datos_empleados` DISABLE KEYS */;
INSERT INTO `datos_empleados` VALUES (1,1,1,2,'arago, 220',456987532),(2,2,1,1,'gracia, 245',159853624),(3,3,2,2,'gran via, 500',426987530);
/*!40000 ALTER TABLE `datos_empleados` ENABLE KEYS */;
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
  `NIF` varchar(45) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Jose','Perez','1265984M'),(2,'Lola','Lopez','7485962N'),(3,'Luisa','Ballestero','2536987J');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega_domicilio`
--

DROP TABLE IF EXISTS `entrega_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega_domicilio` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_pedido` int NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `fk_empleado_entrega_idx` (`id_empleado`),
  KEY `fk_pedido_entrega_idx` (`id_pedido`),
  CONSTRAINT `fk_empleado_entrega` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_pedido_entrega` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_domicilio`
--

LOCK TABLES `entrega_domicilio` WRITE;
/*!40000 ALTER TABLE `entrega_domicilio` DISABLE KEYS */;
INSERT INTO `entrega_domicilio` VALUES (1,1,'2021-12-01 00:00:00',1),(2,1,'2021-12-02 00:00:00',2),(3,3,'2021-12-02 00:00:00',3);
/*!40000 ALTER TABLE `entrega_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamburguesa_producto`
--

DROP TABLE IF EXISTS `hamburguesa_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamburguesa_producto` (
  `id_hamburguesa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `imagen` varchar(10000) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_hamburguesa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamburguesa_producto`
--

LOCK TABLES `hamburguesa_producto` WRITE;
/*!40000 ALTER TABLE `hamburguesa_producto` DISABLE KEYS */;
INSERT INTO `hamburguesa_producto` VALUES (1,'clasica','ternera, queso, tomate, lechuga','C://users/pizzaguay/hamburguesa',10);
/*!40000 ALTER TABLE `hamburguesa_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id_localidad` int NOT NULL AUTO_INCREMENT,
  `id_provincia` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_localidad`),
  KEY `fk_provincia_idx` (`id_provincia`),
  CONSTRAINT `fk_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,1,'Badalona'),(2,1,'Barcelona'),(3,1,'Barbera del Valles'),(4,1,'Cornella de Llobragat'),(5,2,'Alcala de Henares'),(6,2,'Alcobendas‎'),(7,2,'Madrid');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad_entrega`
--

DROP TABLE IF EXISTS `modalidad_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidad_entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `tipo_entrega` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad_entrega`
--

LOCK TABLES `modalidad_entrega` WRITE;
/*!40000 ALTER TABLE `modalidad_entrega` DISABLE KEYS */;
INSERT INTO `modalidad_entrega` VALUES (1,'domicilio'),(2,'recoger_tienda');
/*!40000 ALTER TABLE `modalidad_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_pizza` int DEFAULT NULL,
  `id_pizza_2` int DEFAULT NULL,
  `cantidad_pizza` int DEFAULT NULL,
  `id_bebida` int DEFAULT NULL,
  `id_bebida_2` int DEFAULT NULL,
  `cantidad_bebida` int DEFAULT NULL,
  `id_hamburguesa` int DEFAULT NULL,
  `id_hamburguesa_2` int DEFAULT NULL,
  `cantidad_hamburguesa` int DEFAULT NULL,
  `precio_total` double DEFAULT NULL,
  `id_tienda` int DEFAULT NULL,
  `id_modalidad_entrega` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente_idx` (`id_cliente`),
  KEY `fk_entrega_producto_idx` (`id_pizza`),
  KEY `fk_tienda_pedido_idx` (`id_tienda`),
  KEY `fk_producto3_pedido_idx` (`id_bebida`),
  KEY `fk_producto5_pedido_idx` (`id_hamburguesa`),
  KEY `fk_modalidad_entrega_pedido_idx` (`id_modalidad_entrega`),
  KEY `fk_pizza2_pedido_idx` (`id_pizza_2`),
  KEY `fk_bebida2_pedido_idx` (`id_bebida_2`),
  KEY `fk_hamburguesa2_pedido_idx` (`id_hamburguesa_2`),
  CONSTRAINT `fk_bebida2_pedido` FOREIGN KEY (`id_bebida_2`) REFERENCES `bebida_producto` (`id_bebida`),
  CONSTRAINT `fk_bebida_pedido` FOREIGN KEY (`id_bebida`) REFERENCES `bebida_producto` (`id_bebida`),
  CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_hamburguesa2_pedido` FOREIGN KEY (`id_hamburguesa_2`) REFERENCES `hamburguesa_producto` (`id_hamburguesa`),
  CONSTRAINT `fk_hamburguesa_pedido` FOREIGN KEY (`id_hamburguesa`) REFERENCES `hamburguesa_producto` (`id_hamburguesa`),
  CONSTRAINT `fk_modalidad_entrega_pedido` FOREIGN KEY (`id_modalidad_entrega`) REFERENCES `modalidad_entrega` (`id_entrega`),
  CONSTRAINT `fk_pizza2_pedido` FOREIGN KEY (`id_pizza_2`) REFERENCES `pizza_producto` (`id_pizza`),
  CONSTRAINT `fk_pizza_pedido` FOREIGN KEY (`id_pizza`) REFERENCES `pizza_producto` (`id_pizza`),
  CONSTRAINT `fk_tienda_pedido` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2021-12-01 00:00:00',1,1,2,1,1,2,1,NULL,1,23,1,1),(2,2,'2021-12-02 00:00:00',1,NULL,1,1,NULL,1,1,NULL,1,21.5,1,1),(3,3,'2021-12-02 00:00:00',NULL,NULL,NULL,1,1,2,1,1,2,23,2,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_producto`
--

DROP TABLE IF EXISTS `pizza_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_producto` (
  `id_pizza` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `imagen` varchar(10000) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_producto`
--

LOCK TABLES `pizza_producto` WRITE;
/*!40000 ALTER TABLE `pizza_producto` DISABLE KEYS */;
INSERT INTO `pizza_producto` VALUES (1,'margarita','salsa, queso','C://users/tiendaguay/margarita',10);
/*!40000 ALTER TABLE `pizza_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Barcelona'),(2,'Madrid');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos_trabajo`
--

DROP TABLE IF EXISTS `puestos_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos_trabajo` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos_trabajo`
--

LOCK TABLES `puestos_trabajo` WRITE;
/*!40000 ALTER TABLE `puestos_trabajo` DISABLE KEYS */;
INSERT INTO `puestos_trabajo` VALUES (1,'cocinero'),(2,'repartidor');
/*!40000 ALTER TABLE `puestos_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `id_tienda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  `id_localidad` int DEFAULT NULL,
  PRIMARY KEY (`id_tienda`),
  KEY `fk_provincia_tienda_idx` (`id_provincia`),
  KEY `fk_localidad_tienda_idx` (`id_localidad`),
  CONSTRAINT `fk_localidad_tienda` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`),
  CONSTRAINT `fk_provincia_tienda` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'pizza guay independencia',8012,'independencia, 200',1,2),(2,'pizza guay madrid',28001,'gran via, 140',2,7);
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07  1:10:25
