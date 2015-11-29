-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 29, 2015 at 08:53 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wom`
--

-- --------------------------------------------------------

--
-- Table structure for table `guild`
--

CREATE TABLE `guild` (
  `guild_title` varchar(35) NOT NULL,
  `char_name` varchar(45) NOT NULL,
  `leaderflag` tinyint(1) NOT NULL
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

CREATE TABLE `purchase_table` (
  `account_number` int(11) NOT NULL,
  `card_number` varchar(11) NOT NULL,
  `card_type` varchar(35) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_table`
--

INSERT INTO `purchase_table` (`account_number`, `card_number`, `card_type`, `first_name`, `last_name`, `date`) VALUES
(121, '223-2322-23', 'Visa', '', '', '2015-11-02'),
(126, '123', 'Visa', 'Mitchell', 'Gerber', '3/2/2'),
(130, '123', 'Visa', 'Mit', 'ksjd', '2/2/2');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `quest_id` int(11) NOT NULL,
  `quest_title` varchar(125) NOT NULL,
  `quest_reqlvl` int(11) NOT NULL
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
(197, 'Raptor Mastery', 24);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `account_number` int(35) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`account_number`, `user_name`, `first_name`, `last_name`, `password`) VALUES
(125, NULL, 'NAMESET', 'NAMELAST', ''),
(126, 'user', 'fname', 'lname', '12345'),
(127, 'test', 't', 'd', 'ksdkfj'),
(128, 'null', 'null', 'null', 'null'),
(129, 'user1', 'Mitch', 'll', '12345'),
(130, 'user2', 'm', 'g', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `account_number` int(11) NOT NULL,
  `char_level` int(11) NOT NULL,
  `quests_completed` int(10) NOT NULL DEFAULT '0',
  `image_path` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`account_number`, `char_level`, `quests_completed`, `image_path`) VALUES
(121, 1, 0, ''),
(130, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE `user_friends` (
  `account_number` int(11) NOT NULL,
  `friend_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_friends`
--

INSERT INTO `user_friends` (`account_number`, `friend_name`) VALUES
(0, 'Jos'),
(0, 'user2'),
(0, 'user'),
(126, 'user'),
(126, 'user2'),
(130, 'user'),
(130, 'user2');

-- --------------------------------------------------------

--
-- Table structure for table `user_quests`
--

CREATE TABLE `user_quests` (
  `account_number` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_quests`
--

INSERT INTO `user_quests` (`account_number`, `quest_id`, `completion`) VALUES
(0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`guild_title`,`char_name`),
  ADD UNIQUE KEY `guild_title` (`guild_title`);

--
-- Indexes for table `purchase_table`
--
ALTER TABLE `purchase_table`
  ADD PRIMARY KEY (`account_number`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`quest_id`),
  ADD UNIQUE KEY `quest_id_UNIQUE` (`quest_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`account_number`),
  ADD UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_name_2` (`user_name`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`account_number`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `account_number_idx` (`account_number`);

--
-- Indexes for table `user_quests`
--
ALTER TABLE `user_quests`
  ADD PRIMARY KEY (`account_number`,`quest_id`),
  ADD KEY `quest_id_idx` (`quest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `account_number` int(35) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;