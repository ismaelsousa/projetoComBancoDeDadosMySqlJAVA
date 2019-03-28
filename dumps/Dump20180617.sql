CREATE DATABASE  IF NOT EXISTS `locadoradecarro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `locadoradecarro`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: locadoradecarro
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `cnh` int(11) NOT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'tania',25,1232423,'rua joaquim moreira'),(2,'gabreil',57937,32829,'rua ufc em russas'),(3,'ismael',338339,93838,'rua padre joaquim de menezes'),(4,'denilson',19,74649,'rua padre joaquim de menezes'),(5,'luiz silva',22,23532,'agua fria'),(6,'cristina',30,566644,'agosto xavier');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` int(11) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `emai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'emanuel',33833,'889833838','emanuel@hotmail.com'),(2,'joao ',2332,'883939393','joao@gmail.com'),(3,'Jose sombra',234445,'889933833','sem email');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idVeiculo` int(11) DEFAULT NULL,
  `idFuncionario` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  `horaInicio` varchar(20) DEFAULT NULL,
  `horaFim` varchar(20) DEFAULT NULL,
  `contrato` text,
  `situacao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCliente` (`idCliente`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`id`),
  CONSTRAINT `locacao_ibfk_3` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1,1,1,200,'2018-12-04','2018-12-09','8','8','C/contratos.contr','alugado'),(3,3,3,3,4000,'2018-06-17','2018-06-21','8','19','local','alugado'),(4,4,4,1,748,'2018-06-17','0000-00-00','10','10','pastaContrato','alugado'),(5,5,6,2,2000,'2018-06-17','2018-06-30','11','11','arquivo','alugado'),(6,6,2,3,300,'2018-06-17','2019-06-17','7','7','arquivo','alugado');
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `locacaocompleta`
--

DROP TABLE IF EXISTS `locacaocompleta`;
/*!50001 DROP VIEW IF EXISTS `locacaocompleta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `locacaocompleta` AS SELECT 
 1 AS `idlocacao`,
 1 AS `valor`,
 1 AS `dataInicio`,
 1 AS `dataFim`,
 1 AS `horaInicio`,
 1 AS `horaFim`,
 1 AS `situacao`,
 1 AS `nomeCliente`,
 1 AS `idade`,
 1 AS `modelo`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `custoEstimado` float NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `horaInicio` varchar(20) DEFAULT NULL,
  `horaFim` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,5,1000,'2018-06-18','2018-06-21','8','13');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(20) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `acessorios` text,
  `placa` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'Gol','volks',1998,'ar, vidro eletrico, rodão','fhf-443'),(2,'celta','chevrolet',2000,'completo','hgh-444'),(3,'civic ','honda',2018,'completo','kcs-222'),(4,'corolla','toyota',2006,'completo','jdh-394'),(5,'city','honda',2018,'completo','ncv-989'),(6,'ranger rover','land rover',2018,'completo','nvv-555');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `locacaocompleta`
--

/*!50001 DROP VIEW IF EXISTS `locacaocompleta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `locacaocompleta` AS select `locacao`.`id` AS `idlocacao`,`locacao`.`valor` AS `valor`,`locacao`.`dataInicio` AS `dataInicio`,`locacao`.`dataFim` AS `dataFim`,`locacao`.`horaInicio` AS `horaInicio`,`locacao`.`horaFim` AS `horaFim`,`locacao`.`situacao` AS `situacao`,`cliente`.`nome` AS `nomeCliente`,`cliente`.`idade` AS `idade`,`veiculo`.`modelo` AS `modelo`,`funcionario`.`nome` AS `nome` from (((`locacao` join `cliente`) join `funcionario`) join `veiculo`) where ((`locacao`.`idCliente` = `cliente`.`id`) and (`locacao`.`idVeiculo` = `veiculo`.`id`) and (`locacao`.`idFuncionario` = `funcionario`.`id`)) */;
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

-- Dump completed on 2018-06-17 16:35:50
