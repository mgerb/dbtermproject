-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2015 at 07:15 PM
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
  `char_name` varchar(45) NOT NULL,
  `leaderflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`guild_title`,`char_name`),
  UNIQUE KEY `guild_title` (`guild_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guild`
--

INSERT INTO `guild` (`guild_title`, `char_name`, `leaderflag`) VALUES
('Subway eat Flesh', 'Jegaar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_table`
--

CREATE TABLE IF NOT EXISTS `purchase_table` (
  `account_number` int(11) NOT NULL,
  `card_number` varchar(11) NOT NULL,
  `card_type` varchar(35) NOT NULL,
  `transaction_amt` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_table`
--

INSERT INTO `purchase_table` (`account_number`, `card_number`, `card_type`, `transaction_amt`, `date`) VALUES
(121, '223-2322-23', 'Visa', 30, '2015-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `quest_title` varchar(125) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `quest_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`quest_id`),
  UNIQUE KEY `quest_id_UNIQUE` (`quest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`quest_title`, `completion`, `quest_id`) VALUES
('Lucky Hearts', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `account_number` int(35) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`account_number`, `user_name`, `first_name`, `last_name`) VALUES
(125, NULL, 'NAMESET', 'NAMELAST');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `char_name` varchar(45) NOT NULL,
  `char_level` int(11) NOT NULL,
  `location_x` int(11) NOT NULL,
  `location_y` int(11) NOT NULL,
  `account_number` int(11) NOT NULL,
  PRIMARY KEY (`account_number`,`char_name`),
  KEY `account_number_idx` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`char_name`, `char_level`, `location_x`, `location_y`, `account_number`) VALUES
('Jegaar', 1, 33, 25, 121);

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE IF NOT EXISTS `user_friends` (
  `account_number` int(11) NOT NULL,
  `friend_name` varchar(45) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_friends`
--

INSERT INTO `user_friends` (`account_number`, `friend_name`) VALUES
(121, 'Jos');

-- --------------------------------------------------------

--
-- Table structure for table `user_quests`
--

CREATE TABLE IF NOT EXISTS `user_quests` (
  `char_name` varchar(45) NOT NULL,
  `quest_id` int(11) NOT NULL,
  PRIMARY KEY (`char_name`,`quest_id`),
  KEY `quest_id_idx` (`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_quests`
--

INSERT INTO `user_quests` (`char_name`, `quest_id`) VALUES
('Jegaar', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
