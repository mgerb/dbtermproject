-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2015 at 03:34 PM
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
  `guild_title` varchar(35) NOT NULL,
  `account_number` varchar(45) NOT NULL,
  `leaderflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `guild_title` (`guild_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_table`
--

CREATE TABLE IF NOT EXISTS `purchase_table` (
  `account_number` int(11) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_type` varchar(35) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Simmer Down Now', 23),
(35, 'Further Concerns', 7),
(37, 'Find the Lost Guards', 7),
(40, 'A Fishy Peril', 7),
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
(147, 'Manhunt', 7),
(171, 'A Warden of the Alliance', 10),
(172, 'Children''s Week', 10),
(176, 'Wanted:  "Hogger"', 7),
(185, 'Tiger Hunting', 24),
(186, 'Tiger Stalking', 24),
(187, 'Tiger Prowess', 24),
(188, 'Tiger Mastery', 24),
(190, 'Panther Hunting', 24),
(191, 'Panther Stalking', 24),
(192, 'Panther Prowess', 24),
(193, 'Panther Mastery', 24),
(194, 'Raptor Hunting', 24),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `account_number` int(11) NOT NULL,
  `char_level` int(11) NOT NULL,
  `quests_completed` int(10) NOT NULL DEFAULT '0',
  `image_path` varchar(30) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `account_number_idx` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE IF NOT EXISTS `user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` int(11) NOT NULL,
  `friend_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_quests`
--

CREATE TABLE IF NOT EXISTS `user_quests` (
  `account_number` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest_id`),
  KEY `quest_id_idx` (`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
