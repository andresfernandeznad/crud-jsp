-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2018 a las 19:39:09
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `CodAct` int(11) NOT NULL,
  `NomAct` varchar(20) NOT NULL,
  `DescAct` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`CodAct`, `NomAct`, `DescAct`) VALUES
(1, 'Body Pump', 'BodyPump es un programa grupal de entrenamiento basado en el levantamiento de pesas, creado y distribuido internacionalmente por Les Mills International.'),
(2, 'Body Combat', 'BodyPump es un programa grupal de entrenamiento basado en las artes marciales.'),
(3, 'Spinning', 'El spinning es un ejercicio aeróbico y de piernas principalmente, donde el monitor o profesor puede mediante el cambio de la frecuencia de pedaleo y de la resistencia al movimiento.'),
(4, 'Zumba', 'Zumba es una disciplina fitness creada a mediados de los años 90​ enfocada por una parte a mantener un cuerpo saludable y a fortalecer y dar flexibilidad al cuerpo mediante movimientos de baile.'),
(5, 'Aerobic', 'Aeróbic​ es un tipo de gimnasia que se realiza con música. Sus beneficios son además de ejercitar capacidades físicas, ejercitar la flexibilidad, coordinación, orientación, ritmo, etc.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apuntado`
--

CREATE TABLE `apuntado` (
  `CodCli` int(11) NOT NULL,
  `CodAct` int(11) NOT NULL,
  `FecApu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `apuntado`
--

INSERT INTO `apuntado` (`CodCli`, `CodAct`, `FecApu`) VALUES
(1, 3, '1900-01-01'),
(22, 3, '1900-01-01'),
(343, 2, '1900-01-01'),
(1233, 5, '1900-01-01'),
(3245, 3, '1900-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CodCli` int(11) NOT NULL,
  `NomCli` varchar(20) NOT NULL,
  `ApeCli` varchar(40) NOT NULL,
  `FechNac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CodCli`, `NomCli`, `ApeCli`, `FechNac`) VALUES
(1, 'Andrés', 'Fernández Nadales', '1998-02-11'),
(22, 'Marcos', 'Fernández Nadales', '1999-05-07'),
(342, 'asdfsadf', 'asdfasdfsdf', '1999-01-01'),
(343, 'asdfsdfsdfsa', 'sdfasfsaf', '1999-01-01'),
(1233, 'assdfsdf', 'asdfsdfsdfsaf', '1999-05-07'),
(3245, 'juan', 'fern', '1999-01-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`CodAct`),
  ADD UNIQUE KEY `NomAct` (`NomAct`);

--
-- Indices de la tabla `apuntado`
--
ALTER TABLE `apuntado`
  ADD PRIMARY KEY (`CodCli`,`CodAct`),
  ADD KEY `CodAct` (`CodAct`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodCli`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apuntado`
--
ALTER TABLE `apuntado`
  ADD CONSTRAINT `apuntado_ibfk_1` FOREIGN KEY (`CodCli`) REFERENCES `cliente` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apuntado_ibfk_2` FOREIGN KEY (`CodAct`) REFERENCES `actividad` (`CodAct`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
