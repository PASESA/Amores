-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-04-2023 a las 20:20:14
-- Versión del servidor: 10.3.27-MariaDB-0+deb10u1
-- Versión de PHP: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Parqueadero1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cortes`
--

CREATE TABLE `Cortes` (
  `Folio` bigint(20) UNSIGNED NOT NULL,
  `FechaIni` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Importe` int(11) DEFAULT NULL,
  `NumBoletos` int(11) DEFAULT NULL,
  `TipoDCorte` smallint(6) DEFAULT NULL,
  `Quedados` int(11) DEFAULT NULL,
  `idInicial` int(11) DEFAULT NULL,
  `NumBolQued` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Cortes`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Entradas`
--

CREATE TABLE `Entradas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Entrada` datetime NOT NULL,
  `Salida` datetime DEFAULT NULL,
  `TiempoTotal` varchar(255) DEFAULT NULL,
  `Importe` float DEFAULT NULL,
  `CorteInc` int(11) DEFAULT NULL,
  `vobo` varchar(5) DEFAULT NULL,
  `Placas` varchar(255) DEFAULT NULL,
  `TarifaPreferente` varchar(255) DEFAULT NULL,
  `TipoPromocion` varchar(255) DEFAULT NULL,
  `QRPromo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MovimientosPens`
--

