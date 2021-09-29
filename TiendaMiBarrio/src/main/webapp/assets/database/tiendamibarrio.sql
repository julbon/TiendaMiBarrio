-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2021 a las 23:15:48
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendamibarrio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `Cantidad` int(11) DEFAULT NULL,
  `numFacturaFK` int(11) DEFAULT NULL,
  `idProductoFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProd` int(11) NOT NULL,
  `nombreProd` varchar(50) NOT NULL,
  `marcaProd` varchar(50) DEFAULT NULL,
  `cantidadProd` int(11) NOT NULL,
  `precioProd` int(11) NOT NULL,
  `idProvFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `producto` (`idProd`, `nombreProd`, `marcaProd`, cantidadProd`, `precioProd`, `idProvFK`) VALUES
(45, 'Carne', 5, 2000, 'Abarrotes'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProv` int(11) NOT NULL,
  `nombreProv` varchar(50) NOT NULL,
  `dirProv` varchar(50) DEFAULT NULL,
  `telProv` int(11) NOT NULL,
  `emailProv` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `numFactura` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valorTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD KEY `numFacturaFK` (`numFacturaFK`),
  ADD KEY `idProductoFK` (`idProductoFK`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProd`),
  ADD KEY `idProvFK` (`idProvFK`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProv`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`numFactura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `numFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`numFacturaFK`) REFERENCES `venta` (`numFactura`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idProductoFK`) REFERENCES `producto` (`idProd`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idProvFK`) REFERENCES `proveedor` (`idProv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
