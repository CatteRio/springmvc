CREATE DATABASE  IF NOT EXISTS `custom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `custom`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: custom
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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
  `role` varchar(45) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(2,'admisdfn','hfeun','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(3,'admisdfn','hufen','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(4,'admisdfn','husdfn','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(5,'admidfsn','hsdfun','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(6,'admiefen','huen','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(7,'admifefn','hjjufen','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(8,'adfefmin','husfn','admin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(9,'as','hun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(11,'adfefmin','huwdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(12,'adfefmin','hsdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(13,'adfefmin','huasn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(14,'adfefmin','huawsddsn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(15,'adfefmin','husdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(16,'adfefmin','hasddun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(17,'adfefmin','haaswduasdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(18,'adfefmin','huaddwasdsdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(19,'adfefmin','dw','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(20,'adfefmin','huaswdsasn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(21,'adfefmin','haaawadassdsdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(22,'adfefmin','hdsdasdasaun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(23,'adfefmin','huawdasdsdn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(24,'adfefmin','haadsddssdasdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(25,'adfefmin','hsddsdaasddn','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com'),(27,'adfefmin','hsdasasdun','admsin	b5a005539e27a88e692cb88e9c6c9187','WB9KdQmj10WeKyZf','admin','18860902920','417168602@qq.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09 23:39:07
