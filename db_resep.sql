-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 11:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_resep`
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
  `price` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`recipe_id`, `name`) VALUES
(6, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `description` text,
  `submit` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `submit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cooklater`
--

CREATE TABLE `cooklater` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `submit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_finish` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `quantity` decimal(8,2) DEFAULT '0.00',
  `units` varchar(30) DEFAULT NULL,
  `info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`recipe_id`, `name`, `quantity`, `units`, `info`) VALUES
(6, 'bawang putih', '3.00', '300gr', ''),
(6, 'ikan patin', '1.00', '500gr', '');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) NOT NULL,
  `description` mediumtext,
  `submit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `read` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `value` decimal(2,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `name` text,
  `description` text,
  `portion` int(10) UNSIGNED DEFAULT '1',
  `duration` int(10) UNSIGNED DEFAULT '0',
  `author` int(10) UNSIGNED NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` decimal(2,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `tmp_status` tinyint(1) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '0',
  `photo` text,
  `highlight` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `description`, `portion`, `duration`, `author`, `create_date`, `last_update`, `rating`, `status`, `tmp_status`, `views`, `photo`, `highlight`) VALUES
(6, 'Gulai Ikan patin', '', 1, 53, 10, '2023-06-22 08:38:47', '2023-06-22 09:54:35', '0.0', 0, 0, 15, '/assets/img/recipe-default.jpg', 0),
(7, NULL, NULL, 1, 0, 10, '2023-06-22 09:19:43', '2023-06-22 09:19:43', '0.0', 0, 1, 0, '/assets/img/recipe-default.jpg', 0),
(8, NULL, NULL, 1, 0, 10, '2023-06-22 09:40:18', '2023-06-22 09:40:18', '0.0', 0, 1, 0, '/assets/img/recipe-default.jpg', 0);

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
  `reason` text,
  `submit` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `no_step` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `description` text,
  `photo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`recipe_id`, `no_step`, `description`, `photo`) VALUES
(6, 1, 'Cara membuat:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n1. Tumis bumbu halus sampai harum sambil masukkan serai, daun jeruk, daun salam, dan asam belimbing.\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n2. Masukkan air hingga mendidih, kemudian santan.\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n3. Tambahkan gula, garam, dan kaldu jamur.\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n4. Setelah itu, masukkan ikan, tahu, dan telur rebus. Masak hingga bumbu meresap. Sajikan.', 'assets/img/step-default.jpg');

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
  `name` text,
  `password` text NOT NULL,
  `gender` varchar(1) DEFAULT 'f',
  `bdate` date DEFAULT '1970-01-01',
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'MEMBER',
  `photo` text,
  `facebook` text,
  `twitter` text,
  `googleplus` text,
  `path` text,
  `last_access` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `gender`, `bdate`, `phone`, `status`, `photo`, `facebook`, `twitter`, `googleplus`, `path`, `last_access`) VALUES
(10, 'josh@gmail.com', 'Josh Lee', 'M3Jguoy16aMWdKcuJZyaSNHsi4v8r/RQzToTxGLz9Buf4BCCiJ6UYUlzt3jveBHX/RgDBZdWBhFIgwpXy3fAmg==', 'M', '2002-06-16', '', 'MEMBER', 'assets/img/user-male.png', '', '', '', '', '2023-06-22 03:37:32');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
