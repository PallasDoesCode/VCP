-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2014 at 05:13 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vbp`
--
CREATE DATABASE IF NOT EXISTS `vbp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vbp`;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--
-- Creation: Apr 24, 2014 at 03:09 AM
--

DROP TABLE IF EXISTS `award`;
CREATE TABLE IF NOT EXISTS `award` (
  `pNo` bigint(20) NOT NULL,
  `award` varchar(50) NOT NULL,
  PRIMARY KEY (`pNo`,`award`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `award`:
--   `pNo`
--       `person` -> `pNo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cemetery`
--
-- Creation: Apr 23, 2014 at 03:28 AM
--

DROP TABLE IF EXISTS `cemetery`;
CREATE TABLE IF NOT EXISTS `cemetery` (
  `cNo` bigint(20) NOT NULL AUTO_INCREMENT,
  `cID` int(11) NOT NULL,
  `sID` int(11) NOT NULL,
  `county` varchar(50) DEFAULT NULL,
  `community` varchar(100) DEFAULT NULL,
  `driveDir` varchar(64900) DEFAULT NULL,
  `gpsCoor` varchar(50) DEFAULT NULL,
  `township` varchar(20) DEFAULT NULL,
  `cName` varchar(60) NOT NULL,
  `altName` varchar(60) DEFAULT NULL,
  `oName` varchar(50) DEFAULT NULL,
  `permission` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `cMap` varchar(80) DEFAULT NULL,
  `dMap` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`cNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `cemetery`:
--   `cID`
--       `country` -> `cID`
--   `sID`
--       `state` -> `sID`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--
-- Creation: Apr 24, 2014 at 02:27 AM
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `cID` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `period`
--
-- Creation: Apr 24, 2014 at 03:11 AM
--

DROP TABLE IF EXISTS `period`;
CREATE TABLE IF NOT EXISTS `period` (
  `pNo` bigint(20) NOT NULL,
  `period` varchar(25) NOT NULL,
  PRIMARY KEY (`pNo`,`period`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `period`:
--   `pNo`
--       `person` -> `pNo`
--

-- --------------------------------------------------------

--
-- Table structure for table `person`
--
-- Creation: Apr 24, 2014 at 03:04 AM
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `pNo` bigint(20) NOT NULL AUTO_INCREMENT,
  `cID` int(11) NOT NULL,
  `sID` int(11) NOT NULL,
  `community` varchar(100) DEFAULT NULL,
  `cNo` int(11) NOT NULL,
  `sectionNo` varchar(10) DEFAULT NULL,
  `plotNo` int(11) DEFAULT NULL,
  `lName` varchar(50) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `mName` varchar(75) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dod` date DEFAULT NULL,
  `gpsGrave` varchar(50) DEFAULT NULL,
  `notes` varchar(64900) DEFAULT NULL,
  `pPhoto` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`pNo`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `person`:
--   `cID`
--       `country` -> `cID`
--   `cNo`
--       `cemetery` -> `cNo`
--   `sID`
--       `state` -> `sID`
--

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--
-- Creation: Apr 24, 2014 at 03:11 AM
--

DROP TABLE IF EXISTS `rank`;
CREATE TABLE IF NOT EXISTS `rank` (
  `pNo` bigint(20) NOT NULL,
  `rank` varchar(50) NOT NULL,
  PRIMARY KEY (`pNo`,`rank`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `rank`:
--   `pNo`
--       `person` -> `pNo`
--

-- --------------------------------------------------------

--
-- Table structure for table `service`
--
-- Creation: Apr 24, 2014 at 03:11 AM
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `pNo` bigint(20) NOT NULL,
  `service` varchar(25) NOT NULL,
  PRIMARY KEY (`pNo`,`service`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `service`:
--   `pNo`
--       `person` -> `pNo`
--

-- --------------------------------------------------------

--
-- Table structure for table `state`
--
-- Creation: Apr 24, 2014 at 02:29 AM
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `sID` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`sID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--
-- Creation: Apr 24, 2014 at 03:10 AM
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `pNo` bigint(20) NOT NULL,
  `unit` varchar(75) NOT NULL,
  PRIMARY KEY (`unit`,`pNo`),
  KEY `pNo` (`pNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `unit`:
--   `pNo`
--       `person` -> `pNo`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Apr 24, 2014 at 02:33 AM
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uNo` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`uNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `award_pNo_FK` FOREIGN KEY (`pNo`) REFERENCES `person` (`pNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `period`
--
ALTER TABLE `period`
  ADD CONSTRAINT `period_pNo_FK` FOREIGN KEY (`pNo`) REFERENCES `person` (`pNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rank`
--
ALTER TABLE `rank`
  ADD CONSTRAINT `rank_pNo_FK` FOREIGN KEY (`pNo`) REFERENCES `person` (`pNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_pNo_FK` FOREIGN KEY (`pNo`) REFERENCES `person` (`pNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_pNo_FK` FOREIGN KEY (`pNo`) REFERENCES `person` (`pNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
