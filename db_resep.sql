-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2023 at 12:18 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joshleer_resep`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalogs`
--

CREATE TABLE `catalogs` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `quantity` int(10) NOT NULL,
  `units` varchar(30) NOT NULL DEFAULT '',
  `price` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `catalogs`
--

INSERT INTO `catalogs` (`id`, `name`, `quantity`, `units`, `price`) VALUES
(1, 'Air', 200, 'ml', 1000),
(2, 'Bawang Putih', 1, 'butir', 100),
(3, 'Daging Ayam', 300, 'gram', 21000),
(4, 'Kecap Asin', 2, 'tbs', 400),
(5, 'Kecap Manis', 3, 'tbs', 300),
(6, 'Olive Oil', 1, 'tbs', 200),
(7, 'Saos Tiram', 1, 'sdt', 100),
(8, 'Agar agar', 1, 'bungkus', 4000),
(9, 'Gula pasir', 1, 'sdm', 500),
(10, 'Oreo cookies', 20, 'buah', 10500),
(11, 'Susu kental manis', 1, 'kaleng', 10000),
(12, 'Vanilli', 1, 'sdt', 100),
(13, 'agar-agar plain', 1, 'bungkus', 4000),
(14, 'garam', 1, 'sdt', 100),
(15, 'Skm', 1, 'kaleng', 10000),
(16, 'sp/ovalet', 1, 'sdt', 100),
(17, 'susu cair', 200, 'ml', 3000),
(18, 'telor', 1, 'butir', 1000),
(19, 'ubi ungu', 250, 'gram', 4000),
(20, 'daging cincang', 100, 'gram', 6000),
(21, 'keju mozarella', 50, 'gram', 6000),
(22, 'minyak goreng', 1, 'sdm', 100),
(23, 'saos spaghetti instan', 8, 'sdm', 15000),
(24, 'spaghetti', 500, 'gram', 19000),
(25, 'Air', 7, 'sdm', 0),
(26, 'Ayam fillet', 50, 'gram', 2000),
(27, 'Bawang merah', 5, 'siung', 1000),
(28, 'Bawang Putih', 2, 'siung', 200),
(29, 'Kol', 2, 'lembar', 500),
(30, 'Lada', 1, 'sdt', 100),
(31, 'Maizena', 5, 'sdm', 1000),
(32, 'Minyak Goreng', 1, 'cangkir', 3000),
(33, 'Saus tomat', 3, 'sdm', 500),
(34, 'Telur Ayam', 3, 'butir', 3000),
(35, 'Tomat', 1, 'buah', 500),
(38, 'jinten', 1, 'sdt', 100),
(39, 'kecap manis', 3, 'sdm', 600),
(40, 'kekian', 150, 'gram', 17000),
(41, 'kemiri', 1, 'buah', 500),
(42, 'kentang', 100, 'gram', 1600),
(43, 'kulit lumpia', 10, 'buah', 5000),
(44, 'merica butiran', 1, 'sdt', 100),
(45, 'bawang putih', 4, 'buah', 400),
(46, 'broccoli', 200, 'gram', 2600),
(47, 'cabe merah', 1, 'buah', 250),
(48, 'gula', 1, 'sdt', 500),
(50, 'tofu', 2, 'buah', 2000),
(51, 'Air', 2, 'liter', 5000),
(52, 'Asam kandis', 5, 'biji', 5000),
(53, 'Bawang goreng', 2, 'sdm', 2000),
(54, 'Bawang merah', 100, 'gram', 3900),
(55, 'Cabe rawit', 100, 'gram', 2500),
(56, 'Garam halus', 5, 'sdm', 500),
(57, 'Gula aren/gula batok', 750, 'gram', 30000),
(58, 'Ikan giling (tenggiri/gabus/kakap)', 500, 'gram', 20000),
(59, 'Merica bubuk', 1, 'sdt', 2000),
(61, 'Santan dingin', 350, 'ml', 7000),
(62, 'Tepung sagu', 250, 'gram', 2500),
(64, 'Vegeroni', 3, 'genggam', 9000),
(66, 'Bawang Bombay', 2, 'buah', 5000),
(68, 'Ikan Gurame', 1, 'ekor', 25000),
(73, 'rambutans', 4, 'buah', 4000),
(74, 'yakult', 1, 'buah', 1500),
(75, 'Daging Kornet', 2, 'sendok makan', 10000),
(76, 'Lasagna', 4, 'lembar', 40000),
(77, 'Minyak Goreng', 2, 'sendok makan', 200),
(78, 'Saus Spaghetti', 4, 'sendok makan', 7500),
(80, 'Coklat bubuk', 15, 'gram', 5000),
(82, 'Gula Halus', 150, 'gram', 2250),
(83, 'Kuning Telor', 1, 'Butir', 1000),
(84, 'Mentega', 125, 'gram', 2000),
(85, 'Minyak Goreng', 56, 'ml', 700),
(86, 'Vanili bubuk', 1, 'sdt', 500),
(87, 'Air hangat', 125, 'ml', 0),
(88, 'Fermipan', 1, 'sdm', 100),
(89, 'Gula pasir', 100, 'gram', 1500),
(91, 'Kuning telur', 2, 'butir', 0),
(92, 'Tepung protein rendah', 75, 'gram', 5000),
(93, 'Tepung protein tinggi', 225, 'gram', 10000),
(94, 'Air Kalidu', 600, 'ml', 0),
(95, 'Apel', 1, 'buah', 5000),
(96, 'Japanese Curry Roux', 1, 'pack', 50000),
(97, 'kecap', 1, 'sdm', 100),
(99, 'madu/gula', 1, 'sdm', 500),
(100, 'Minyak Goreng', 3, 'sdm', 600),
(101, 'Soy Sauce (aku pakai kikkoman all purpose)', 1, 'sdm', 1000),
(102, 'air kelapa segar', 200, 'ml', 5000),
(103, 'daun pandan', 1, 'lembar', 500),
(104, 'daun sereh', 4, 'batang', 2000),
(105, 'ragi instan', 11, 'gram', 3000),
(106, 'santan kental dari 2 butir kelapa', 600, 'ml', 10000),
(107, 'tepung sagu tani', 300, 'gram', 3000),
(108, 'tepung terigu', 100, 'gram', 2000),
(109, 'vanila', 1, 'sdt', 500),
(110, 'coklat batang', 2, 'blok', 20000),
(111, 'keju cheddar parut', 2, 'sdm', 2000),
(112, 'mentega', 1, 'sdm', 500),
(113, 'roti tawar', 7, 'lembar', 10000),
(114, 'susu cair tambahan', 1, 'sdm', 300),
(115, 'tepung terigu', 2, 'sdm', 1000),
(117, 'Air jeruk lemon', 1, 'sdm', 5000),
(118, 'Butter', 50, 'gram', 1500),
(119, 'Cream cheese, suhu ruang', 250, 'gram', 25000),
(120, 'Parutan kulit jeruk lemon (skip jika tidak suka)', 1, 'sdt', 0),
(121, 'Putih telur', 6, 'butir', 6000),
(122, 'Susu cair', 100, 'cc', 1200),
(123, 'Tepung maizena', 20, 'gram', 500),
(124, 'Ayam, rebus dengan 1.5 L air', 1, 'ekor', 40000),
(125, 'Daun bawang', 1, 'batang', 500),
(126, 'Daun Salam', 2, 'lembar', 200),
(127, 'Daun seledri, iris-iris', 1, 'batang', 200),
(129, 'Jahe', 1, 'ruas', 500),
(130, 'Kemiri', 2, 'butir', 1000),
(132, 'Ketumbar', 1, 'sdt', 500),
(133, 'Kunyit', 1, 'ruas', 500),
(134, 'Sereh, geprek', 1, 'batang', 500),
(135, 'soun, kol iris, tauge, tomat, telur rebus, perkedel, sambal dan jeruk nipis', 0, 'secukupnya', 5000),
(136, 'Air es', 200, 'ml', 0),
(137, 'Buah sirsak', 250, 'gram', 4000),
(138, 'Buah terung belanda dikupas', 3, 'buah', 9000),
(139, 'Es batu', 1, 'cangkir', 0),
(141, 'Susu kental manis', 1, 'sdm', 500),
(142, 'Cabe merah besar', 2, 'biji', 320),
(143, 'Cabe rawit merah', 15, 'biji', 4200),
(144, 'Daun Jeruk', 2, 'lembar', 200),
(146, 'Ikan Cakalang', 400, 'gram', 20000),
(149, 'Bakso', 5, 'buah', 5000),
(153, 'Makaroni spiral', 3, 'bungkus', 20000),
(154, 'Margarin ( Blueband )', 2, 'sdm', 2000),
(156, 'Kopi', 1, 'cangkir', 3000),
(157, 'Monde egg drops', 1, 'bungkus', 5000),
(159, 'Minyak/Olive oil.', 250, 'ml', 43000),
(160, 'Telur', 125, 'gram', 1250),
(161, 'Gula', 1, 'sdm', 500),
(162, 'Jahe, potong korek api', 1, 'cm', 500),
(163, 'Jamur kuping', 100, 'gram', 4500),
(164, 'Kailan', 250, 'gram', 3500),
(165, 'Kaldu sapi bubuk', 1, 'sdt', 1000),
(167, 'Merica', 1, 'sdt', 1000),
(168, 'Minyak untuk menumis', 3, 'sdm', 300),
(169, 'Saus tiram', 1, 'sdm', 100),
(170, 'Baso Salmon', 5, 'buah', 15000),
(171, 'Bok Choy', 1, 'ikat', 1000),
(172, 'Fillet ayam', 100, 'gram', 4000),
(175, 'Kecap ikan', 2, 'sdm', 500),
(176, 'Maizena/sagu, larutkan dengan air 1 sdm', 1, 'sdt', 500),
(177, 'Minyak wijen', 2, 'sdm', 500),
(178, 'susu kental enak', 200, 'gram', 8500),
(179, 'cabe merah besar', 1, 'kg', 33714),
(180, 'cabe rawit merah', 1, 'kg', 29643),
(181, 'cabe rawit hijau', 1, 'kg', 24786),
(182, 'bawang merah', 1, 'kg', 32857),
(183, 'bawang putih', 1, 'kg', 21857),
(184, 'kentang', 1, 'kg', 11750),
(185, 'tomat', 1, 'kg', 11536),
(186, 'kelapa kupas', 1, 'butir', 7000),
(187, 'semangka', 1, 'kg', 7357),
(188, 'jeruk medan', 1, 'kg', 29407),
(189, 'beras', 1, 'kg', 11825),
(190, 'minyak goreng', 1, 'kg', 11054),
(191, 'daging sapi paha belakang', 1, 'kg', 104786),
(192, 'daging sapi murni', 1, 'kg', 93321),
(193, 'ayam broiler/ras', 1, 'kg', 30107),
(194, 'telur ayam ras', 1, 'kg', 20571),
(195, 'gula pasir', 1, 'kg', 12607),
(196, 'tepung terigu', 1, 'kg', 8304),
(197, 'garam dapur', 200, 'gram', 9275),
(198, 'daging kambing', 1, 'kg', 105179),
(199, 'daging babi berlemak', 1, 'kg', 68036),
(200, 'ikan bandeng', 1, 'kg', 38214),
(201, 'ikan mas', 1, 'kg', 29286),
(202, 'ikan lele', 1, 'kg', 25000),
(203, 'susu bubuk bendera', 400, 'gram', 41036),
(204, 'susu bubuk dancow', 400, 'gram', 48679),
(205, 'susu kental bendera', 200, 'gram', 14107),
(206, 'margarin blueband cup', 1, 'kemasan', 9821),
(207, 'margarin blueband sachet', 1, 'kemasan', 6636),
(208, 'susu kental enak', 200, 'gram', 8500),
(209, 'cabe merah keriting', 1, 'kg', 27667),
(210, 'Udang', 50, 'gram', 4000),
(211, 'Air Dingin', 1, 'liter', 0),
(212, 'Air Gula', 50, 'cc', 0),
(213, 'Biji Selasih', 4, 'sdm', 2000),
(214, 'Jeruk Lemon', 1, 'buah', 3000),
(215, 'Kiwi', 1, 'buah', 7000),
(216, 'Stroberi', 10, 'buah', 8000),
(217, 'bawang bombay', 1, 'butir', 2500),
(218, 'mentimun', 1, 'buah', 1000),
(219, 'roti tawar', 8, ' buah', 10000),
(220, 'sosis sapi', 4, 'buah', 6000),
(221, 'Kaldu ayam', 50, 'gram', 0),
(222, 'Kecap asin Jepang (shoyu)', 1, 'sdm', 2000),
(223, 'Lemon', 1, 'buah', 8000),
(224, 'Madu', 1, 'sdm', 500),
(225, 'Sagu', 2, 'sdm', 200),
(226, 'air panas', 220, 'ml', 0),
(227, 'ayam cincang', 150, 'gram', 8000),
(228, 'bawang merah', 3, 'buah', 600),
(229, 'kentang', 2, 'buah', 2000),
(230, 'kol', 100, 'gram', 1000),
(231, 'minyak', 3, 'sdm', 300),
(232, 'royco', 1, 'bungkus', 1000),
(233, 'telur', 1, 'butir', 1000),
(234, 'tepung sagu', 4, 'sdm', 2000),
(235, 'wortel', 1, 'buah', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`recipe_id`, `name`) VALUES
(1, 'indonesian food'),
(1, 'meat'),
(1, 'rice'),
(2, 'dessert'),
(2, 'snack'),
(3, 'beverage'),
(3, 'dessert'),
(3, 'other'),
(4, 'noodle'),
(4, 'western food'),
(5, 'chinese food'),
(5, 'vegetarian'),
(6, 'other'),
(6, 'snack'),
(7, 'chinese food'),
(7, 'other'),
(7, 'vegetarian'),
(8, 'indonesian food'),
(8, 'snack'),
(9, 'indonesian food'),
(9, 'other'),
(9, 'snack'),
(10, 'indonesian food'),
(10, 'seafood'),
(11, 'beverage'),
(11, 'dessert'),
(11, 'other'),
(12, 'other'),
(12, 'western food'),
(13, 'dessert'),
(13, 'other'),
(13, 'snack'),
(14, 'dessert'),
(14, 'other'),
(14, 'snack'),
(14, 'western food'),
(15, 'chinese food'),
(15, 'meat'),
(15, 'other'),
(15, 'rice'),
(15, 'vegetarian'),
(16, 'indonesian food'),
(16, 'snack'),
(17, 'other'),
(17, 'snack'),
(18, 'other'),
(18, 'snack'),
(19, 'indonesian food'),
(19, 'rice'),
(19, 'vegetarian'),
(20, 'beverage'),
(20, 'dessert'),
(21, 'indonesian food'),
(21, 'seafood'),
(22, 'other'),
(22, 'western food'),
(23, 'dessert'),
(23, 'other'),
(24, 'noodle'),
(25, 'vegetarian'),
(26, 'chinese food'),
(26, 'vegetarian'),
(27, 'beverage'),
(28, 'snack'),
(29, 'meat'),
(30, 'chinese food'),
(30, 'snack'),
(32, 'indonesian food');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `submit` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `recipe_id`, `description`, `submit`) VALUES
(1, 1, 29, 'Mantap 10 out of 10', '2023-07-06 06:03:21'),
(2, 9, 15, 'Good', '2023-07-11 03:40:27'),
(3, 1, 11, 'Mantap', '2023-07-13 01:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `submit` timestamp NULL DEFAULT current_timestamp(),
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cooklater`
--

CREATE TABLE `cooklater` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `submit` timestamp NULL DEFAULT current_timestamp(),
  `status_finish` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`recipe_id`, `user_id`) VALUES
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `quantity` decimal(8,2) DEFAULT 0.00,
  `units` varchar(30) DEFAULT NULL,
  `info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`recipe_id`, `name`, `quantity`, `units`, `info`) VALUES
