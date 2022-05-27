-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 11:24 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`id`, `descripcion`, `fecha`, `usuario`) VALUES
(176, 'SE GUARDO EL PRODUCTO: Boligrafo Kilometrico Plus', '2022-05-27 17:49:47', 'admin'),
(177, 'SE GUARDO LA VENTA: 1', '2022-05-27 17:51:01', 'admin'),
(178, 'SE GUARDO EL PAGO CON VENTA: 1 IMPORTE PAGADO:16.24 ImporteDevuelto0 Tipo de PagoEfectivo', '2022-05-27 17:51:01', 'admin'),
(179, 'SE GUARDO LA VENTA: 2', '2022-05-27 18:34:39', 'admin'),
(180, 'SE GUARDO EL PAGO CON VENTA: 2 IMPORTE PAGADO:40.6 ImporteDevuelto0 Tipo de PagoEfectivo', '2022-05-27 18:34:39', 'admin'),
(181, 'SE GUARDO LA VENTA: 3', '2022-05-27 19:34:28', 'admin'),
(182, 'SE GUARDO EL PAGO CON VENTA: 3 IMPORTE PAGADO:70.28 ImporteDevuelto54.04 Tipo de PagoEfectivo', '2022-05-27 19:34:28', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(10, 'Boligrafos', '2022-05-24 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `documento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `compras` int(11) DEFAULT NULL,
  `ultima_compra` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(21, 'Jose Chourio', '25494517', 'jchouriopirela@gmail.com', '(412) 740-3207', 'Puerto Cabello', '1997-04-22', 9, '2022-05-27 21:34:28', '2022-05-27 01:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `configuracioncorreo`
--

CREATE TABLE `configuracioncorreo` (
  `correoSaliente` varchar(75) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `host` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `SMTPDebug` int(11) DEFAULT NULL,
  `SMTPAuth` tinyint(1) DEFAULT NULL,
  `Puerto` int(11) DEFAULT NULL,
  `clave` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `SMTPSeguridad` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `configuracioncorreo`
--

INSERT INTO `configuracioncorreo` (`correoSaliente`, `host`, `SMTPDebug`, `SMTPAuth`, `Puerto`, `clave`, `SMTPSeguridad`) VALUES
('correo@asd.com', 'smtp.gmail.com', 2, 1, 465, 'CEsar1234578@', 'ssl');

-- --------------------------------------------------------

--
-- Table structure for table `datosempresa`
--

CREATE TABLE `datosempresa` (
  `id` int(11) NOT NULL,
  `NombreEmpresa` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `DireccionEmpresa` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `RFC` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `correoElectronico` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `diasEntrega` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `datosempresa`
--

INSERT INTO `datosempresa` (`id`, `NombreEmpresa`, `DireccionEmpresa`, `RFC`, `Telefono`, `correoElectronico`, `diasEntrega`) VALUES
(1, 'SUPROEDI C.A', 'Puerto Cabello', 'RFC', '0424000100', 'suproedica2@gmail.com', 30);

-- --------------------------------------------------------

--
-- Table structure for table `dolar_today`
--

CREATE TABLE `dolar_today` (
  `id` int(11) NOT NULL,
  `dolar_sicad2` double NOT NULL,
  `dolar_transferencia` double NOT NULL,
  `marca_tiempo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dolar_today`
--

INSERT INTO `dolar_today` (`id`, `dolar_sicad2`, `dolar_transferencia`, `marca_tiempo`) VALUES
(3, 5.01, 5.15, 1653595207),
(4, 5.01, 5.15, 1653595207),
(6, 5.02, 5.17, 1653679265),
(7, 0, 0, 0),
(8, 0, 0, 0),
(9, 0, 0, 0),
(10, 0, 0, 0),
(11, 0, 0, 0),
(12, 0, 0, 0),
(13, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) NOT NULL,
  `idVenta` bigint(20) DEFAULT NULL,
  `importePagado` decimal(18,2) DEFAULT NULL,
  `importeDevuelto` decimal(18,2) DEFAULT NULL,
  `fechaPago` datetime NOT NULL DEFAULT current_timestamp(),
  `tipoPago` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `idVenta`, `importePagado`, `importeDevuelto`, `fechaPago`, `tipoPago`) VALUES
(85, 1, '16.24', '0.00', '2022-05-27 00:00:00', 'Efectivo'),
(86, 2, '40.60', '0.00', '2022-05-27 00:00:00', 'Efectivo'),
(87, 3, '70.28', '54.04', '2022-05-27 00:00:00', 'Efectivo');

-- --------------------------------------------------------

--
-- Table structure for table `perfiles`
--

CREATE TABLE `perfiles` (
  `perfil` int(11) NOT NULL,
  `descripcion` varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `menuConfiguraciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `datosEmpresa` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `usuarios` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `perfiles` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `configuracionCorreo` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `clientes` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `productos` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `categorias` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `cotizaciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `administrarCotizaciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `modificarCotizaciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `eliminarCotizaciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `menuCotizaciones` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `menuVentas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `ventas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `administrarVentas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `modificarVentas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `eliminarVentas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `facturacionElectronica` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `reportesVentas` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `cajasSuperiores` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `graficoGanancias` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `productosMasVendidos` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `productosAgregadosRecientemente` varchar(5) COLLATE utf8_spanish2_ci DEFAULT 'off',
  `bitacora` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pagos` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `historicoPagos` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imprimirPagos` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eliminarPagos` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `costoProductos` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `stock` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `perfiles`
--

INSERT INTO `perfiles` (`perfil`, `descripcion`, `menuConfiguraciones`, `datosEmpresa`, `usuarios`, `perfiles`, `configuracionCorreo`, `clientes`, `productos`, `categorias`, `cotizaciones`, `administrarCotizaciones`, `modificarCotizaciones`, `eliminarCotizaciones`, `menuCotizaciones`, `menuVentas`, `ventas`, `administrarVentas`, `modificarVentas`, `eliminarVentas`, `facturacionElectronica`, `reportesVentas`, `cajasSuperiores`, `graficoGanancias`, `productosMasVendidos`, `productosAgregadosRecientemente`, `bitacora`, `pagos`, `historicoPagos`, `imprimirPagos`, `eliminarPagos`, `costoProductos`, `stock`) VALUES
(1, 'Administrador', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', NULL, 'on'),
(3, 'Especial', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Vendedor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'on', 'on', 'on', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `ventas` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(74, 10, '75980510098317', 'Boligrafo Kilometrico Plus', 'vistas/img/productos/75980510098317/920.png', 6, 5, 7, 9, '2022-05-27 17:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` int(11) NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `intentos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`, `intentos`) VALUES
(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 1, 'vistas/img/usuarios/admin/199.png', 1, '2022-05-27 11:50:20', '2020-04-27 20:20:56', 2),
(60, 'asd', 'asd', '$2a$07$asxx54ahjppf45sd87a5aurxwsuKZ45wFSbiNfdS6xl.3y0E2/122', 4, '', 1, '2020-05-12 14:53:50', '2020-04-27 20:29:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` double NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_venta` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `codigoVenta` bigint(20) DEFAULT NULL,
  `cotizarA` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `plazoEntrega` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Observaciones` varchar(259) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UUID` varchar(36) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`, `tipo_venta`, `FechaVencimiento`, `codigoVenta`, `cotizarA`, `plazoEntrega`, `Observaciones`, `UUID`) VALUES
(946, 1, 21, 1, '[{\"id\":\"74\",\"renglon\":\"1\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"2\",\"stock\":\"14\",\"precio\":\"7\",\"total\":\"14\"}]', 2.24, 14, 16.24, 'Efectivo', '2022-05-27 04:00:00', 'VEN', '2022-06-26 00:00:00', 0, '', '30', 'undefined', '7b4a22b7-dde5-11ec-92ed-bc542fc07816'),
(947, 2, 21, 1, '[{\"id\":\"74\",\"renglon\":\"1\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"7\",\"total\":\"7\"},{\"id\":\"74\",\"renglon\":\"2\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"7\",\"total\":\"7\"},{\"id\":\"74\",\"renglon\":\"3\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"7\",\"total\":\"7\"},{\"id\":\"74\",\"renglon\":\"4\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"7\",\"total\":\"7\"},{\"id\":\"74\",\"renglon\":\"5\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"7\",\"total\":\"7\"}]', 5.6, 35, 40.6, 'Efectivo', '2022-05-27 04:00:00', 'VEN', '2022-06-26 00:00:00', 0, '', '30', 'undefined', '9601550d-ddeb-11ec-92ed-bc542fc07816'),
(948, 3, 21, 1, '[{\"id\":\"74\",\"renglon\":\"1\",\"descripcion\":\"Boligrafo Kilometrico Plus\",\"cantidad\":\"2\",\"stock\":\"7\",\"precio\":\"7\",\"total\":\"14\"}]', 2.24, 14, 16.24, 'Efectivo', '2022-05-27 04:00:00', 'VEN', '2022-06-26 00:00:00', 0, '', '30', 'undefined', 'e208c6e1-ddf3-11ec-92ed-bc542fc07816');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_vista_productos`
-- (See below for the actual view)
--
CREATE TABLE `vw_vista_productos` (
`id` int(11)
,`codigo` int(11)
,`id_cliente` int(11)
,`id_vendedor` int(11)
,`impuesto` double
,`neto` float
,`total` float
,`metodo_pago` text
,`fecha` timestamp
,`Tipo_Venta` varchar(25)
,`fechaVencimiento` datetime
,`Observaciones` varchar(259)
,`renglonProducto` longtext
,`idProducto` longtext
,`descripcionProducto` longtext
,`cantidadProducto` longtext
,`precioProducto` longtext
,`totalProducto` longtext
);

-- --------------------------------------------------------

--
-- Structure for view `vw_vista_productos`
--
DROP TABLE IF EXISTS `vw_vista_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vista_productos`  AS  select `z`.`id` AS `id`,`z`.`codigo` AS `codigo`,`z`.`id_cliente` AS `id_cliente`,`z`.`id_vendedor` AS `id_vendedor`,`z`.`impuesto` AS `impuesto`,`z`.`neto` AS `neto`,`z`.`total` AS `total`,`z`.`metodo_pago` AS `metodo_pago`,`z`.`fecha` AS `fecha`,`z`.`Tipo_Venta` AS `Tipo_Venta`,`z`.`fechaVencimiento` AS `fechaVencimiento`,`z`.`Observaciones` AS `Observaciones`,replace(json_extract(`z`.`rec`,'$.renglon'),'"','') AS `renglonProducto`,replace(json_extract(`z`.`rec`,'$.id'),'"','') AS `idProducto`,replace(json_extract(`z`.`rec`,'$.descripcion'),'"','') AS `descripcionProducto`,replace(json_extract(`z`.`rec`,'$.cantidad'),'"','') AS `cantidadProducto`,replace(json_extract(`z`.`rec`,'$.precio'),'"','') AS `precioProducto`,replace(json_extract(`z`.`rec`,'$.total'),'"','') AS `totalProducto` from (select `t`.`id` AS `id`,`t`.`codigo` AS `codigo`,`t`.`id_cliente` AS `id_cliente`,`t`.`id_vendedor` AS `id_vendedor`,`t`.`productos` AS `productos`,`t`.`impuesto` AS `impuesto`,`t`.`neto` AS `neto`,`t`.`total` AS `total`,`t`.`metodo_pago` AS `metodo_pago`,`t`.`fecha` AS `fecha`,`t`.`tipo_venta` AS `Tipo_Venta`,`t`.`FechaVencimiento` AS `fechaVencimiento`,`t`.`Observaciones` AS `Observaciones`,json_extract(`t`.`productos`,concat('$[',`x`.`renglon`,']')) AS `rec` from (`ventas` `t` join (select 0 AS `renglon` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9`) `x` on(json_extract(`t`.`productos`,concat('$[',`x`.`renglon`,']')) is not null))) `z` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datosempresa`
--
ALTER TABLE `datosempresa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dolar_today`
--
ALTER TABLE `dolar_today`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`perfil`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductoCategoria` (`id_categoria`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UUID` (`UUID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `datosempresa`
--
ALTER TABLE `datosempresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dolar_today`
--
ALTER TABLE `dolar_today`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=949;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `ProductoCategoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
