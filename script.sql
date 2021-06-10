-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2021 a las 10:09:45
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
(1, 'PERUTEC', '12345678901', 'LUIS CLAUDIO PONCE', '46794282', 'ANALISTA DE SITEMAS', '2019-01-01', '2020-09-01', 'documentos/certificados/46794282.pdf', 'luis.claudio@perutec.com.pe', 1, 1, '2021-04-24 16:05:49', '2021-06-06 01:12:36'),
(2, 'PERUTEC', '12345678901', 'OMAR MORI', '12340099', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/12340099.pdf', 'carlosmorih33@gmail.com', 1, 1, '2021-04-24 16:05:49', '2021-06-06 01:15:51'),
(3, 'PERUTEC', '12345678901', 'GUSTAVO MIRANDA', '12340777', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/12340777.pdf', 'gustavo.sistemas2@qgmail.com', 1, 1, '2021-04-24 16:05:49', '2021-06-06 01:16:24'),
(4, 'PERUTEC', '12345678901', 'CRISTIAN VARGAS', '123407468', 'PROGRAMADOR', '2018-01-01', '2021-01-01', 'documentos/certificados/123407468.pdf', 'cvargas1477@gmail.com', 1, 1, '2021-04-24 16:05:49', '2021-06-06 01:17:01');

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
(1, 'Gerente - DNI 46794282', 'PE', 'Luis Augusto Claudio Ponce', 'Gerente', '4FA147620A2810FD', 'DNI 46794282', 'Llama.pe SHA256 Standard CA LLAMA.PE', '2021-05-14', '2022-05-14', 0x2d2d2d2d2d424547494e2043455254494649434154452d2d2d2d2d0a4d494945397a434341392b674177494241674949582f45324a395a72426349774451594a4b6f5a496876634e41514546425141776767454e4d5273774751594b0a435a496d695a50794c4751424752594c54457842545545755545556755304578437a414a42674e5642415954416c42464d51307743775944565151494441524d0a535531424d51307743775944565151484441524d535531424d526777466759445651514b44413955565342465456425352564e4249464d7551533478525442440a42674e564241734d5045524f535341354f546b354f546b3549464a56517941784d4451324e7a6b304d6a67794d43417449454e46556c524a526b6c44515552500a49464242556b45675245564e54314e55556b464453634f54546a46454d4549474131554541777737546b394e516c4a4649464a4655464a465530564f5645464f0a5645556754455648515577674c53424452564a5553555a4a513046455479425151564a42494552465455395456464a4251306e446b3034784844416142676b710a686b694739773042435145574457526c625739416247786862574575634755774868634e4d6a45774e544d774d4441784d6a41355768634e4d6a4d774e544d770a4d4441784d6a4135576a434341513078477a415a42676f4a6b69614a6b2f49735a41455a4667744d5445464e51533551525342545154454c4d416b47413155450a42684d43554555784454414c42674e564241674d4245784a545545784454414c42674e564241634d4245784a545545784744415742674e5642416f4d443152560a4945564e55464a4655304567557935424c6a46464d454d4741315545437777385245354a49446b354f546b354f546b67556c5644494445774e4459334f5451790a4f444977494330675130565356456c4753554e42524538675545465351534245525531505531525351554e4a77354e4f4d55517751675944565151444444744f0a54303143556b5567556b5651556b565452553555515535555253424d525564425443417449454e46556c524a526b6c445155525049464242556b45675245564e0a54314e55556b464453634f54546a45634d426f4743537147534962334451454a4152594e5a4756746230427362474674595335775a544343415349774451594a0a4b6f5a496876634e4151454242514144676745504144434341516f4367674542414c6268744d5432554e63496d2b614d585433536a777775584c4f32324939690a71357745432b76616362566b2b76465959474e317a456e35495066686a6977434a6874392f6d50746b364a434173704d6e316836456a552b696452684d3071610a6a41344c4b7a4d73364c76734575394c7951385843396639394f4f4c6358654e2f4459753276797a476762686365726d6a3766542f4c78304f5a7045792f2f560a5361566e51715972596b486f44516c46675467474b3545455063794b5570776c6a443368466e5071325341736748454c485069794c6a526945515a536432574a0a4f304c6172674a5362754d3353347a3259566c6a77554e477134376e58414179515464664858752b693864424f4e4843437864684d706661774554474c754d740a68752b424c386f454e4453593539674d636674336368354548786f357a5479784935687a564c4d4b346a4a6376566f447564624f504138434177454141614e580a4d465577485159445652304f42425945464755595956674a425a4b35477949334b4c312b714d2f6b6a5a5a4a4d42384741315564497751594d426141464755590a5956674a425a4b35477949334b4c312b714d2f6b6a5a5a4a4d424d47413155644a51514d4d416f47434373474151554642774d424d41304743537147534962330a4451454242515541413449424151415437705041684833377055654a592b4d6f6e4e6c7557326c6c6e71656d6c392b72676457377750647277544d66373474460a64783473674d4f36324b715568546230633745774b617a5463566d4b7a654442414d2f36726278666f7246507a722b55364339626f6343574449732f6d7167650a774b6b797533454d52764c6856583371306f50796d50594b6335676349586e7461526b7373397a624d2b584f5953377079445976465477664a724348794732420a41437465732b356e2f55764545746e466e4856616267564d30304967634b4c4175455a7533595277356151364f4a596b6b46705970516a53524a5179637863520a3543706570344a69544e716f7455424c58344732774a586b6d564f416157547971503463395a506c62616f62695a6c6b327a477237782f65346f7550486b464c0a58447259513275477145466f7758632b707163426e6939527055634336725036667377330a2d2d2d2d2d454e442043455254494649434154452d2d2d2d2d0a2d2d2d2d2d424547494e2050524956415445204b45592d2d2d2d2d0a4d494945766749424144414e42676b71686b6947397730424151454641415343424b67776767536b41674541416f49424151433234625445396c4458434a766d0a6a463039306f384d4c6c797a747469505971756342417672326e47315a5072785747426a6463784a2b53443334593473416959626666356a375a4f6951674c4b0a544a395965684931506f6e5559544e4b6d6f774f4379737a4c4f693737424c7653386b50467776582f66546a693346336a6677324c74723873786f47345848710a356f2b33302f793864446d61524d762f31556d6c5a304b6d4b324a423641304a52594534426975524244334d696c4b634a59773934525a7a36746b674c4942780a43787a347369343059684547556e646c6954744332713443556d376a4e30754d396d465a593846445271754f353177414d6b453358783137766f764851546a520a7767735859544b58327342457869376a4c59627667532f4b424451306d4f66594448483764334965524238614f63303873534f596331537a43754979584c31610a41376e577a6a775041674d424141454367674542414a776a4c615076724773367457667274507641566c4d5044695239576e316f763531504d794a6c65536c6d0a6b6e3056654133536c3930634c784b545a7a2b5a676846387934466a5a2b566a4f4743686448596b6d6f454d364c3444557268434a49736b362f6767516e2b570a2b542b4730357a6e6a7a77555855306355333741495848644a53675566596363575a63307938556c337954436b68397331304b515266564b71504f59484b616f0a316a52437a4f3975305533723965376f6658764f72685850506566395679445652446f394b7062427a78623837556c535342682f2f6c6149684b6c6a3141706e0a393661664230364f6c693132356f5567457359574148714437362f576d2b5738556f54344e536d77364e78665532375273396c704b704a5839396e6830474c610a356c6f3053434646366d32696e6146366953535036565551586e747a677a525261487977696a766a48496b4367594541366f344371354148592f5949575a68700a454674584b55587a4f4257754150724d4f354a344b55474f414d7a4f2b69694e6d53744862644f2b414f4c5157334f415858526e526b664f6b4f63626b514a620a597137564c713344526d6e6e31707271543546712b746851454269426e65353759526167425371626a5161394c6e3779754e714f67676d7736494e44776949740a4e2f39306b716f5a48514d69634c50794836394849304941684155436759454178356f3855596f715a5a34364172427965696777784f4c5a633151695a4f64420a6661783061624b383832736e4148333557567a65574a563261315446616170586a75366d714e67734f385155336a4e37584938713156683061674b52316c2f560a534a454b4f4b4835695a342b666b52733130467575464b4348526a574939706138412b395972553746613858576b686e59594c42376c3449454f724a676363700a456b79613335646f38414d4367594133732f6f575847496b3779305565676d5a684e6579535a5a31583143766b75416c3161634c785448414a754f5172556a540a63312f4853563336502b4e546c4a364c6b7a566a6a33495448342b415a4a726e574c5877472f7767494d3661504c67677056784f726b6831536879654d5344440a38656557306f4f57666c3833523562464a384a6f52337a6e2b795341576a563638775077514d3075417179504c327a303856396e6c436b6a4d514b42675143680a32554778794876715843756a784a6c2b7a686f4666414267304d6232314d47342b743647576f5632523975665059617a334762366f32386252756977626f79430a2f4b617334475331726142534d4b4b4741687a305537354a7533327675354f4250514a7875333152427279627644595a4d5268725935505872697a74633441720a696b6642777a782b72375161342f7a59423650692b654a476657735a7a586c544f6b5357717670504b774b426745595a6c71542b4e4d696b4651726341616b450a584661563043324f51415057547074676f495079665a57505170473068793241734f497244734b7857534e7972304641666662776671486744627555574a47690a694e6639693232774c4a457431544934697158512b76425a69304864304e49536d75647a594f4f626b6646372f356f644741354c4558326d6b4a5559767242470a59525749655747794d4e317a446f5a574b3045776a3455300a2d2d2d2d2d454e442050524956415445204b45592d2d2d2d2d0a, '2021-05-16 02:02:47', '2021-05-16 02:02:47');

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
(4, 'El Documento ya se encuentra registrado', 'Intente con otro número documento', 'warning', NULL, NULL),
(5, 'Documentos Digitales Generados Correctamente', '...', 'success', NULL, NULL);

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
(1, 'App\\User', 1),
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
('luis.claudio@perutec.com.pe', '$2y$10$zCnIeNPNDNgHD7jD522gHu3NYRqU4UpUzqvyYDI1FM8t6Kg6SgTc2', '2021-05-30 01:59:05');

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
('correos_copia', 'Correos a los cuales se les envía copia', 'cvargas1477@gmail.com,carlosmorih33@gmail.com,gustavo.sistemas20@gmail.com,jorge0920520@gmail.com'),
('from_correo', 'nombre de correo', 'tallerlaravel7notificaciones@gmail.com'),
('limit_envio_correo', 'Valor limite de registros ', '1'),
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
