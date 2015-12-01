-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2015 at 12:18 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wom`
--

-- --------------------------------------------------------

--
-- Table structure for table `guild`
--

CREATE TABLE IF NOT EXISTS `guild` (
  `guild_title` varchar(30) NOT NULL,
  `account_number` int(35) NOT NULL,
  `leaderflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guild`
--

INSERT INTO `guild` (`guild_title`, `account_number`, `leaderflag`) VALUES
('Subway Eat Flesh', 6, 1),
('Assembly Swag', 8, 1),
('Assembly Swag', 14, 0),
('Alliance of the Lab', 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_table`
--

CREATE TABLE IF NOT EXISTS `purchase_table` (
  `account_number` int(35) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_type` varchar(35) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_table`
--

INSERT INTO `purchase_table` (`account_number`, `card_number`, `card_type`, `first_name`, `last_name`, `date`) VALUES
(6, 'FADADADADADA', 'VISA', 'Jason', 'Carpen', '22/23/22'),
(8, '888-888-8888', 'Visa', 'N.Ryan', 'Dubstep', '12/1/2015'),
(14, '888-888-8888', 'Visa', 'Ja', 'Carpenter', '12/1/2015'),
(17, '999-999-9999', 'Mastercard', 'Jason', 'Caer', '12/1/2015');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `quest_id` int(11) NOT NULL,
  `quest_title` varchar(125) NOT NULL,
  `quest_reqlvl` int(11) NOT NULL,
  PRIMARY KEY (`quest_id`),
  UNIQUE KEY `quest_id_UNIQUE` (`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`quest_id`, `quest_title`, `quest_reqlvl`) VALUES
(1, 'Lucky Hearts', 0),
(2, 'Sharptalon''s Claw', 19),
(11, 'Riverpaw Gnoll Bounty', 7),
(16, 'Give Gerard a Drink', 1),
(23, 'Ursangous'' Paw', 19),
(24, 'Shadumbra''s Head', 19),
(25, 'Simmer Down Now', 23),
(35, 'Further Concerns', 7),
(37, 'Find the Lost Guards', 7),
(40, 'A Fishy Peril', 7),
(45, 'Discover Rolf''s Fate', 7),
(46, 'Bounty on Murlocs', 7),
(52, 'Protect the Frontier', 7),
(54, 'Report to Goldshire', 1),
(59, 'Cloth and Leather Armor', 7),
(62, 'The Fargodeep Mine', 4),
(71, 'Report to Thomas', 7),
(76, 'The Jasperlode Mine', 4),
(83, 'Fine Linen Goods', 7),
(84, 'Back to Billy', 5),
(85, 'Lost Necklace', 5),
(86, 'Pie for Billy', 5),
(87, 'Goldtooth', 5),
(88, 'Princess Must Die!', 6),
(106, 'Young Lovers', 5),
(107, 'Note to William', 5),
(111, 'Speak with Gramma', 5),
(112, 'Collecting Kelp', 5),
(114, 'The Escape', 5),
(123, 'The Collector', 7),
(171, 'A Warden of the Alliance', 10),
(172, 'Children''s Week', 10),
(185, 'Tiger Hunting', 24),
(186, 'Tiger Stalking', 24),
(187, 'Tiger Prowess', 24),
(195, 'Raptor Stalking', 24),
(196, 'Raptor Prowess', 24),
(197, 'Raptor Mastery', 24),
(29037, '''Borrowing'' From the Winterfall', 50),
(38396, 'A Curious Oddity', 100),
(39665, 'A True Naval Commander', 100);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `account_number` int(35) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`account_number`, `user_name`, `first_name`, `last_name`, `password`) VALUES
(6, 'Ja', 'Da', 'Ma', '1'),
(7, 'M_Smash', 'Tory', 'Jod', '1'),
(8, 'Swagnath', 'N.Ryan', 'Dubstep', '1'),
(9, 'Dr.F', 'John', 'French', '1'),
(10, 'TeflonG', 'Gary', 'Chicken', '1'),
(11, 'Shakespear', 'Mangled', 'Fang', '1'),
(12, 'Take_That', 'Addi', 'Dad', '1'),
(13, 'MumKas', 'Gregory', 'Ford-Harrison', '1'),
(14, 'Slygar', 'Bob', 'Scar', '1'),
(15, 'Shoeblaster', 'Polo', 'Shultz', '1'),
(16, 'Mitchwell', 'Mitch', 'Gerberbaby', '1'),
(17, 'Carpensir', 'Jason', 'Carpet Turd', '1'),
(18, 'J_son', 'JSON', 'JavaClass', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `account_number` int(35) NOT NULL,
  `char_level` int(11) NOT NULL,
  `quests_completed` int(10) NOT NULL DEFAULT '0',
  `image_path` varchar(30) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `account_number_idx` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`account_number`, `char_level`, `quests_completed`, `image_path`) VALUES
(6, 5, 2, ''),
(7, 1, 0, ''),
(8, 1, 0, ''),
(9, 1, 0, ''),
(10, 1, 0, ''),
(11, 1, 0, ''),
(12, 1, 0, ''),
(13, 1, 0, ''),
(14, 3, 1, ''),
(15, 1, 0, ''),
(16, 1, 0, ''),
(17, 15, 7, ''),
(18, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE IF NOT EXISTS `user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` int(35) NOT NULL,
  `friend_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `user_friends`
--

INSERT INTO `user_friends` (`id`, `account_number`, `friend_name`) VALUES
(15, 17, 'Mitchwell'),
(16, 17, 'Ja'),
(17, 17, 'TeflonG'),
(18, 8, 'TeflonG'),
(21, 8, 'Mumkas'),
(22, 8, 'Shakespear'),
(23, 8, 'Dr.F'),
(24, 14, 'Swagnath'),
(25, 14, 'Mumkas'),
(26, 14, 'TeflonG');

-- --------------------------------------------------------

--
-- Table structure for table `user_quests`
--

CREATE TABLE IF NOT EXISTS `user_quests` (
  `account_number` int(35) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `quest_id_idx` (`quest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `user_quests`
--

INSERT INTO `user_quests` (`account_number`, `quest_id`, `completion`, `id`) VALUES
(6, 1, 1, 38),
(6, 54, 1, 39),
(6, 16, 0, 40),
(17, 1, 1, 41),
(17, 54, 1, 42),
(17, 16, 1, 43),
(17, 76, 1, 44),
(17, 62, 1, 45),
(17, 111, 1, 46),
(17, 107, 1, 47),
(14, 1, 1, 48),
(14, 54, 0, 49),
(14, 16, 0, 50);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
