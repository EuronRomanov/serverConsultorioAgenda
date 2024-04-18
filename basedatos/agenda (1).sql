-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agenda
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `idEvento` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEvento`),
  UNIQUE KEY `idevento_UNIQUE` (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `codPaciente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evento_paciente_idx` (`codPaciente`),
  CONSTRAINT `fk_evento_paciente` FOREIGN KEY (`codPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (34,'2024-02-27 01:58:00','2024-02-27 02:58:00','nueva prueba actualizar datos',18),(35,'2024-02-28 03:17:00','2024-02-28 04:18:00','',38),(36,'2024-02-29 04:45:00','2024-02-29 05:44:00','probando cambio de texto',42),(37,'2024-03-28 02:19:00','2024-03-28 03:20:00','prueba de nuevo proc. almacenado',37),(39,'2024-03-29 13:00:00','2024-03-29 14:01:00','prueba 4 de horas',39),(40,'2024-03-30 13:00:00','2024-03-30 14:00:00','prueba 5',39),(42,'2024-03-28 11:03:00','2024-03-28 12:04:00','probando cambio de fecha',32),(44,'2024-03-27 02:40:00','2024-03-27 05:40:00','nuevo dato',26),(45,'2024-03-30 08:00:00','2024-03-30 09:00:00','',31);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `idPaciente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `lugarNacimiento` varchar(100) DEFAULT NULL,
  `lugarResidencia` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `idpaciente_UNIQUE` (`idPaciente`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,' PABLO MARCELO ABAD NIETO ','1303753618','0990394034','Av. Atahualpa OE1-109 y 10 de Agosto','1998-01-02','Pichincha_Mejia_Gasca','Pichincha_Quito_Ecuatoriana'),(4,'pablo morales','1929309240','4838498348','djsdkjskdjsd','2024-01-11','sdsd','sdsds_dsdsd_sdsdsd'),(5,'Galo rocha','110129239','128918239','dsdsdsd','2019-01-17','','sdsdsd_sdsd_sdsdsd'),(10,'eiza gonzales t','1102943455','2121212122','dsdsd','2019-01-25','dsd','sdsd_sdsd_sddsdsd'),(11,'Pedro coral','1232323323','23232323','ewewe','2024-01-12','ewewewe','wewe_wewe_ewewe'),(12,'Armold Shasergener','09183712333','6565656566','rererere','2024-01-12','rerer','rererer_ererere_rererer'),(13,'silvestre estallone','1234898493','094903434','dsdsd','2019-01-18','dsdsd','sdsdsdsd_sdsds_dsdsd'),(14,'ellion anderson','1192013333','0987474777','dsdsds','2024-01-12','sdsd','sdsd_sdsd_sdsd'),(15,'Alexandra Camacho C','1192015567','0987474777','dsdsds','2024-01-12','sdsd','sdsd_sdsd_sdsd'),(18,'Alfredo Palacios','1099999911','0998989898','av peña nieto y 8 diciembre','2024-01-16','quito','Tungurahua_EL naranjito_Concordia'),(19,'Gerardo Moran','099389238','090993223','av colon y vida nueva','2024-01-16','Quito','Pichincha_Quito_Quitumbe'),(22,'Hernel Valencia','012938483','090993223','av colon y vida nueva','2024-01-16','Quito','Pichincha_Quito_Quitumbe'),(23,'Sofia Copola','057378374','090993223','av colon y vida nueva','2024-01-16','Quito','Pichincha_Quito_Quitumbe'),(24,'cristin dunst','0384848585','0939348383','av colon y 6 de diciembre','1990-01-18','Ecuador','Pichincha_Quito_Quitumbe'),(25,'Merdardo Mejia','0483989582','0994838443','Colon y reina isabel','2024-01-17','Ecuador','Pichincha_Quitumbe_La ecuatoriana'),(26,'Roberto Carlos','0183989582','0994838555','Av amzonas y 8 noviembre','2024-01-17','Ecuador','Pichincha_Quitumbe_La ecuatoriana'),(27,'Ernesto Guevara','0567989582','0994838555','Av amzonas y 8 noviembre','2024-01-17','Ecuador','Pichincha_Quitumbe_La ecuatoriana'),(28,'Juliana Velgrado','1237989582','0994838555','Av amzonas y 8 noviembre','2024-01-17','Ecuador','Pichincha_Quitumbe_La ecuatoriana'),(29,'mario Zimarro','1005989582','0994838555','Av amzonas y 8 noviembre','2024-01-17','Ecuador','Pichincha_Quitumbe_La ecuatoriana'),(30,'Ingrid Betancurt','1019298383','0988833111','6 de diciembre y amazonas','2024-01-17','Ecuador','Pichincha_Quito_Quitumbe'),(31,'Inna Slagado','1093398888','0938483943','asasas','2024-01-17','sasas','asasas_asas_asas'),(32,'Adam Driver','0122223743','0948382821','dsds','2024-01-17','dsdsd','dsd_sdsd_sdsd'),(33,'Jack Black','9022223743','0948382821','dsds','2024-01-17','dsdsd','dsd_sdsd_sdsd'),(34,'Carol Danbers','3044443743','0948382821','dsds','2024-01-17','dsdsd','dsd_sdsd_sdsd'),(35,'Scott Lan','1374833743','0948382800','dsds','2024-01-17','dsdsd','dsd_sdsd_sdsd'),(36,'Lolita Espoito','1011173731','0948382800','dsds','2024-01-17','dsdsd','dsd_sdsd_sdsd'),(37,'Ana Karina','0565273773','0939203992','oe6 y e7','1991-01-16','Ecuador','Pichincha_Quito_Quitumbe'),(38,'Luisa Gonzales','0666273773','0939203992','oe6 y e7','1991-01-16','Ecuador','Pichincha_Quito_Quitumbe'),(39,'Eduardo Gonzalez','1284383832','0939202932','calle sebasatopul','2013-02-01','Quitumbe','Pichincha_Quito_Quitumbe'),(40,'Luis Andrade','0918282822','0999111122','av boluarte y  8 de diciembre','2024-01-18','Quito','Pichincha_Quito_Quitumbe'),(41,'Estes esposito','0100282822','0999111122','av boluarte y  8 de diciembre','2024-01-18','Quito','Pichincha_Quito_Quitumbe'),(42,'Lali Esposito','0122282822','0999111122','av boluarte y  8 de diciembre','2024-01-18','Quito','Pichincha_Quito_Quitumbe'),(45,'Nicolas Maduro','1649304932','0929102911','av orellana y Oe2','2024-01-19','Quito','Pichincha_Quito_Quito'),(48,'Lali MOrena','0333391833','0938299222','av Vagallanes y Colon','2024-01-19','Ecuador','Pichincha_Quito _Quitumbe'),(54,'Nicon Robin','9903827273','0998382823','av maldonado y ds2','2024-01-19','','Imbabura_Deballo_La Magdalena'),(55,'Antoni Blinklen ','0188812717','0929838233','av Amazonas y Orellana','2024-01-19','Ecuador','Pichincha_Quito_Quito'),(58,'Rolando Quiroz','0112333445','0928377771','av orellana y yanzatsa','2024-01-20','Ecuador','Pichincha_Quito_Quitumbe'),(60,'','','','','2024-04-06','','__');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_eventos`
