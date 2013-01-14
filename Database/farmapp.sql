
--
-- Base de datos: `farmapp`
--
CREATE DATABASE farmapp;
use farmapp;

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `usuarios` (
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
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

CREATE TABLE IF NOT EXISTS `farmacias` (
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
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `receta` varchar(255) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `farm_prod` (
  `id_farmprod` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmacia` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_farmprod`),
  KEY `id_farmacia` (`id_farmacia`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


CREATE TABLE IF NOT EXISTS `pedidos_farm_prod` (
  `id_pedido` int(11) NOT NULL,
  `id_farmprod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `id_farmprod` (`id_farmprod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
insert into tipo_usuario values (null, 'admin');
insert into tipo_usuario values (null, 'farma_admin');
insert into tipo_usuario values (null, 'usuario');

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`, `nombre`, `apellidos`, `direccion`, `ciudad`, `telefono`, `id_tipo`) VALUES
(1, 'admin@farmapp.com', 'telematica', 'admin', NULL, NULL, NULL, NULL, 1),
(3, 'alberto@farmapp.com', 'telematica', 'alberto', NULL, NULL, NULL, NULL, 3),
(4, 'juan@farmapp.com', 'telematica', 'ivan', NULL, NULL, NULL, NULL, 3),
(5, 'gael@farmapp.com', 'telematica', 'gael', NULL, NULL, NULL, NULL, 2),
(8, 'ferran@farmapp.com', 'telematica', 'ferran', NULL, NULL, NULL, NULL, 2),
(9, 'angel@farmapp.com', 'telematica', 'angel', NULL, NULL, 'castelldefels', NULL, 2);

INSERT INTO `farmacias` (`id_farmacia`, `nombre`, `ciudad`, `latitud`, `longitud`, `direccion`, `horario`, `id_admin`, `telefono`) VALUES
(1, 'farmacia2000', 'barcelona', '41.281410', '1.974889', 'doctor trueta', '', 8, NULL),
(3, 'farmaCastelldefels', 'castelldefels', '41.282003', '1.977244', 'calle ramon y cajal', '', 8, NULL),
(4, 'Farmacia Centelles', 'castelldefels', '41.27958', '1.978698', '', '', 5, NULL),
(5, 'Prat Farmacia', 'El Prat de llobregat', '41.323084', '2.089529', 'rosa ribas parellada', '09:00-21:00', 5, NULL),
(6, 'Farma platja', 'castelldefels', '41.265872', '1.964836', '', '', 9, NULL);

INSERT INTO `productos` (`id_producto`, `nombre`, `tipo`, `cantidad`, `descripcion`, `receta`, `precio`) VALUES
(1, 'ibuprofeno', '', '100', 'Para el dolor de cabeza', NULL, NULL),
(2, 'paracetamol', '', '1000', 'Dolores y malestar', NULL, NULL),
(3, 'Aspirina', '', '1000', 'Dolor localizado', NULL, NULL);


INSERT INTO `farm_prod` (`id_farmprod`, `id_farmacia`, `id_producto`, `precio`, `stock`) VALUES
(1, 1, 1, 5, 15),
(2, 1, 2, 8, 30),
(3, 3, 1, 6, 10);
-- --------------------------------------------------------