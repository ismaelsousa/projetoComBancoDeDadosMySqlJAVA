CREATE DATABASE  IF NOT EXISTS `condominio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `condominio`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: condominio
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

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
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluguel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_apartamento` int(11) DEFAULT NULL,
  `id_contrato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_apartamento` (`id_apartamento`),
  KEY `id_contrato` (`id_contrato`),
  CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`id_apartamento`) REFERENCES `apartamento` (`id`),
  CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
INSERT INTO `aluguel` VALUES (4,2,8),(5,2,8),(6,3,8),(7,5,13);
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qtd_quarto` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_condominio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_condominio` (`id_condominio`),
  CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`id_condominio`) REFERENCES `condominio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
INSERT INTO `apartamento` VALUES (2,5,'Alugado',1),(3,2,'Alugado',1),(4,5,'vazio',3),(5,2,'Alugado',4);
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condominio`
--

DROP TABLE IF EXISTS `condominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condominio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_locador` int(11) DEFAULT NULL,
  `rua` varchar(20) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_locador` (`id_locador`),
  CONSTRAINT `condominio_ibfk_1` FOREIGN KEY (`id_locador`) REFERENCES `locador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominio`
--

LOCK TABLES `condominio` WRITE;
/*!40000 ALTER TABLE `condominio` DISABLE KEYS */;
INSERT INTO `condominio` VALUES (1,3,'catumbela',217),(2,2,'jurema 2',2),(3,3,'russas',117),(4,10,'matia neto',967);
/*!40000 ALTER TABLE `condominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` varchar(15) DEFAULT NULL,
  `data_fim` varchar(15) DEFAULT NULL,
  `id_locatario` int(11) DEFAULT NULL,
  `id_locador` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_locatario` (`id_locatario`),
  KEY `id_locador` (`id_locador`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_locatario`) REFERENCES `locatario` (`id`),
  CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`id_locador`) REFERENCES `locador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (8,'14/06/2018','18/06/2018',4,2,'Novo contrato'),(9,'13/06/2018','18/06/2019',4,2,'para meu aniversario'),(12,'19','919',4,3,'ss'),(13,'19/03/2019','19/03/2020',6,10,'alugado');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locador`
--

DROP TABLE IF EXISTS `locador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locador`
--

LOCK TABLES `locador` WRITE;
/*!40000 ALTER TABLE `locador` DISABLE KEYS */;
INSERT INTO `locador` VALUES (2,'ismaelel',1,'(88) 9393'),(3,'max',333,'444444'),(6,'luiz dos peba',813,'88'),(8,'Denilzon',705747832,'94417'),(9,'Gabriel',7865463,'676546679'),(10,'lorin',61112056,'88 994224595'),(11,'novo',8484774,'94847474'),(12,'novo2',484748,'9844747');
/*!40000 ALTER TABLE `locador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locatario`
--

DROP TABLE IF EXISTS `locatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locatario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locatario`
--

LOCK TABLES `locatario` WRITE;
/*!40000 ALTER TABLE `locatario` DISABLE KEYS */;
INSERT INTO `locatario` VALUES (4,'denss',34,'3333'),(5,'ismael',611120563,'8894224595'),(6,'ismael',299282928,'9999889');
/*!40000 ALTER TABLE `locatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidade`
--

DROP TABLE IF EXISTS `mensalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensalidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluguel` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `mes` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aluguel` (`id_aluguel`),
  CONSTRAINT `mensalidade_ibfk_1` FOREIGN KEY (`id_aluguel`) REFERENCES `aluguel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidade`
--

LOCK TABLES `mensalidade` WRITE;
/*!40000 ALTER TABLE `mensalidade` DISABLE KEYS */;
INSERT INTO `mensalidade` VALUES (1,4,500,'pendente','14/06/2018'),(2,7,1000,'pendente','19/04/2019');
/*!40000 ALTER TABLE `mensalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomes`
--

DROP TABLE IF EXISTS `nomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomes` (
  `nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomes`
--

LOCK TABLES `nomes` WRITE;
/*!40000 ALTER TABLE `nomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ismaelsousa1998','ismael'),(2,'daniele@siqueira','daniel');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_apartamento`
--

DROP TABLE IF EXISTS `view_apartamento`;
/*!50001 DROP VIEW IF EXISTS `view_apartamento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_apartamento` AS SELECT 
 1 AS `id`,
 1 AS `qtd_quarto`,
 1 AS `estado`,
 1 AS `id_condominio`,
 1 AS `cid`,
 1 AS `id_locador`,
 1 AS `rua`,
 1 AS `numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_condominio`
--

DROP TABLE IF EXISTS `view_condominio`;
/*!50001 DROP VIEW IF EXISTS `view_condominio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_condominio` AS SELECT 
 1 AS `id`,
 1 AS `id_locador`,
 1 AS `rua`,
 1 AS `numero`,
 1 AS `lid`,
 1 AS `lnome`,
 1 AS `lcpf`,
 1 AS `ltel`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_apartamento`
--

/*!50001 DROP VIEW IF EXISTS `view_apartamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_apartamento` AS select `apartamento`.`id` AS `id`,`apartamento`.`qtd_quarto` AS `qtd_quarto`,`apartamento`.`estado` AS `estado`,`apartamento`.`id_condominio` AS `id_condominio`,`condominio`.`id` AS `cid`,`condominio`.`id_locador` AS `id_locador`,`condominio`.`rua` AS `rua`,`condominio`.`numero` AS `numero` from (`apartamento` join `condominio`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_condominio`
--

/*!50001 DROP VIEW IF EXISTS `view_condominio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_condominio` AS select `condominio`.`id` AS `id`,`condominio`.`id_locador` AS `id_locador`,`condominio`.`rua` AS `rua`,`condominio`.`numero` AS `numero`,`l`.`id` AS `lid`,`l`.`nome` AS `lnome`,`l`.`cpf` AS `lcpf`,`l`.`telefone` AS `ltel` from (`condominio` join `locador` `l`) */;
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

-- Dump completed on 2019-03-27 21:58:41