(1, 'Air', 200.00, 'ml', NULL),
(1, 'Bawang Putih', 1.00, 'butir', 'cincang halus'),
(1, 'Daging Ayam', 300.00, 'gram', NULL),
(1, 'Garam', 0.50, 'sdt', NULL),
(1, 'Kecap Asin', 2.00, 'tbs', NULL),
(1, 'Kecap Manis', 3.00, 'tbs', NULL),
(1, 'Olive Oil', 1.00, 'tbs', NULL),
(1, 'Saos Tiram', 1.00, 'sdt', NULL),
(2, 'Agar agar', 1.00, 'bungkus', NULL),
(2, 'Air', 1700.00, 'ml', NULL),
(2, 'Gula pasir', 1.00, 'sdm', NULL),
(2, 'Oreo cookies', 20.00, 'buah', NULL),
(2, 'Susu kental manis', 1.00, 'kaleng', NULL),
(2, 'Vanilli', 0.50, 'sdt', NULL),
(3, 'agar-agar plain', 1.00, 'bungkus', NULL),
(3, 'garam', 1.00, 'sdt', NULL),
(3, 'Skm', 1.00, 'kaleng', NULL),
(3, 'sp/ovalet', 1.00, 'sdt', NULL),
(3, 'susu cair', 200.00, 'ml', NULL),
(3, 'telor', 1.00, 'butir', NULL),
(3, 'ubi ungu', 250.00, 'gram', NULL),
(4, 'bawang bombay', 0.50, 'buah', NULL),
(4, 'daging cincang', 100.00, 'gram', NULL),
(4, 'keju mozarella', 50.00, 'gram', 'parut kasar'),
(4, 'minyak goreng', 1.00, 'sdm', 'untuk menumis'),
(4, 'saos spaghetti instan', 8.00, 'sdm', NULL),
(4, 'spaghetti', 150.00, 'gram', NULL),
(5, 'Air', 7.00, 'sdm', NULL),
(5, 'Ayam fillet', 50.00, 'gram', NULL),
(5, 'Bawang merah', 5.00, 'siung', NULL),
(5, 'Bawang Putih', 2.00, 'siung', NULL),
(5, 'Daun bawang', 6.00, 'batang', NULL),
(5, 'Garam', 1.00, 'sdt', NULL),
(5, 'Kol', 2.00, 'lembar', 'ukuran kecil'),
(5, 'Lada', 0.50, 'sdt', NULL),
(5, 'Maizena', 5.00, 'sdm', NULL),
(5, 'Minyak Goreng', 1.00, 'cangkir', NULL),
(5, 'Saus tomat', 3.00, 'sdm', NULL),
(5, 'Telur Ayam', 3.00, 'butir', NULL),
(5, 'Tomat', 1.00, 'buah', 'ukuran sedang'),
(5, 'Wortel', 0.50, 'buah', 'ukuran sedang'),
(6, 'air', 0.00, 'secukupnya', NULL),
(6, 'bawang merah', 3.00, 'siung', NULL),
(6, 'bawang putih', 5.00, 'siung', NULL),
(6, 'gula+garam', 0.00, 'secukupnya', NULL),
(6, 'jinten', 0.50, 'sdt', NULL),
(6, 'kecap manis', 3.00, 'sdm', NULL),
(6, 'kekian', 150.00, 'gram', NULL),
(6, 'kemiri', 1.00, 'buah', NULL),
(6, 'kentang', 250.00, 'gram', NULL),
(6, 'kulit lumpia', 10.00, 'buah', NULL),
(6, 'merica butiran', 0.50, 'sdt', NULL),
(6, 'saos tiram', 1.00, 'sdt', NULL),
(6, 'saus tomat', 4.00, 'sdm', NULL),
(7, 'air', 50.00, 'ml', NULL),
(7, 'bawang putih', 4.00, 'buah', NULL),
(7, 'broccoli', 200.00, 'gram', NULL),
(7, 'cabe merah', 1.00, 'buah', NULL),
(7, 'garam', 0.50, 'sdt', NULL),
(7, 'gula', 0.50, 'sdt', NULL),
(7, 'merica', 0.00, 'sejumput', NULL),
(7, 'saus tiram', 2.00, 'sdm', NULL),
(7, 'tofu', 2.00, 'buah', NULL),
(8, 'Air', 2.00, 'liter', NULL),
(8, 'Asam kandis', 5.00, 'biji', NULL),
(8, 'Bawang goreng', 2.00, 'sdm', NULL),
(8, 'Bawang merah', 50.00, 'gram', 'iris halus'),
(8, 'Bawang putih', 15.00, 'siung', 'dihaluskan'),
(8, 'Cabe rawit', 100.00, 'gram', NULL),
(8, 'Garam halus', 5.00, 'sdm', NULL),
(8, 'Gula aren/gula batok', 750.00, 'gram', NULL),
(8, 'Ikan giling (tenggiri/gabus/kakap)', 500.00, 'gram', NULL),
(8, 'Merica bubuk', 0.50, 'sdt', NULL),
(8, 'Minyak sayur untuk menggoreng', 0.00, 'secukupnya', NULL),
(8, 'Santan dingin', 350.00, 'ml', NULL),
(8, 'Telur ayam', 1.00, 'butir', NULL),
(8, 'Tepung sagu', 250.00, 'gram', NULL),
(9, 'Air', 600.00, 'ml', NULL),
(9, 'Garam', 0.50, 'sdt', NULL),
(9, 'Lada', 0.00, 'secukupnya', NULL),
(9, 'Olive Oil', 2.00, 'tbs', NULL),
(9, 'Telur', 2.00, 'butir', NULL),
(9, 'Vegeroni', 3.00, 'genggam', NULL),
(10, 'Bango kecap manis', 0.00, 'secukupnya', NULL),
(10, 'Bawang Bombay', 2.00, 'buah', NULL),
(10, 'Garam', 0.00, 'secukupnya', NULL),
(10, 'Ikan Gurame', 1.00, 'ekor', NULL),
(10, 'Indofood saus sambal', 0.00, 'secukupnya', NULL),
(10, 'Indofood saus tomat (bisa diganti dengan 3 buah tomat merah)', 0.00, 'secukupnya', NULL),
(10, 'lengkuas digeprek', 0.00, 'sebesar ibu jari', NULL),
(11, 'batu es', 0.00, 'secukupnya', ''),
(11, 'rambutans', 4.00, 'buah', ''),
(11, 'yakult', 1.00, 'buah', ''),
(12, 'Daging Kornet', 2.00, 'sendok makan', NULL),
(12, 'Keju Mozarella', 50.00, 'gram', NULL),
(12, 'Lasagna', 4.00, 'lembar', NULL),
(12, 'Minyak Goreng', 2.00, 'sendok makan', NULL),
(12, 'Saus Spaghetti', 4.00, 'sendok makan', NULL),
(13, 'Choco Chip', 0.00, 'secukupnya', NULL),
(13, 'Coklat bubuk', 15.00, 'gram', NULL),
(13, 'Garam', 0.00, 'sejumput', NULL),
(13, 'Gula Halus', 150.00, 'gram', NULL),
(13, 'Kuning Telor', 1.00, 'Butir', NULL),
(13, 'Mentega', 125.00, 'gram', NULL),
(13, 'Minyak Goreng', 56.00, 'ml', NULL),
(13, 'Telur', 1.00, 'butir', NULL),
(13, 'Tepung terigu', 300.00, 'gram', NULL),
(13, 'Vanili bubuk', 0.25, 'sdt', NULL),
(14, 'Air hangat', 125.00, 'ml', NULL),
(14, 'Fermipan', 1.00, 'sdm', NULL),
(14, 'Gula pasir', 100.00, 'gram', NULL),
(14, 'Keju parut', 0.00, 'secukupnya', NULL),
(14, 'Kuning telur', 2.00, 'butir', NULL),
(14, 'Minyak goreng', 62.00, 'ml', NULL),
(14, 'Tepung protein rendah', 75.00, 'gram', NULL),
(14, 'Tepung protein tinggi', 225.00, 'gram', NULL),
(15, 'Air Kalidu', 600.00, 'ml', NULL),
(15, 'Apel', 1.00, 'buah', NULL),
(15, 'Bawang Bombay', 2.00, 'buah', NULL),
(15, 'Bawang Putih', 2.00, 'siung', 'cincang halus'),
(15, 'Fillet Ayam', 250.00, 'gram', 'bisa diganti beef, seafood, atau tofu kalau untuk vegetarian'),
(15, 'garam', 0.00, 'secukupnya', NULL),
(15, 'Japanese Curry Roux', 1.00, 'pack', NULL),
(15, 'kecap', 1.00, 'sdm', NULL),
(15, 'Kentang', 2.00, 'buah', 'bisa ditambah lebih banyak kalau suka'),
(15, 'Lada Hitam', 0.00, 'secukupnya', NULL),
(15, 'madu/gula', 0.50, 'sdm', NULL),
(15, 'Minyak Goreng', 3.00, 'sdm', NULL),
(15, 'Soy Sauce (aku pakai kikkoman all purpose)', 1.50, 'sdm', NULL),
(15, 'Wortel', 2.00, 'buah', 'bisa ditambah lebih banyak kalau suka'),
(16, 'air kelapa segar', 200.00, 'ml', NULL),
(16, 'daun jeruk', 25.00, 'lembar', NULL),
(16, 'daun pandan', 1.00, 'lembar', NULL),
(16, 'daun sereh', 4.00, 'batang', NULL),
(16, 'garam', 1.00, 'sdt', NULL),
(16, 'gula pasir', 400.00, 'gram', NULL),
(16, 'kuning telur', 16.00, 'butir', NULL),
(16, 'ragi instan', 11.00, 'gram', NULL),
(16, 'santan kental dari 2 butir kelapa', 600.00, 'ml', NULL),
(16, 'tepung sagu tani', 300.00, 'gram', NULL),
(16, 'tepung terigu', 100.00, 'gram', 'protein sedang'),
(16, 'vanila', 1.00, 'sdt', NULL),
(17, 'coklat batang', 2.00, 'blok', NULL),
(17, 'garam', 0.00, 'secukupnya', NULL),
(17, 'gula', 2.00, 'sdm', NULL),
(17, 'keju cheddar parut', 2.00, 'sdm', NULL),
(17, 'mentega', 1.50, 'sdm', NULL),
(17, 'roti tawar', 7.00, 'lembar', NULL),
(17, 'susu cair', 100.00, 'ml', NULL),
(17, 'susu cair tambahan', 1.00, 'sdm', NULL),
(17, 'susu kental manis', 1.50, 'sdm', NULL),
(17, 'tepung terigu', 2.00, 'sdm', NULL),
(17, 'vanili bubuk', 0.00, 'secukupnya', NULL),
(18, 'Air jeruk lemon', 1.00, 'sdm', NULL),
(18, 'Butter', 50.00, 'gram', NULL),
(18, 'Cream cheese, suhu ruang', 250.00, 'gram', NULL),
(18, 'Gula pasir', 140.00, 'gram', NULL),
(18, 'Kuning telur', 6.00, 'butir', NULL),
(18, 'Parutan kulit jeruk lemon (skip jika tidak suka)', 1.00, 'sdt', NULL),
(18, 'Putih telur', 6.00, 'butir', NULL),
(18, 'Susu cair', 100.00, 'cc', NULL),
(18, 'Tepung maizena', 20.00, 'gram', NULL),
(18, 'Tepung terigu', 60.00, 'gram', NULL),
(19, 'Ayam, rebus dengan 1.5 L air', 0.50, 'ekor', NULL),
(19, 'Bawang Merah', 4.00, 'siung', NULL),
(19, 'Bawang Putih', 5.00, 'siung', NULL),
(19, 'Daun bawang', 1.00, 'batang', 'iris-iris'),
(19, 'Daun jeruk', 2.00, 'lembar', NULL),
(19, 'Daun Salam', 2.00, 'lembar', NULL),
(19, 'Daun seledri, iris-iris', 1.00, 'batang', NULL),
(19, 'Garam, Gula dan Lada', 0.00, 'secukupnya', NULL),
(19, 'Jahe', 1.00, 'ruas', NULL),
(19, 'Kemiri', 2.00, 'butir', NULL),
(19, 'Kerupuk Udang, goreng', 0.00, 'secukupnya', NULL),
(19, 'Ketumbar', 1.00, 'sdt', NULL),
(19, 'Kunyit', 1.00, 'ruas', NULL),
(19, 'Minyak goreng', 2.00, 'sdm', 'untuk menumis'),
(19, 'Sereh, geprek', 1.00, 'batang', NULL),
(19, 'soun, kol iris, tauge, tomat, telur rebus, perkedel, sambal dan jeruk nipis', 0.00, 'secukupnya', NULL),
(20, 'Air es', 200.00, 'ml', NULL),
(20, 'Buah sirsak', 250.00, 'gram', NULL),
(20, 'Buah terung belanda dikupas', 3.00, 'buah', NULL),
(20, 'Es batu', 1.00, 'cangkir', NULL),
(20, 'Gula pasir', 0.00, 'sesuai selera', NULL),
(20, 'Susu kental manis', 1.00, 'sdm', NULL),
(21, 'air', 4.00, 'sdm', NULL),
(21, 'Bawang Merah', 5.00, 'siung', NULL),
(21, 'Bawang Putih', 3.00, 'siung', NULL),
(21, 'Cabe merah besar', 2.00, 'biji', NULL),
(21, 'Cabe rawit merah', 15.00, 'biji', NULL),
(21, 'Daun Jeruk', 2.00, 'lembar', NULL),
(21, 'Garam & Masako', 0.00, 'secukupnya', NULL),
(21, 'Ikan Cakalang', 400.00, 'gram', NULL),
(21, 'Minyak goreng', 0.00, 'secukupnya', NULL),
(21, 'Tomat', 1.00, 'buah', NULL),
(22, 'Air untuk merebus', 0.00, '', NULL),
(22, 'Bakso', 5.00, 'buah', NULL),
(22, 'Daun seledri', 0.00, 'sesuai selera', NULL),
(22, 'Garam', 0.00, 'sesuai selera', NULL),
(22, 'Lada', 0.00, 'sesuai selera', NULL),
(22, 'Makaroni spiral', 3.00, 'bungkus', NULL),
(22, 'Margarin ( Blueband )', 2.00, 'sdm', NULL),
(22, 'Telur', 2.00, 'butir', NULL),
(22, 'Tomat', 2.00, 'buah', NULL),
(22, 'Wortel', 2.00, 'buah', NULL),
(23, 'Coklat bubuk', 0.00, 'secukupnya', NULL),
(23, 'Kopi', 1.00, 'cangkir', NULL),
(23, 'Monde egg drops', 1.00, 'bungkus', NULL),
(23, 'whipped cream', 0.00, 'secukupnya', NULL),
(24, 'Garam', 0.50, 'sdt', NULL),
(24, 'Minyak/Olive oil.', 10.00, 'ml', NULL),
(24, 'Telur', 125.00, 'gram', NULL),
(24, 'Tepung Terigu', 250.00, 'gram', 'Segitiga Biru./All purpose flour.'),
(25, 'Air', 100.00, 'ml', NULL),
(25, 'Bawang bombay', 0.50, 'buah', NULL),
(25, 'Bawang putih', 4.00, 'siung', NULL),
(25, 'Garam', 0.00, 'secukupnya', NULL),
(25, 'Gula', 1.00, 'sdm', NULL),
(25, 'Jahe, potong korek api', 1.00, 'cm', NULL),
(25, 'Jamur kuping', 100.00, 'gram', NULL),
(25, 'Kailan', 250.00, 'gram', NULL),
(25, 'Kaldu sapi bubuk', 1.00, 'sdt', NULL),
(25, 'Kecap asin secukupnya', 0.00, '', NULL),
(25, 'Merica', 1.00, 'sdt', NULL),
(25, 'Minyak untuk menumis', 3.00, 'sdm', NULL),
(25, 'Saus tiram', 1.00, 'sdm', NULL),
(26, 'Air', 250.00, 'ml', NULL),
(26, 'Baso Salmon', 5.00, 'buah', NULL),
(26, 'Bawang putih', 5.00, 'siung', 'cincang halus'),
(26, 'Bok Choy', 1.00, 'ikat', NULL),
(26, 'Fillet ayam', 100.00, 'gram', NULL),
(26, 'Garam, gula, penyedap', 0.00, 'secukupnya', NULL),
(26, 'Jamur kancing', 0.00, 'secukupnya', NULL),
(26, 'Kecap ikan', 2.00, 'sdm', NULL),
(26, 'Maizena/sagu, larutkan dengan air 1 sdm', 1.00, 'sdt', NULL),
(26, 'Minyak wijen', 1.50, 'sdm', NULL),
(26, 'Udang', 50.00, 'gram', NULL),
(26, 'Wortel', 2.00, 'buah', NULL),
(27, 'Air Dingin', 1.00, 'liter', NULL),
(27, 'Air Gula', 50.00, 'cc', NULL),
(27, 'Biji Selasih', 4.00, 'sdm', NULL),
(27, 'Jeruk Lemon', 1.00, 'buah', NULL),
(27, 'Kiwi', 1.00, 'buah', NULL),
(27, 'Madu', 1.00, 'sdm', NULL),
(27, 'Stroberi', 10.00, 'buah', NULL),
(28, 'bawang bombay', 1.00, 'butir', NULL),
(28, 'margarin', 0.00, 'secukupnya', NULL),
(28, 'mayonais', 0.00, 'secukupnya', NULL),
(28, 'mentimun', 1.00, 'buah', NULL),
(28, 'roti tawar', 8.00, ' buah', NULL),
(28, 'saus sambal', 0.00, 'secukupnya', NULL),
(28, 'saus tomat', 0.00, 'secukupnya', NULL),
(28, 'sosis sapi', 4.00, 'buah', NULL),
(28, 'tomat', 2.00, 'buah', NULL),
(29, 'Daging Ayam', 250.00, 'gram', NULL),
(29, 'Garam', 0.00, 'secukupnya', NULL),
(29, 'Kaldu ayam', 50.00, 'gram', NULL),
(29, 'Kecap asin Jepang (shoyu)', 1.00, 'sdm', NULL),
(29, 'Lada', 0.00, 'secukupnya', NULL),
(29, 'Lemon', 1.00, 'buah', NULL),
(29, 'Madu', 1.00, 'sdm', NULL),
(29, 'Sagu', 2.00, 'sdm', NULL),
(30, 'air panas', 220.00, 'ml', NULL),
(30, 'ayam cincang', 150.00, 'gram', NULL),
(30, 'bawang bombay', 0.50, 'buah', NULL),
(30, 'bawang merah', 3.00, 'buah', NULL),
(30, 'bawang putih', 3.00, 'buah', NULL),
(30, 'daun bawang', 2.00, 'batang', NULL),
(30, 'garam', 0.00, 'secukupnya', NULL),
(30, 'kentang', 2.00, 'buah', 'parut kasar'),
(30, 'kol', 100.00, 'gram', 'potong halus'),
(30, 'merica', 0.00, 'secukupnya', NULL),
(30, 'minyak', 3.00, 'sdm', NULL),
(30, 'royco', 1.00, 'bungkus', NULL),
(30, 'saos sambal', 0.00, 'secukupnya', NULL),
(30, 'telur', 1.00, 'butir', NULL),
(30, 'tepung sagu', 4.00, 'sdm', NULL),
(30, 'tepung terigu', 400.00, 'gram', NULL),
(30, 'wortel', 1.00, 'buah', 'parut kasar'),
(32, 'Bawang merah', 2.00, 'buah', ''),
(32, 'Bawang Putih', 4.00, 'siung', ''),
(32, 'Cabe Merah', 2.00, 'buah', ''),
(32, 'Daun salam', 1.00, 'batang', ''),
(32, 'Garam', 1.00, 'secukupnya', ''),
(32, 'Kentang', 2.00, 'buah', ''),
(32, 'Minyak goreng', 1.00, 'secukupnya', ''),
(32, 'Teri', 200.00, 'gr', '');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `submit` timestamp NULL DEFAULT current_timestamp(),
  `read` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1),
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `value` decimal(2,1) UNSIGNED NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`recipe_id`, `user_id`, `value`) VALUES
(4, 1, 3.1),
(15, 1, 4.3),
(15, 6, 1.9),
(29, 1, 5.0);