CREATE TABLE `MovimientosPens` (
  `Id_movs` int(10) UNSIGNED NOT NULL,
  `Idcliente` int(10) UNSIGNED NOT NULL,
  `num_tarjeta` int(11) NOT NULL,
  `Entrada` datetime DEFAULT NULL,
  `Salida` datetime DEFAULT NULL,
  `TiempoTotal` varchar(255) DEFAULT NULL,
  `Estatus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MovsUsuarios`
--

CREATE TABLE `MovsUsuarios` (
  `Id_movs` int(10) UNSIGNED NOT NULL,
  `Idusuario` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `CierreCorte` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PagosPens`
--

CREATE TABLE `PagosPens` (
  `Id_pago` int(10) UNSIGNED NOT NULL,
  `Idcliente` int(10) UNSIGNED NOT NULL,
  `num_tarjeta` int(11) NOT NULL,
  `Fecha_pago` datetime DEFAULT NULL,
  `Fecha_vigencia` datetime DEFAULT NULL,
  `Mensualidad` varchar(255) DEFAULT NULL,
  `Monto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `PagosPens`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pensionados`
--

CREATE TABLE `Pensionados` (
  `Id_cliente` int(10) UNSIGNED NOT NULL,
  `Num_tarjeta` int(11) NOT NULL,
  `Nom_cliente` varchar(255) DEFAULT NULL,
  `Apell1_cliente` varchar(255) DEFAULT NULL,
  `Apell2_cliente` varchar(255) DEFAULT NULL,
  `Fecha_alta` datetime DEFAULT NULL,
  `Telefono1` varchar(25) DEFAULT NULL,
  `Telefono2` varchar(25) DEFAULT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  `Colonia` varchar(255) DEFAULT NULL,
  `CP` varchar(8) DEFAULT NULL,
  `Calle_num` varchar(255) DEFAULT NULL,
  `Placas` varchar(50) DEFAULT NULL,
  `Modelo_auto` varchar(50) DEFAULT NULL,
  `Color_auto` varchar(20) DEFAULT NULL,
  `Vigencia` varchar(20) DEFAULT NULL,
  `Fecha_vigencia` datetime DEFAULT NULL,
  `Monto` int(15) DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `Cortesia` varchar(20) DEFAULT NULL,
  `Tolerancia` varchar(20) DEFAULT NULL,
  `Ult_Cambio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Pensionados`
--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id_usuario` int(10) UNSIGNED NOT NULL,
  `Usuario` varchar(25) NOT NULL,
  `Contrasena` varchar(25) DEFAULT NULL,
  `Nom_usuario` varchar(255) DEFAULT NULL,
  `Fecha_alta` datetime DEFAULT NULL,
  `Telefono1` varchar(25) DEFAULT NULL,
  `Aviso_Emer` varchar(255) DEFAULT NULL,
  `TelefonoEmer` varchar(25) DEFAULT NULL,
  `Sucursal` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Id_usuario`, `Usuario`, `Contrasena`, `Nom_usuario`, `Fecha_alta`, `Telefono1`, `Aviso_Emer`, `TelefonoEmer`, `Sucursal`) VALUES
(1, 'AG', '13579', 'Aurelio Guarneros Ruiz', NULL, NULL, NULL, NULL, NULL),
(2, 'FRANCISCO', 'FHM', 'Juan Francisco Hernandez Morales', NULL, NULL, NULL, NULL, NULL),
(3, 'ARMANDO', 'ASP', 'Armando Salazar Perdomo', NULL, NULL, NULL, NULL, NULL),
(4, 'LAURA', 'LCF', 'Laura Janet Cruz Flores', NULL, NULL, NULL, NULL, NULL),
(5, 'HERIBERTO', 'HSO', 'Heriberto Salazar Ocaña', NULL, NULL, NULL, NULL, NULL),
(6, 'BERNARDO', 'BG', 'Bernardo Garcia', NULL, NULL, NULL, NULL, NULL),
(7, 'HECTOR', 'HMM', 'Hector Agustin Martinez Miranda', NULL, NULL, NULL, NULL, NULL),
(8, 'TACHO', 'EB', 'Eustaquio Bautista', NULL, NULL, NULL, NULL, NULL),
(9, 'DANY', 'DS', 'Daniela Santiago', NULL, NULL, NULL, NULL, NULL),
(10, 'ARTEMIO', 'AR', 'Artemio Ramirez', NULL, NULL, NULL, NULL, NULL),
(11, 'MANUEL', 'JMM', 'José Manuel Marín', NULL, NULL, NULL, NULL, NULL),
(12, 'BELEN', 'BBB', 'Belen Becerril Berrozabal', NULL, NULL, NULL, NULL, NULL),
(13, 'ANGELES', 'APS', 'Maria de los Angeles Parra Sanchez', NULL, NULL, NULL, NULL, NULL),
(14, 'KRIS', 'KR', 'Kristhell Romero', NULL, NULL, NULL, NULL, NULL),
(15, 'VICTOR', 'VAM', 'Victor Alejandro Medel', NULL, NULL, NULL, NULL, NULL),
(16, 'IRVING', 'IRB', 'Irving Ramirez Bazan', NULL, NULL, NULL, NULL, NULL),
(17, 'CLAUDIA', 'CAP', 'Claudia Patriia Argomaniz Perez', NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cortes`
--
ALTER TABLE `Cortes`
  ADD PRIMARY KEY (`Folio`);

--
-- Indices de la tabla `Entradas`
--
ALTER TABLE `Entradas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MovimientosPens`
--
ALTER TABLE `MovimientosPens`
  ADD PRIMARY KEY (`Id_movs`),
  ADD KEY `Idcliente` (`Idcliente`);

--
-- Indices de la tabla `MovsUsuarios`
--
ALTER TABLE `MovsUsuarios`
  ADD PRIMARY KEY (`Id_movs`),
  ADD KEY `Idusuario` (`Idusuario`);

--
-- Indices de la tabla `PagosPens`
--
ALTER TABLE `PagosPens`
  ADD PRIMARY KEY (`Id_pago`),
  ADD KEY `Idcliente` (`Idcliente`);

--
-- Indices de la tabla `Pensionados`
--
ALTER TABLE `Pensionados`
  ADD PRIMARY KEY (`Id_cliente`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cortes`
--
ALTER TABLE `Cortes`
  MODIFY `Folio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Entradas`
--
ALTER TABLE `Entradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `MovimientosPens`
--
ALTER TABLE `MovimientosPens`
  MODIFY `Id_movs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `MovsUsuarios`
--
ALTER TABLE `MovsUsuarios`
  MODIFY `Id_movs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `PagosPens`
--
ALTER TABLE `PagosPens`
  MODIFY `Id_pago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Pensionados`
--
ALTER TABLE `Pensionados`
  MODIFY `Id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `MovimientosPens`
--
ALTER TABLE `MovimientosPens`
  ADD CONSTRAINT `MovimientosPens_ibfk_1` FOREIGN KEY (`Idcliente`) REFERENCES `Pensionados` (`Id_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `MovsUsuarios`
--
ALTER TABLE `MovsUsuarios`
  ADD CONSTRAINT `MovsUsuarios_ibfk_1` FOREIGN KEY (`Idusuario`) REFERENCES `Usuarios` (`Id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `PagosPens`
--
ALTER TABLE `PagosPens`
  ADD CONSTRAINT `PagosPens_ibfk_1` FOREIGN KEY (`Idcliente`) REFERENCES `Pensionados` (`Id_cliente`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
