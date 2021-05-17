-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2021 a las 17:03:20
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `documentos_digitales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados`
--

CREATE TABLE `certificados` (
  `id` int(11) NOT NULL,
  `empresa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trabajador` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_cese` date NOT NULL,
  `url_documento` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_pdf` int(11) NOT NULL DEFAULT 0,
  `estado_correo` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `certificados`
--

INSERT INTO `certificados` (`id`, `empresa`, `ruc`, `trabajador`, `dni`, `cargo`, `fecha_ingreso`, `fecha_cese`, `url_documento`, `correo`, `estado_pdf`, `estado_correo`, `created_at`, `updated_at`) VALUES
(1, 'PERUTEC', '12345678901', 'LUIS CLAUDIO PONCE', '46794282', 'ANALISTA DE SITEMAS', '2019-01-01', '2020-09-01', 'documentos/certificados/46794282.pdf', 'luis.claudio@perutec.com.pe', 1, 1, '2021-04-24 16:05:49', '2021-05-01 14:42:51'),
(2, 'PERUTEC', '12345678901', 'OMAR MORI', '12340099', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/12340099.pdf', 'carlosmorih33@gmail.com', 1, 1, '2021-04-24 16:05:49', '2021-05-01 14:42:51'),
(3, 'PERUTEC', '12345678901', 'GUSTAVO MIRANDA', '12340777', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/12340777.pdf', 'gustavo.sistemas2@qgmail.com', 1, 1, '2021-04-24 16:05:49', '2021-05-01 14:42:52'),
(4, 'PERUTEC', '12345678901', 'CRISTIAN VARGAS', '123407468', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/123407468.pdf', 'cvargas1477@gmail.com', 1, 1, '2021-04-24 16:05:49', '2021-05-01 14:42:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_correo`
--

CREATE TABLE `configuracion_correo` (
  `id` int(11) NOT NULL,
  `driver` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_reply` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion_correo`
--

INSERT INTO `configuracion_correo` (`id`, `driver`, `host`, `port`, `username`, `password`, `encryption`, `address`, `name`, `email_reply`, `email_cc`, `created_at`, `updated_at`) VALUES
(1, 'SMTP', 'smtp.gmail.com', '587', 'tallerlaravel7notificaciones@gmail.com', 'taller2021', 'tls', 'tallerlaravel7notificaciones@gmail.com', 'tallerlaravel7notificaciones@gmail.com', 'tallerlaravel7notificaciones@gmail.com', 'tallerlaravel7notificaciones@gmail.com', '2021-05-01 15:49:05', '2021-05-01 15:49:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `estado` enum('pendiente','aprobado','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `descripcion`, `tipo`, `estado`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Boletas de Pago', 2, 'pendiente', 1, '2021-03-13 14:55:23', '2021-03-13 14:55:23'),
(3, 'Certificados de Trabajo', 2, 'pendiente', 1, '2021-03-13 14:56:47', '2021-03-13 14:56:47'),
(4, 'Constancia de Cese', 2, 'pendiente', 2, '2021-03-13 14:56:47', '2021-03-13 14:56:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firmas_digitales`
--

CREATE TABLE `firmas_digitales` (
  `id` int(11) NOT NULL,
  `nif` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_pais` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_comun` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_serie` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_certificado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entidad_emisora` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `pem` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `firmas_digitales`
--

INSERT INTO `firmas_digitales` (`id`, `nif`, `codigo_pais`, `nombre_comun`, `cargo`, `numero_serie`, `tipo_certificado`, `entidad_emisora`, `fecha_inicio`, `fecha_fin`, `pem`, `created_at`, `updated_at`) VALUES
(1, 'Gerente - DNI 46794282', 'PE', 'Luis Augusto Claudio Ponce', 'Gerente', '4FA147620A2810FD', 'DNI 46794282', 'Llama.pe SHA256 Standard CA LLAMA.PE', '2021-05-14', '2022-05-14', '', '2021-05-16 02:02:47', '2021-05-16 02:02:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_errors`
--

CREATE TABLE `log_errors` (
  `id` int(11) NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `log_errors`
--

INSERT INTO `log_errors` (`id`, `code`, `message`, `created_at`, `updated_at`) VALUES
(1, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:16:27 where `id` = 9)', '2021-04-03 15:16:27', '2021-04-03 15:16:27'),
(2, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:16:54 where `id` = 9)', '2021-04-03 15:16:54', '2021-04-03 15:16:54'),
(3, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:17:39 where `id` = 9)', '2021-04-03 15:17:39', '2021-04-03 15:17:39'),
(4, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:17:51 where `id` = 9)', '2021-04-03 15:17:51', '2021-04-03 15:17:51'),
(5, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:31:13 where `id` = 9)', '2021-04-03 15:31:13', '2021-04-03 15:31:13'),
(6, '23000', 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'juan@perutec.com.pe\' for key \'users_email_unique\' (SQL: update `users` set `email` = juan@perutec.com.pe, `users`.`updated_at` = 2021-04-03 10:32:02 where `id` = 9)', '2021-04-03 15:32:02', '2021-04-03 15:32:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `title`, `text`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Buen Trabajo', 'Registro Agregado', 'success', NULL, NULL),
(2, 'Buen Trabajo', 'Registro Actualizado', 'success', NULL, NULL),
(3, 'El Correo ya se encuentra registrado', 'Intente con otro correo', 'warning', NULL, NULL),
(4, 'El Documento ya se encuentra registrado', 'Intente con otro número documento', 'warning', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2021_03_13_141624_create_documentos_table', 1),
(13, '2021_04_17_084729_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 1),
(2, 'App\\User', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('luis.claudio@perutec.com.pe', '$2y$10$XhKXg2zaZ07e5h7BdX4jG.S4SAasJGl85WS73IHS3UujEgGIEMS2S', '2021-05-01 14:06:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Documentos', 'web', '2021-04-17 14:03:15', '2021-04-17 14:03:15'),
(2, 'Usuarios', 'web', '2021-04-17 14:03:42', '2021-04-17 14:03:42'),
(3, 'Reportes', 'web', '2021-04-17 14:12:01', '2021-04-17 14:12:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-04-17 13:59:52', '2021-04-17 13:59:52'),
(2, 'usuario', 'web', '2021-04-17 14:02:00', '2021-04-17 14:02:00'),
(3, 'invitado', 'web', '2021-04-17 14:02:12', '2021-04-17 14:02:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio_configuraciones`
--

CREATE TABLE `sitio_configuraciones` (
  `nombre` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sitio_configuraciones`
--

INSERT INTO `sitio_configuraciones` (`nombre`, `descripcion`, `valor`) VALUES
('correos_copia', 'Correos a los cuales se les envía copia', 'cvargas1477@gmail.com,carlosmorih33@gmail.com,gustavo.sistemas20@gmail.com'),
('from_correo', 'nombre de correo', 'tallerlaravel7notificaciones@gmail.com'),
('limit_envio_correo', 'Valor limite de registros ', '2'),
('limit_generacion_pdf', 'Valor limite de registros ', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombres`, `apellidos`, `document_number`, `email`, `email_verified_at`, `password`, `remember_token`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Luis Augusto', 'Claudio Ponce', '12345678', 'luis.claudio@perutec.com.pe', NULL, '$2y$10$FTeE0Mhvt7W5IP/pxj0XjOSN3UH1bqoWodGrDly.aGHI6f.9P8jPS', 'dt3UILNPSkaIPlrDyHm6ro3r2AxDKoTad11Cket4k12pmxW3M8JdiOjhc73w', 1, '2021-03-20 15:43:01', '2021-04-03 13:22:10'),
(3, 'Cesar', 'Ponce', '12345600', 'cesar@perutec.com.pe', NULL, '$2y$10$NqT8qoOLxTPpyTGlngDcVu7Sfo6J00yjaut.wMevrHOv7V6gaTrwK', NULL, 0, '2021-03-20 15:46:26', '2021-04-03 13:22:13'),
(4, 'demo', 'demo', '1233233', 'demo@perutec.com.pe', NULL, '$2y$10$bMLwJfgLDc0YSqJGSMFIXOo/C6TXOnmUmPrHOCqTuRKemi2TZ9r3O', NULL, 0, '2021-03-27 15:00:10', '2021-03-27 16:54:10'),
(7, 'Juan', 'Perez', '3333', 'juan@perutec.com.pe', NULL, '$2y$10$nVFrv24HhjXuCJlgPr0WwOPu/RPVrEIM5o9dYILbdu4TCQ6KTYDLi', NULL, 1, '2021-03-27 15:45:16', '2021-03-27 16:52:59'),
(8, 'demo', 'demo', '13333', 'pruebas@perutec.com.pe', NULL, '$2y$10$XDwKw0IH3XloIWJaHX7Mn.4fhPQqIgcq1crgPm6Nnccw4N2dU77C2', NULL, 1, '2021-03-27 15:48:03', '2021-03-27 16:53:02'),
(9, 'Jose', 'Perez Garcia', '3446666', 'yyyyy@perutec.com.pe', NULL, '$2y$10$xQC0BML26xCkmvBdXbpwXO0rwSGpcvd/q8VygAso0e/mVujB9tune', NULL, 1, '2021-03-27 15:49:49', '2021-04-03 15:44:50'),
(10, 'sss', 'ss', '00000000000', 'demo@perute.com.pe', NULL, '$2y$10$FH1Ia27HfdhmUB18DToo5uAW9wMHO3MrdGVh4tiUok2VDnroYUZbK', NULL, 0, '2021-04-03 15:49:24', '2021-04-03 15:49:24'),
(11, 'ddd', 'dd', '1333344444', 'hola@peru.com', NULL, '$2y$10$2DMd2e2Wluwug7xJkBGope3Y9oiuaLF8f5JclC1P1rETuovVObt9u', NULL, 0, '2021-04-03 15:53:01', '2021-04-03 15:53:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion_correo`
--
ALTER TABLE `configuracion_correo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `firmas_digitales`
--
ALTER TABLE `firmas_digitales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log_errors`
--
ALTER TABLE `log_errors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `document_number` (`document_number`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `certificados`
--
ALTER TABLE `certificados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `firmas_digitales`
--
ALTER TABLE `firmas_digitales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_errors`
--
ALTER TABLE `log_errors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
