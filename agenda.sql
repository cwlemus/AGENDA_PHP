-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2017 a las 17:13:18
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_finalizacion` date NOT NULL,
  `hora_finalizacion` time NOT NULL,
  `todoElDia` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `id_usuario`, `titulo`, `fecha_inicio`, `hora_inicio`, `fecha_finalizacion`, `hora_finalizacion`, `todoElDia`) VALUES
(2, 1, 'Evento IT', '2017-05-09', '07:30:00', '2017-05-17', '18:00:00', 0),
(9, 1, 'Evento Html', '2017-05-06', '00:00:00', '0000-00-00', '00:00:00', 1),
(15, 3, 'asd', '2017-05-01', '07:00:00', '2017-05-18', '07:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `psw` varchar(256) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `email`, `psw`, `nombre`, `fecha_nacimiento`) VALUES
(1, 'cwlemus@gmail.com', '$2y$10$.eqCehd90qBGLu1CmbBT8uIiuLSZ1qhbyhpnQeugNeQEvRdGTWdxq', 'carlos', '0000-00-00'),
(2, 'nemlemus@gmail.com', '$2y$10$Itw4Abatshx9z9tiDvoIyOk8IHWckpUmnwFUweAVElbeoTezbeC3y', 'norma', '2017-05-17'),
(3, 'ari@gmail.com', '$2y$10$pcBKeyd3us6vgUbQHv6RteF6JeVFVhuiIYRpf6nDcTZIDjIiVCZsa', 'ariana', '2014-03-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `Fk_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
