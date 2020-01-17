-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: universe_development
-- ------------------------------------------------------
-- Server version	10.3.20-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-01-04 16:08:44.304160','2020-01-04 16:08:44.304160');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galaxies`
--

DROP TABLE IF EXISTS `galaxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galaxies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shape` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `supercluster_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_galaxies_on_supercluster_id` (`supercluster_id`),
  CONSTRAINT `fk_rails_626cc28178` FOREIGN KEY (`supercluster_id`) REFERENCES `superclusters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galaxies`
--

LOCK TABLES `galaxies` WRITE;
/*!40000 ALTER TABLE `galaxies` DISABLE KEYS */;
INSERT INTO `galaxies` VALUES (1,'Andromeda','Spiral','hiclipart.com__1_.png',1000000,'2020-01-04 16:11:24.700304','2020-01-04 16:11:24.700304',1),(2,'Milky way','Spiral','hiclipart.com.png',200000,'2020-01-04 16:11:47.571393','2020-01-04 16:11:47.571393',1);
/*!40000 ALTER TABLE `galaxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `life` tinyint(1) DEFAULT 0,
  `moons` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `star_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_planets_on_star_id` (`star_id`),
  CONSTRAINT `fk_rails_ef9c2584b4` FOREIGN KEY (`star_id`) REFERENCES `stars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
INSERT INTO `planets` VALUES (1,'Mercury',0,0,'hiclipart.com__13_.png',NULL,NULL,1,'2020-01-04 16:20:58.462097','2020-01-04 16:20:58.462097'),(2,'Venus',0,0,'hiclipart.com__8_.png',NULL,NULL,1,'2020-01-04 16:22:04.145267','2020-01-04 16:22:04.145267'),(3,'Earth',1,1,'hiclipart.com__9_.png',NULL,NULL,1,'2020-01-04 16:23:21.338414','2020-01-04 16:23:21.338414'),(4,'Mars',1,2,'580b585b2edbce24c47b2708__1_.png',NULL,NULL,1,'2020-01-04 16:24:16.604171','2020-01-04 16:24:16.604171'),(5,'Jupiter',0,79,'hiclipart.com__14_.png',NULL,NULL,1,'2020-01-04 16:31:28.299972','2020-01-04 16:31:28.299972'),(6,'Saturn',0,82,'hiclipart.com__15_.png',NULL,NULL,1,'2020-01-04 16:34:23.422876','2020-01-04 16:34:23.422876'),(7,'Uranus',0,27,'hiclipart.com__11_.png',NULL,NULL,1,'2020-01-04 16:39:20.247703','2020-01-04 16:39:20.247703'),(8,'Neptune',0,14,'hiclipart.com__10_.png',NULL,NULL,1,'2020-01-04 16:40:05.472272','2020-01-04 16:40:05.472272'),(9,'Pluto',1,15,'hiclipart.com__12_.png',NULL,NULL,1,'2020-01-04 16:41:27.888093','2020-01-04 16:41:27.888093');
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20200103003052'),('20200103003120'),('20200103010758'),('20200103011325'),('20200103050405');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stars` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `galaxy_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stars_on_galaxy_id` (`galaxy_id`),
  CONSTRAINT `fk_rails_344a6fa293` FOREIGN KEY (`galaxy_id`) REFERENCES `galaxies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stars`
--

LOCK TABLES `stars` WRITE;
/*!40000 ALTER TABLE `stars` DISABLE KEYS */;
INSERT INTO `stars` VALUES (1,'Sun','hiclipart.com__5_.png','yellow dwarf',2,'2020-01-04 16:12:09.670337','2020-01-04 16:12:09.670337');
/*!40000 ALTER TABLE `stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superclusters`
--

DROP TABLE IF EXISTS `superclusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superclusters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superclusters`
--

LOCK TABLES `superclusters` WRITE;
/*!40000 ALTER TABLE `superclusters` DISABLE KEYS */;
INSERT INTO `superclusters` VALUES (1,'Virgo supercluster','2020-01-04 16:10:28.290505','2020-01-04 16:10:28.290505'),(2,'Saraswati Supercluster','2020-01-04 16:10:34.274231','2020-01-04 16:10:34.274231'),(3,'Pavo-Indus Supercluster','2020-01-04 16:10:42.584875','2020-01-04 16:10:42.584875');
/*!40000 ALTER TABLE `superclusters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-04 19:59:36
