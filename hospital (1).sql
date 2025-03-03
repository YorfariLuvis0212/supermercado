-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2025 a las 20:15:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCita` (IN `p_id_paciente` INT(11), IN `p_id_medico` INT(11), IN `p_fecha_cita` DATE, IN `p_hora_cita` TIME, IN `p_estado` VARCHAR(255), IN `p_motivo_consulta` VARCHAR(255))   BEGIN
    -- Insertar la nueva cita
    INSERT INTO Citas (
        id_paciente, 
        id_medico, 
        fecha_cita, 
        hora_cita, 
        estado, 
        motivo_consulta
    )
    VALUES (
        p_id_paciente, 
        p_id_medico, 
        p_fecha_cita, 
        p_hora_cita, 
        p_estado, 
        p_motivo_consulta
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFactura` (IN `p_id_paciente` INT(11), IN `p_fecha_emision` DATE, IN `p_monto_total` DECIMAL(10,0), IN `p_estado` VARCHAR(255))   BEGIN
    -- Insertar la nueva factura
    INSERT INTO facturacion (
        id_paciente, 
        fecha_emision, 
        monto_total, 
        estado
    )
    VALUES (
        p_id_paciente, 
        p_fecha_emision, 
        p_monto_total, 
        p_estado
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPaciente` (IN `p_nombre` VARCHAR(255), IN `p_apellido` VARCHAR(255), IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(255), IN `p_tipo_documento` VARCHAR(255), IN `p_numero_documento` VARCHAR(255), IN `p_direccion` VARCHAR(255), IN `p_telefono` VARCHAR(255), IN `p_email` VARCHAR(255), IN `p_password` VARCHAR(255))   BEGIN
    -- Insertar el nuevo paciente
    INSERT INTO Pacientes (
        nombre, 
        apellido, 
        fecha_nacimiento, 
        genero, 
        tipo_documento, 
        numero_documento, 
        direccion, 
        telefono, 
        email, 
        password, 
        fecha_registro
    )
    VALUES (
        p_nombre, 
        p_apellido, 
        p_fecha_nacimiento, 
        p_genero, 
        p_tipo_documento, 
        p_numero_documento, 
        p_direccion, 
        p_telefono, 
        p_email, 
        p_password, 
        CURDATE() -- Fecha actual
    );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cantidad_tratamientos_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cantidad_tratamientos_por_medico` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`total_tratamientos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cantidad_tratamientos_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cantidad_tratamientos_por_paciente` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`total_tratamientos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `fecha_cita` date DEFAULT NULL,
  `hora_cita` time DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `motivo_consulta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_medico`, `fecha_cita`, `hora_cita`, `estado`, `motivo_consulta`) VALUES
(8, 1, 1, '2025-03-10', '09:00:00', 'Completada', 'Chequeo general'),
(9, 2, 2, '2024-03-11', '11:30:00', 'Pendiente', 'Fiebre y dolor de garganta'),
(10, 3, 3, '2024-03-12', '14:00:00', 'Cancelada', 'Problemas en la piel'),
(11, 8, 2, '2023-10-30', '10:00:00', 'Programada', 'Dolor de cabeza');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_canceladas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_canceladas` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_completadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_completadas` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_futuras`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_futuras` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_pasadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_pasadas` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_pendientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_pendientes` (
`id_cita` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_por_medico` (
`id_cita` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`especialidad` varchar(255)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_por_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_por_mes` (
`anio` int(4)
,`mes` int(2)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `citas_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `citas_por_paciente` (
`id_cita` int(11)
,`fecha_cita` date
,`hora_cita` time
,`estado` varchar(255)
,`motivo_consulta` varchar(255)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`especialidad` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_con_total_factura`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalle_con_total_factura` (
`id_detalle_factura` int(11)
,`id_factura` int(11)
,`cantidad` int(11)
,`precio_unitario` decimal(10,0)
,`subtotal` decimal(10,0)
,`total_factura` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle_factura` int(11) NOT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle_factura`, `id_factura`, `id_servicio`, `id_medicamento`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(4, 1, 1, 1, 1, 25500, 25500),
(5, 2, 2, 2, 1, 15000, 15000),
(6, 3, 3, 3, 1, 12750, 12750);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_factura_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalle_factura_completo` (
`id_detalle_factura` int(11)
,`id_factura` int(11)
,`servicio` varchar(255)
,`medicamento` varchar(255)
,`cantidad` int(11)
,`precio_unitario` decimal(10,0)
,`subtotal` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_formula`
--

CREATE TABLE `detalle_formula` (
  `id_detalle_formula` int(11) NOT NULL,
  `id_formula` int(11) DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `dosis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_formula`
--

INSERT INTO `detalle_formula` (`id_detalle_formula`, `id_formula`, `id_medicamento`, `cantidad`, `dosis`) VALUES
(1, 1, 1, 30, '1 comprimido al día'),
(2, 2, 2, 21, '1 cápsula cada 8 horas'),
(3, 3, 3, 15, 'Aplicar en la zona afectada cada 12 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `monto_total` decimal(10,0) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id_factura`, `id_paciente`, `fecha_emision`, `monto_total`, `estado`) VALUES
(1, 1, '2025-03-10', 150000, 'Pagado'),
(2, 2, '2024-03-11', 75000, 'Pendiente'),
(3, 3, '2024-03-12', 120000, 'Pagado'),
(4, 8, '2023-10-30', 15000, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturacion_anual`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturacion_anual` (
`anio` int(4)
,`total_facturado` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_altas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_altas` (
`id_factura` int(11)
,`total_factura` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_con_datos_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_con_datos_paciente` (
`id_factura` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`numero_documento` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_ordenadas_por_monto_asc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_ordenadas_por_monto_asc` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_ordenadas_por_monto_desc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_ordenadas_por_monto_desc` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_pagadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_pagadas` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_pendientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_pendientes` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturas_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `facturas_recientes` (
`id_factura` int(11)
,`id_paciente` int(11)
,`fecha_emision` date
,`monto_total` decimal(10,0)
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_detalladas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_detalladas` (
`id_formula` int(11)
,`fecha_emision` date
,`observaciones` varchar(255)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`especialidad` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulas_medicas`
--

CREATE TABLE `formulas_medicas` (
  `id_formula` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulas_medicas`
--

INSERT INTO `formulas_medicas` (`id_formula`, `id_paciente`, `id_medico`, `fecha_emision`, `observaciones`) VALUES
(1, 1, 1, '2025-03-10', 'Tomar losartán una vez al día'),
(2, 2, 2, '2024-03-11', 'Tomar amoxicilina cada 8 horas por 7 días'),
(3, 3, 3, '2024-03-12', 'Aplicar hidrocortisona dos veces al día');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_ordenadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_ordenadas` (
`id_formula` int(11)
,`fecha_emision` date
,`observaciones` varchar(255)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_por_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_por_especialidad` (
`id_formula` int(11)
,`fecha_emision` date
,`observaciones` varchar(255)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`especialidad` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_por_medico` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`total_formulas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_por_paciente` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`total_formulas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `formulas_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `formulas_recientes` (
`id_formula` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`fecha_emision` date
,`observaciones` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `id_historia` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha_consulta` date DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historia_clinica`
--

INSERT INTO `historia_clinica` (`id_historia`, `id_paciente`, `fecha_consulta`, `id_medico`, `diagnostico`, `observaciones`, `id_tratamiento`) VALUES
(1, 1, '2024-03-10', 1, 'Hipertensión leve', 'Controlar la dieta y hacer ejercicio', NULL),
(2, 2, '2024-03-11', 2, 'Amigdalitis', 'Requiere antibióticos', NULL),
(3, 3, '2024-03-12', 3, 'Dermatitis', 'Evitar alérgenos y usar cremas hidratantes', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `historia_completa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `historia_completa` (
`id_historia` int(11)
,`fecha_consulta` date
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`diagnostico` varchar(255)
,`observaciones` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ingresos_mensuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ingresos_mensuales` (
`anio` int(4)
,`mes` int(2)
,`ingresos` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `cantidad_disponible` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `nombre`, `descripcion`, `fabricante`, `cantidad_disponible`, `precio_unitario`) VALUES
(1, 'Losartán', 'Antihipertensivo', 'PharmaLab', 0, 25500),
(2, 'Amoxicilina', 'Antibiótico de amplio espectro', 'BioMed', 100, 15000),
(3, 'Hidrocortisona', 'Crema antiinflamatoria', 'DermaCare', 30, 12750),
(4, 'Acetaminofem', 'dolor', 'PharmaLab', 5, 950);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_agotados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_agotados` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_baja_existencia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_baja_existencia` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_baratos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_baratos` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_descripcion_larga`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_descripcion_larga` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_disponibles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_disponibles` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_facturados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_facturados` (
`id_detalle_factura` int(11)
,`id_factura` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`precio_unitario` decimal(10,0)
,`subtotal` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_mas_caros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_mas_caros` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_ordenados_stock`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_ordenados_stock` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_ordenados_stock_asc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_ordenados_stock_asc` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`fabricante` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicamentos_por_fabricante`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicamentos_por_fabricante` (
`fabricante` varchar(255)
,`total_medicamentos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `numero_licencia` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `nombre`, `apellido`, `especialidad`, `numero_licencia`, `telefono`, `email`, `fecha_contratacion`, `password`) VALUES
(1, 'Luvis', 'Correa', 'Cirujano', '1111111111', '3216720152', 'yorfariluvis1@gmail.com', '2025-02-25', '$2y$10$birdRvRAgWMarqCLzR0ptetIH7cF1HhGHBBd7ug3mK3RhMEdvBmx2'),
(2, 'Andrés', 'Martínez', 'Cardiología', 'LIC12345', '3123456789', 'andres.martinez@example.com', '2020-01-15', NULL),
(3, 'Luisa', 'Fernández', 'Pediatría', 'LIC67890', '3156784321', 'luisa.fernandez@example.com', '2018-06-10', NULL),
(4, 'Ricardo', 'López', 'Dermatología', 'LIC54321', '3117896543', 'ricardo.lopez@example.com', '2021-09-05', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_activos_formulas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_activos_formulas` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_antiguos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_antiguos` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_cardiologos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_cardiologos` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_con_email`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_con_email` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_con_telefono`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_con_telefono` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_nombre_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_nombre_completo` (
`id_medico` int(11)
,`nombre_completo` varchar(511)
,`especialidad` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_ordenados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_ordenados` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_por_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_por_especialidad` (
`especialidad` varchar(255)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `medicos_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `medicos_recientes` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`numero_licencia` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_contratacion` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre`, `apellido`, `fecha_nacimiento`, `genero`, `tipo_documento`, `numero_documento`, `direccion`, `telefono`, `email`, `fecha_registro`, `password`) VALUES
(1, 'Luvis', 'Correa', '2004-02-12', 'mujer', 'cedula', '1078456289', 'tomas perez', '3216720152', 'yorfariluvis@gmail.com', '2025-02-25', '$2y$10$.PwrNjJmCpWI2gyn3ELp9umVqN2SuUnHYLQcQfxFYaNvCtQMAJB8m'),
(2, 'Juan', 'Pérez', '1985-06-15', 'Masculino', 'CC', '1001234567', 'Calle 10 #45-67', '3114567890', 'juan.perez@example.com', '2025-02-26', NULL),
(3, 'María', 'Gómez', '1992-03-22', 'Femenino', 'TI', '1023456789', 'Carrera 23 #12-45', '3209876543', 'maria.gomez@example.com', '2025-02-26', NULL),
(4, 'Carlos', 'Ramírez', '2000-08-10', 'Masculino', 'CC', '1009876543', 'Av. 30 #90-23', '3001234567', NULL, '2025-02-26', NULL),
(8, 'Olga', 'Mosquera', '1990-05-15', 'Mujer', 'CC', '12345678', 'Tomas Perez', '3333333333', 'olga@gmail.com', '2025-03-02', '12345678');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_contactables`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_contactables` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_con_edad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_con_edad` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`edad` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_con_email`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_con_email` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_con_facturas_pendientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_con_facturas_pendientes` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`monto_total` decimal(10,0)
,`fecha_emision` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_mayores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_mayores` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_mayor_facturacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_mayor_facturacion` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`total_facturado` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_multimedicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_multimedicos` (
`id_paciente` int(11)
,`total_medicos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_nacidos_antes_2000`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_nacidos_antes_2000` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_nombre_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_nombre_completo` (
`id_paciente` int(11)
,`nombre_completo` varchar(511)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_ordenados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_ordenados` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_por_genero`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_por_genero` (
`genero` varchar(255)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_por_tipo_doc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_por_tipo_doc` (
`tipo_documento` varchar(255)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pacientes_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pacientes_recientes` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`fecha_nacimiento` date
,`genero` varchar(255)
,`tipo_documento` varchar(255)
,`numero_documento` varchar(255)
,`direccion` varchar(255)
,`telefono` varchar(255)
,`email` varchar(255)
,`fecha_registro` date
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `primera_formula_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `primera_formula_por_paciente` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`id_medico` int(11)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`fecha_emision` date
,`observaciones` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Consulta general', 'Evaluación médica de rutina', 50000),
(2, 'Consulta especializada', 'Atención por un médico especialista', 80000),
(3, 'Examen de laboratorio', 'Análisis de sangre y otros estudios', 40000);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_con_descripcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_con_descripcion` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_con_impuesto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_con_impuesto` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
,`precio_final` decimal(13,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_costosos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_costosos` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_economicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_economicos` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_facturados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_facturados` (
`id_detalle_factura` int(11)
,`id_factura` int(11)
,`id_servicio` int(11)
,`cantidad` int(11)
,`precio_unitario` decimal(10,0)
,`subtotal` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_ordenados_precio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_ordenados_precio` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_ordenados_precio_asc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_ordenados_precio_asc` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_ordenados_precio_desc`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_ordenados_precio_desc` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_precio_redondeado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_precio_redondeado` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicios_sin_descripcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicios_sin_descripcion` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicio_extremos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicio_extremos` (
`id_servicio` int(11)
,`nombre` varchar(255)
,`descripcion` varchar(255)
,`precio` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `total_citas_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `total_citas_por_medico` (
`id_medico` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`especialidad` varchar(255)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `total_citas_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `total_citas_por_paciente` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `total_facturado_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `total_facturado_por_paciente` (
`id_paciente` int(11)
,`total_facturado` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id_tratamiento` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id_tratamiento`, `id_paciente`, `id_medico`, `descripcion`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 1, 1, 'Tratamiento para hipertensión', '2024-03-10', '2024-06-10', 'En curso'),
(2, 2, 2, 'Tratamiento con antibióticos', '2024-03-11', '2024-03-20', 'Finalizado'),
(3, 3, 3, 'Terapia con cremas hidratantes', '2025-03-12', '2025-04-12', 'En curso');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_en_curso`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_en_curso` (
`id_tratamiento` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`descripcion` varchar(255)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_finalizados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_finalizados` (
`id_tratamiento` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`descripcion` varchar(255)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_por_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_por_especialidad` (
`especialidad` varchar(255)
,`total_tratamientos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_por_medico` (
`id_tratamiento` int(11)
,`descripcion` varchar(255)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` varchar(255)
,`id_medico` int(11)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_por_paciente` (
`id_tratamiento` int(11)
,`descripcion` varchar(255)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` varchar(255)
,`id_paciente` int(11)
,`nombre_paciente` varchar(255)
,`apellido_paciente` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tratamientos_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tratamientos_recientes` (
`id_tratamiento` int(11)
,`id_paciente` int(11)
,`id_medico` int(11)
,`descripcion` varchar(255)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ultima_formula_por_paciente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ultima_formula_por_paciente` (
`id_paciente` int(11)
,`nombre` varchar(255)
,`apellido` varchar(255)
,`id_medico` int(11)
,`nombre_medico` varchar(255)
,`apellido_medico` varchar(255)
,`fecha_emision` date
,`observaciones` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `valor_inventario_medicamentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `valor_inventario_medicamentos` (
`id_medicamento` int(11)
,`nombre` varchar(255)
,`cantidad_disponible` int(11)
,`precio_unitario` decimal(10,0)
,`valor_total` decimal(20,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cantidad_total_por_formula`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cantidad_total_por_formula` (
`id_formula` int(11)
,`total_medicamentos` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_formulas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_formulas` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`dosis` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_formula_medicamentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_formula_medicamentos` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`nombre_medicamento` varchar(255)
,`cantidad` int(11)
,`dosis` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_formulas_altas_dosis`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_formulas_altas_dosis` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`dosis` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_formulas_con_paracetamol`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_formulas_con_paracetamol` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`dosis` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_formulas_mas_medicamentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_formulas_mas_medicamentos` (
`id_formula` int(11)
,`total_medicamentos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_formulas_medicamentos_altas_cantidades`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_formulas_medicamentos_altas_cantidades` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`dosis` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicamentos_en_multiples_formulas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicamentos_en_multiples_formulas` (
`id_medicamento` int(11)
,`total_formulas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicamentos_mas_recetados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicamentos_mas_recetados` (
`id_medicamento` int(11)
,`veces_recetado` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicamentos_mayor_dosis`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicamentos_mayor_dosis` (
`id_detalle_formula` int(11)
,`id_formula` int(11)
,`id_medicamento` int(11)
,`cantidad` int(11)
,`dosis` varchar(255)
,`nombre_medicamento` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `cantidad_tratamientos_por_medico`
--
DROP TABLE IF EXISTS `cantidad_tratamientos_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidad_tratamientos_por_medico`  AS SELECT `t`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, count(0) AS `total_tratamientos` FROM (`tratamientos` `t` join `medicos` `m` on(`t`.`id_medico` = `m`.`id_medico`)) GROUP BY `t`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cantidad_tratamientos_por_paciente`
--
DROP TABLE IF EXISTS `cantidad_tratamientos_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidad_tratamientos_por_paciente`  AS SELECT `t`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, count(0) AS `total_tratamientos` FROM (`tratamientos` `t` join `pacientes` `p` on(`t`.`id_paciente` = `p`.`id_paciente`)) GROUP BY `t`.`id_paciente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_canceladas`
--
DROP TABLE IF EXISTS `citas_canceladas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_canceladas`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_cita` AS `fecha_cita`, `citas`.`hora_cita` AS `hora_cita`, `citas`.`estado` AS `estado`, `citas`.`motivo_consulta` AS `motivo_consulta` FROM `citas` WHERE `citas`.`estado` = 'Cancelada' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_completadas`
--
DROP TABLE IF EXISTS `citas_completadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_completadas`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_cita` AS `fecha_cita`, `citas`.`hora_cita` AS `hora_cita`, `citas`.`estado` AS `estado`, `citas`.`motivo_consulta` AS `motivo_consulta` FROM `citas` WHERE `citas`.`estado` = 'Completada' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_futuras`
--
DROP TABLE IF EXISTS `citas_futuras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_futuras`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_cita` AS `fecha_cita`, `citas`.`hora_cita` AS `hora_cita`, `citas`.`estado` AS `estado`, `citas`.`motivo_consulta` AS `motivo_consulta` FROM `citas` WHERE `citas`.`fecha_cita` >= curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_pasadas`
--
DROP TABLE IF EXISTS `citas_pasadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_pasadas`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_cita` AS `fecha_cita`, `citas`.`hora_cita` AS `hora_cita`, `citas`.`estado` AS `estado`, `citas`.`motivo_consulta` AS `motivo_consulta` FROM `citas` WHERE `citas`.`fecha_cita` < curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_pendientes`
--
DROP TABLE IF EXISTS `citas_pendientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_pendientes`  AS SELECT `citas`.`id_cita` AS `id_cita`, `citas`.`id_paciente` AS `id_paciente`, `citas`.`id_medico` AS `id_medico`, `citas`.`fecha_cita` AS `fecha_cita`, `citas`.`hora_cita` AS `hora_cita`, `citas`.`estado` AS `estado`, `citas`.`motivo_consulta` AS `motivo_consulta` FROM `citas` WHERE `citas`.`estado` = 'Pendiente' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_por_medico`
--
DROP TABLE IF EXISTS `citas_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_por_medico`  AS SELECT `c`.`id_cita` AS `id_cita`, `c`.`fecha_cita` AS `fecha_cita`, `c`.`hora_cita` AS `hora_cita`, `c`.`estado` AS `estado`, `c`.`motivo_consulta` AS `motivo_consulta`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `m`.`especialidad` AS `especialidad`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente` FROM ((`citas` `c` join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_por_mes`
--
DROP TABLE IF EXISTS `citas_por_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_por_mes`  AS SELECT year(`citas`.`fecha_cita`) AS `anio`, month(`citas`.`fecha_cita`) AS `mes`, count(0) AS `total_citas` FROM `citas` GROUP BY year(`citas`.`fecha_cita`), month(`citas`.`fecha_cita`) ORDER BY year(`citas`.`fecha_cita`) DESC, month(`citas`.`fecha_cita`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `citas_por_paciente`
--
DROP TABLE IF EXISTS `citas_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citas_por_paciente`  AS SELECT `c`.`id_cita` AS `id_cita`, `c`.`fecha_cita` AS `fecha_cita`, `c`.`hora_cita` AS `hora_cita`, `c`.`estado` AS `estado`, `c`.`motivo_consulta` AS `motivo_consulta`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `m`.`especialidad` AS `especialidad` FROM ((`citas` `c` join `pacientes` `p` on(`c`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`c`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_con_total_factura`
--
DROP TABLE IF EXISTS `detalle_con_total_factura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_con_total_factura`  AS SELECT `df`.`id_detalle_factura` AS `id_detalle_factura`, `df`.`id_factura` AS `id_factura`, `df`.`cantidad` AS `cantidad`, `df`.`precio_unitario` AS `precio_unitario`, `df`.`subtotal` AS `subtotal`, (select sum(`detalle_factura`.`subtotal`) from `detalle_factura` where `detalle_factura`.`id_factura` = `df`.`id_factura`) AS `total_factura` FROM `detalle_factura` AS `df` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_factura_completo`
--
DROP TABLE IF EXISTS `detalle_factura_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_factura_completo`  AS SELECT `df`.`id_detalle_factura` AS `id_detalle_factura`, `df`.`id_factura` AS `id_factura`, `s`.`nombre` AS `servicio`, `m`.`nombre` AS `medicamento`, `df`.`cantidad` AS `cantidad`, `df`.`precio_unitario` AS `precio_unitario`, `df`.`subtotal` AS `subtotal` FROM ((`detalle_factura` `df` left join `servicios` `s` on(`df`.`id_servicio` = `s`.`id_servicio`)) left join `medicamentos` `m` on(`df`.`id_medicamento` = `m`.`id_medicamento`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturacion_anual`
--
DROP TABLE IF EXISTS `facturacion_anual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturacion_anual`  AS SELECT year(`facturacion`.`fecha_emision`) AS `anio`, sum(`facturacion`.`monto_total`) AS `total_facturado` FROM `facturacion` GROUP BY year(`facturacion`.`fecha_emision`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_altas`
--
DROP TABLE IF EXISTS `facturas_altas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_altas`  AS SELECT `detalle_factura`.`id_factura` AS `id_factura`, sum(`detalle_factura`.`subtotal`) AS `total_factura` FROM `detalle_factura` GROUP BY `detalle_factura`.`id_factura` HAVING `total_factura` > 100000 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_con_datos_paciente`
--
DROP TABLE IF EXISTS `facturas_con_datos_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_con_datos_paciente`  AS SELECT `f`.`id_factura` AS `id_factura`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`monto_total` AS `monto_total`, `f`.`estado` AS `estado`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `p`.`numero_documento` AS `numero_documento` FROM (`facturacion` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_ordenadas_por_monto_asc`
--
DROP TABLE IF EXISTS `facturas_ordenadas_por_monto_asc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_ordenadas_por_monto_asc`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto_total` AS `monto_total`, `facturacion`.`estado` AS `estado` FROM `facturacion` ORDER BY `facturacion`.`monto_total` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_ordenadas_por_monto_desc`
--
DROP TABLE IF EXISTS `facturas_ordenadas_por_monto_desc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_ordenadas_por_monto_desc`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto_total` AS `monto_total`, `facturacion`.`estado` AS `estado` FROM `facturacion` ORDER BY `facturacion`.`monto_total` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_pagadas`
--
DROP TABLE IF EXISTS `facturas_pagadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_pagadas`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto_total` AS `monto_total`, `facturacion`.`estado` AS `estado` FROM `facturacion` WHERE `facturacion`.`estado` = 'Pagado' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_pendientes`
--
DROP TABLE IF EXISTS `facturas_pendientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_pendientes`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto_total` AS `monto_total`, `facturacion`.`estado` AS `estado` FROM `facturacion` WHERE `facturacion`.`estado` = 'Pendiente' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `facturas_recientes`
--
DROP TABLE IF EXISTS `facturas_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturas_recientes`  AS SELECT `facturacion`.`id_factura` AS `id_factura`, `facturacion`.`id_paciente` AS `id_paciente`, `facturacion`.`fecha_emision` AS `fecha_emision`, `facturacion`.`monto_total` AS `monto_total`, `facturacion`.`estado` AS `estado` FROM `facturacion` WHERE `facturacion`.`fecha_emision` >= curdate() - interval 1 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_detalladas`
--
DROP TABLE IF EXISTS `formulas_detalladas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_detalladas`  AS SELECT `f`.`id_formula` AS `id_formula`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`observaciones` AS `observaciones`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `m`.`especialidad` AS `especialidad` FROM ((`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_ordenadas`
--
DROP TABLE IF EXISTS `formulas_ordenadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_ordenadas`  AS SELECT `f`.`id_formula` AS `id_formula`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`observaciones` AS `observaciones`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico` FROM ((`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) ORDER BY `f`.`fecha_emision` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_por_especialidad`
--
DROP TABLE IF EXISTS `formulas_por_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_por_especialidad`  AS SELECT `f`.`id_formula` AS `id_formula`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`observaciones` AS `observaciones`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `m`.`especialidad` AS `especialidad` FROM ((`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) WHERE `m`.`especialidad` = 'Cardiología' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_por_medico`
--
DROP TABLE IF EXISTS `formulas_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_por_medico`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, `m`.`especialidad` AS `especialidad`, count(0) AS `total_formulas` FROM (`formulas_medicas` `f` join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) GROUP BY `m`.`id_medico` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_por_paciente`
--
DROP TABLE IF EXISTS `formulas_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_por_paciente`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, count(0) AS `total_formulas` FROM (`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) GROUP BY `p`.`id_paciente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `formulas_recientes`
--
DROP TABLE IF EXISTS `formulas_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `formulas_recientes`  AS SELECT `formulas_medicas`.`id_formula` AS `id_formula`, `formulas_medicas`.`id_paciente` AS `id_paciente`, `formulas_medicas`.`id_medico` AS `id_medico`, `formulas_medicas`.`fecha_emision` AS `fecha_emision`, `formulas_medicas`.`observaciones` AS `observaciones` FROM `formulas_medicas` WHERE `formulas_medicas`.`fecha_emision` >= curdate() - interval 1 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `historia_completa`
--
DROP TABLE IF EXISTS `historia_completa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `historia_completa`  AS SELECT `hc`.`id_historia` AS `id_historia`, `hc`.`fecha_consulta` AS `fecha_consulta`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `hc`.`diagnostico` AS `diagnostico`, `hc`.`observaciones` AS `observaciones` FROM ((`historia_clinica` `hc` join `pacientes` `p` on(`hc`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`hc`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ingresos_mensuales`
--
DROP TABLE IF EXISTS `ingresos_mensuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ingresos_mensuales`  AS SELECT year(`facturacion`.`fecha_emision`) AS `anio`, month(`facturacion`.`fecha_emision`) AS `mes`, sum(`facturacion`.`monto_total`) AS `ingresos` FROM `facturacion` GROUP BY year(`facturacion`.`fecha_emision`), month(`facturacion`.`fecha_emision`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_agotados`
--
DROP TABLE IF EXISTS `medicamentos_agotados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_agotados`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` WHERE `medicamentos`.`cantidad_disponible` = 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_baja_existencia`
--
DROP TABLE IF EXISTS `medicamentos_baja_existencia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_baja_existencia`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` WHERE `medicamentos`.`cantidad_disponible` < 20 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_baratos`
--
DROP TABLE IF EXISTS `medicamentos_baratos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_baratos`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` WHERE `medicamentos`.`precio_unitario` < 1000 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_descripcion_larga`
--
DROP TABLE IF EXISTS `medicamentos_descripcion_larga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_descripcion_larga`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` WHERE octet_length(`medicamentos`.`descripcion`) > 100 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_disponibles`
--
DROP TABLE IF EXISTS `medicamentos_disponibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_disponibles`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` WHERE `medicamentos`.`cantidad_disponible` > 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_facturados`
--
DROP TABLE IF EXISTS `medicamentos_facturados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_facturados`  AS SELECT `detalle_factura`.`id_detalle_factura` AS `id_detalle_factura`, `detalle_factura`.`id_factura` AS `id_factura`, `detalle_factura`.`id_medicamento` AS `id_medicamento`, `detalle_factura`.`cantidad` AS `cantidad`, `detalle_factura`.`precio_unitario` AS `precio_unitario`, `detalle_factura`.`subtotal` AS `subtotal` FROM `detalle_factura` WHERE `detalle_factura`.`id_medicamento` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_mas_caros`
--
DROP TABLE IF EXISTS `medicamentos_mas_caros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_mas_caros`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` ORDER BY `medicamentos`.`precio_unitario` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_ordenados_stock`
--
DROP TABLE IF EXISTS `medicamentos_ordenados_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_ordenados_stock`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` ORDER BY `medicamentos`.`cantidad_disponible` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_ordenados_stock_asc`
--
DROP TABLE IF EXISTS `medicamentos_ordenados_stock_asc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_ordenados_stock_asc`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`descripcion` AS `descripcion`, `medicamentos`.`fabricante` AS `fabricante`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario` FROM `medicamentos` ORDER BY `medicamentos`.`cantidad_disponible` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicamentos_por_fabricante`
--
DROP TABLE IF EXISTS `medicamentos_por_fabricante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicamentos_por_fabricante`  AS SELECT `medicamentos`.`fabricante` AS `fabricante`, count(0) AS `total_medicamentos` FROM `medicamentos` GROUP BY `medicamentos`.`fabricante` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_activos_formulas`
--
DROP TABLE IF EXISTS `medicos_activos_formulas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_activos_formulas`  AS SELECT DISTINCT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, `m`.`especialidad` AS `especialidad` FROM (`formulas_medicas` `f` join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) WHERE `f`.`fecha_emision` >= curdate() - interval 6 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_antiguos`
--
DROP TABLE IF EXISTS `medicos_antiguos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_antiguos`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` ORDER BY `medicos`.`fecha_contratacion` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_cardiologos`
--
DROP TABLE IF EXISTS `medicos_cardiologos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_cardiologos`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` WHERE `medicos`.`especialidad` = 'Cardiología' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_con_email`
--
DROP TABLE IF EXISTS `medicos_con_email`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_con_email`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` WHERE `medicos`.`email` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_con_telefono`
--
DROP TABLE IF EXISTS `medicos_con_telefono`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_con_telefono`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` WHERE `medicos`.`telefono` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_nombre_completo`
--
DROP TABLE IF EXISTS `medicos_nombre_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_nombre_completo`  AS SELECT `medicos`.`id_medico` AS `id_medico`, concat(`medicos`.`nombre`,' ',`medicos`.`apellido`) AS `nombre_completo`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email` FROM `medicos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_ordenados`
--
DROP TABLE IF EXISTS `medicos_ordenados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_ordenados`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` ORDER BY `medicos`.`especialidad` ASC, `medicos`.`apellido` ASC, `medicos`.`nombre` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_por_especialidad`
--
DROP TABLE IF EXISTS `medicos_por_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_por_especialidad`  AS SELECT `medicos`.`especialidad` AS `especialidad`, count(0) AS `total` FROM `medicos` GROUP BY `medicos`.`especialidad` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `medicos_recientes`
--
DROP TABLE IF EXISTS `medicos_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medicos_recientes`  AS SELECT `medicos`.`id_medico` AS `id_medico`, `medicos`.`nombre` AS `nombre`, `medicos`.`apellido` AS `apellido`, `medicos`.`especialidad` AS `especialidad`, `medicos`.`numero_licencia` AS `numero_licencia`, `medicos`.`telefono` AS `telefono`, `medicos`.`email` AS `email`, `medicos`.`fecha_contratacion` AS `fecha_contratacion`, `medicos`.`password` AS `password` FROM `medicos` WHERE `medicos`.`fecha_contratacion` >= curdate() - interval 6 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_contactables`
--
DROP TABLE IF EXISTS `pacientes_contactables`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_contactables`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` WHERE `pacientes`.`direccion` is not null AND `pacientes`.`telefono` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_con_edad`
--
DROP TABLE IF EXISTS `pacientes_con_edad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_con_edad`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) AS `edad` FROM `pacientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_con_email`
--
DROP TABLE IF EXISTS `pacientes_con_email`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_con_email`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` WHERE `pacientes`.`email` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_con_facturas_pendientes`
--
DROP TABLE IF EXISTS `pacientes_con_facturas_pendientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_con_facturas_pendientes`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `f`.`monto_total` AS `monto_total`, `f`.`fecha_emision` AS `fecha_emision` FROM (`pacientes` `p` join `facturacion` `f` on(`p`.`id_paciente` = `f`.`id_paciente`)) WHERE `f`.`estado` = 'Pendiente' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_mayores`
--
DROP TABLE IF EXISTS `pacientes_mayores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_mayores`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` WHERE timestampdiff(YEAR,`pacientes`.`fecha_nacimiento`,curdate()) >= 18 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_mayor_facturacion`
--
DROP TABLE IF EXISTS `pacientes_mayor_facturacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_mayor_facturacion`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, sum(`f`.`monto_total`) AS `total_facturado` FROM (`pacientes` `p` join `facturacion` `f` on(`p`.`id_paciente` = `f`.`id_paciente`)) GROUP BY `p`.`id_paciente` ORDER BY sum(`f`.`monto_total`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_multimedicos`
--
DROP TABLE IF EXISTS `pacientes_multimedicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_multimedicos`  AS SELECT `formulas_medicas`.`id_paciente` AS `id_paciente`, count(distinct `formulas_medicas`.`id_medico`) AS `total_medicos` FROM `formulas_medicas` GROUP BY `formulas_medicas`.`id_paciente` HAVING `total_medicos` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_nacidos_antes_2000`
--
DROP TABLE IF EXISTS `pacientes_nacidos_antes_2000`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_nacidos_antes_2000`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` WHERE `pacientes`.`fecha_nacimiento` < '2000-01-01' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_nombre_completo`
--
DROP TABLE IF EXISTS `pacientes_nombre_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_nombre_completo`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, concat(`pacientes`.`nombre`,' ',`pacientes`.`apellido`) AS `nombre_completo`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email` FROM `pacientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_ordenados`
--
DROP TABLE IF EXISTS `pacientes_ordenados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_ordenados`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` ORDER BY `pacientes`.`fecha_registro` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_por_genero`
--
DROP TABLE IF EXISTS `pacientes_por_genero`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_por_genero`  AS SELECT `pacientes`.`genero` AS `genero`, count(0) AS `total` FROM `pacientes` GROUP BY `pacientes`.`genero` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_por_tipo_doc`
--
DROP TABLE IF EXISTS `pacientes_por_tipo_doc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_por_tipo_doc`  AS SELECT `pacientes`.`tipo_documento` AS `tipo_documento`, count(0) AS `total` FROM `pacientes` GROUP BY `pacientes`.`tipo_documento` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pacientes_recientes`
--
DROP TABLE IF EXISTS `pacientes_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacientes_recientes`  AS SELECT `pacientes`.`id_paciente` AS `id_paciente`, `pacientes`.`nombre` AS `nombre`, `pacientes`.`apellido` AS `apellido`, `pacientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `pacientes`.`genero` AS `genero`, `pacientes`.`tipo_documento` AS `tipo_documento`, `pacientes`.`numero_documento` AS `numero_documento`, `pacientes`.`direccion` AS `direccion`, `pacientes`.`telefono` AS `telefono`, `pacientes`.`email` AS `email`, `pacientes`.`fecha_registro` AS `fecha_registro`, `pacientes`.`password` AS `password` FROM `pacientes` WHERE `pacientes`.`fecha_registro` >= curdate() - interval 30 day ;

-- --------------------------------------------------------

--
-- Estructura para la vista `primera_formula_por_paciente`
--
DROP TABLE IF EXISTS `primera_formula_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `primera_formula_por_paciente`  AS SELECT `f`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `f`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`observaciones` AS `observaciones` FROM ((`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) WHERE `f`.`fecha_emision` = (select min(`formulas_medicas`.`fecha_emision`) from `formulas_medicas` where `formulas_medicas`.`id_paciente` = `f`.`id_paciente`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_con_descripcion`
--
DROP TABLE IF EXISTS `servicios_con_descripcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_con_descripcion`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`descripcion` is not null AND `servicios`.`descripcion` <> '' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_con_impuesto`
--
DROP TABLE IF EXISTS `servicios_con_impuesto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_con_impuesto`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio`, `servicios`.`precio`* 1.15 AS `precio_final` FROM `servicios` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_costosos`
--
DROP TABLE IF EXISTS `servicios_costosos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_costosos`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`precio` > 100000 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_economicos`
--
DROP TABLE IF EXISTS `servicios_economicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_economicos`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`precio` <= 50 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_facturados`
--
DROP TABLE IF EXISTS `servicios_facturados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_facturados`  AS SELECT `detalle_factura`.`id_detalle_factura` AS `id_detalle_factura`, `detalle_factura`.`id_factura` AS `id_factura`, `detalle_factura`.`id_servicio` AS `id_servicio`, `detalle_factura`.`cantidad` AS `cantidad`, `detalle_factura`.`precio_unitario` AS `precio_unitario`, `detalle_factura`.`subtotal` AS `subtotal` FROM `detalle_factura` WHERE `detalle_factura`.`id_servicio` is not null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_ordenados_precio`
--
DROP TABLE IF EXISTS `servicios_ordenados_precio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_ordenados_precio`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` ORDER BY `servicios`.`precio` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_ordenados_precio_asc`
--
DROP TABLE IF EXISTS `servicios_ordenados_precio_asc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_ordenados_precio_asc`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` ORDER BY `servicios`.`precio` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_ordenados_precio_desc`
--
DROP TABLE IF EXISTS `servicios_ordenados_precio_desc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_ordenados_precio_desc`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` ORDER BY `servicios`.`precio` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_precio_redondeado`
--
DROP TABLE IF EXISTS `servicios_precio_redondeado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_precio_redondeado`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`precio` = round(`servicios`.`precio`,0) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicios_sin_descripcion`
--
DROP TABLE IF EXISTS `servicios_sin_descripcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicios_sin_descripcion`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`descripcion` is null OR `servicios`.`descripcion` = '' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `servicio_extremos`
--
DROP TABLE IF EXISTS `servicio_extremos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicio_extremos`  AS SELECT `servicios`.`id_servicio` AS `id_servicio`, `servicios`.`nombre` AS `nombre`, `servicios`.`descripcion` AS `descripcion`, `servicios`.`precio` AS `precio` FROM `servicios` WHERE `servicios`.`precio` = (select max(`servicios`.`precio`) from `servicios`) OR `servicios`.`precio` = (select min(`servicios`.`precio`) from `servicios`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `total_citas_por_medico`
--
DROP TABLE IF EXISTS `total_citas_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_citas_por_medico`  AS SELECT `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre`, `m`.`apellido` AS `apellido`, `m`.`especialidad` AS `especialidad`, count(`c`.`id_cita`) AS `total_citas` FROM (`medicos` `m` left join `citas` `c` on(`m`.`id_medico` = `c`.`id_medico`)) GROUP BY `m`.`id_medico`, `m`.`nombre`, `m`.`apellido`, `m`.`especialidad` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `total_citas_por_paciente`
--
DROP TABLE IF EXISTS `total_citas_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_citas_por_paciente`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, count(`c`.`id_cita`) AS `total_citas` FROM (`pacientes` `p` left join `citas` `c` on(`p`.`id_paciente` = `c`.`id_paciente`)) GROUP BY `p`.`id_paciente`, `p`.`nombre`, `p`.`apellido` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `total_facturado_por_paciente`
--
DROP TABLE IF EXISTS `total_facturado_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_facturado_por_paciente`  AS SELECT `facturacion`.`id_paciente` AS `id_paciente`, sum(`facturacion`.`monto_total`) AS `total_facturado` FROM `facturacion` GROUP BY `facturacion`.`id_paciente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_en_curso`
--
DROP TABLE IF EXISTS `tratamientos_en_curso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_en_curso`  AS SELECT `tratamientos`.`id_tratamiento` AS `id_tratamiento`, `tratamientos`.`id_paciente` AS `id_paciente`, `tratamientos`.`id_medico` AS `id_medico`, `tratamientos`.`descripcion` AS `descripcion`, `tratamientos`.`fecha_inicio` AS `fecha_inicio`, `tratamientos`.`fecha_fin` AS `fecha_fin`, `tratamientos`.`estado` AS `estado` FROM `tratamientos` WHERE `tratamientos`.`estado` = 'En curso' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_finalizados`
--
DROP TABLE IF EXISTS `tratamientos_finalizados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_finalizados`  AS SELECT `tratamientos`.`id_tratamiento` AS `id_tratamiento`, `tratamientos`.`id_paciente` AS `id_paciente`, `tratamientos`.`id_medico` AS `id_medico`, `tratamientos`.`descripcion` AS `descripcion`, `tratamientos`.`fecha_inicio` AS `fecha_inicio`, `tratamientos`.`fecha_fin` AS `fecha_fin`, `tratamientos`.`estado` AS `estado` FROM `tratamientos` WHERE `tratamientos`.`estado` = 'Finalizado' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_por_especialidad`
--
DROP TABLE IF EXISTS `tratamientos_por_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_por_especialidad`  AS SELECT `m`.`especialidad` AS `especialidad`, count(0) AS `total_tratamientos` FROM (`tratamientos` `t` join `medicos` `m` on(`t`.`id_medico` = `m`.`id_medico`)) WHERE `t`.`estado` = 'Finalizado' GROUP BY `m`.`especialidad` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_por_medico`
--
DROP TABLE IF EXISTS `tratamientos_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_por_medico`  AS SELECT `t`.`id_tratamiento` AS `id_tratamiento`, `t`.`descripcion` AS `descripcion`, `t`.`fecha_inicio` AS `fecha_inicio`, `t`.`fecha_fin` AS `fecha_fin`, `t`.`estado` AS `estado`, `m`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico` FROM (`tratamientos` `t` join `medicos` `m` on(`t`.`id_medico` = `m`.`id_medico`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_por_paciente`
--
DROP TABLE IF EXISTS `tratamientos_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_por_paciente`  AS SELECT `t`.`id_tratamiento` AS `id_tratamiento`, `t`.`descripcion` AS `descripcion`, `t`.`fecha_inicio` AS `fecha_inicio`, `t`.`fecha_fin` AS `fecha_fin`, `t`.`estado` AS `estado`, `p`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre_paciente`, `p`.`apellido` AS `apellido_paciente` FROM (`tratamientos` `t` join `pacientes` `p` on(`t`.`id_paciente` = `p`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tratamientos_recientes`
--
DROP TABLE IF EXISTS `tratamientos_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tratamientos_recientes`  AS SELECT `tratamientos`.`id_tratamiento` AS `id_tratamiento`, `tratamientos`.`id_paciente` AS `id_paciente`, `tratamientos`.`id_medico` AS `id_medico`, `tratamientos`.`descripcion` AS `descripcion`, `tratamientos`.`fecha_inicio` AS `fecha_inicio`, `tratamientos`.`fecha_fin` AS `fecha_fin`, `tratamientos`.`estado` AS `estado` FROM `tratamientos` WHERE `tratamientos`.`fecha_inicio` >= curdate() - interval 6 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ultima_formula_por_paciente`
--
DROP TABLE IF EXISTS `ultima_formula_por_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultima_formula_por_paciente`  AS SELECT `f`.`id_paciente` AS `id_paciente`, `p`.`nombre` AS `nombre`, `p`.`apellido` AS `apellido`, `f`.`id_medico` AS `id_medico`, `m`.`nombre` AS `nombre_medico`, `m`.`apellido` AS `apellido_medico`, `f`.`fecha_emision` AS `fecha_emision`, `f`.`observaciones` AS `observaciones` FROM ((`formulas_medicas` `f` join `pacientes` `p` on(`f`.`id_paciente` = `p`.`id_paciente`)) join `medicos` `m` on(`f`.`id_medico` = `m`.`id_medico`)) WHERE `f`.`fecha_emision` = (select max(`formulas_medicas`.`fecha_emision`) from `formulas_medicas` where `formulas_medicas`.`id_paciente` = `f`.`id_paciente`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `valor_inventario_medicamentos`
--
DROP TABLE IF EXISTS `valor_inventario_medicamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `valor_inventario_medicamentos`  AS SELECT `medicamentos`.`id_medicamento` AS `id_medicamento`, `medicamentos`.`nombre` AS `nombre`, `medicamentos`.`cantidad_disponible` AS `cantidad_disponible`, `medicamentos`.`precio_unitario` AS `precio_unitario`, `medicamentos`.`cantidad_disponible`* `medicamentos`.`precio_unitario` AS `valor_total` FROM `medicamentos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cantidad_total_por_formula`
--
DROP TABLE IF EXISTS `vista_cantidad_total_por_formula`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cantidad_total_por_formula`  AS SELECT `detalle_formula`.`id_formula` AS `id_formula`, sum(`detalle_formula`.`cantidad`) AS `total_medicamentos` FROM `detalle_formula` GROUP BY `detalle_formula`.`id_formula` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_formulas`
--
DROP TABLE IF EXISTS `vista_detalle_formulas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_formulas`  AS SELECT `detalle_formula`.`id_detalle_formula` AS `id_detalle_formula`, `detalle_formula`.`id_formula` AS `id_formula`, `detalle_formula`.`id_medicamento` AS `id_medicamento`, `detalle_formula`.`cantidad` AS `cantidad`, `detalle_formula`.`dosis` AS `dosis` FROM `detalle_formula` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_formula_medicamentos`
--
DROP TABLE IF EXISTS `vista_detalle_formula_medicamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_formula_medicamentos`  AS SELECT `df`.`id_detalle_formula` AS `id_detalle_formula`, `df`.`id_formula` AS `id_formula`, `m`.`nombre` AS `nombre_medicamento`, `df`.`cantidad` AS `cantidad`, `df`.`dosis` AS `dosis` FROM (`detalle_formula` `df` join `medicamentos` `m` on(`df`.`id_medicamento` = `m`.`id_medicamento`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_formulas_altas_dosis`
--
DROP TABLE IF EXISTS `vista_formulas_altas_dosis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_formulas_altas_dosis`  AS SELECT `df`.`id_detalle_formula` AS `id_detalle_formula`, `df`.`id_formula` AS `id_formula`, `df`.`id_medicamento` AS `id_medicamento`, `df`.`cantidad` AS `cantidad`, `df`.`dosis` AS `dosis` FROM `detalle_formula` AS `df` WHERE `df`.`dosis` like '%mg%' AND cast(regexp_substr(`df`.`dosis`,'[0-9]+') as signed) > 500 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_formulas_con_paracetamol`
--
DROP TABLE IF EXISTS `vista_formulas_con_paracetamol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_formulas_con_paracetamol`  AS SELECT `df`.`id_detalle_formula` AS `id_detalle_formula`, `df`.`id_formula` AS `id_formula`, `df`.`id_medicamento` AS `id_medicamento`, `df`.`cantidad` AS `cantidad`, `df`.`dosis` AS `dosis` FROM (`detalle_formula` `df` join `medicamentos` `m` on(`df`.`id_medicamento` = `m`.`id_medicamento`)) WHERE `m`.`nombre` = 'Paracetamol' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_formulas_mas_medicamentos`
--
DROP TABLE IF EXISTS `vista_formulas_mas_medicamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_formulas_mas_medicamentos`  AS SELECT `detalle_formula`.`id_formula` AS `id_formula`, count(`detalle_formula`.`id_medicamento`) AS `total_medicamentos` FROM `detalle_formula` GROUP BY `detalle_formula`.`id_formula` ORDER BY count(`detalle_formula`.`id_medicamento`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_formulas_medicamentos_altas_cantidades`
--
DROP TABLE IF EXISTS `vista_formulas_medicamentos_altas_cantidades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_formulas_medicamentos_altas_cantidades`  AS SELECT `detalle_formula`.`id_detalle_formula` AS `id_detalle_formula`, `detalle_formula`.`id_formula` AS `id_formula`, `detalle_formula`.`id_medicamento` AS `id_medicamento`, `detalle_formula`.`cantidad` AS `cantidad`, `detalle_formula`.`dosis` AS `dosis` FROM `detalle_formula` WHERE `detalle_formula`.`cantidad` > 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicamentos_en_multiples_formulas`
--
DROP TABLE IF EXISTS `vista_medicamentos_en_multiples_formulas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicamentos_en_multiples_formulas`  AS SELECT `detalle_formula`.`id_medicamento` AS `id_medicamento`, count(distinct `detalle_formula`.`id_formula`) AS `total_formulas` FROM `detalle_formula` GROUP BY `detalle_formula`.`id_medicamento` HAVING `total_formulas` > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicamentos_mas_recetados`
--
DROP TABLE IF EXISTS `vista_medicamentos_mas_recetados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicamentos_mas_recetados`  AS SELECT `detalle_formula`.`id_medicamento` AS `id_medicamento`, count(0) AS `veces_recetado` FROM `detalle_formula` GROUP BY `detalle_formula`.`id_medicamento` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicamentos_mayor_dosis`
--
DROP TABLE IF EXISTS `vista_medicamentos_mayor_dosis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicamentos_mayor_dosis`  AS SELECT `df`.`id_detalle_formula` AS `id_detalle_formula`, `df`.`id_formula` AS `id_formula`, `df`.`id_medicamento` AS `id_medicamento`, `df`.`cantidad` AS `cantidad`, `df`.`dosis` AS `dosis`, `m`.`nombre` AS `nombre_medicamento` FROM (`detalle_formula` `df` join `medicamentos` `m` on(`df`.`id_medicamento` = `m`.`id_medicamento`)) ORDER BY cast(regexp_substr(`df`.`dosis`,'[0-9]+') as signed) DESC LIMIT 0, 10 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle_factura`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `detalle_formula`
--
ALTER TABLE `detalle_formula`
  ADD PRIMARY KEY (`id_detalle_formula`),
  ADD KEY `id_formula` (`id_formula`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `formulas_medicas`
--
ALTER TABLE `formulas_medicas`
  ADD PRIMARY KEY (`id_formula`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_tratamiento` (`id_tratamiento`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `numero_licencia` (`numero_licencia`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_formula`
--
ALTER TABLE `detalle_formula`
  MODIFY `id_detalle_formula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `formulas_medicas`
--
ALTER TABLE `formulas_medicas`
  MODIFY `id_formula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturacion` (`id_factura`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`);

--
-- Filtros para la tabla `detalle_formula`
--
ALTER TABLE `detalle_formula`
  ADD CONSTRAINT `detalle_formula_ibfk_1` FOREIGN KEY (`id_formula`) REFERENCES `formulas_medicas` (`id_formula`),
  ADD CONSTRAINT `detalle_formula_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `formulas_medicas`
--
ALTER TABLE `formulas_medicas`
  ADD CONSTRAINT `formulas_medicas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `formulas_medicas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `historia_clinica_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `historia_clinica_ibfk_3` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `tratamientos_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