--

DROP TABLE IF EXISTS `view_eventos`;
/*!50001 DROP VIEW IF EXISTS `view_eventos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_eventos` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `start`,
 1 AS `end`,
 1 AS `description`,
 1 AS `codPaciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'agenda'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_actualizarEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizarEvento`(IN idIn int,IN codPacienteIn INT,
IN startIn datetime, IN endIn datetime, In descriptionIn varchar(255),OUT respuesta varchar(100) )
BEGIN
DECLARE numConflicts INT;

    -- Verificar si hay eventos que se crucen en el mismo día
    SELECT COUNT(*)
    INTO numConflicts
    FROM eventos
    WHERE id!=idIn AND  DATE(start) = DATE(startIn)
    AND (
        (startIn >= start AND startIn < end) OR
        (endIn > start AND endIn <= end) OR
        (startIn <= start AND endIn >= end)
    );

-- Si hay conflictos, mostrar un mensaje y no insertar el evento
    IF numConflicts > 0 THEN
       
        set respuesta = 'No se puede actulizar el evento. Existen conflictos de horario con otros eventos en el mismo día.';
    ELSE
        -- Si no hay conflictos, insertar el evento
        update eventos set start=startIn ,end=endIn ,description=descriptionIn ,codPaciente=codPacienteIn 
where id=idIn;
set respuesta = "actualizado correctamente";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_agregarNuevoEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_agregarNuevoEvento`( IN codPacienteIn INT,
IN startIn datetime, IN endIn datetime, In descriptionIn varchar(255),OUT respuesta varchar(100))
BEGIN
DECLARE numConflicts INT;

    -- Verificar si hay eventos que se crucen en el mismo día
    SELECT COUNT(*)
    INTO numConflicts
    FROM eventos
    WHERE DATE(start) = DATE(startIn)
    AND (
        (startIn >= start AND startIn < end) OR
        (endIn > start AND endIn <= end) OR
        (startIn <= start AND endIn >= end)
    );

-- Si hay conflictos, mostrar un mensaje y no insertar el evento
    IF numConflicts > 0 THEN
       
        set respuesta = 'No se puede insertar el evento. Existen conflictos de horario con otros eventos en el mismo día.';
    ELSE
        -- Si no hay conflictos, insertar el evento
        insert into eventos (start,end,description,codPaciente)
values(startIn,endIn,descriptionIn,codPacienteIn);
set respuesta = "ingresado correctamente";
    END IF;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_agregarNuevoPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_agregarNuevoPaciente`( IN nombreIn varchar(255), 
											  IN cedulaIn varchar(20),
                                              IN celularIn varchar(20),
                                              IN direccionIn varchar(255),
                                              IN fechaNacimientoIn date,
                                              IN lugarNacimientoIn varchar(100),
                                              IN lugarResidenciaIn varchar(200),
                                              OUT respuesta varchar(255))
BEGIN

DECLARE duplicateKeyError condition for 1062;

DECLARE EXIT HANDLER FOR duplicateKeyError
BEGIN
SET respuesta ="La cedula o nombre ya existe en la base de datos";
END;

START transaction;
INSERT INTO paciente(nombre,
					cedula,
                    celular,
                    direccion,
                    fechaNacimiento,
                    lugarNacimiento,
                    lugarResidencia) VALUES(nombreIn,
					cedulaIn,
                    celularIn,
                    direccionIn,
                    fechaNacimientoIn,
                    lugarNacimientoIn,
                    lugarResidenciaIn);
	commit;
  SET respuesta ="Registro exitoso";  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_eliminarEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminarEvento`(IN idIn int,OUT respuesta varchar(100))
BEGIN

DECLARE exit handler for not found
begin
set respuesta="El registro no existe";
end;

DECLARE exit handler for sqlexception
begin
set respuesta="Error al intentar eliminar el registro ";
end;


start transaction;
  DELETE FROM `agenda`.`eventos` WHERE id=idIn;

commit;
set respuesta="Registro eliminado exitosamente";


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_eliminarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminarPaciente`(IN idIn int,OUT respuesta varchar(100))
BEGIN
DECLARE exit handler for not found
begin
set respuesta="El registro no existe";
end;

DECLARE exit handler for sqlexception
begin
set respuesta="Error al intentar eliminar el registro ";
end;


start transaction;
  DELETE FROM `agenda`.`paciente` WHERE idPaciente=idIn;

commit;
set respuesta="Registro eliminado exitosamente";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_eventos`
--

/*!50001 DROP VIEW IF EXISTS `view_eventos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_eventos` AS select `e`.`id` AS `id`,`p`.`nombre` AS `title`,`e`.`start` AS `start`,`e`.`end` AS `end`,`e`.`description` AS `description`,`e`.`codPaciente` AS `codPaciente` from (`eventos` `e` join `paciente` `p`) where (`e`.`codPaciente` = `p`.`idPaciente`) */;
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

-- Dump completed on 2024-04-17 22:07:52
