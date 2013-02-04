     DROP DATABASE IF EXISTS farmapp;                                
CREATE DATABASE  IF NOT EXISTS `farmapp` ;
USE `farmapp`;

-- Table structure for table `tipo_usuario`

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `farmacias`
--

DROP TABLE IF EXISTS `farmacias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmacias` (
  `id_farmacia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_farmacia`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `farmacias_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `receta` varchar(255) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `farm_prod`
--

DROP TABLE IF EXISTS `farm_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farm_prod` (
  `id_farmprod` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmacia` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_farmprod`),
  KEY `id_farmacia` (`id_farmacia`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `farm_prod_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacias` (`id_farmacia`),
  CONSTRAINT `farm_prod_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `pedidos_farm_prod`
--

DROP TABLE IF EXISTS `pedidos_farm_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_farm_prod` (
  `id_pedido` int(11) NOT NULL,
  `id_farmprod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `id_farmprod` (`id_farmprod`),
  CONSTRAINT `pedidos_farm_prod_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `pedidos_farm_prod_ibfk_2` FOREIGN KEY (`id_farmprod`) REFERENCES `farm_prod` (`id_farmprod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

                                                              
  
INSERT INTO `tipo_usuario` (`id_tipo`, `rol`) VALUES
(1, 'admin'),
(2, 'farma_admin'),
(3, 'usuario');                                                                   
                                             
INSERT INTO `usuarios` VALUES (1,'admin@farmapp.com','telematica','admin','admin','admin','castelldefels','675486963',1),(3,'alberto@farmapp.com','telematica','alberto','cruz','rosa ribas','el prat','53423432',3),(4,'ferran@farmapp.com','telematica','ferran','segarra','calle ena','barcelona','6754543534',3),(5,'gael@farmapp.com','telematica','gael','rodriguez','calle arriba','gava','53525252',2),(6,'juan@farmapp.com','telematica','Juan','Pérez García','Av la muntanyeta','Castelldefels','654565672',2),(7,'raul@farmapp.com','telematica','Raúl','Castellanos Alonso','Calle los Nogales','León','659803037',2),(8,'angel@farmapp.com','telematica','angel','sanchez','mulejos','el prat','6754543534',2),(9,'ferran@farmapp.com','telematica','ferran','segarra','calle ena','barcelona','6754543534',2),(10,'andrea@farmapp.com','telematica','andrea','solano22','trueta','castelldefels','534353',3);

                                                           
                                             
INSERT INTO `farmacias` VALUES (1,'farmacia2000','Barcelona','41.281410','1.974889','doctor trueta 58','L-S 09:00-21:00',8,NULL),(3,'farmaCastelldefels','Castelldefels','41.282003','1.977244','calle ramon y cajal','L-S 09:00-21:00',8,NULL),(4,'Farmacia Centelles','Castelldefels','41.27958','1.978698','avenida manuel Girona 23','L-S 09:00-21:00',5,NULL),(5,'Prat Farmacia','El Prat de llobregat','41.323084','2.089529','rosa ribas parellada 27','L-S 09:00-21:00',5,NULL),(6,'Farma platja','Castelldefels','41.265872','1.964836','paseo de los baños 13','L-S 09:00-21:00',9,NULL),(42,'Farmacia Brasa Edif. Europa','Leon','42.604786','-5.580504','Calle Reyes Leoneses 14','L-S 09:00-21:00 D 10:00-14:00',5,'987279091'),(43,'Farmacia Fernandez De Vega Elosua','Leon','42.598102','-5.570017','Calle Ancha 23','L-S 09:00-21:00',5,'987254253'),(44,'Farmacia Vizcaíno Herrezuelo','Leon','42.599819','-5.567579','Calle de Cervantes, 3','L-S 09:00-21:00',5,'987239372'),(45,'Farmacia Alonso Núñez','Leon','42.598651','-5.567713','Calle Ancha 3','L-S 09:00-21:00',5,'987254227'),(46,'Farmacia Miguélez Montero','Leon','42.597987','-5.573999','Av de Ordoño II, 8','L-S 09:00-21:00',5,'987238377'),(47,'Farmacia Sirera','Leon','42.596518','-5.577346','Av Ordoño II, 41','L-S 09:00-21:00',5,'987261531'),(48,'Farmacia Pícara Justina','Leon','42.595397','-5.575308','Av República Argentina, 23','L-S 09:00-21:00',5,'987252559'),(49,'Farmacia Vega de Castro','Leon','42.596439','-5.573376','Calle Burgo Nuevo, 13','L-S 09:00-21:00',5,'987282813'),(50,'Farmacia Aller Martínez','Leon','42.600372','-5.57299','Calle de la Torre, 3','L-S 09:00-21:00',5,'987222347'),(51,'Farmacia Rodríguez Rodríguez','Leon','42.600372','-5.57299','Calle del Doce de Octubre','L-S 09:00-21:00',5,'987202707'),(52,'Farmacia Andrés Rodríguez','Leon','42.609596','-5.586509','Av de los Reyes Leoneses, 15','L-S 09:00-21:00',5,'987208325'),(53,'Farmacia Casanova Muñoz Espada','Leon','42.600372','-5.57299','Av San Ignacio de Loyola, 16','L-S 09:00-21:00',5,'987230789'),(54,'Farmacia Cuevas Andrés','Leon','42.594401','-5.570158','Calle de San Francisco, 15','L-S 09:00-21:00',5,'987253820'),(55,'Farmacia Martínez-Roca','Roses','42.257063','3.183652','Carrer Pujada al Puig Rom-Pui, 17','L-S 09:00-21:00',5,'972459159'),(56,'Farmacia Celrá Frigole','Roses','42.259771','3.181592','Carrer Cap Norfeu, 4','L-S 09:00-21:00',5,'972459159'),(57,'Farmacia Castro Martínez','Roses','42.262796','3.175283','Carrer del Doctor Pi i Sunyer','L-S 09:00-21:00',5,'972256233'),(58,'María Dolores Itarte Casanovas','Castelldefels','41.278','1.976588','Carrer del Doctor Fleming, 6','L-S 09:00-21:00',6,'936653715'),(59,'Farmacia Puig Lluch','Castelldefels','41.278693','1.972708','Avinguda Diagonal, 30','L-S 09:00-21:00',7,'936652318'),(60,'Farmacia Sentelles Monill','Castelldefels','41.280467','1.97657','Av Constitución, 121','L-S 09:00-21:00',7,'936454213'),(61,'Farmacia Chalmeta Alonso','Castelldefels','41.28258','1.981248','Calle de Arcadio Balaguer, 67','L-S 09:00-21:00',7,'936650894'),(62,'Farmacia Mallasen Zinsser','Castelldefels','41.285579','1.985003','Carrer de Narcís Monturiol, 3','L-S 09:00-21:00',7,'936655011'),(63,'Farmacia Borrás Urtubia','Gava','41.302781','2.001418','Passeig de Joan Maragall, 3','L-S 09:00-21:00',7,'936628990'),(64,'Farmacia Pugès','Gava','41.301249','2.001225','Carrer de Montflorit, 38','L-S 09:00-21:00',7,'936623113'),(65,'Farmacia Amat Roca','Gava','41.304119','1.998135','Avinguda de la Diagonal, 7','L-S 09:00-21:00',7,'936384055'),(66,'Farmacia Sánchez Moratos','Gava','41.306214','2.004551','Carrer de Salvador Lluch, 20','L-S 09:00-21:00',7,'936621934'),(67,'Farmacia Ibáñez','Gava','41.309808','2.002984','Rambla Pompeu Fabra','L-S 09:00-21:00',7,'936621232'),(68,'Farmacia Rotllan Pare','Villadecans','41.315788','2.008156','Carrer de Santa Isabel, 14','L-S 09:00-21:00',7,'936581184');


INSERT INTO `productos` (`id_producto`, `nombre`, `tipo`, `cantidad`, `descripcion`, `receta`, `precio`) VALUES
(1, 'ibuprofeno', 'comprimido', '100', 'Para el dolor de cabeza', 'si', NULL),
(2, 'paracetamol', 'comprimido', '1000', 'Dolores y malestar', 'si', NULL),
(3, 'Gelocatil', 'Comprimidos', '', 'Dolores localizados', 'null', NULL),
(8, 'Ibuprofeno Normon C', 'Comprimidos', NULL, 'Antiinflamatorio, dolores, fiebre, artritis reumatoide juvenil', NULL, NULL),
(9, 'Ibuprofeno Normon S', 'Sobres', NULL, 'Antiinflamatorio, dolores, fiebre, artritis reumatoide juvenil', NULL, NULL),
(10, 'Ibuprofeno Cinfa C', 'Comprimidos', NULL, 'Antiinflamatorio, dolores, fiebre, artritis reumatoide juvenil', NULL, NULL),
(11, 'Ibuprofeno Cinfa S', 'Sobres', NULL, 'Antiinflamatorio, dolores, fiebre, artritis reumatoide juvenil', NULL, NULL),
(12, 'Ibuprofeno Zentiva', 'Comprimidos', NULL, 'Antiinflamatorio, dolores, fiebre, artritis reumatoide juvenil', NULL, NULL),
(13, 'Neobrufen', 'Comprimidos', NULL, 'Antiinflamatorio, dolores, fiebre, cefaleas, gota', NULL, NULL),
(14, 'Enantyum C', 'Comprimidos', NULL, 'Dolor muscular agudo', NULL, NULL),
(15, 'Enantyum Gel', 'Gel', NULL, 'Dolor muscular agudo', NULL, NULL),
(16, 'Enantyum S', 'Sobres', NULL, 'Dolor muscular agudo', NULL, NULL),
(17, 'Almax FORTE', 'Sobres', NULL, 'Alivio de ardor gástrico', NULL, NULL),
(18, 'Aspirina C', 'Efervescente', NULL, 'Tratamiento de calea, dolor, fiebre', NULL, NULL),
(19, 'Sintrom', 'Comprimidos', NULL, 'Enfermedad tromboembólica', NULL, NULL),
(20, 'Omeprazol', 'Cápsulas', NULL, 'Protector gástrico', NULL, NULL),
(21, 'Viagra', 'Comprimidos', NULL, 'Disfunción Eréctil', NULL, NULL),
(22, 'Aero Red', 'Comprimidos masticables', NULL, 'Alivio sintomático de los gases', NULL, NULL),
(23, 'Frenadol', 'Granulado', NULL, 'Alivio de los síntomas de la gripe', NULL, NULL);


INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `fecha`, `estado`) VALUES
(1, 3, '2013-02-01 09:38:19', 'iniciado'),
(2, 3, '2013-02-01 10:30:49', 'finalizado'),
(3, 3, '2013-02-01 10:31:35', 'iniciado'),
(4, 3, '2013-02-01 10:32:08', 'iniciado'),
(5, 3, '2013-02-01 20:06:45', 'iniciado'),
(6, 3, '2013-02-01 20:06:48', 'iniciado'),
(7, 3, '2013-02-01 20:06:56', 'iniciado'),
(8, 3, '2013-02-01 20:08:22', 'Finalizado'),
(9, 4, '2013-02-03 21:48:44', 'Nuevo');


INSERT INTO `farm_prod` (`id_farmprod`, `id_farmacia`, `id_producto`, `precio`, `stock`) VALUES
(1, 1, 1, 5, 15),
(2, 1, 2, 8, 30),
(3, 3, 1, 6, 10),
(4, 5, 2, 6, 90),
(5, 5, 1, 6, 33),
(6, 4, 2, 7, 89),
(7, 4, 3, 5, 100);


INSERT INTO `pedidos_farm_prod` (`id_pedido`, `id_farmprod`, `cantidad`) VALUES
(1, 1, 2),
(2, 2, 3),
(2, 1, 2),
(3, 2, 3),
(3, 1, 2),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(4, 2, 3),
(8, 6, 1),
(9, 6, 2),
(9, 7, 1);
