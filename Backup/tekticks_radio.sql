-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2016 at 02:06 PM
-- Server version: 5.6.25-73.1-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tekticks_radio`
--

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE IF NOT EXISTS `demo` (
  `name` varbinary(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`name`) VALUES
('ÿ<‰µ\\!\nø¤');

-- --------------------------------------------------------

--
-- Table structure for table `doctormobilenumber`
--

CREATE TABLE IF NOT EXISTS `doctormobilenumber` (
  `doctorId` varchar(11) NOT NULL,
  `mobileNumber` text NOT NULL,
  `alterMobile1` varchar(10) NOT NULL,
  `alterMobile2` varchar(10) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `statusDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctormobilenumber`
--

INSERT INTO `doctormobilenumber` (`doctorId`, `mobileNumber`, `alterMobile1`, `alterMobile2`, `flag`, `statusDate`) VALUES
('71', '-', '8898223505', '', 0, NULL),
('99', '-', '8600256527', '', 0, NULL),
('1', '-', '8108756911', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loginDetails`
--

CREATE TABLE IF NOT EXISTS `loginDetails` (
  `mobileNo` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginDetails`
--

INSERT INTO `loginDetails` (`mobileNo`, `createdOn`) VALUES
('9820223174', '2016-05-04 07:57:09'),
('9820223174', '2016-05-04 07:57:54'),
('9820223174', '2016-05-04 07:59:13'),
('8108756911', '2016-05-07 03:33:00'),
('8108756911', '2016-05-09 12:25:11'),
('8108756911', '2016-05-09 12:29:00'),
('8108756911', '2016-05-09 01:35:50'),
('8108756911', '2016-05-09 01:37:33'),
('8108756911', '2016-05-09 01:39:38'),
('8108756911', '2016-05-09 01:40:23'),
('8108756911', '2016-05-09 01:41:07'),
('8108756911', '2016-05-09 01:43:53'),
('8108756911', '2016-05-09 01:44:58'),
('8149662817', '2016-05-09 01:47:34'),
('8149662817', '2016-05-09 01:51:13'),
('8149662817', '2016-05-09 01:51:42'),
('8108756911', '2016-05-09 02:02:19'),
('8108756911', '2016-05-09 02:13:41'),
('9870025736', '2016-05-09 03:18:28'),
('9870025736', '2016-05-09 03:19:21'),
('8149662817', '2016-05-09 03:20:07'),
('8149662817', '2016-05-09 03:20:54'),
('8149662817', '2016-05-09 04:43:00'),
('8108756911', '2016-05-10 02:04:18'),
('8108756911', '2016-05-10 02:11:55'),
('9987529999', '2016-05-10 03:20:34'),
('9987529999', '2016-05-10 03:23:59'),
('9987529999', '2016-05-10 03:26:18'),
('9987529999', '2016-05-10 03:27:10'),
('8108756911', '2016-05-10 03:42:42'),
('8108756911', '2016-05-10 03:43:06'),
('8108756911', '2016-05-10 06:10:47'),
('8149662817', '2016-05-10 06:11:49'),
('8149662817', '2016-05-10 06:13:15'),
('8108756911', '2016-05-11 01:00:47'),
('8149662817', '2016-05-25 06:16:20'),
('8149662817', '2016-05-25 06:18:12'),
('8149662817', '2016-05-25 06:26:51'),
('8149662817', '2016-05-25 06:30:30'),
('8149662817', '2016-05-25 06:32:53'),
('8149662817', '2016-05-25 06:34:16'),
('8149662817', '2016-05-25 06:37:09'),
('8149662817', '2016-05-25 06:38:01'),
('8149662817', '2016-05-25 06:41:41'),
('8149662817', '2016-05-25 06:43:09'),
('8149662817', '2016-05-25 06:43:24'),
('8149662817', '2016-05-25 06:43:54'),
('8108756911', '2016-05-31 03:42:02'),
('8108756911', '2016-05-31 03:42:32'),
('8108756911', '2016-05-31 03:45:24'),
('8108756911', '2016-05-31 03:46:16'),
('8108756911', '2016-05-31 03:48:29'),
('8108756911', '2016-05-31 03:49:39'),
('8108756911', '2016-05-31 03:55:50'),
('8108756911', '2016-05-31 04:03:54'),
('8108756911', '2016-05-31 04:05:30'),
('8108756911', '2016-05-31 04:09:00'),
('8149662817', '2016-05-31 04:14:28'),
('8149662817', '2016-05-31 04:16:56'),
('8149662817', '2016-05-31 04:23:29'),
('8149662817', '2016-05-31 04:25:56'),
('8108756911', '2016-06-06 11:14:08'),
('8108756911', '2016-06-06 11:20:32'),
('8108756911', '2016-06-06 12:23:42'),
('8600256227', '2016-06-06 04:50:25'),
('8600256227', '2016-06-06 04:52:49'),
('8600256227', '2016-06-06 04:53:59'),
('8600256227', '2016-06-06 05:07:17'),
('8898223505', '2016-06-06 05:11:52'),
('8898223505', '2016-06-06 05:12:42'),
('8108756911', '2016-06-06 05:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `serverlocation`
--

CREATE TABLE IF NOT EXISTS `serverlocation` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` text NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `serverlocation`
--

INSERT INTO `serverlocation` (`locationId`, `deviceId`, `latitude`, `longitude`, `createdOn`) VALUES
(1, 'e3fd26834e9ba09e', 19.082774, 72.9043598, '2016-06-07 02:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `servertransactions`
--

CREATE TABLE IF NOT EXISTS `servertransactions` (
  `pt_transaction` int(100) NOT NULL,
  `flag` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