--
-- Triggers `rating`
--
DELIMITER $$
CREATE TRIGGER `avg_rating_delete` AFTER DELETE ON `rating` FOR EACH ROW UPDATE recipes SET rating = (SELECT AVG(rating.value) from rating where rating.recipe_id=recipes.id) WHERE recipes.id=OLD.recipe_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `avg_rating_insert` AFTER INSERT ON `rating` FOR EACH ROW UPDATE recipes SET rating = (SELECT AVG(rating.value) from rating where rating.recipe_id=recipes.id) WHERE recipes.id=NEW.recipe_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `avg_rating_update` AFTER UPDATE ON `rating` FOR EACH ROW UPDATE recipes SET rating = (SELECT AVG(rating.value) from rating where rating.recipe_id=recipes.id) WHERE recipes.id=NEW.recipe_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `portion` int(10) UNSIGNED DEFAULT 1,
  `duration` int(10) UNSIGNED DEFAULT 0,
  `author` int(10) UNSIGNED NOT NULL,
  `create_date` timestamp NULL DEFAULT current_timestamp(),
  `last_update` timestamp NULL DEFAULT current_timestamp(),
  `rating` decimal(2,1) UNSIGNED NOT NULL DEFAULT 0.0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `tmp_status` tinyint(1) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `photo` text DEFAULT NULL,
  `highlight` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `description`, `portion`, `duration`, `author`, `create_date`, `last_update`, `rating`, `status`, `tmp_status`, `views`, `photo`, `highlight`) VALUES
