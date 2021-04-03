-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2021 a las 18:13:16
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

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
(12, '2021_03_13_141624_create_documentos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT de la tabla `log_errors`
--
ALTER TABLE `log_errors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
