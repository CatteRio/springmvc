-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: custom
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `premission`
--

DROP TABLE IF EXISTS `premission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premission` (
  `id` int(11) NOT NULL,
  `content` varchar(45) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premission`
--

LOCK TABLES `premission` WRITE;
/*!40000 ALTER TABLE `premission` DISABLE KEYS */;
INSERT INTO `premission` VALUES (1,'管理员管理',NULL),(2,'文章管理',NULL),(3,'系统管理',NULL);
/*!40000 ALTER TABLE `premission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','超级管理员权限',1),(2,'管理员','管理员',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_premission`
--

DROP TABLE IF EXISTS `role_premission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_premission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `premissionid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_premission`
--

LOCK TABLES `role_premission` WRITE;
/*!40000 ALTER TABLE `role_premission` DISABLE KEYS */;
INSERT INTO `role_premission` VALUES (1,1,2),(2,1,1),(9,2,1),(10,2,2);
/*!40000 ALTER TABLE `role_premission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(5,'婷宝宝','hsdfun','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(6,'admiefen','huen','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(7,'admifefn','hjjufen','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(9,'as','hun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(11,'adfefmin','huwdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(12,'adfefmin','hsdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(13,'adfefmin','huasn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(14,'adfefmin','huawsddsn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(15,'adfefmin','husdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(16,'adfefmin','hasddun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(17,'adfefmin','haaswduasdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(18,'adfefmin','huaddwasdsdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(19,'adfefmin','dw','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(20,'adfefmin','huaswdsasn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(21,'adfefmin','haaawadassdsdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(22,'adfefmin','hdsdasdasaun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(23,'adfefmin','huawdasdsdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(24,'adfefmin','haadsddssdasdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','18860902920','417168602@qq.com'),(35,'asdhuh','ahsud','be01f6b82ead522b46473669274ef07b','gTuzzPBuhlqgRe7k','15026482615','asdwd@qq.com'),(36,'asd','dwdd','33cd528298c8715cb06cd2873e7d9c36','n64rEparTVgdlOx3','15023264859','asdwd@qq.com'),(37,'adwd','huanah','8c078991ac912aae9176083ab68bd488','KogkxHpkrhOzBPhM','15026154826','dwdwuw@qq.com'),(41,'yuanyang','yuanyang','7cf1f620fb55653545595b4768e03810','OectJr9cHyZJCGnL','18860902920','417168602@qq.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,1,2),(6,0,1),(7,0,2),(8,0,3),(17,15,1),(18,15,2),(19,15,3),(30,41,1),(31,41,2),(32,41,3),(33,9,1),(34,9,2),(35,9,3),(37,12,1),(38,12,2),(39,13,3),(40,14,2),(41,16,2),(43,6,1),(44,6,3),(45,7,1),(56,5,1),(57,5,2),(58,5,3),(61,11,1),(62,11,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'custom'
--

--
-- Dumping routines for database 'custom'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-23 14:17:42