(1, 'Minced Chicken with Soy Sauce', 'Sajikan dengan nasi yang dikukus bersama si ayam kecap. Luar Biasa :) \r\nby _Papao', 2, 20, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 2, 'images/recipe/1.jpg', 0),
(2, 'Oreo Pudding', 'Pudding yang satu ini memang selalu menjadi juara dessert dirumah, apalagi bila di dukung dengan cuaca yg panas ^_^ \r\nby Iien Soegie', 20, 60, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 4, 'images/recipe/2.jpg', 0),
(3, 'ES CREAM UBI UNGU', 'warnanya bagus dan tentunya lebih sehat tanpa bahan pewarna \r\nby MEMEY\r\n', 5, 240, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/3.jpg', 0),
(4, 'spaghetti panggang', 'resep pasta yang mudah dan cepat, rasanya lebih mantap daripada spagheti biasa \r\nby Mega Fitri', 3, 30, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 3.1, 1, 0, 7, 'images/recipe/4.jpg', 0),
(5, 'Fuyunghai Authentic Chinese Style', 'fuyunghai #homemade \r\nby Riska', 3, 60, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 3.1, 1, 0, 15, 'images/recipe/5.jpg', 0),
(6, 'Mini Kebab Veggie', 'by ameLicious~', 10, 20, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 3, 'images/recipe/6.jpg', 0),
(7, 'broccoli tofu saus tiram', 'Menu sayur super gampang :D \r\nby Titie Aisyiah Nugraha', 4, 20, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/7.jpg', 0),
(8, 'Pempek Adaan', 'Membuatnya mudah dan cepat, adonannya langsung digoreng tanpa harus melewati proses perebusan lagi\r\nby Nova Rilandari', 5, 60, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.9, 1, 0, 7, 'images/recipe/8.jpg', 0),
(9, 'Dadar Vegeroni (Vegeroni Omelette)', 'Cepat, praktis, dan sehat. Cocok untuk menu sarapan, lauk makan siang, atau camilan =)\r\n_Papao', 2, 20, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 0, 0, 3, 'images/recipe/9.jpg', 0),
(10, 'Gurame Pedas Manis Yummy', 'by Wattini Yudo', 3, 20, 1, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/10.jpg', 0),
(11, 'Yakulty-fresh', 'Yakulty-fresh siap mjd temen #minumansegar mu di weekend ceria :)\\nby Adelia', 1, 2, 2, '2023-07-06 14:15:32', '2023-07-13 08:43:54', 0.0, 1, 0, 5, 'images/recipe/11.jpg', 0),
(12, 'LASAGNA GULUNG PRAKTIS', 'Resep praktis dan kilatnya pasta nih!\r\nby nining wahyoe\r\n', 2, 10, 2, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/12.jpg', 0),
(13, 'Pie brownies', 'Sip banget buat pecinta cemilan manis N gurih ^_^\r\nby Nita selpa', 6, 60, 2, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/13.jpg', 0),
(14, 'Cheese Bread', 'by Any S. Soetrisno', 12, 180, 2, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 0, 'images/recipe/14.jpg', 0),
(15, 'Simple Japanese Curry Rice', 'Japanese curry rice yang gampang dan enak tapi ngga kalah sama rasa restoran\r\nby Riska', 4, 60, 2, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 3.1, 1, 0, 12, 'images/recipe/15.jpg', 0),
(16, 'Bika Ambon Andalan', 'by gita setyani', 5, 240, 5, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/16.jpg', 0),
(17, 'Roti Isi Vla Keju', 'Alternatif bekal atau sarapan :)\r\nby Mutia Sari Putri', 5, 20, 5, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 0, 'images/recipe/17.jpg', 0),
(18, 'Japanese Cheesecake', 'Japanese cheesecake lembut membelai lidah,, rasanya enak bgt, sajikan dalam keadaan dingin dari kulkas\r\nby Dapur Ibu MaLKa', 6, 120, 5, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 4, 'images/recipe/18.jpg', 0),
(19, 'Soto Ambengan ala Ibu Malka', 'Bumbu koyanya gurih dan bikin nagih!\r\nby Dapur Ibu MaLKa', 5, 60, 5, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/19.jpg', 0),
(20, 'Lady Pink Juice', 'Yuk dicoba, healthy juice nya.\r\nby Iien Soegie', 4, 15, 5, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 0, 'images/recipe/20.jpg', 0),
(21, 'Ikan Cakalang Endesss (Enak & Pedesss)', 'by Labita Kitchen', 4, 20, 3, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 0, 'images/recipe/21.jpg', 0),
(22, 'Healthy and Simple Spiral Makaroni', 'by Christiana Jeslyn', 4, 20, 3, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/22.jpg', 0),
(23, 'Tiramisu Instan', 'Camilan ini cocok banget buat yg pengen makan enak tapi nggak mau ribet, instan dan super cepat buatnya hehe^^\r\nby Nurul Hikmah', 2, 15, 3, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/23.jpg', 0),
(24, 'Fresh Pasta', 'We love Homemade Food.\r\nby Nikmatul Rosidah', 6, 50, 3, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/24.jpg', 0),
(25, 'Kailan cah jamur kuping', 'Teman pendamping kailan: Jamur kuping.\r\nby E-kitchen', 4, 20, 3, '2023-07-06 14:15:32', '2023-07-01 14:15:32', 0.0, 1, 0, 1, 'images/recipe/25.jpg', 0),
(26, 'Cap cay', 'Cocok untuk anak-anak yang kurang menyukai sayuran. \r\nby Iris May', 6, 30, 4, '2015-04-15 13:55:07', '2015-04-15 13:55:07', 2.0, 1, 0, 1, 'images/recipe/26.jpg', 0),
(27, 'Fruity squash', 'Slruupp... segeerrr... \r\nby Andra Tersiana', 4, 20, 4, '2015-04-15 13:55:05', '2015-04-15 13:55:05', 0.0, 1, 0, 0, 'images/recipe/27.jpg', 0),
(28, 'sandwich pang', 'by ibu Rafa bektim', 4, 10, 4, '2015-04-15 14:31:03', '2015-04-15 14:31:03', 0.0, 1, 0, 1, 'images/recipe/28.jpg', 0),
(29, 'Chicken Teriyaki saus Honey Lemon', 'Resep sederhana cocok untuk menemani santap makan malam. \r\nby Akari Papa', 2, 20, 4, '2015-04-15 14:01:48', '2015-04-15 14:01:48', 5.0, 1, 0, 21, 'images/recipe/29.jpg', 1),
(30, 'Gyoza isi ayam sayur (dumpling)', 'Resep ini saya ambil dr NHK world dan JTT selebihnya saya modifikasi sendiri^^ \r\nby Nova Paramita', 5, 60, 4, '2015-04-15 14:20:53', '2015-04-15 14:20:53', 0.0, 1, 0, 6, 'images/recipe/30.jpg', 1),
(32, 'Oseng teri kentang', 'Oseng teri kentang adalah hidangan yang terdiri dari teri yang digoreng bersama kentang dan bumbu-bumbu yang memberikan cita rasa gurih dan pedas. Hidangan ini cocok disantap sebagai lauk pendamping nasi hangat. Nikmati oseng teri kentang yang lezat ini bersama keluarga dan teman-teman Anda.', 1, 30, 1, '2023-07-06 10:54:54', '2023-07-06 11:00:43', 0.0, 0, 0, 1, 'images/recipe/32.jpg', 0),
(33, NULL, NULL, 1, 0, 6, '2023-07-13 09:19:49', '2023-07-13 09:19:49', 0.0, 0, 1, 0, '/assets/img/recipe-default.jpg', 0),
(34, NULL, NULL, 1, 0, 6, '2023-07-13 09:19:55', '2023-07-13 09:19:55', 0.0, 0, 1, 0, '/assets/img/recipe-default.jpg', 0),
(35, NULL, NULL, 1, 0, 6, '2023-07-13 09:30:59', '2023-07-13 09:30:59', 0.0, 0, 1, 0, '/assets/img/recipe-default.jpg', 0),
(36, NULL, NULL, 1, 0, 6, '2023-07-13 09:31:32', '2023-07-13 09:31:32', 0.0, 0, 1, 0, '/assets/img/recipe-default.jpg', 0),
(37, NULL, NULL, 1, 0, 2, '2023-07-13 09:41:05', '2023-07-13 09:41:05', 0.0, 0, 1, 0, '/assets/img/recipe-default.jpg', 0);

--
-- Triggers `recipes`
--
DELIMITER $$
CREATE TRIGGER `add_recipe_default` BEFORE INSERT ON `recipes` FOR EACH ROW if (NEW.photo is null ) then set NEW.photo = '/assets/img/recipe-default.jpg'; end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `submit` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `no_step` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`recipe_id`, `no_step`, `description`, `photo`) VALUES
(1, 1, 'Cuci daging ayam dan cincang kasar (sesuai selera). Balurkan daging ayam tsb dengan garam. Sisihkan sesaat.', 'assets/img/step-default.jpg'),
(1, 2, 'Panaskan olive oil di pan dengan api sedang. Tumis bawang putih hingga harum dan agak kecoklatan.', 'assets/img/step-default.jpg'),
(1, 3, 'Kemudian tiriskan daging ayam dari air dan garam tadi. Setelah itu, masukkan daging ayam, tumis sesaat bersama dengan bawang putih tadi hingga daging ayam tidak terlihat mentah lagi.', 'assets/img/step-default.jpg'),
(1, 4, 'Masukkan air, kecap manis, kecap asin dan saos tiram. Aduk kembali dan biarkan hingga semua bumbu meresap ke dalam daging ayam. Jika dirasa airnya terlalu sedikit bisa ditambahkan, tapi jangan lupa koreksi rasa.', 'assets/img/step-default.jpg'),
(1, 5, 'Ambil sebuah mangkuk kosong, sajikan daging ayam yang sudah matang tadi di bagian dalam mangkuk, kemudian masukkan nasi, padatkan.', 'assets/img/step-default.jpg'),
(1, 6, 'Kukus mangkuk yang telah terisi daging ayam dan nasi tsb kurang lebih 15menit agar benar-benar meresap.', 'assets/img/step-default.jpg'),
(1, 7, 'Sajikan. Selamat menikmati :)\r\n_Papao', 'assets/img/step-default.jpg'),
(2, 1, 'Buang isi / cream oreo, dan blender hingga halus. Bisa jg dihancurkan dengan cara di tumbuk kasar. Basahkan cetakan pudding dgn sedikit air, agar mudah pd saat dikeluarkan nanti.', 'assets/img/step-default.jpg'),
(2, 2, 'Campurkan susu, air, gula, vanili, agar2, aduk rata sampai tidak ada gumpalan bubuk puding', 'assets/img/step-default.jpg'),
(2, 3, 'Masak di atas kompor dengan api sedang sambil sesekali diaduk searah jarum jam, sampai terlihat letupan pertama.', 'assets/img/step-default.jpg'),
(2, 4, 'Matikan api, aduk2 dan biarkan sebentar sampai hilang uap panasnya. Tuang pudding kesetengah bagian cup, biarkan setengah beku.', 'assets/img/step-default.jpg'),
(2, 5, 'Taburkan remahan oreo di atas pudding , dan siram kembali dgn pudding. Simpan pudding di dalam lemari es selama 3 jam, dan sajikan dengan taburan oreo diatasnya. Hhmm ,,, yummy\r\n-Iien Soegie-', 'assets/img/step-default.jpg'),
(3, 1, 'Kukus ubi ungu,haluskan', 'assets/img/step-default.jpg'),
(3, 2, 'Campur semua bahan ,tambahkan air jika terlalu kental,masukan ubi ungu yg telah dihaluskan,,', 'assets/img/step-default.jpg'),
(3, 3, 'Masak diatas api kecil sampai meletup letup,sambil diaduk Tunggu sampai adonan dingin', 'assets/img/step-default.jpg'),
(3, 4, 'Setelah dingin,Mix atau blender adonan sampai lembut', 'images/step/3-4.jpg'),
(4, 1, 'Panaskan oven dengan suhu 180 derqjat celcius.', 'assets/img/step-default.jpg'),
(4, 2, 'Panaskan minyak goreng. Tumis bawang bombay dan daging cincang Hingga matang.', 'assets/img/step-default.jpg'),
(4, 3, 'Campur spaghetti rebus dengan saos spagheti instan. Masukkan dalam pinggan tahan panas', 'assets/img/step-default.jpg'),
(4, 4, 'Atur daging cincang tumis diatas spagheti.', 'assets/img/step-default.jpg'),
(4, 5, 'Tabur keju mozarela.', 'assets/img/step-default.jpg'),
(4, 6, 'Panggang 10-15 menit sampai keju meleleh', 'images/step/4-6.jpg'),
(5, 1, 'Goreng bawang merah hingga kuning lalu angkat sisihkan (lupa difoto), cincang halus bawang putih, wortel dipotong korek api, kol iris memanjang, fillet ayam dan tomat dipotong dadu kecil', 'images/step/5-1.jpg'),
(5, 2, 'kocok telur ayam didalam mangkuk besar. lalu campurkan wortel, kol, ayam, daun bawang, bawang merah goreng, garam dan lada', 'images/step/5-2.jpg'),
(5, 3, 'Masukkan 4 sdm makan tepung maizena lalu aduk rata adonan fuyunghai', 'images/step/5-3.jpg'),
(5, 4, 'Panaskan minyak diatas panci teflon dengan api sedang. Jika panci mulai mengeluarkan asap putih tandanya minyak sudah benar benar panas. baru tuangkan adonan fuyunghai. Minyak yang digunakan harus banyak agar bagian atas fuyunghai tergoreng merata', 'images/step/5-4.jpg'),
(5, 5, 'Intip bagian bawah fuyunghai jika sudah kecoklatan saatnya membalik adonan agar tidak gosong. Supaya waktu dibalik adonan tidak terbelah tips saya gunakan golok dibagian bawah spatula dibagian atas. jepit kedua sisi balik perlahan', 'images/step/5-5.jpg'),
(5, 6, 'goreng sampai bagian lainnya matang. Intip sesekali supaya tidak terlalu gosong.', 'images/step/5-6.jpg'),
(5, 7, 'Tiriskan diatas piring, gunakan tisu dapur dengan menekan perlahan fuyunghai agar minyak terserap', 'images/step/5-7.jpg'),
(5, 8, 'Sementara itu kita buat sausnya dengan menumis bawang putih dan tomat dengan 2 sdm minyak. tunggu hingga tomat mulai mengeluarkan air', 'images/step/5-8.jpg'),
(5, 9, 'Tambahkan air dan saus tomat aduk rata dengan api kecil', 'images/step/5-9.jpg'),
(5, 10, 'Tuang larutan maizena. Aduk rata hingga mengental matikan api. Siram diatas fuyunghai', 'images/step/5-10.jpg'),
(6, 1, 'Kukus kentang dan kekian sampai matang. Haluskan kentang,sisihkan. Potong dadu kekian,sisihkan.', 'assets/img/step-default.jpg'),
(6, 2, 'Haluskan : bawang putih,bawang merah,kemiri,merica,jinten.', 'assets/img/step-default.jpg'),
(6, 3, 'Tumis bumbu halus,tambahkan sedikit air,aduk sampai wangi', 'assets/img/step-default.jpg'),
(6, 4, 'Masukkan kentang halus,aduk rata', 'assets/img/step-default.jpg'),
(6, 5, 'Bumbui dgn gula dan garam,masukkan kecap manis,saos tomat,saos tiram.', 'assets/img/step-default.jpg'),
(6, 6, 'Aduk sampai mengental,kalo dirasa terlalu kurang kalis bisa ditambah air sedikit. Sisihkan tunggu dingin', 'assets/img/step-default.jpg'),
(6, 7, 'Siapkan kulit lumpia,isi dengan kentang dan beri potongan kekian. Gulung dan ujungnya rekatkan dengan air (gak usah ditekuk seperti lumpia ya,cukup digulung aja)', 'assets/img/step-default.jpg'),
(6, 8, 'Panaskan sedikit mentega pada teflon,panggang kebab veggie sampai matang kecoklatan', 'assets/img/step-default.jpg'),
(6, 9, 'Mini kebab veggie ready to eat :) sajikan dgn mayones+saos tomat/saos sambal. NyamNyam~', 'assets/img/step-default.jpg'),
(7, 1, 'Cuci brokoli lalu rendam di air garam 15menit, kemudian tiriskan lalu potong2. Sisihkan', 'assets/img/step-default.jpg'),
(7, 2, 'Potong2 tofu, kemudian goreng hingga agak berkulit dikedua sisinya kemudian sisihkan', 'assets/img/step-default.jpg'),
(7, 3, 'Iris tipis cabe & bawang putih lalu tumis hingga harum, masukan brokoli beri saus tiram, gula, garam, merica, sdikit air aduk rata, cicipi kemudian masukan tofu aduk rata lalu kecilkan api, tutup wajan selama 5 menit hingga brokoli lunak, siap disajikan', 'assets/img/step-default.jpg'),
(8, 1, 'Campurkan ikan giling dan santan dingin. Aduk hingga tercampur rata menggunakan tangan', 'assets/img/step-default.jpg'),
(8, 2, 'Masukkan telur, garam, dan merica. Aduk rata', 'assets/img/step-default.jpg'),
(8, 3, 'Tambahkan sagu, bawang merah iris, dan bawang goreng. Aduk kembali hingga tercampur rata.', 'assets/img/step-default.jpg'),
(8, 4, 'Bentuk adonan menjadi bulatan. Bisa menggunakan scoop ice cream atau bisa juga dengan tehnik membuat bakso yaitu ambil adonan menggunakan tangan lalu remas hingga adonan keluar diantara ibu jari dan telunjuk membentuk bulatan lalu ambil menggunakan sendok', 'assets/img/step-default.jpg'),
(8, 5, 'Goreng dalam minyak panas dan banyak dengan api sedang hingga kuning kecoklatan. Angkat dan tiriskan. Sajikan dengan kuah cuko.', 'assets/img/step-default.jpg'),
(8, 6, 'Cuko :  Campurkan semua bahan. Masak di atas api sedang sambil diaduk sesekali hingga mengental. Angkat dan dinginkan, lalu saring', 'assets/img/step-default.jpg'),
(9, 1, 'Rebus vegeroni dalam air mendidih selama kurleb 10 menit atau hingga al dente (empuk). Kemudian tiriskan.', 'assets/img/step-default.jpg'),
(9, 2, 'Sediakan sebuah mangkuk, kocok lepas telur, masukkan garam dan lada, kocok hingga merata dan mengembang.', 'assets/img/step-default.jpg'),
(9, 3, '4\r\nW1siziisijiwmtuvmdqvmdevmdyvntuvmdqvmjc2lzmynjk2njuynta1mzjlmji1yzbjlmpwzyjdlfsiccisimnvbnzlcnqilcityxv0by1vcmllbnqgil0swyjwiiwidgh1bwiilcixodb4il1d?sha=da67e616\r\nSelamat menikmati =)\r\nBagikan via:Fac', 'assets/img/step-default.jpg'),
(9, 4, 'Selamat menikmati =)', 'images/step/9-4.jpg'),
(10, 1, 'Cuci bersih ikan gurame dan bumbui dengan bawang putih dan garam, lalu goreng, jangan sampai kering banget. Angkat.', 'assets/img/step-default.jpg'),
(10, 2, 'Panaskan minyak goreng, tumis Bawang Bombay, Bawang Putih, Saus Sambal, Saus tomat, Kecap manis, Lengkuas. Aduk-aduk.', 'assets/img/step-default.jpg'),
(10, 3, 'Masukkan ikan gurame, cukup 2 kali balik saja agar ikan tidak hancur. Angkat dan sajikan selagi hangat.', 'assets/img/step-default.jpg'),
(11, 1, 'Siapkan buah rambutan, ambil dagingnya. Cuci bersih, sisihkan.', 'images/step/11-1.jpg'),
(11, 2, 'Tuang batu es dlm gelas saji, masukan daging buah. Siram dg yakult. Sajikan.', 'assets/img/step-default.jpg'),
(12, 1, 'rebus lasagna instan dengan menambahkan 2sdm minyak goreng agar lasagna tidak lengket satu sama lain, tiriskan\r\n', 'assets/img/step-default.jpg'),
(12, 2, 'tumis saus spagheti instan dengan daging kornet, sampai tercampur rata', 'assets/img/step-default.jpg'),
(12, 3, 'isi lasagna dengan tumisan saus dan beri parutan keju mozarella, lalu gulung, lakukan sampai habis', 'assets/img/step-default.jpg'),
(12, 4, 'panggang sebentar lasagna yang telah diisi', 'assets/img/step-default.jpg'),
(12, 5, 'terakhir tata dipiring lalu beri sisa saus dan beri parutan keju, selamat menikmati...praktis bukan?', 'assets/img/step-default.jpg'),
(13, 1, 'Untuk membuat kulit pie nya . Campurkan tepung terigu, mentega, telor dan gula halus sampai Kalis bs menggunakan wisk balon ato langsung remes2 pake tangan. Setelah Kalis olesi cetakan pie ( dsni saya pake yg diameter 18) dengan mentega secara merata.', 'assets/img/step-default.jpg'),
(13, 2, 'Jgn lupa ya setelah dicetak adonan kulit pie nya bagian dasarnya di tusuk pake garpu.', 'assets/img/step-default.jpg'),
(13, 3, 'Utk fla browniess aduk telur ,gula halus dgn wisk sampe halus. Masukkan campuran terigu,garam,Vanili bubuk, & cokelat bubuk scr brthp aduk rata.masukkan minyak goreng aduk rata. Tuang ke adonan pie 3/4 penuh taburi choco Chip oven d suhu 150-160 dercel', 'assets/img/step-default.jpg'),
(13, 4, 'Panggang selama 45 menit atau sampe kulit pie terlihat keemasan . Keluarkan dari oven diinginkan sebentar lalu keluarkan dari cetakan. Pie brownies siap dihidangkan :)', 'assets/img/step-default.jpg'),
(14, 1, 'Campurkan fermipan dengan air hangat. Tambahkan gula, tunggu sampai fermipan aktif.', 'assets/img/step-default.jpg'),
(14, 2, 'Kocok sebentar kuning telur, campurkan larutan fermipan. Tuang minyak goreng.', 'assets/img/step-default.jpg'),
(14, 3, 'Masukkan tepung secara bertahap. Aduk sebentar. Gunakan mixer untuk menguleni hingga kalis.', 'assets/img/step-default.jpg'),
(14, 4, 'Bulatkan adonan, oles dengan minyak goreng lalu tutup rapat menggunakan plastik selama 1 jam.', 'assets/img/step-default.jpg'),
(14, 5, 'Setelah adonan mengembang, pukul bagian tengahnya kemudian uleni kembali untuk menghilangkan udara di dalamnya.', 'assets/img/step-default.jpg'),
(14, 6, 'Bentuk bulat, letakkan pada loyang yang sudah diolesi mentega. Taburi atasnya dengan keju.', 'assets/img/step-default.jpg'),
(14, 7, 'Biarkan mengembang lagi hingga double size. kemudian panggang selama kurang lebih 40 menit dengan suhu 180c sampai matang. Happy baking ^^', 'assets/img/step-default.jpg'),
(15, 1, 'Siapkan semua bahan masakan dan kupas wortel, kentang, dan apel. Aku pakai pisau peeler supaya lebih cepat mengupasnya', 'images/step/15-1.jpg'),
(15, 2, 'Cuci daging ayam, keringkan dengan tissue dapur lalu taburkan garam dan lada di kedua sisi diamkan sebentar kemudian potong kotak-kotak kurang lebih 2x2 cm', 'images/step/15-2.jpg'),
(15, 3, 'Cincang halus bawang putih, dan juga iris bawang bombay. aku iris bawang bombay dengan bentuk wedges.', 'images/step/15-3.jpg'),
(15, 4, 'Untuk wortelnya aku potong - potong bentuk segitiga, kentang dipotong kotak-kotak agak besar karena kalau terlalu kecil nanti jadi hancur waktu dimasak\r\n', 'images/step/15-4.jpg'),
(15, 5, 'Panaskan minyak goreng dengan api sedang, lalu tumis bawang bombay sampai berwarna transparan lalu masukkan bawang putih. Tumis sampai harum baru masukkan ayam', 'images/step/15-5.jpg'),
(15, 6, 'Masukkan wortel, tumis sebentar lalu tambahkan air kaldu tunggu sampai agak mendidih masukkan kentang', 'images/step/15-6.jpg'),
(15, 7, 'Setelah mendidih parut apel, tambahkan kedalam panci. Tuang soy sauce & gula (madu). Aduk-aduk hinga rata.', 'images/step/15-7.jpg'),
(15, 8, 'Untuk curry roux atau kari blok nya disarankan jangan langsung dimasukkan ke panci karena takut menggumpal. sebaiknya. ambil 2 blok larutkan di mangkok kecil dengan air kaldu. Setelah larut tuang kedalam panci. Ulangi sampai kari blok habis\r\n', 'images/step/15-8.jpg'),
(15, 9, 'Kecilkan api supaya kari tidak cepat gosong. Tambahkan lada, koreksi rasa dengan garam. Lalu aduk-aduk sampai kari mengental dan wortel juga kentang lembut. Matikan api.', 'images/step/15-9.jpg'),
(15, 10, 'Sajikan Chicken Curry dengan nasi putih panas. Jika masih ada sisa curry, dapat disimpan di kulkas 2-3 hari atau di freezer sampai 1 bulan.', 'images/step/15-10.jpg'),
(16, 1, 'Masak santan kental dengan api kecil hingga agak berminyak, kemudian masukkan daun pandan, daun sereh dan daun jeruk. Aduk sampai tercium wanginya baru diangkat.', 'images/step/16-1.jpg'),
(16, 2, 'Buatlah bahan biang dengan mencampur tepung terigu, air kelapa dan ragi instan hingga rata. Diamkan selama 15 menit.', 'assets/img/step-default.jpg'),
(16, 3, 'Aduk kuning telur, gula, garam dan vanili hingga rata. Kemudian masukkan bahan biang dan tepung sagu. Sesekali masukkan santan sedikit demi sedikit sambil diaduk rata. Saring adonan dan diamkan selama 2 jam.', 'images/step/16-3.jpg'),
(16, 4, 'Panaskan loyang yang sudah diolesi dengan minyak. Jika sudah benar-benar panas baru tuangkan adonan, jangan diaduk lagi.', 'images/step/16-4.jpg'),
(16, 5, 'Panggang selama kurang lebih 45 menit. Buka sedikit pintu oven agar ada aliran udara, atau gunakan oven yang ada bukaan pada bagian atasnya.', 'images/step/16-5.jpg'),
(17, 1, 'Vla: Campur smua bahan. Masak diatas api kecil sambil terus diaduk hingga mengental dan tidak lengket di panci. Setelah masak diamkan sejenak hingga panas berkurang.', 'assets/img/step-default.jpg'),
(17, 2, 'Gilas roti tawar hingga tipis. Isi vla keju secukupnya, gulung lalu padatkan.', 'assets/img/step-default.jpg'),
(17, 3, 'Masak bahan celupan hingga cair. Celup ujung-ujung roti tadi di coklat cair, lalu beri meises warna warni. Dinginkan di kulkas.', 'assets/img/step-default.jpg'),
(18, 1, 'Siapkan loyang bulat ukuran 20cm, alasi dgn kertas roti, olesi dgn menteg tipis, sisihkan. Set oven di suhu 150\'c', 'assets/img/step-default.jpg'),
(18, 2, 'Campur dan ayak tepung terigu + maizena. Sisihkan', 'assets/img/step-default.jpg'),
(18, 3, 'Campur butter, cream cheese dan susu cair, panaskan diatas api kecil, sampe larut . Tidak usah terlalu lama, asal tercampur rata dan meleleh. Angkat, biarkan hangat\r\n', 'assets/img/step-default.jpg'),
(18, 4, 'Masukkan campuran tepung, parutan kulit lemon ke adonan cream cheese, aduk rata. Masukkan kuning telur, aduk rata. Sisihkan', 'assets/img/step-default.jpg'),
(18, 5, 'Kocok putih telur, sambil dituang air jeruk lemon dan gula pasir sedikit demi sedikit. Kocok hingga putih telur mengembang dan soft peak.', 'assets/img/step-default.jpg'),
(18, 6, 'Tuang 1/3 putih telur ke adonan cream cheese, aduk rata ( teknik pancing), setelah tercampur tuang sisa putih telur ke adonan cream chesee, aduk rata.', 'assets/img/step-default.jpg'),
(18, 7, 'Tuang adonan ke loyang, panggang secara au bain marie ( pemanggangab dgn loyang air) selama 90 menit, hingga kuning keemasan (lama pemanggangan disesuaikan dgn oven masing)', 'assets/img/step-default.jpg'),
(18, 8, 'Setelah matang angkat, tunggu dingin baru dikeluarkan perlahan dari loyang. Sajikan dengan glaze selai atau topping sesuai selera', 'assets/img/step-default.jpg'),
(19, 1, 'Rebus ayam hingga empuk, angkat dan goreng sebentar hingga berkulit dan suwir2', 'assets/img/step-default.jpg'),
(19, 2, 'Siapkan air kaldu rebusan ayam. Sisihkan', 'assets/img/step-default.jpg'),
(19, 3, 'Tumis bumbu halus hingga wangi, masukkan daun salam, daun jeruk dan sereh. Aduk rata, masak hingga bumbu matang.', 'assets/img/step-default.jpg'),
(19, 4, 'Tuang tumisan bumbu ke air kaldu yang sedang direbus, tambahkan garam, gula dan lada. Tes rasa, masak hingga mendidih. Matikan api, taburi dengan irisan daun bawang dan seledri.', 'assets/img/step-default.jpg'),
(19, 5, 'Koya : blender kerupuk udang dan bawang putih goreng.', 'assets/img/step-default.jpg'),
(19, 6, 'Sajikan soto ambengan dengan bahan pelengkap dan koya', 'assets/img/step-default.jpg'),
(20, 1, 'Campur buah sirsak, terung belanda yg telah dikupas terlebih dahulu, susu, gula, air, & es batu.', 'assets/img/step-default.jpg'),
(20, 2, 'Blender sampai halus. Tuang dlm gelas & sajikan', 'assets/img/step-default.jpg'),
(21, 1, 'Ikan cakalang rebus ( biasanya dijual dlm bentuk yang sdh direbus ) kita belah2 menjadi ukuran kecil sesuai selera..Kemudian digoreng sampai berubah warna kecoklatan', 'images/step/21-1.jpg'),
(21, 2, 'Haluskan semua bumbu..Kemudian ditumis sampai keluar aromanya..Tambahkan air agar tidak terlalu kering..Daun jeruk, Garam & Masako supaya makin syedaaapp ;)', 'assets/img/step-default.jpg'),
(21, 3, 'Kemudian masukkan ikan cakalang yang sudah digoreng..Kecilkan api kompor..Aduk2 hingga tercampur rata dengan bumbu..Angkat dan siap disajikan ^^', 'assets/img/step-default.jpg'),
(22, 1, 'Cuci bersih wortel, daun seledri, tomat dan bakso. Tetapi tidak bersamaan, dan satu persatu\r\n', 'assets/img/step-default.jpg'),
(22, 2, 'Ulek lada sampai halus *tidak harus mengulek, jika sudah ada lada bubuk', 'assets/img/step-default.jpg'),
(22, 3, 'Masak air hingga mendidih untuk merebus bakso. Tunggu hingga bakso mengapung, tanda sudah matang. Jika sudah mengapung, saring dan tunggu hingga tidak terlalu panas', 'assets/img/step-default.jpg'),
(22, 4, 'Masak lagi air hingga mendidih, baru masukan makaroni nya. Tunggu hingga makaroni sudah lembut *caranya ambil 1 makaroni dengan sendok, lalu coba hancurkan dengan tangan atau di coba kelembutannya. Jika sudah matang, angkat dan tiriskan', 'assets/img/step-default.jpg'),
(22, 5, 'Untuk menunggu air dalam makaroni di saringan sudah tidak ada, potong wortel menjadi dadu. Potong juga seledri kecil kecil. Bakso tadi yg sudah ditiriskan, potong sesuai keinginan', 'assets/img/step-default.jpg'),
(22, 6, 'Masukan margarin dalam wajan, tunggu meleleh. Masukan telur, dan masak orak arik. Masukan lagi tomat, wortel dan bakso bersamaan lalu aduk rata. Beri sedikit garam', 'assets/img/step-default.jpg'),
(22, 7, 'Matikan dulu kompornya, lalu masukan margarin lagi, tunggu meleleh. Baru masukan makaroni spiral dan daun seledri. Beri garam dan lada. Aduk hingga tercampur rata.', 'assets/img/step-default.jpg'),
(22, 8, 'Untuk hiasan, bisa taruh daun seledri diatasnya', 'assets/img/step-default.jpg'),
(23, 1, 'Siapkan cup kecil atau gelas sesuai selera', 'assets/img/step-default.jpg'),
(23, 2, 'Celupkan monde egg drops ke dalam kopi, lalu susun ke dalam gelas', 'assets/img/step-default.jpg'),
(23, 3, 'Tambahkan whipped cream diatasnya', 'assets/img/step-default.jpg'),
(23, 4, 'Ulangi step 2 dan 3 hingga penuh atau sesuai selera', 'assets/img/step-default.jpg'),
(23, 5, 'Taburi coklat bubuk di atasnya. Siap disajikan', 'assets/img/step-default.jpg'),
(24, 1, 'Ayak tepung dan garam. Di mangkok atau di permukaan buat tepung lubang tengah masukkan telur dan minyak.aduk secara perlahan lalu diuleni selama 7 ke 10 menit.', 'assets/img/step-default.jpg'),
(24, 2, 'Jika Anda punya Food processor bisa juga dan lebih cepat.setelah adonan di uleni bungkus dengan plastik,biarkan adonan rehat selama 30 menit.setelah 30 menit adonan jadi lemas.', 'assets/img/step-default.jpg'),
(24, 3, 'Bagi adonan jadi beberapa bagian,Jika Anda punya mesin pasta Lebih mudah. Kika tidak bisa di pipihkan dengan Rolling pin. potong potong sesuai yang di mau.Jika untuk pasta panjang Tabur dengan tepung setelah dipotong biar tidak lekat.', 'images/step/24-3.jpg'),
(24, 4, 'Jika untuk Lasagna lebar setelah di pipihkan keringkan tuk beberapa saat biar tidak lekat satu sama lain.', 'images/step/24-4.jpg'),
(24, 5, 'Pasta siap di olah sesuai dengan menu masing masing,Rebus pasta di air mendidih dengan sedikit minyak dan garam selama 3 ke 4 menit.', 'images/step/24-5.jpg'),
(25, 1, 'Siapkan bahan-bahan.', 'assets/img/step-default.jpg'),
(25, 2, 'Cuci kailan di bawah air mengalir, lalu potong sesuai selera. Setelah itu rendam dalam larutan air garam (1 sdm) selama 5-10 menit. Cuci dan tiriskan.', 'assets/img/step-default.jpg'),
(25, 3, 'Panaskan wajan, beri minyak lalu tumis bawang putih dan bombay sampai harum. lalu masukan jamur kuping dan tumis 2 menit.', 'assets/img/step-default.jpg'),
(25, 4, 'Masukan kailan lalu aduk-aduk hingga kailan berubah warna jadi hijau muda. Tambahkan jahe dan bumbu-bumbu lalu aduk hingga rata dengan api besar agar tetap crunchy. Masukan air lalu aduk kembali sekitar 20 detik. matikan api.', 'assets/img/step-default.jpg'),
(25, 5, 'Sajikan.', 'assets/img/step-default.jpg'),
(26, 1, 'Tumis bawang putih hingga harum, masukkan fillet ayam, aduk hingga berubah warna. Tambahkan udang, tuang kecap ikan, garam, gula, penyedap', 'assets/img/step-default.jpg'),
(26, 2, 'Masukkan jamur, tambahkan air, aduk. Terakhir setelah meresap, masukkan sayuran, kemudian larutan maizena/sagu. Aduk-aduk sampai mendidih. Matikan api', 'assets/img/step-default.jpg'),
(26, 3, 'Penyajian: beri minyak wijen sebagai topping', 'assets/img/step-default.jpg'),
(27, 1, 'Campur air gula dengan sari lemon, tambahkan air dingin, lalu aduk.', 'assets/img/step-default.jpg'),
(27, 2, 'Masukkan stoberi, kiwi, dan biji selasih ke dalam larutan, aduk-aduk. Tambahkan batu es jika suka. Fruity squash siap dinikmati.', 'assets/img/step-default.jpg'),
(28, 1, 'Potong iris sosis yg sudah disiapkan sesuai selera', 'assets/img/step-default.jpg'),
(28, 2, 'Iris kasar bawang bombay sisihkan', 'assets/img/step-default.jpg'),
(28, 3, 'Tumis sosis dan bawang bombay hingga harum dengan sedikit margarin...jika sudah terlihat matang dan harum matikan kompor lalu sisihkan', 'assets/img/step-default.jpg'),
(28, 4, 'Siapkan roti tawar yg sudah disediakan...lalu olesi dengan saus tomat dan sambal kemudian beri isian tumisan sosis tadi...kkemudian berikan mayonais sesuai selera..lalu taru kembali diatasnya dengan irisan tomat dan mentimun kemudian tutup dengan roti...', 'assets/img/step-default.jpg'),
(28, 5, 'Kemudian setelah semua roti telah terisi sempurna beri masing2 sisi dengan olesan margarin kemudian dipanggang diatas api kecil dg bergantian hingga terlihat matang dan agak garing rotinya...', 'assets/img/step-default.jpg'),
(28, 6, 'Jika semua roti selesai dipanggang iris menjadi dua bagian seperti yg ada digambar...', 'assets/img/step-default.jpg'),
(28, 7, 'Lalu sajikan deh...', 'assets/img/step-default.jpg'),
(29, 1, 'Potong lemon menjadi dua bagian, satu bagian iris tipis2 untuk hiasan dan setengahnya lagi untuk bahan bumbu', 'images/step/29-1.jpg'),
(29, 2, 'Gunakan daging tanpa tulang, taburkan garam dan lada secukupnya', 'images/step/29-2.jpg'),
(29, 3, 'Kemudian lumurkan dengan sagu menutupi seluruh permukaan daging ayam secara merata', 'images/step/29-3.jpg'),
(29, 4, 'panggang daging ayam bagian kulit terlebih dahulu tanpa minyak sampai mengeluarkan minyak dengan api sedang sekitar 5 menit', 'images/step/29-4.jpg'),
(29, 5, 'Kemudian balik dan panggang bagian daging selama 5 menit. Masukkan kaldu ayam atau cukup air 50 cc tutup fried pan dan kukus sekitar 5 menit agar daging ayam matang', 'images/step/29-5.jpg'),
(29, 6, 'Kecilkan api. Masukkan kecap asin jepang, madu dan perasaan lemon ke dalam fried pan dan panggang sambil menyiram berulang-ulang sausnya ke daging dengan menggunakan sendok', 'images/step/29-6.jpg'),
(29, 7, 'Setelah saus mengental, matikan api. Angkat dan potong vertikal sebesar 1 cm. Selipkan potongan lemon diantara potongan daging dan sajikan', 'images/step/29-7.jpg'),
(30, 1, 'BAHAN ISIAN: Haluskan merica, bawang merah dan putih..setelah itu tumis bersama bawang bombay yg sdh dicincang hingga wangi..setelah itu masukkan garam,royco,ayam dan sayur2an..terakhir masukkan telur dan daun bawang..sisihkan', 'images/step/30-1.jpg'),
(30, 2, 'BAHAN KULIT campur tepung&garam..masukkan air panas dan minyak,aduk dengan sendok (apabila panas)..diamkan sebentar,setelah mulai mendingin uleni adonan dengan tangan..setelah tercampur rata,istrhatkan adonan selama 10menit(tu2p dgn kain lembab)', 'assets/img/step-default.jpg'),
(30, 3, 'Pipihkan bahan kulit,dan cetak berbentuk lingkaran dengan menggunakan mulut gelas..setelah itu masukkan bahan isian dan tutup bagian ujung kulit,pipihkan..', 'images/step/30-3.jpg'),
(30, 4, 'Siapkan teflon dan berikan sedikit minyak,masukkan gyoza panggang hingga menguning dikedua sisinya', 'images/step/30-4.jpg'),
(30, 5, 'Setelah menguning tambahkan air sekitar 80ml..rebus (ditutup) hingga terlihat perubahan warna dr kulit gyoza (akan menjadi agak transparan) lalu angkat..', 'images/step/30-5.jpg'),
(30, 6, 'Gyoza siap untuk dihidangkan..selamat mencoba :)', 'assets/img/step-default.jpg'),
(32, 1, 'Pertama, rendam teri dalam air bersih selama sekitar 15 menit. Setelah itu, tiriskan teri dan sisihkan.', 'assets/img/step-default.jpg'),
(32, 2, 'Panaskan minyak goreng dalam wajan dengan api sedang.', 'assets/img/step-default.jpg'),
(32, 3, 'Tumis bawang putih, bawang merah, cabai merah, daun salam, dan serai hingga harum dan bawang menjadi layu.', 'assets/img/step-default.jpg'),
(32, 4, 'Masukkan teri yang telah direndam dan aduk rata dengan bumbu tumis.', 'assets/img/step-default.jpg'),
(32, 5, 'Tambahkan kentang yang telah dipotong dadu ke dalam wajan. Aduk merata dan masak selama beberapa menit hingga kentang mulai empuk.', 'assets/img/step-default.jpg'),
(32, 6, 'Tuangkan sedikit air, sekitar 100 ml, untuk membantu proses pemasakan kentang.', 'assets/img/step-default.jpg'),
(32, 7, 'Tambahkan gula dan garam secukupnya. Aduk rata.', 'assets/img/step-default.jpg'),
(32, 8, 'Tutup wajan dan masak hingga kentang benar-benar matang dan bumbu meresap, sekitar 10-15 menit.', 'assets/img/step-default.jpg'),
(32, 9, 'Jika terlihat kering, tambahkan sedikit air lagi jika diperlukan.\\r\\nAngkat oseng teri kentang dari wajan dan sajikan dalam piring saji.', 'assets/img/step-default.jpg');

--
-- Triggers `steps`
--
DELIMITER $$
CREATE TRIGGER `add_step_default` BEFORE INSERT ON `steps` FOR EACH ROW if (NEW.photo is null ) then set NEW.photo = 'assets/img/step-default.jpg'; end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` text DEFAULT NULL,
  `password` text NOT NULL,
  `gender` varchar(1) DEFAULT 'f',
  `bdate` date DEFAULT '1970-01-01',
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'MEMBER',
  `photo` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `googleplus` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `last_access` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `gender`, `bdate`, `phone`, `status`, `photo`, `facebook`, `twitter`, `googleplus`, `path`, `last_access`) VALUES
(1, 'josh@gmail.com', 'Josh Lee', 'SLEAQSv5yJhiJ5hsHolMB1o9k2fX7MNCnE/6JqcpJqgj3Uorl+fKKIDtQ5om7WsFbVXd9U2cizyhDSkol0Qvtg==', 'M', '1994-06-19', '085762112191', 'ADMIN', 'images/user/1.jpg', '', '', '', '', '2023-07-13 01:57:39'),
(2, 'adelia@gmail.com', 'Adelia', '7IyrTjkpnX+eHXMtpDc61YhhcnhhHD3Qo/3U2s8RnQkeZvf8PFQ2OFWbhl71/+iiXHzloyFfWxC3FYEcVImkdg==', 'F', '1994-08-05', '', 'ADMIN', 'assets/img/user-female.png', '', '', '', '', '2023-07-13 01:52:24'),
(3, 'garry@gmail.com', 'Garry', 'CD7ASWtj34DBIQrGBIjfKOl0yGP0UeHs65UEE4zE4CzI1nhviAXJ9kQ4Qu6Ppb0y3bRR2zveJnb9oXWwUbRjtQ==', 'M', '1994-04-16', '', 'ADMIN', 'assets/img/user-male.png', '', '', '', '', '2023-07-13 01:18:48'),
(4, 'randy@gmail.com', 'Randy', 'PGlyr2utpqIsGCBRtvXCCf1lM8XGEdA9F7C0/O4GzJviYhzoBgk34UOMvKV/oFNUiMI0HGxwsdcCb1SQHTbeUw==', 'M', '1994-07-28', '', 'ADMIN', 'assets/img/user-male.png', '', '', '', '', '2023-07-06 10:42:11'),
(5, 'kelly@gmail.com', 'Kelly', 'q7flI4hjSMmqOoaPB0Y9gVhq2lodDXaSH6jseRq+6mCkVC+I0h594PKJsAFm4o9i4B8rncMh3w5dj1bx8lPCmA==', 'F', '1993-12-27', '', 'ADMIN', 'assets/img/user-male.png', '', '', '', '', '2023-07-06 10:52:24'),
(6, 'felix@gmail.com', 'Felix', 'MRe0eMEUvrNfJCu2gNMaDFyAd/P1FdpikomgJXHg9RIPEY1cxxmYJXunGN0GBATEg+zX6skCxxZeTZdiEvsUSA==', 'M', '1970-01-01', NULL, 'MEMBER', 'assets/img/user-male.png', NULL, NULL, NULL, NULL, '2023-07-13 01:38:17'),
(8, 'admin@joshleerecipe.com', 'admin', 'gxaHNGRWTk9KgLBHK6FLLcCZjLqK0IxnTr8lgc7pCFzUmbBoKXIbzcf4MdqU+W7J3MpArCLG2+5+dVkVpQctzw==', 'M', '1970-01-01', NULL, 'admin', 'assets/img/user-male.png', NULL, NULL, NULL, NULL, '2023-07-09 08:24:42'),
(9, 'Lucky@gmail.com', 'Lucky', 'tlJ2Ah01IFPufD5w9cS7jypmVu84vfAFBf00U53q7x2SJpORRo9msictZ8YezA1ZW7/HYQAUhkRUIVNci3hung==', 'M', '1970-01-01', NULL, 'MEMBER', 'assets/img/user-male.png', NULL, NULL, NULL, NULL, '2023-07-11 03:40:23'),
(10, 'test@gmail.com', 'test', '7IyrTjkpnX+eHXMtpDc61YhhcnhhHD3Qo/3U2s8RnQkeZvf8PFQ2OFWbhl71/+iiXHzloyFfWxC3FYEcVImkdg==', 'F', '1970-01-01', NULL, 'MEMBER', 'assets/img/user-female.png', NULL, NULL, NULL, NULL, '2023-07-13 01:40:24');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `add_user_default` BEFORE INSERT ON `users` FOR EACH ROW if (LOWER(NEW.gender) = 'f' ) then set NEW.photo = 'assets/img/user-female.png'; elseif (LOWER(NEW.gender) = 'm' ) then set NEW.photo = 'assets/img/user-male.png'; end if
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`recipe_id`,`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cooklater`
--
ALTER TABLE `cooklater`
  ADD PRIMARY KEY (`recipe_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`recipe_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`recipe_id`,`name`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`,`conversation_id`),
  ADD KEY `conversation_id` (`conversation_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`recipe_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);
ALTER TABLE `recipes` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`recipe_id`,`no_step`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`email`),
  ADD UNIQUE KEY `email` (`email`);
ALTER TABLE `users` ADD FULLTEXT KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cooklater`
--
ALTER TABLE `cooklater`
  ADD CONSTRAINT `cooklater_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cooklater_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
