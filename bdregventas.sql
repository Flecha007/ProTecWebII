-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-03-2021 a las 03:16:00
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdregventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpaquetes`
--

CREATE TABLE `tpaquetes` (
  `idpaquete` int(11) NOT NULL,
  `nombrepaq` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tpaquetes`
--

INSERT INTO `tpaquetes` (`idpaquete`, `nombrepaq`, `descripcion`, `precio`) VALUES
(1, 'Simple o Matrimonial', 'Simple o Matrimonial', 370),
(2, 'Doble', 'Para dos personas', 380),
(3, 'Triple', 'Para tres personas', 450),
(4, 'Familiar', 'dep.de 4 a 6 personas', 700),
(9, 'nueva pruebas', 'personas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuarios`
--

CREATE TABLE `tusuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numdocumento` int(11) NOT NULL,
  `nomusuario` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tusuarios`
--

INSERT INTO `tusuarios` (`idusuario`, `nombre`, `numdocumento`, `nomusuario`, `password`) VALUES
(1, 'administrador1', 10101, 'adm1', '1245'),
(3, 'Carlos Pedregal', 88888888, 'carlosp', '1234'),
(4, 'Pedro Rios', 87878787, 'pedro', '5678'),
(9, 'milton', 23232323, 'mltn', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tventas`
--

CREATE TABLE `tventas` (
  `idventa` int(11) NOT NULL,
  `nomcliente` varchar(100) NOT NULL,
  `doccliente` int(11) NOT NULL,
  `idpaquete` int(11) NOT NULL,
  `cantidaddias` int(11) NOT NULL,
  `total` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `tventas`
--

INSERT INTO `tventas` (`idventa`, `nomcliente`, `doccliente`, `idpaquete`, `cantidaddias`, `total`, `idusuario`, `fecha`) VALUES
(1, 'Sr. Trago Camote', 25252525, 1, 2, 740, 3, '2021-02-28'),
(4, 'Prueba', 1010, 3, 1, 450, 4, '2021-03-01'),
(8, 'Elgr', 54156, 3, 3, 1350, 3, '2021-03-04'),
(10, 'gondar', 6666666, 2, 3, 1140, 4, '2021-03-04'),
(11, 'orueba cURL', 6666666, 2, 3, 1140, 4, '2021-03-04'),
(18, 'PRUEBA completa', 13131312, 3, 3, 1900, 3, '2021-03-03'),
(20, 'Segunda Prueba', 5555, 2, 5, 2500, 4, '2021-03-04'),
(27, 'algu', 8787, 3, 8, 8, 4, '2021-03-05'),
(28, 'prueba cel', 787879, 3, 3, 900, 4, '2021-03-09'),
(29, 'client nuevo', 78787, 3, 2, 900, 4, '2021-03-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tpaquetes`
--
ALTER TABLE `tpaquetes`
  ADD PRIMARY KEY (`idpaquete`);

--
-- Indices de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `tventas`
--
ALTER TABLE `tventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idpaquete` (`idpaquete`),
  ADD KEY `idusuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tpaquetes`
--
ALTER TABLE `tpaquetes`
  MODIFY `idpaquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tventas`
--
ALTER TABLE `tventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tventas`
--
ALTER TABLE `tventas`
  ADD CONSTRAINT `tventas_ibfk_1` FOREIGN KEY (`idpaquete`) REFERENCES `tpaquetes` (`idpaquete`),
  ADD CONSTRAINT `tventas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `tusuarios` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
