-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2023 a las 01:06:39
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project_2`
--
CREATE DATABASE IF NOT EXISTS `project_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project_2`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_insert_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cita` (IN `id_Cita` INT, IN `fecha_Cita` INT, IN `hora_Cita` INT, IN `estado_Cita` VARCHAR(50), IN `idClienteFK` INT)   BEGIN
IF (SELECT COUNT(*) FROM cita WHERE  fecha_Cita=fechaCita)=0 THEN
INSERT INTO `cita`(`idCita`, `fechaCita`, `horaCita`,`idClienteFK`)
VALUES (id_Cita,fecha_Cita,hora_Cita,hora_Cita,idCliente);
SELECT 'USER INSERT' AS errormessage;
ELSE
SELECT 'DUPLICATE KEY ERROR' AS errormessage;
END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente` (IN `idCliente` INT, IN `Doc_Cliente` INT, IN `Tipo_Doc` VARCHAR(50), IN `Name_Cliente` VARCHAR(50), IN `Lastname_Cliente` VARCHAR(50), IN `Celular_Cliente` INT, IN `idUsuarioFK` INT)   BEGIN
IF (SELECT COUNT(*) FROM user WHERE  Name_Cliente=NameCliente )=0 THEN
INSERT INTO `cliente`(`idCliente`, `Doc_Cliente`, `Tipo_Doc`, `Name_Cliente`, `Lastname_Cliente`,`Celular_Cliente`,`idUsuarioFK`)
VALUES (idCliente,Doc_Cliente,Tipo_Doc,Name_Cliente,Lastname_Cliente,Celular_Cliente,idUsuarioFK);
SELECT 'USER INSERT' AS errormessage;
ELSE
SELECT 'DUPLICATE KEY ERROR' AS errormessage;
END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_user` (IN `idusuario` INT, IN `Useremail` VARCHAR(50), IN `Userpassword` VARCHAR(20), IN `statusid` INT, IN `idRolFK` INT)   BEGIN
IF (SELECT COUNT(*) FROM user WHERE  User_email=Useremail)=0 THEN
INSERT INTO `user`(`idUsuario`, `User_email`, `User_password`, `status_id`, `idRolFK`)
VALUES (idusuario,Useremail,Userpassword,statusid,idRolFK);
SELECT 'USER INSERT' AS errormessage;
ELSE
SELECT 'DUPLICATE KEY ERROR' AS errormessage;
END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_email`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_email` (IN `Useremail` VARCHAR(50))   BEGIN
SELECT * FROM user WHERE User_email=Useremail;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_id` (IN `idUsuario` INT)   BEGIN
SELECT User_password FROM user WHERE User_id=Userid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE `administrador` (
  `IdEmpleado` int(11) NOT NULL,
  `numDocEmpleado` varchar(15) DEFAULT NULL,
  `tipoDocEmpleado` varchar(20) DEFAULT NULL,
  `nombreEmpleado` varchar(50) DEFAULT NULL,
  `apellidoEmpleado` varchar(50) DEFAULT NULL,
  `direccionEmpleado` varchar(50) DEFAULT NULL,
  `telefonoEmpleado` varchar(20) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`IdEmpleado`, `numDocEmpleado`, `tipoDocEmpleado`, `nombreEmpleado`, `apellidoEmpleado`, `direccionEmpleado`, `telefonoEmpleado`, `status_id`, `idUsuarioFK`) VALUES
(2, '1212121', 'CC', 'DIego', 'Casallas', 'Calle ', '21212', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `id_Cita` int(11) NOT NULL,
  `fecha_Cita` date DEFAULT NULL,
  `hora_Cita` time(6) DEFAULT NULL,
  `estado_Cita` varchar(50) DEFAULT NULL,
  `tipo_Cita` varchar(50) NOT NULL,
  `idUsuarioFk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_Cita`, `fecha_Cita`, `hora_Cita`, `estado_Cita`, `tipo_Cita`, `idUsuarioFk`) VALUES
(12, '2023-11-08', '15:35:00.000000', 'bloqueada', 'Consultoria Canina', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Doc_Cliente` int(11) NOT NULL,
  `Tipo_Doc` varchar(50) NOT NULL,
  `Name_Cliente` varchar(50) NOT NULL,
  `Lastname_Cliente` varchar(50) NOT NULL,
  `Celular_Cliente` int(11) NOT NULL,
  `idRolFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Doc_Cliente`, `Tipo_Doc`, `Name_Cliente`, `Lastname_Cliente`, `Celular_Cliente`, `idRolFK`) VALUES
(1, 2147483647, 'CC', 'paula', 'paz', 2147483647, 0),
(2, 1010962587, 'TI', 'Julian', 'Paz', 2147483647, 0),
(4, 2147483647, 'CC', 'Juana', 'Paezas', 2147483647, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crear`
--

DROP TABLE IF EXISTS `crear`;
CREATE TABLE `crear` (
  `nombreCliente` varchar(50) DEFAULT NULL,
  `fechaCita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `desccripcionRol` varchar(30) DEFAULT NULL,
  `estadoRol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `desccripcionRol`, `estadoRol`) VALUES
(1, 'Cliente', NULL),
(2, 'Empleado', NULL);

--
-- Disparadores `rol`
--
DROP TRIGGER IF EXISTS `Administrador_Rol`;
DELIMITER $$
CREATE TRIGGER `Administrador_Rol` BEFORE INSERT ON `rol` FOR EACH ROW BEGIN
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

DROP TABLE IF EXISTS `servicio`;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `descripcionServicio` varchar(30) DEFAULT NULL,
  `estadoServicio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Disparadores `servicio`
--
DROP TRIGGER IF EXISTS `Cliente_Servicio`;
DELIMITER $$
CREATE TRIGGER `Cliente_Servicio` AFTER INSERT ON `servicio` FOR EACH ROW BEGIN
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUsuario` int(11) NOT NULL,
  `User_email` varchar(50) DEFAULT NULL,
  `User_password` varchar(20) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `Rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUsuario`, `User_email`, `User_password`, `status_id`, `Rol`) VALUES
(1, 'diehe@gmail.com', '123456', 1, '1'),
(21, 'diehe32@gmail.com', '$2y$10$m22.LaDvxmgfk', 0, NULL),
(22, 'assadd@gmail.com', '$2y$10$s6xIahsjHFukr', 0, NULL),
(24, '1231232345h@gmail.com', '123456', 0, '2'),
(25, 'juan212@gmail.com', '$2y$10$FOOuzjWijrhX6', 0, '2'),
(26, 'paulafea@gmail.com', '$2y$10$HK20gSipxu9Wc', 0, '2'),
(27, 'paulafea@gmail.com', '$2y$10$6qqNA5wY9ff4o', 0, '1'),
(28, 'assadd@gmail.com', '$2y$10$kFSCknlpuI9fK', 0, '1'),
(29, 'julianpaz@gmail.com', '$2y$10$NHdrGx8xkpQ0Z', 0, '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IdEmpleado`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_Cita`) USING BTREE;

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRolFK` (`Rol`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `IdEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_Cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
