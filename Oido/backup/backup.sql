-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: oido_pl
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idCategory` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `category` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `idCategory_UNIQUE` (`idCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,1),(2,0,2),(3,0,3),(4,3,4),(5,3,5),(6,4,6),(7,4,7),(8,5,66),(9,66,67),(10,5,68),(11,4,69),(12,69,70),(13,69,71),(14,69,72),(15,72,73),(16,72,74),(17,72,75),(18,72,76),(19,72,77),(20,72,78),(21,72,79),(22,72,80),(23,72,81),(24,72,82),(25,72,83),(26,72,84),(27,72,85),(28,72,86),(29,72,87);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_oid`
--

DROP TABLE IF EXISTS `next_oid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_oid` (
  `category` int(10) unsigned NOT NULL,
  `next_oid` int(10) unsigned DEFAULT '11',
  PRIMARY KEY (`category`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_oid`
--

LOCK TABLES `next_oid` WRITE;
/*!40000 ALTER TABLE `next_oid` DISABLE KEYS */;
INSERT INTO `next_oid` VALUES (1,10),(2,10),(3,12),(4,13),(5,13),(6,56),(7,21),(66,11),(67,10),(68,10),(69,13),(70,10),(71,10),(72,25),(73,10),(74,10),(75,10),(76,10),(77,10),(78,10),(79,10),(80,10),(81,10),(82,10),(83,10),(84,10),(85,10),(86,10),(87,10);
/*!40000 ALTER TABLE `next_oid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object`
--

DROP TABLE IF EXISTS `object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object` (
  `idObject` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `oidLast` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idObject`),
  UNIQUE KEY `idObject_UNIQUE` (`idObject`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object`
--

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;
INSERT INTO `object` VALUES (1,0,11,'lingo'),(2,0,11,'word-collection'),(3,0,65,'try'),(4,3,11,'oido'),(5,3,12,'struct'),(6,4,11,'begriff'),(7,4,12,'language'),(8,6,11,'Begriff'),(9,6,12,'Kategorie'),(10,7,11,'Sprache'),(11,6,13,'perception'),(12,6,14,'idea'),(13,6,15,'etwas'),(14,6,16,'vorgang'),(15,6,17,'doing'),(16,6,18,'zustand'),(17,6,19,'eigenschaft'),(18,6,20,'beziehung'),(19,6,21,'zeit'),(20,6,22,'ursache'),(21,6,23,'wirkung'),(22,6,24,'frage'),(23,6,25,'antwort'),(24,6,26,'betrachtung'),(25,6,27,'beschreibung'),(26,6,28,'verstehen'),(27,6,29,'struktur'),(28,6,30,'ordnung'),(29,6,31,'system'),(30,6,32,'wahrnehmung'),(31,6,33,'denken'),(32,6,34,'schlussfolgern'),(33,6,35,'Ã¼berprÃ¼fen'),(34,6,36,'Ã¼berprÃ¼fen'),(35,6,37,'vergleichen'),(36,6,38,'erinnern'),(37,6,39,'richtung'),(38,6,40,'bewegung'),(39,6,41,'stillstand'),(40,6,42,'wissen'),(41,6,43,'verneinung'),(42,6,44,'bejahung'),(43,6,45,'eigenschaft'),(44,6,46,'kann'),(45,6,47,'teil'),(46,6,48,'ganze'),(47,6,49,'raum'),(48,7,12,'sprechen'),(49,7,13,'hÃ¶ren'),(50,7,14,'artikulieren'),(51,6,50,'kommunikation'),(52,6,51,'empfinden'),(53,7,15,'aussage'),(54,7,16,'wort'),(55,7,17,'satz'),(56,7,18,'nomen'),(57,7,19,'verb'),(58,7,20,'adjektiv'),(59,7,21,'auxiliary'),(60,6,52,'ort'),(61,6,53,'ort'),(62,6,54,'ort'),(63,6,55,'zeitpunkt'),(64,6,56,'platzhalter'),(65,5,11,'tree'),(66,5,12,'communicationStructs'),(67,66,11,'handshake'),(68,5,13,'sermon'),(69,4,13,'oido-struct'),(70,69,11,'aussage-struct'),(71,69,12,'wordtree-struct'),(72,69,13,'aussage-elements'),(73,72,11,'doing-element'),(74,72,12,'state-element'),(75,72,13,'can-element'),(76,72,14,'owns-element'),(77,72,15,'attribute-element'),(78,72,16,'member-element'),(79,72,17,'object-elements'),(80,72,18,'actor-element'),(81,72,19,'orts-element'),(82,72,20,'beziehungs-element'),(83,72,21,'zeit-element'),(84,72,22,'reason-element'),(85,72,23,'purpose-element'),(86,72,24,'link-element'),(87,72,25,'sequence-element');
/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oid_table`
--

DROP TABLE IF EXISTS `oid_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oid_table` (
  `oid` varchar(100) NOT NULL,
  `idObject` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oid_table`
--

LOCK TABLES `oid_table` WRITE;
/*!40000 ALTER TABLE `oid_table` DISABLE KEYS */;
INSERT INTO `oid_table` VALUES ('128.128.63.11',1),('128.128.128.11',2),('128.65',3),('128.65.11',4),('128.65.12',5),('128.65.11.11',6),('128.65.11.12',7),('128.65.11.11.11',8),('128.65.11.11.12',9),('128.65.11.12.11',10),('128.65.11.11.13',11),('128.65.11.11.14',12),('128.65.11.11.15',13),('128.65.11.11.16',14),('128.65.11.11.17',15),('128.65.11.11.18',16),('128.65.11.11.19',17),('128.65.11.11.20',18),('128.65.11.11.21',19),('128.65.11.11.22',20),('128.65.11.11.23',21),('128.65.11.11.24',22),('128.65.11.11.25',23),('128.65.11.11.26',24),('128.65.11.11.27',25),('128.65.11.11.28',26),('128.65.11.11.29',27),('128.65.11.11.30',28),('128.65.11.11.31',29),('128.65.11.11.32',30),('128.65.11.11.33',31),('128.65.11.11.34',32),('128.65.11.11.35',33),('128.65.11.11.36',34),('128.65.11.11.37',35),('128.65.11.11.38',36),('128.65.11.11.39',37),('128.65.11.11.40',38),('128.65.11.11.41',39),('128.65.11.11.42',40),('128.65.11.11.43',41),('128.65.11.11.44',42),('128.65.11.11.45',43),('128.65.11.11.46',44),('128.65.11.11.47',45),('128.65.11.11.48',46),('128.65.11.11.49',47),('128.65.11.12.12',48),('128.65.11.12.13',49),('128.65.11.12.14',50),('128.65.11.11.50',51),('128.65.11.11.51',52),('128.65.11.12.15',53),('128.65.11.12.16',54),('128.65.11.12.17',55),('128.65.11.12.18',56),('128.65.11.12.19',57),('128.65.11.12.20',58),('128.65.11.12.21',59),('128.65.11.11.52',60),('128.65.11.11.53',61),('128.65.11.11.54',62),('128.65.11.11.55',63),('128.65.11.11.56',64),('128.65.12.11',65),('128.65.12.12',66),('128.65.12.12.11',67),('128.65.12.13',68),('128.65.11.13',69),('128.65.11.13.11',70),('128.65.11.13.12',71),('128.65.11.13.13',72),('128.65.11.13.13.11',73),('128.65.11.13.13.12',74),('128.65.11.13.13.13',75),('128.65.11.13.13.14',76),('128.65.11.13.13.15',77),('128.65.11.13.13.16',78),('128.65.11.13.13.17',79),('128.65.11.13.13.18',80),('128.65.11.13.13.19',81),('128.65.11.13.13.20',82),('128.65.11.13.13.21',83),('128.65.11.13.13.22',84),('128.65.11.13.13.23',85),('128.65.11.13.13.24',86),('128.65.11.13.13.25',87);
/*!40000 ALTER TABLE `oid_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `root`
--

DROP TABLE IF EXISTS `root`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `root` (
  `idRoot` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) unsigned NOT NULL,
  `oid` varchar(100) NOT NULL,
  PRIMARY KEY (`idRoot`),
  UNIQUE KEY `idRoot_UNIQUE` (`idRoot`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `root`
--

LOCK TABLES `root` WRITE;
/*!40000 ALTER TABLE `root` DISABLE KEYS */;
INSERT INTO `root` VALUES (1,1,'128.128.63'),(2,2,'128.128.128'),(3,3,'128');
/*!40000 ALTER TABLE `root` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-14 15:47:39
