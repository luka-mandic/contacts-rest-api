-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: typeqast
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favourite` tinyint(1) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_email_user_id_unique` (`email`,`user_id`),
  KEY `contacts_user_id_foreign` (`user_id`),
  CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'2019-03-24 14:42:41','2019-03-24 14:42:41','Brant','Hill','https://lorempixel.com/640/480/?67244','jarrell89@example.org',1,3),(2,'2019-03-24 14:42:41','2019-03-24 14:45:01','Otto','Breitenberg','https://lorempixel.com/640/480/?29876','haufderhar@example.com',0,3),(3,'2019-03-24 14:42:41','2019-03-24 14:42:41','Brandyn','Homenick','https://lorempixel.com/640/480/?59310','jayce.towne@example.net',0,3),(4,'2019-03-24 14:42:41','2019-03-24 14:42:41','Hilma','Becker','https://lorempixel.com/640/480/?71053','jonatan84@example.net',0,3),(5,'2019-03-24 14:42:41','2019-03-24 14:42:41','Israel','Powlowski','https://lorempixel.com/640/480/?27519','dstoltenberg@example.com',1,3),(6,'2019-03-24 14:42:41','2019-03-24 14:45:08','Samir','Russel','https://lorempixel.com/640/480/?52283','runte.noemi@example.com',0,3),(7,'2019-03-24 14:42:41','2019-03-24 14:42:41','Adelia','Morissette','https://lorempixel.com/640/480/?20392','franecki.vinnie@example.net',1,3),(8,'2019-03-24 14:42:41','2019-03-24 14:42:41','Colt','Reichert','https://lorempixel.com/640/480/?91218','mose50@example.org',1,3),(9,'2019-03-24 14:42:41','2019-03-24 14:42:41','Emmie','Howe','https://lorempixel.com/640/480/?62844','scummerata@example.org',1,3),(10,'2019-03-24 14:42:41','2019-03-24 14:42:41','Stacey','Kihn','https://lorempixel.com/640/480/?99147','whettinger@example.org',0,3),(11,'2019-03-24 14:42:50','2019-03-24 14:42:50','Hubert','Bogisich','https://lorempixel.com/640/480/?54291','romaguera.linwood@example.net',0,4),(12,'2019-03-24 14:42:50','2019-03-24 14:42:50','Ellie','Schinner','https://lorempixel.com/640/480/?94629','kemmer.katelyn@example.net',1,4),(13,'2019-03-24 14:42:50','2019-03-24 14:42:50','Sandrine','Parker','https://lorempixel.com/640/480/?23987','mhayes@example.net',1,4),(14,'2019-03-24 14:42:50','2019-03-24 14:42:50','Fanny','Koepp','https://lorempixel.com/640/480/?17006','wolff.carlie@example.com',0,4),(15,'2019-03-24 14:42:50','2019-03-24 14:42:50','Chester','Graham','https://lorempixel.com/640/480/?33828','grobel@example.com',1,4),(16,'2019-03-24 14:42:50','2019-03-24 14:42:50','Aliyah','Welch','https://lorempixel.com/640/480/?17368','jada.little@example.net',0,4),(17,'2019-03-24 14:42:50','2019-03-24 14:42:50','Tremaine','Torphy','https://lorempixel.com/640/480/?36865','leonor97@example.net',0,4),(18,'2019-03-24 14:42:50','2019-03-24 14:42:50','Minnie','Fahey','https://lorempixel.com/640/480/?13039','mhirthe@example.org',0,4),(19,'2019-03-24 14:42:50','2019-03-24 14:42:50','Adrien','DuBuque','https://lorempixel.com/640/480/?54501','iheidenreich@example.org',1,4),(20,'2019-03-24 14:42:50','2019-03-24 14:42:50','Damien','Jakubowski','https://lorempixel.com/640/480/?12777','ledner.magdalen@example.net',1,4);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_03_15_220437_create_contacts_table',1),(9,'2019_03_15_222010_create_phone_numbers_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('fee94bba57c3bc8b16264640619479552c5c8c814f3b42167a240411f41962404b982f2d20cfaabf',3,1,'token_created_by_login','[]',0,'2019-03-24 14:44:39','2019-03-24 14:44:39','2019-03-25 15:44:39');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Contact List Personal Access Client','b03snQdPtts1ZtAy7VDHwA95VVJ3vY7b6kzOfuVt','http://localhost',1,0,0,'2019-03-24 14:08:58','2019-03-24 14:08:58'),(2,NULL,'Contact List Password Grant Client','UXmUgkZsFizJUZ9Fwvay6HuM8cFTe8UIupmDlFXJ','http://localhost',0,1,0,'2019-03-24 14:08:58','2019-03-24 14:08:58');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-03-24 14:08:58','2019-03-24 14:08:58');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_numbers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_numbers_number_contact_id_unique` (`number`,`contact_id`),
  KEY `phone_numbers_contact_id_foreign` (`contact_id`),
  CONSTRAINT `phone_numbers_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (1,'2019-03-24 14:42:41','2019-03-24 14:42:41','949-272-2788','dolores',1),(2,'2019-03-24 14:42:41','2019-03-24 14:42:41','1-315-287-8648','perspiciatis',1),(3,'2019-03-24 14:42:41','2019-03-24 14:42:41','(854) 826-8199','ducimus',1),(4,'2019-03-24 14:42:41','2019-03-24 14:42:41','(904) 659-4302 x6342','numquam',2),(5,'2019-03-24 14:42:41','2019-03-24 14:42:41','+1 (269) 654-8806','et',2),(6,'2019-03-24 14:42:41','2019-03-24 14:42:41','(259) 685-6597 x54573','inventore',2),(7,'2019-03-24 14:42:41','2019-03-24 14:42:41','902-438-3938 x1310','itaque',3),(8,'2019-03-24 14:42:41','2019-03-24 14:42:41','1-367-758-4748','placeat',3),(9,'2019-03-24 14:42:41','2019-03-24 14:42:41','1-362-994-8692','expedita',3),(10,'2019-03-24 14:42:41','2019-03-24 14:42:41','(365) 620-1246','magnam',4),(11,'2019-03-24 14:42:41','2019-03-24 14:42:41','864.377.0908','nihil',4),(12,'2019-03-24 14:42:41','2019-03-24 14:42:41','+1-658-720-9204','modi',4),(13,'2019-03-24 14:42:41','2019-03-24 14:42:41','(457) 616-0662','dolor',5),(14,'2019-03-24 14:42:41','2019-03-24 14:42:41','+18148374820','vel',5),(15,'2019-03-24 14:42:41','2019-03-24 14:42:41','(326) 822-5248 x82251','quia',5),(16,'2019-03-24 14:42:41','2019-03-24 14:42:41','1-970-448-3842 x199','sunt',6),(17,'2019-03-24 14:42:41','2019-03-24 14:42:41','+12682135752','nulla',6),(18,'2019-03-24 14:42:41','2019-03-24 14:42:41','+1-421-633-7848','explicabo',6),(19,'2019-03-24 14:42:42','2019-03-24 14:42:42','550-204-1664 x409','quidem',7),(20,'2019-03-24 14:42:42','2019-03-24 14:42:42','+1-763-805-5639','consectetur',7),(21,'2019-03-24 14:42:42','2019-03-24 14:42:42','1-728-740-5883','enim',7),(22,'2019-03-24 14:42:42','2019-03-24 14:42:42','(310) 521-5974 x67726','cumque',8),(23,'2019-03-24 14:42:42','2019-03-24 14:42:42','708-587-6374','quis',8),(24,'2019-03-24 14:42:42','2019-03-24 14:42:42','583-913-3444','dolore',8),(25,'2019-03-24 14:42:42','2019-03-24 14:42:42','(793) 815-1517 x2639','repellat',9),(26,'2019-03-24 14:42:42','2019-03-24 14:42:42','+1.610.491.6126','non',9),(27,'2019-03-24 14:42:42','2019-03-24 14:42:42','+1-597-717-4089','architecto',9),(28,'2019-03-24 14:42:42','2019-03-24 14:42:42','856-718-0360','soluta',10),(29,'2019-03-24 14:42:42','2019-03-24 14:42:42','298.272.2882','est',10),(30,'2019-03-24 14:42:42','2019-03-24 14:42:42','+19863164770','rem',10),(31,'2019-03-24 14:42:50','2019-03-24 14:42:50','248-694-1553','quis',11),(32,'2019-03-24 14:42:50','2019-03-24 14:42:50','1-514-689-3767','fugit',11),(33,'2019-03-24 14:42:50','2019-03-24 14:42:50','679.988.8390 x350','quo',11),(34,'2019-03-24 14:42:50','2019-03-24 14:42:51','1-845-907-5393 x033','eligendi',12),(35,'2019-03-24 14:42:50','2019-03-24 14:42:51','+18564263484','qui',12),(36,'2019-03-24 14:42:50','2019-03-24 14:42:51','(432) 879-4071','sint',12),(37,'2019-03-24 14:42:51','2019-03-24 14:42:51','+1-990-972-9482','aspernatur',13),(38,'2019-03-24 14:42:51','2019-03-24 14:42:51','(493) 661-8252','vel',13),(39,'2019-03-24 14:42:51','2019-03-24 14:42:51','+19426760873','qui',13),(40,'2019-03-24 14:42:51','2019-03-24 14:42:51','283.733.1190','qui',14),(41,'2019-03-24 14:42:51','2019-03-24 14:42:51','781-758-9441','neque',14),(42,'2019-03-24 14:42:51','2019-03-24 14:42:51','1-202-888-3956','maxime',14),(43,'2019-03-24 14:42:51','2019-03-24 14:42:51','(507) 597-9640 x7684','itaque',15),(44,'2019-03-24 14:42:51','2019-03-24 14:42:51','(941) 860-5740 x93142','in',15),(45,'2019-03-24 14:42:51','2019-03-24 14:42:51','+1.665.549.5878','ratione',15),(46,'2019-03-24 14:42:51','2019-03-24 14:42:51','1-765-651-7575','quia',16),(47,'2019-03-24 14:42:51','2019-03-24 14:42:51','+12356554279','ut',16),(48,'2019-03-24 14:42:51','2019-03-24 14:42:51','+14298130254','aut',16),(49,'2019-03-24 14:42:51','2019-03-24 14:42:51','1-603-561-5748 x81089','totam',17),(50,'2019-03-24 14:42:51','2019-03-24 14:42:51','1-208-840-3731 x85410','unde',17),(51,'2019-03-24 14:42:51','2019-03-24 14:42:51','(691) 910-1791','dolor',17),(52,'2019-03-24 14:42:51','2019-03-24 14:42:51','587-390-5367','quam',18),(53,'2019-03-24 14:42:51','2019-03-24 14:42:51','+1.942.998.2641','soluta',18),(54,'2019-03-24 14:42:51','2019-03-24 14:42:51','763.394.5290 x840','ut',18),(55,'2019-03-24 14:42:51','2019-03-24 14:42:51','618.638.6634 x271','consequuntur',19),(56,'2019-03-24 14:42:51','2019-03-24 14:42:51','(342) 641-8153 x9703','quae',19),(57,'2019-03-24 14:42:51','2019-03-24 14:42:51','(625) 583-3910 x1282','eveniet',19),(58,'2019-03-24 14:42:51','2019-03-24 14:42:51','1-585-587-6315','in',20),(59,'2019-03-24 14:42:51','2019-03-24 14:42:51','+18966583997','aut',20),(60,'2019-03-24 14:42:51','2019-03-24 14:42:51','727.639.8379','qui',20);
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Test','test@test.com',NULL,'$2y$10$ggUQjsjvaIJLszymn/2OZ.UV0R9Smr3WGEdIxLuh4/kl.NrG.B/0i',NULL,'2019-03-24 14:43:22','2019-03-24 14:43:22'),(4,'test2','test2@test.com',NULL,'$2y$10$XZYzoreDt8fZdh4iIfs3aOUV3nwC3wI1BkwOgaFRvFAG27E7PIuRu',NULL,'2019-03-24 14:43:32','2019-03-24 14:43:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-24 18:19:51
