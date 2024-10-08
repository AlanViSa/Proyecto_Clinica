-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-10-2024 a las 16:34:18
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

DROP TABLE IF EXISTS `citas`;
CREATE TABLE IF NOT EXISTS `citas` (
  `ID_Citas` int DEFAULT NULL,
  `ID_Clinica` int NOT NULL,
  `ID_Paciente` int NOT NULL,
  `ID_Medico` int NOT NULL,
  `Fecha_Cita` date NOT NULL,
  `Hora_Cita` time NOT NULL,
  `EstatusCita` varchar(1) NOT NULL,
  `Recordatorio` tinyint(1) NOT NULL,
  `Confirmar` tinyint(1) NOT NULL,
  `Fecha_Confirmacion` date NOT NULL,
  UNIQUE KEY `ID_Citas` (`ID_Citas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clínica`
--

DROP TABLE IF EXISTS `clínica`;
CREATE TABLE IF NOT EXISTS `clínica` (
  `ID_Clinicia` int DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `CP` varchar(15) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Telefono_1` varchar(20) NOT NULL,
  `Telefono_2` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Responsable` varchar(50) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `HorarioAtencion` varchar(20) NOT NULL,
  UNIQUE KEY `ID_Clinicia` (`ID_Clinicia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobranza`
--

DROP TABLE IF EXISTS `cobranza`;
CREATE TABLE IF NOT EXISTS `cobranza` (
  `ID_Cobro` int DEFAULT NULL,
  `ID_Clinica` int NOT NULL,
  `ID_Paciente` int NOT NULL,
  `Fecha_Cobro` timestamp NOT NULL,
  `EstatusPago` varchar(1) NOT NULL,
  `Importe` decimal(10,0) NOT NULL,
  `MetodoPago` varchar(1) NOT NULL,
  `Saldo` decimal(10,0) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Comprobante` varchar(50) NOT NULL,
  UNIQUE KEY `ID_Cobro` (`ID_Cobro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE IF NOT EXISTS `especialidad` (
  `ID_Especialidad` int DEFAULT NULL,
  `Especialidad` varchar(100) NOT NULL,
  `Padecimientos` blob NOT NULL,
  UNIQUE KEY `ID_Especialidad` (`ID_Especialidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `Sexo` varchar(1) NOT NULL,
  `Descripcion` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `ID_Historail` int DEFAULT NULL,
  `ID_Paciente` int DEFAULT NULL,
  `ID_Medico` int DEFAULT NULL,
  `Fecha_Mov` date NOT NULL,
  `AntecedentesFamilioares` blob NOT NULL,
  `AntecedentesPersonales` blob NOT NULL,
  `Obvservaciones` blob NOT NULL,
  `Tratamiento` blob NOT NULL,
  `ID_Estudios` int NOT NULL,
  `ID_Radiografias` int NOT NULL,
  UNIQUE KEY `ID_Historail` (`ID_Historail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `ID_Medico` int DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `CP` varchar(15) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Telefono_1` varchar(20) NOT NULL,
  `Telefono_2` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ID_Especialidad` int NOT NULL,
  `FechaCreacion` timestamp NOT NULL,
  `Estatus` enum('Activo','Inactivo','','') NOT NULL,
  `FechaModificacion` datetime NOT NULL,
  `ID_Clinica` int NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `Curp` varchar(25) NOT NULL,
  UNIQUE KEY `ID_Medico` (`ID_Medico`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `ID_Paciente` int DEFAULT NULL,
  `ID_Clinica` int DEFAULT NULL,
  `ID_Medico` int DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `CP` varchar(15) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Telefono_1` varchar(20) NOT NULL,
  `Telefono_2` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `CURP` varchar(25) NOT NULL,
  UNIQUE KEY `ID_Paciente` (`ID_Paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
