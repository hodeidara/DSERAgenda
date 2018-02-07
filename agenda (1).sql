-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2017 a las 10:20:20
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
-- Base de datos: `agenda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `idContacto` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`idContacto`, `nombre`, `apellido`, `telefono`) VALUES
(1, 'Juan', 'Marx', 555555555),
(2, 'Ana', 'Garcia', 111111111),
(3, 'Mikel', 'Ibarguen', 222222222),
(4, 'Soraya', 'Cabo', 333333333),
(5, 'Duztin', 'Prince', 444444444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactosgrupos`
--

CREATE TABLE `contactosgrupos` (
  `idContactosGrupos` int(11) NOT NULL,
  `idcontacto` int(11) NOT NULL,
  `idgrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactosgrupos`
--

INSERT INTO `contactosgrupos` (`idContactosGrupos`, `idcontacto`, `idgrupo`) VALUES
(1, 2, 2),
(2, 2, 3),
(3, 1, 1),
(4, 5, 4),
(5, 5, 1),
(6, 3, 2),
(7, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `idEmail` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idcontacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `emails`
--

INSERT INTO `emails` (`idEmail`, `email`, `idcontacto`) VALUES
(1, 'ana1@gmail.com', 2),
(2, 'ana2@gmail.com', 2),
(3, 'duztin1@gmail.com', 5),
(4, 'duztin2@gmail.com', 5),
(5, 'juan@gmail.com', 1),
(6, 'mikel@gmail.com', 3),
(7, 'soraya1@gmail.com', 4),
(8, 'soraya2@gmail.com', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `idGrupo` int(11) NOT NULL,
  `nombreGrupo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idGrupo`, `nombreGrupo`) VALUES
(1, 'Familia'),
(2, 'Amigos'),
(3, 'Trabajo'),
(4, 'WhatsApp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `esAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `user`, `pass`, `esAdmin`) VALUES
(1, 'admin', 'admin', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`idContacto`),
  ADD KEY `idContacto` (`idContacto`);

--
-- Indices de la tabla `contactosgrupos`
--
ALTER TABLE `contactosgrupos`
  ADD PRIMARY KEY (`idContactosGrupos`),
  ADD KEY `idgrupo` (`idgrupo`),
  ADD KEY `idcontacto` (`idcontacto`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`idEmail`),
  ADD KEY `idcontacto` (`idcontacto`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contactosgrupos`
--
ALTER TABLE `contactosgrupos`
  MODIFY `idContactosGrupos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `idEmail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contactosgrupos`
--
ALTER TABLE `contactosgrupos`
  ADD CONSTRAINT `contactosgrupos_ibfk_1` FOREIGN KEY (`idcontacto`) REFERENCES `contactos` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contactosgrupos_ibfk_2` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`idcontacto`) REFERENCES `contactos` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
