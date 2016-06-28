-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2016 at 07:57 AM
-- Server version: 5.6.25-73.1-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tekticks_exhibition`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(500) NOT NULL,
  `citytId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_fk0` (`citytId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE IF NOT EXISTS `continents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continentName` varchar(500) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(500) NOT NULL,
  `continentId` int(11) NOT NULL,
  `coutryCode` varchar(30) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_fk0` (`continentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

CREATE TABLE IF NOT EXISTS `exhibition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `tagline` text,
  `location` text,
  `logoMediaId` int(11) DEFAULT NULL,
  `shortDescription` text,
  `longDescription` text,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `address1` text,
  `address2` text,
  `pincode` varchar(10) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `maplink` text,
  `website` text,
  `mapLayoutId` int(11) DEFAULT NULL,
  `feedbackOn` varchar(200) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isCurrent` binary(1) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibition_fk0` (`logoMediaId`),
  KEY `exhibition_fk1` (`cityId`),
  KEY `exhibition_fk2` (`mapLayoutId`),
  KEY `exhibition_fk3` (`createdBy`),
  KEY `exhibition_fk4` (`modifiedByFlag`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exhibition`
--

INSERT INTO `exhibition` (`id`, `name`, `tagline`, `location`, `logoMediaId`, `shortDescription`, `longDescription`, `startDate`, `endDate`, `address1`, `address2`, `pincode`, `cityId`, `maplink`, `website`, `mapLayoutId`, `feedbackOn`, `createdOn`, `isCurrent`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 'First Exhibition', NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-25 09:42:46', NULL, '0000-00-00 00:00:00', 0, 0, NULL),
(2, 'Second Exhibition', NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-25 09:42:46', NULL, '0000-00-00 00:00:00', 0, 0, NULL),
(3, 'Third Exhibition', NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-25 09:43:08', NULL, '0000-00-00 00:00:00', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionAdmin`
--

CREATE TABLE IF NOT EXISTS `exhibitionAdmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `mobileNo` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibitionAdmin_fk0` (`exhibitionId`),
  KEY `exhibitionAdmin_fk1` (`createdBy`),
  KEY `exhibitionAdmin_fk2` (`modifiedByFlag`),
  KEY `exhibitionAdmin_fk3` (`countryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionAdminContact`
--

CREATE TABLE IF NOT EXISTS `exhibitionAdminContact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `degination` varchar(500) DEFAULT NULL,
  `phoneNo` varchar(50) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedByFlag` int(11) DEFAULT NULL,
  `photoMediaId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibitionAdminContact_fk0` (`createdBy`),
  KEY `exhibitionAdminContact_fk1` (`modifiedBy`),
  KEY `exhibitionAdminContact_fk2` (`modifiedByFlag`),
  KEY `exhibitionAdminContact_fk3` (`photoMediaId`),
  KEY `exhibitionAdminContact_fk4` (`countryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionAlbum`
--

CREATE TABLE IF NOT EXISTS `exhibitionAlbum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `albumTitle` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exhibitionAlbum`
--

INSERT INTO `exhibitionAlbum` (`id`, `exhibitionId`, `albumTitle`, `description`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 1, 'Album1', 'dsgsgsfgsgfsg', '2016-06-14 07:21:17', '0000-00-00 00:00:00', 0, 0, 0),
(2, 2, 'Album2', 'wefgwdgvsvxcvxcbvdfbgdefb', '2016-06-14 07:21:17', '0000-00-00 00:00:00', 0, 0, 0),
(3, 3, 'dssdgsgs', 'gcxvxvdsgfedgbdbdb', '2016-06-14 07:35:10', '0000-00-00 00:00:00', 0, 0, 0),
(4, 1, 'album4', 'rhjngfhnfgnfgnfgn', '2016-06-25 10:12:31', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionAlbum_media`
--

CREATE TABLE IF NOT EXISTS `exhibitionAlbum_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionAlbumId` int(11) NOT NULL,
  `mediaId` int(11) NOT NULL,
  `caption` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exhibitionAlbum_media`
--

INSERT INTO `exhibitionAlbum_media` (`id`, `exhibitionAlbumId`, `mediaId`, `caption`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 1, 10, 'sdvgfsfbgsfbfsb', '2016-06-14 10:56:32', '0000-00-00 00:00:00', 0, 0, 0),
(2, 1, 11, 'dfxcvcverfbvgeve', '2016-06-14 10:56:32', '0000-00-00 00:00:00', 0, 0, 0),
(3, 2, 1, 'sc vcxzvcvwvfdsv', '2016-06-14 10:57:00', '0000-00-00 00:00:00', 0, 0, 0),
(4, 3, 2, 'asddvfdfdvfdvs', '2016-06-14 10:57:00', '0000-00-00 00:00:00', 0, 0, 0),
(5, 4, 12, 'dcxczvvsvsvwsvsvcs', '2016-06-14 10:57:37', '0000-00-00 00:00:00', 0, 0, 0),
(6, 4, 3, 'fvvvxcvxcvxcvxc', '2016-06-14 10:58:07', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionBannerMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitionBannerMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `mediaId` int(11) NOT NULL,
  `isCover` int(11) NOT NULL,
  `linkToPage` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exhibitionBannerMedia`
--

INSERT INTO `exhibitionBannerMedia` (`id`, `exhibitionId`, `mediaId`, `isCover`, `linkToPage`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 1, 10, 0, '', '2016-06-14 07:18:09', '0000-00-00 00:00:00', 0, 0, 0),
(2, 2, 11, 0, '', '2016-06-14 07:18:09', '0000-00-00 00:00:00', 0, 0, 0),
(3, 3, 1, 0, '', '2016-06-14 07:18:32', '0000-00-00 00:00:00', 0, 0, 0),
(4, 1, 12, 0, '', '2016-06-25 10:14:16', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionBooth`
--

CREATE TABLE IF NOT EXISTS `exhibitionBooth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boothName` text NOT NULL,
  `boothMediaId` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEventPasses`
--

CREATE TABLE IF NOT EXISTS `exhibitionEventPasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventsId` int(11) NOT NULL,
  `passCategory` text NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `noOfSeats` int(11) NOT NULL,
  `noOfSeatsSold` int(11) NOT NULL,
  `seatMapId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEventPromos`
--

CREATE TABLE IF NOT EXISTS `exhibitionEventPromos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promoCode` text NOT NULL,
  `eventPassId` int(11) NOT NULL,
  `discount` float NOT NULL,
  `validityStart` datetime NOT NULL,
  `validityEnd` datetime NOT NULL,
  `limit` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEvents`
--

CREATE TABLE IF NOT EXISTS `exhibitionEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `eventTitle` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibitionEvents`
--

INSERT INTO `exhibitionEvents` (`id`, `exhibitionId`, `eventTitle`, `description`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 1, 'Make in India Week', 'Showcasing the potential of design, innovation and sustainability across India''s manufacturing sectors in the coming decade. A week that will spark a renewed sense of pride and prejudice with all the right ingredients at right places. Everything is all sorted out but it seems so distorted at the same time.', '2016-05-02 07:01:26', '0000-00-00 00:00:00', 0, 0, 0),
(2, 2, 'Times Furniture Expo', 'Times Furniture Expo is a 4 day event being held from 29th April to the 2nd May 2016 at the Bandra Kurla Complex in Mumbai, India. This event showcases products like furnishing, kitchen, and home decor, furniture based products and services associated with this field etc. in the Furniture industry.', '2016-05-02 09:55:54', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEventsDetail`
--

CREATE TABLE IF NOT EXISTS `exhibitionEventsDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionEventsId` int(11) NOT NULL,
  `date` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `exhibitionEventVenueId` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibitionEventsDetail`
--

INSERT INTO `exhibitionEventsDetail` (`id`, `exhibitionEventsId`, `date`, `starttime`, `endtime`, `exhibitionEventVenueId`) VALUES
(1, 1, '2016-02-13', '09:00:00', '17:00:00', '00:00:00'),
(2, 2, '2016-04-29', '09:00:00', '22:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEvents_media`
--

CREATE TABLE IF NOT EXISTS `exhibitionEvents_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionEventsId` int(11) NOT NULL,
  `imageLink` varchar(200) CHARACTER SET utf8 NOT NULL,
  `mediaId` int(11) NOT NULL,
  `thumbnail` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibitionEvents_media`
--

INSERT INTO `exhibitionEvents_media` (`id`, `exhibitionEventsId`, `imageLink`, `mediaId`, `thumbnail`) VALUES
(1, 1, 'http://radio.tekticks.com/uploads/makeinindia.jpg', 0, 0),
(2, 2, 'http://radio.tekticks.com/uploads/times.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionEventVenue`
--

CREATE TABLE IF NOT EXISTS `exhibitionEventVenue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `venueName` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibitionEventVenue`
--

INSERT INTO `exhibitionEventVenue` (`id`, `exhibitionId`, `venueName`, `description`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `modifiedByFlag`) VALUES
(1, 1, 'Bandra Kurla Complex, Mumbai', '', '2016-05-02 06:57:12', '0000-00-00 00:00:00', 0, 0, 0),
(2, 2, 'Kala Nagar, Mumbai', '', '2016-05-02 09:58:07', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionFacilities`
--

CREATE TABLE IF NOT EXISTS `exhibitionFacilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionFAQ`
--

CREATE TABLE IF NOT EXISTS `exhibitionFAQ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionOfficeAddress`
--

CREATE TABLE IF NOT EXISTS `exhibitionOfficeAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `landmark` text NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `cityId` int(11) NOT NULL,
  `mapLink` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  `photoMediaId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibitionOfficeAddress_fk0` (`cityId`),
  KEY `exhibitionOfficeAddress_fk1` (`createdBy`),
  KEY `exhibitionOfficeAddress_fk2` (`modifiedBy`),
  KEY `exhibitionOfficeAddress_fk3` (`modifiedByFlag`),
  KEY `exhibitionOfficeAddress_fk4` (`photoMediaId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionOpportunity`
--

CREATE TABLE IF NOT EXISTS `exhibitionOpportunity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `opportunityTitle` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `contactNo` varchar(200) NOT NULL,
  `mediaId` int(11) NOT NULL,
  `message` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  `mobileCountryId` int(11) NOT NULL,
  `contactCountryId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionOpportunityResponses`
--

CREATE TABLE IF NOT EXISTS `exhibitionOpportunityResponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `opportunityId` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contactNo` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contactCountryId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionPartners`
--

CREATE TABLE IF NOT EXISTS `exhibitionPartners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `partnerLogoId` int(11) NOT NULL,
  `partnerWebsiteLink` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionSector`
--

CREATE TABLE IF NOT EXISTS `exhibitionSector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectorName` text NOT NULL,
  `sectorMediaId` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exhibitionSector`
--

INSERT INTO `exhibitionSector` (`id`, `sectorName`, `sectorMediaId`, `description`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(1, 'Sector 1', '', 'subsidiaries, and by other bodies or their subsidiaries for the fulfilment of a public service broadcasting remit; (e) documents held by educational and research establishments, such as schools, universities, archives, libraries and research facilities including,', '2016-05-12 06:48:17', '0000-00-00 00:00:00', 0, 0),
(2, 'Sector 2', '', 'afsff fdbffsgdfksdgfnasdfcvh, wfesgvisvgsavdvfs. dfadsygfuydcdgvcsyvjhsbvcjv, sfvsvgsyvgsvsvsv!!fsvbcsvucsvgsc', '2016-05-12 06:49:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionSocialMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitionSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionSpeakers`
--

CREATE TABLE IF NOT EXISTS `exhibitionSpeakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `designation` text NOT NULL,
  `qualification` text NOT NULL,
  `profileMediaId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionSpeakersSocialMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitionSpeakersSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionSpeakersId` int(11) NOT NULL,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionSpeakers_exhibitionEvents`
--

CREATE TABLE IF NOT EXISTS `exhibitionSpeakers_exhibitionEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionEventsId` int(11) NOT NULL,
  `exhibitionSpeakerId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionStats`
--

CREATE TABLE IF NOT EXISTS `exhibitionStats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `statsMediaId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionTeam`
--

CREATE TABLE IF NOT EXISTS `exhibitionTeam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagline` text NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `gender` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `degination` varchar(500) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `mobileNo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  `phoneCountryId` int(11) NOT NULL,
  `mobileCountryId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitionTeamMemberSocialMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitionTeamMemberSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibition_posts`
--

CREATE TABLE IF NOT EXISTS `exhibition_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` int(11) NOT NULL,
  `exhibitionAdminId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitor`
--

CREATE TABLE IF NOT EXISTS `exhibitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstLetter` varchar(1) NOT NULL,
  `isMainExhibitor` int(11) NOT NULL,
  `companyName` text NOT NULL,
  `mobileNo` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `primCountryCodeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exhibitor`
--

INSERT INTO `exhibitor` (`id`, `firstLetter`, `isMainExhibitor`, `companyName`, `mobileNo`, `username`, `email`, `password`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `primCountryCodeId`) VALUES
(1, '', 0, 'Infosys', '8149662817', 'chandanvdy@gmail.com', 'chandanvdy@gmail.com', 'chandan', '2016-05-18 11:09:49', '0000-00-00 00:00:00', 1, 0, 0),
(2, '', 0, 'Accenture', '8108756911', 'aditya', 'ak@gmail.com', 'abcdef', '2016-05-19 08:05:17', '0000-00-00 00:00:00', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorAddress`
--

CREATE TABLE IF NOT EXISTS `exhibitorAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `primary1` int(11) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `landmark` text NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `cityId` int(11) DEFAULT NULL,
  `maplink` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exhibitorAddress`
--

INSERT INTO `exhibitorAddress` (`id`, `title`, `primary1`, `address1`, `address2`, `landmark`, `pincode`, `cityId`, `maplink`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(1, 'home', 1, 'mansi apartment', 'Karjat', 'near raju hotel', '410201', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3770.953811602961!2d72.87702344090133!3d19.065768277960245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c8944b000767%3A0x02a39647e99d46af!2sKurla+Junction!5e0!3m2!1sen!2sin!4v1463570410659', '2016-05-19 08:20:27', '0000-00-00 00:00:00', 1, 1),
(2, 'home', 1, 'kesar bhuvan', 'Dadar', 'near Axis bank ATM', '333333', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3770.953811602961!2d72.87702344090133!3d19.065768277960245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c8944b000767%3A0x02a39647e99d46af!2sKurla+Junction!5e0!3m2!1sen!2sin!4v1463570410659', '2016-05-19 10:14:06', '0000-00-00 00:00:00', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorBrochures`
--

CREATE TABLE IF NOT EXISTS `exhibitorBrochures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brochureMediaId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorContactInfo`
--

CREATE TABLE IF NOT EXISTS `exhibitorContactInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorContactInfo_exhibitorAddress`
--

CREATE TABLE IF NOT EXISTS `exhibitorContactInfo_exhibitorAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorContactInfoId` int(11) NOT NULL,
  `exhibitorAddressId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorProductCategory`
--

CREATE TABLE IF NOT EXISTS `exhibitorProductCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorProducts`
--

CREATE TABLE IF NOT EXISTS `exhibitorProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` text NOT NULL,
  `description` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorProductsMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitorProductsMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) NOT NULL,
  `exhibitorProductId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorProduct_exhibitorProductCategory`
--

CREATE TABLE IF NOT EXISTS `exhibitorProduct_exhibitorProductCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorRepresentativeId` int(11) NOT NULL,
  `exhibitorProductCategoryId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorProfile`
--

CREATE TABLE IF NOT EXISTS `exhibitorProfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logoMediaId` int(11) DEFAULT NULL,
  `about` text NOT NULL,
  `primEmail` varchar(200) NOT NULL,
  `secEmail` varchar(200) NOT NULL,
  `primContact` varchar(100) NOT NULL,
  `secContact` varchar(100) NOT NULL,
  `website` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `primCountryCodeId` int(11) NOT NULL,
  `secCountryCodeId` int(11) DEFAULT NULL,
  `sectorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exhibitorProfile`
--

INSERT INTO `exhibitorProfile` (`id`, `logoMediaId`, `about`, `primEmail`, `secEmail`, `primContact`, `secContact`, `website`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`, `primCountryCodeId`, `secCountryCodeId`, `sectorId`) VALUES
(1, 1, 'dvfsdsvxcxcv', 'chandan@gmail.com', 'ccc@gmail.com', '8149662817', '8788784444', 'www.jetking.com', '2016-05-18 11:08:36', '0000-00-00 00:00:00', 1, 1, 0, NULL, 1),
(2, 2, 'dvxcvxcvxcvbxcvbxcvbsvgbvcvhbyvjkhsvkghfgjhfgjfjfhjfhjhfjfhjfhjfhjfhjfhjhfjhfjhfjfhjfhj', 'acc@gmail.com', 'acc@hotmail.com', '8108756911', '8976534231', 'www.accenture.com', '2016-05-23 10:05:36', '0000-00-00 00:00:00', 2, 0, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorRepresentative`
--

CREATE TABLE IF NOT EXISTS `exhibitorRepresentative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorAddressId` int(11) NOT NULL,
  `primary2` int(11) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `degination` varchar(500) NOT NULL,
  `emailId` varchar(200) NOT NULL,
  `contactNo` varchar(50) NOT NULL,
  `mobileNo` varchar(50) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `primCountryCodeId` int(11) NOT NULL,
  `secCountryCodeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorRepresentativeSocialMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitorRepresentativeSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorRepresentativeId` int(11) NOT NULL,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitorSocialMedia`
--

CREATE TABLE IF NOT EXISTS `exhibitorSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exhibitorSocialMedia`
--

INSERT INTO `exhibitorSocialMedia` (`id`, `socialMediaId`, `link`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(1, 1, 'http://www.google.com', '2016-05-31 00:00:00', '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitor_exhibitionBooth`
--

CREATE TABLE IF NOT EXISTS `exhibitor_exhibitionBooth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionBoothId` int(11) NOT NULL,
  `boothMapId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exhibitor_exhibitionSector`
--

CREATE TABLE IF NOT EXISTS `exhibitor_exhibitionSector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionSectorId` int(11) NOT NULL,
  `exhibitorId` int(10) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exhibitor_exhibitionSector`
--

INSERT INTO `exhibitor_exhibitionSector` (`id`, `exhibitionSectorId`, `exhibitorId`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(1, 2, 1, '2016-05-12 06:49:52', '0000-00-00 00:00:00', 0, 0),
(2, 1, 2, '2016-05-12 06:49:52', '0000-00-00 00:00:00', 0, 0),
(3, 1, 3, '2016-05-12 06:50:25', '0000-00-00 00:00:00', 0, 0),
(4, 1, 4, '2016-05-12 06:50:25', '0000-00-00 00:00:00', 0, 0),
(5, 2, 5, '2016-05-12 06:51:45', '0000-00-00 00:00:00', 0, 0),
(6, 2, 6, '2016-05-12 06:51:45', '0000-00-00 00:00:00', 0, 0),
(7, 1, 7, '2016-05-12 06:52:02', '0000-00-00 00:00:00', 0, 0),
(8, 1, 8, '2016-05-12 06:52:02', '0000-00-00 00:00:00', 0, 0),
(9, 2, 9, '2016-05-12 06:52:18', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exhibitor_posts`
--

CREATE TABLE IF NOT EXISTS `exhibitor_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` int(11) NOT NULL,
  `exhibitorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `exhibitionId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `subject`, `message`, `email`, `exhibitionId`, `createdOn`) VALUES
(44, 'sbsjxjs', 'Znzjsnx', 'ajH@gmail.com', 0, '2016-06-01 04:11:38'),
(45, '', '', '', 0, '2016-06-01 04:12:11'),
(46, 'bvxbxb', 'hrykjtghvm', 'qe3423@gmail.com', 0, '2016-06-01 04:12:11'),
(47, 'shzhxbsb', 'Ahqiekxncndkw', 'avzvz@gmail.com', 0, '2016-06-01 04:13:29'),
(48, 'zjsjxhdhs', '0sjxjxjsjsn', 'zbzbzbzb@gmail.com', 0, '2016-06-01 06:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formFieldOptions`
--

CREATE TABLE IF NOT EXISTS `formFieldOptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `optionName` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formFields`
--

CREATE TABLE IF NOT EXISTS `formFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `fieldType` varchar(200) NOT NULL,
  `title` text NOT NULL,
  `hint` text,
  `isRequired` int(11) NOT NULL,
  `placeholder` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

CREATE TABLE IF NOT EXISTS `industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industryName` varchar(500) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` text NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `link`, `type`) VALUES
(1, 'http://radio.tekticks.com/uploads/makeinindia.jpg', ''),
(2, 'http://radio.tekticks.com/uploads/makeinindia.jpg', ''),
(3, 'http://radio.tekticks.com/uploads/makeinindia.jpg', ''),
(10, 'http://radio.tekticks.com/uploads/fde.jpg', ''),
(11, 'http://radio.tekticks.com/uploads/times.jpg', ''),
(12, 'http://radio.tekticks.com/uploads/fast.gif', ''),
(13, 'http://radio.tekticks.com/uploads/fast.gif', ''),
(14, 'http://radio.tekticks.com/uploads/fde.jpg', ''),
(15, 'http://radio.tekticks.com/uploads/times.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE IF NOT EXISTS `moderator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `phoneNo` int(11) NOT NULL,
  `mobileNo` int(11) NOT NULL,
  `phoneCountryId` int(11) NOT NULL,
  `mobileCountryId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `imageLink` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `author` text,
  `source` varchar(200) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `notificationImageId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `createdByFlag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ownerAddress`
--

CREATE TABLE IF NOT EXISTS `ownerAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `landmark` text NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `cityId` int(11) NOT NULL,
  `mapLink` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerAddress_fk0` (`cityId`),
  KEY `ownerAddress_fk1` (`createdBy`),
  KEY `ownerAddress_fk2` (`modifiedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ownerContactPerson`
--

CREATE TABLE IF NOT EXISTS `ownerContactPerson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `photoMediaId` int(11) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `degination` varchar(500) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `MobileNo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `primCountryCodeId` int(11) NOT NULL,
  `secCountryCodeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerContactPerson_fk0` (`photoMediaId`),
  KEY `ownerContactPerson_fk1` (`createdBy`),
  KEY `ownerContactPerson_fk2` (`modifiedBy`),
  KEY `ownerContactPerson_fk3` (`primCountryCodeId`),
  KEY `ownerContactPerson_fk4` (`secCountryCodeId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ownerIndustry`
--

CREATE TABLE IF NOT EXISTS `ownerIndustry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industryId` int(11) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerIndustry_fk0` (`industryId`),
  KEY `ownerIndustry_fk1` (`createdBy`),
  KEY `ownerIndustry_fk2` (`modifiedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ownerProfile`
--

CREATE TABLE IF NOT EXISTS `ownerProfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `logoMediaId` int(11) DEFAULT NULL,
  `about` text NOT NULL,
  `primEmail` varchar(200) NOT NULL,
  `secEmail` varchar(200) NOT NULL,
  `primContact` varchar(100) NOT NULL,
  `secContact` varchar(100) NOT NULL,
  `website` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `primCountryCodeId` int(11) NOT NULL,
  `secCountryCodeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerProfile_fk0` (`logoMediaId`),
  KEY `ownerProfile_fk1` (`createdBy`),
  KEY `ownerProfile_fk2` (`primCountryCodeId`),
  KEY `ownerProfile_fk3` (`secCountryCodeId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ownerSocialMedia`
--

CREATE TABLE IF NOT EXISTS `ownerSocialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialMediaId` int(11) NOT NULL,
  `link` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `iconMediaId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerSocialMedia_fk0` (`socialMediaId`),
  KEY `ownerSocialMedia_fk1` (`createdBy`),
  KEY `ownerSocialMedia_fk2` (`modifiedBy`),
  KEY `ownerSocialMedia_fk3` (`iconMediaId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postTypeId` int(11) NOT NULL,
  `postTitle` text NOT NULL,
  `author` text NOT NULL,
  `source` text NOT NULL,
  `postDescription` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts_media`
--

CREATE TABLE IF NOT EXISTS `posts_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postsId` int(11) NOT NULL,
  `mediaId` int(11) NOT NULL,
  `thumbnail` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PostType`
--

CREATE TABLE IF NOT EXISTS `PostType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postType` varchar(50) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialMedia`
--

CREATE TABLE IF NOT EXISTS `socialMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialMedia` varchar(500) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(500) NOT NULL,
  `countrytId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_fk0` (`countrytId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE IF NOT EXISTS `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `emailId` varchar(200) NOT NULL,
  `mobileNo` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `otpVerified` tinyint(1) NOT NULL,
  `gcmId` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `name`, `emailId`, `mobileNo`, `password`, `otpVerified`, `gcmId`, `createdOn`, `modifiedOn`) VALUES
(4, 'aditya khadilkar', 'ak@gmail.com', '9999999999', '123456', 0, '', '2016-05-06 06:24:58', '2016-05-06 06:24:58'),
(5, 'reshma', 'chandanvidyarthi@hotmail.com', '8149662817', '123456', 0, '', '2016-05-26 11:19:24', '2016-05-26 11:19:24'),
(6, 'robert', 'robert@gmail.com', '9373728727', 'robert', 0, '', '2016-06-01 10:49:21', '2016-06-01 10:49:21'),
(7, 'sandeep', 'sandy161192@gmail.com', '9022216857', '123456', 0, '', '2016-06-02 06:06:31', '2016-06-02 06:06:31'),
(8, 'Ranjeet Bhardwaj', 'ranjeet@gmail.com', '9876567432', 'ranjeet', 0, '', '2016-06-07 05:50:03', '2016-06-07 05:50:03'),
(9, 'Rahul Dravid', 'rahul@gmail.com', '1111111111', 'abcdefgh', 0, '', '2016-06-22 13:06:56', '2016-06-22 06:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `visitorActionLog`
--

CREATE TABLE IF NOT EXISTS `visitorActionLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorAttendance`
--

CREATE TABLE IF NOT EXISTS `visitorAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitionId` int(11) NOT NULL,
  `badgeId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorBadges`
--

CREATE TABLE IF NOT EXISTS `visitorBadges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorId` int(11) NOT NULL,
  `exhibitionId` int(11) NOT NULL,
  `badge` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorBrochureDownload`
--

CREATE TABLE IF NOT EXISTS `visitorBrochureDownload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brochureId` int(11) NOT NULL,
  `optionChoosen` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorEventBooking`
--

CREATE TABLE IF NOT EXISTS `visitorEventBooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventPassId` int(11) NOT NULL,
  `modeOfPayment` varchar(200) NOT NULL,
  `amountPaid` float NOT NULL,
  `paymentGatewayResponse` text NOT NULL,
  `transactionNo` text NOT NULL,
  `receiptNo` text NOT NULL,
  `pass` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorEventCancellation`
--

CREATE TABLE IF NOT EXISTS `visitorEventCancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorEventBookedId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transactionNo` text NOT NULL,
  `reason` text,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorLikedExhibitor`
--

CREATE TABLE IF NOT EXISTS `visitorLikedExhibitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorId` int(11) NOT NULL,
  `flag` binary(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorMedia`
--

CREATE TABLE IF NOT EXISTS `visitorMedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` time NOT NULL,
  `exhibitorId` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorNotes`
--

CREATE TABLE IF NOT EXISTS `visitorNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorId` int(11) NOT NULL,
  `notesTitle` text NOT NULL,
  `notes` text NOT NULL,
  `flag` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `visitorNotes`
--

INSERT INTO `visitorNotes` (`id`, `exhibitorId`, `notesTitle`, `notes`, `flag`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(46, 0, 'à¤¹à¤¾ à¤¡à¥‡à¤®à¥‹ à¤†à¤¹à¥‡', '%E0%A4%AF%E0%A4%BE%E0%A4%A4%20%E0%A4%AE%E0%A4%BE%E0%A4%B9%E0%A4%BF%E0%A4%A4%E0%A5%80%20%E0%A4%AD%E0%A4%B0%E0%A4%BE%0Abcdbvcvbcvcv', 0, '2016-06-07 06:05:20', '2016-06-04 09:18:31', 46, 46),
(49, 0, 'note 2', 'this%0A%20%20%20%20%20%20%20%20%20%20%20%20is%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20note%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%202', 0, '2016-06-07 12:17:09', '2016-06-07 12:17:09', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visitorNotifications`
--

CREATE TABLE IF NOT EXISTS `visitorNotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorId` int(11) NOT NULL,
  `notificationId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorProfile`
--

CREATE TABLE IF NOT EXISTS `visitorProfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `profilePic` blob,
  `gender` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `profession` text NOT NULL,
  `education` text NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `visitorProfile`
--

INSERT INTO `visitorProfile` (`id`, `name`, `profilePic`, `gender`, `dateOfBirth`, `profession`, `education`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(4, 'aditya khadilkar', NULL, 0, '0000-00-00', '', '', '2016-05-06 06:24:58', '2016-05-06 06:24:58', 4, 4),
(5, 'reshma', NULL, 0, '0000-00-00', '', '', '2016-05-26 11:19:24', '2016-05-26 11:19:24', 5, 5),
(6, 'robert', NULL, 0, '0000-00-00', '', '', '2016-06-01 10:49:21', '2016-06-01 10:49:21', 6, 6),
(7, 'sandeep', NULL, 0, '0000-00-00', '', '', '2016-06-02 06:06:31', '2016-06-02 06:06:31', 7, 7),
(8, 'Ranjeet Bhardwaj', NULL, 0, '0000-00-00', '', '', '2016-06-07 05:50:03', '2016-06-07 05:50:03', 8, 8);
INSERT INTO `visitorProfile` (`id`, `name`, `profilePic`, `gender`, `dateOfBirth`, `profession`, `education`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(9, 'Rahul Dravid', 0x6956424f5277304b47676f414141414e5355684555674141414d6741414144494341594141414374574b36654141416741456c4551565234587479393261396b3258586565654a4f636563783538796169364e455571496f5731444c5267755144454e416f787677583965502f64427644614f376a595a746543426f3262524579695a46536d4b5272474b78574b7a4b6f584b34387a7a303931747266784837526b58455364566c4d6d6d64516c546b6a5469787a783757742b6139646d647963764b6975634a31646e5932397464712f777174742f2b3037666b7a4d7a4e6a47326e376658735078742f523176355635326468756a75324136656e70324f2f33322b7574507a4e38765235792f5048303864563533662f5976704b5462544e662b63664f6b436d7071624754754446785867434f5438665477415445784e58416d436e30376e53416c385649496458424d68694b3043754273433279546e7358413067626650664551466461515274484c4b4e674e6f6d6f4f33374e674a752b3331622f3972473138614232767258427443322f73394f6a4763415a2b666a4f66684a3530724c3338794f3577394e69344c524e727a5737382b6d72716168744b31505a3370362b6b6f7a31455a41625168746e59475747396f49724730433267693862587874763739712f39726d5a36595a5436486e5459734b64445542316f7858594a766d2f45725531545a3674583956674c5167754e50746471383068445964743332494c2f614f71784c3456582f664e7271323974742b66325741744432673566755a466f4339614942635446344e3457646e34386d2f4d7a733765795741744331774777652f34766f30625370534734446266762b692b3366562b5a6d2b47453867625372572b6455306c47613678595a35305372572b52554263743643344d3763334e774c42556762674b354b674730715468734274716c4162555a2b477744622b6e64564662514e494733396d326778737476575a364946494b656e56794b76747365334b4a437450322f616643542f344148534e6b5674414a594b4f72614a6f364f6a73642b334161514e674733396e787076596a5274414a6d6375526f4264793565727076337447583862664d3332534b426b4d385871426b7931714d744577782f38794b4f774765386d47787a584467664c7a693031525466527a7373504c2f6e2f6e47764e674b314244436e39584d39634a37747a346139513643303452652f347a642b74524734564e4378633978476747304c78506a722f6e422f3356394a2b4e376639647a374e334f543037337650662f2b506665334158783561544c573965546b704c652b744d323847647930513575447a32652b495643767a6542614d4a626a342b4f59676e70746646394e6232337a4e4f723738394e73663954462b6f366a44394f6637366e484550306d446749685139424d4142504675774579507a2f6641776666305344666531494d455036754a3544326d4743334e776f6b62514370322f516b3147704a47304434766959594c35594a7a417334616f4c4e4f45597555457563704733683652766a635839716744423241446f4f34456951656d34483536684e6773314c7732594e616f44514833356e6f41793258784f63324f4f6e4146422f543773315141594a734530466270752f356e7838494851516f4950505a2b7a6a414e525a58467938674a683563544d4e3873344551527972713675397a2f6b4f626d4f5130486b544d4139324f353563487279337433636c43644b6d6f37634278464a754741666b7431374155517652397679323739735775413067534942784141636767324d7a3932643862545a57642f4967666d2f7055362b6e6765497844474e5735354f70676f376977473045654657417a48544778336d673253744a6b49324e6a5a4167544362456a306a693351522f376471312b4a7348385a3042354555786432465234486138554d73736c726532747134456b467048483552434c417a50485463424e55663259745171545a754b31436268726d7044744b6c594e554347395839785a72596e3463323476486138742f562f6276716f743159313047705131504e727074686269366e5a73664e66713869444947706a48732f7a665865697a515936765270416274793445524945516873476b4c573174566141574d31615746686f6c7061574169414731666232397055414175427159417879307a6141654e4748325343574c754d576f673141763071415742715a7564426e6d4e633446657675395a764274413450442b4e6c69576770336761516c626c55675772437a2b6568485452714435734e527054767958437756637637314b645672474532786b67647638324e31494b532b636e784571524e6767336149465a3365314a524571494845435a6d554d5743514b313644564f782b49306c6a745331554d6b4143497546656f5855755971524475687167716d4a6863386830445952796e3231576d6a566f6261625271314447344839716c517341393245367637792b626a2b762f3371367a48487a4c586e6d7a5a735037514248494455617171665259346a5141416767414d666a764e4f41516566383334734e34397048414478623638482f54672b546736666e2b647259694a6a4e7a5578506f2b30474862506247653844654a55752f377a30376e6b563675527672793866414642447872702f4d336e316b2f743652686d704a7472495432514f4843393364336442756c6849767973526a707447694138322f32785a476744694431766f774453746a42744f76785664576a62494b4d41596a746956503842694a6e522f76352b5342446d33493458766874334c55306646776d52524d4e346956304145414141595a48764f614f517561566c616764357a31353473515a6666514c63502b687a65474452423148327173334e3272592b4d79325263502f2b4d6b447a557a357a49444f4265336b6363592b38564147513273334c4a506b7a4a726a4e7a5774584b6353387672346545776b344e6a6333652f62495a7757494148774a494c557238336b6b43497335546b567057344132436448476f64766162374e4232674479327532374955454178384642477479734a62594c6137697a737a4f3243334f646779434d71616e4c414546434141433833414345396b776a674442743161625a4b5177384365797979353048372b37315654674155684d6933303856466131746e6b5a3950316b6b314c6a666678724166534455414f6c4c75443641496c414939334c636f755a6b3350626b795a4f786655667459764c77312f4d4f51566b6e746f764e596f786e634138547958662b72596d2b566d6373416c6b556539547373725262636c432f724931762f78354a647057727a553361706f4a6435646e50383975624e394d474152786d5a7256487353334f6f30684772426e784d74376c79307a56527848792b4679415731366562395a57307259385074674c3572652f697852706d7133752b47544a51525572755853436b5775593235633552597168346e5662326d2b626f394d535366527a54534d396d306a66577873784476674f78736372414d4b504c4a49485266327a5a382f473967467577735142454e344841634c6676793641574b65746a5551343631577533335341584c392b2f524a444d744f77343655747a744d476b496d7a637a6c655a707631316557676b5a50442f5643664479515a6b444a50577954415a775549535951415a47616d4a5a2b2b5a584542534638797049537236594e414b347a6c364f67734a435532727a32486f61365372476a6b44455a506554626359747a46676c696b31794c5948705861316667694a416a746377307a31506d385451647641342f624833586656573251747565336657387649354c4367567762364862646a32336a496d325755524b6b49774a6257757147424746395434384f517030374f694265316a51504c36346d5151616c694a30455a77496d414a6d657668704168726d5a61776d32504473664e483534704b7744356534543173445a4246307a7a6b68334e7a4473477154544e6f77523357315872514b6c6b5a64784578614d3731366b424b6b42346e3757646b4e62494c427462473032534a73523339622b56622f33596c6f6c47417738747658762f4378544d6359425a484678706c6c64586779416e423066427547634870384541583938656a5741304c3942726d35484442366f79636d724163547444364d4e506b4f43374f3866786c685756786562573764754e575350494358526e6a705369304c464d6b6a7379624265316b5a6731756d736d746e746132376d43443264655245537847355154384167515679567737635257427541726771417474385042684a4e454c574f503159444f44306343784246596152327a44564c656b577354424945706e6c325173725231514743704541464773616342346d376253364766542b345076563638752b4a6b6d30384f3974745546655249507a6d386550483851714142416370755463385a4e44724d36356a56717471594a6d62326376304969574962595268586a4b725870396c597632624e6f4331715742586566627a2f486259383273696141746b6e7034636a415849596e6379374d763532647737694a4765414d6c41346c5656724a4d546b6c315455706a4a65693362357635353571654e50696243557a6654724b797352417750686f5032672f516743795332334e61577654766e6d454f626b5571443959414750564976576f4934666d4f5673483433514a396e496b6664302b616c61707566717a7a376558356271315131742f5361744656314f546d576e6a314778647151423473316e70334a584c3344765230464a49393641486e536f674b3147656c386e7743357a4b522f56534178672f6730665354416c2b5848786a42485651554832484c424149722f4e7742533634434451626d3262465a6e6d2f614e7130794e4e2f702f335143705531486f5531762f32346a774e783067345971734e49424246626b7458662f3461473873514736754c346433736a75646d646e374f31734369464c6a35654b4677445a627645787441446b36536f415168786c557330794c6257765570754855594f756e48755776626d3973684d3342474145476b675048446c4b547546367637452f504c317746653269676a5544614f6a39735030447463654c336f344b496646633745415a46734858557765683650525948476d764a5a67412f7a774b3862416c684e644771564d3249474864622f35674c78376867467678744f3546356d4653795838796a4e6a3646784655634a4c7961536766682f666131315652394c733653752b35756830735530356e556b3732466a56344f583659705a576f4a3653514f637262527946572b7477307a7a49764a5a326267395a7258417548613875725951504b764853434467534650546f31792f2f7435414e4c6e43426e7771574d6850417675554e7455673548344e6a32336a51437673726a502b3175507963796b486b4e622f7744486f424f47646a7876784548435a696e6c67577141384c74624779733967455241636741674f334e72765677394f32595349426c7a754b71546f2b33336251415a3563537757624536762f687941644b325961594e4950586944704d673959597345354c6a4f703645516275715673502b6f514d455661466d4f4c5536466a45716562484741655461796b4a4b63645850516f4a676734546455435449566e656c6c3237767442354c646b7572635979674465427436394d47454f63546573304e587450532f46546d4777352b3337504c64574e73536e35524b705a3135474569734a36345557715746335451446533373631514b332b76646b507a474b6c34746165706e74616d516251763476464c674b76646452594934546d4b70347a51554a3668696734785373626833646145624b686f4169525369414d68467845324950442b652b48533264633331322b61337a555a732b333062514f69373139374172514f706b78477866346b414752624a48417a7565554c726766677a336d733778474c625247344a556e4f474f6d32476f4662645673314e2b5531627375452f6449446735673356744e67673035323061374242574b634647654547534351703775394769676b5a4a74676744383476463755595a48516e6970654d753343786a7276613171634e494c614454414e6d6f6c59397a772b50782b3759664f4532534e3278326a676146734378305677547351335255524b6b587042684b685a374a41596c5666313332774c386a7736514e6857727a515a687831357370525967414d6a7867614c6f696833774e784c6b77365063752b36583752736278635135786c304c432b4f4c5972546c6b725542784861622b324136366d30536a436a36533551673774676f4661374e42676c5053366d774d63774763527a456778773030676554465165422b51386449473147656c63535970774e4d7156634c514d6b39675164486c7743794d2b56433271627a387a45586b58577a6d37655553425a57706f6243364332624f51326741797a76324938336b58376d77435155533434452b736f2b34505032774469514b56313745463779674278482f793933397453616635486c7942746274373575537a4e4e4d724e32354552487971724a4559436850314266516e797667513055584372745a59674c75377873674653472f6d316a546f4d494c573263386c494879596961374654632f38363673376e62646d7962515232544848796b6f4963646f534d4a6f6a39346a513350564e3876447654566170444667646f496764492f76714a724c7079504e3150582b5a7a37367433646d74624a506b717876507a2f6e596367326a6a6b48576d776a4247306d62454f675a43504d4237635a4b7a5a345761553231715578715349736e7a34524a6e765668377a353974766c6954736e2f56684d62374d325831316b62356f49313363704b463665724e534a655956546e665a4a7954614251447064337556473649387835357575684e575151677530725270652b6e6f6963666c594a714f4b57693177354d5a736b6a36704e31496d446f4c4f684964396345396e4b78616f377543584673595841414e72546246766858435a44777255642b767759796c5958747a6d62545338474c41595765584a556e616e762b38784c35566537375451434964786779687734554170444a2f57656178367849777a334d6c79563345746234485a6d6268376c6a734362695775392f486f434d6d782b72774858376c6770384e6a7674626467773176347165667373546741447843584d4d6e4c2f6e414278716f6e31657739754543444233516569374179737a5968714939446e6b53417a307a4d68515549737975626a66565a534a626a722f457941676a5342324b63675833334e37577275646855697638707658795a4162422f5541444541494c536c4a704d5661793269586d66537673635a735476464344634244336f697a625648535a417072654e56414e4a563664532b7a5a4f464a767773337276647569704d536a4e482b653375485374426e4f377553544641366d436169634d53706a5a307232726b506739417069557444424256384170674c4d7a4e5237344d414145636248714a6a532f536b566b7344373674663163682f4f663937637345694f66424e515947485230335a4350586b666c61542b64656370504741655367624a697137366c42306761516d646b303075733571734d415a6e616a314b793532583771444c73484c53554d6b686b6c57645953726e34572f34625a6a67554947366247325341314564547842482f6546756e385655695171636d705a7136492f36354f564549645746356343703335564f6e595341344b524a4365624944596147777a77702b58794b3979333873454350323246426e63566b322f6269396d45714c56557461592b333076414c4845475761446e45316e33624c6163395850653770634e635332515732446b455a76686c744c4c6e395761775044346d52644d556972312b6b597943544b737556647a445142556a2b7a74704e6141634b653946724530746967394b694234636b774b747349353163466b4a6e696c6b4f4349446c576c70596a52586c5075555357494654777345316b56313662456476572f312f4639793854494c55304e6448376e5837646e4d384342643442796e795a59624a32784a4836307548544b6b706e72702f4c5a4a764645676c43486177614d6c6930595748753736646931534268626559572b35556c55784b51644e6b4879637a4d3844694e78785437374d635a365a5439716230534a767842505836556a6c6d7257384f49365663426b456b38567156716d5147797572775365667a50744a2b684c6e746a6d38697178612b43774b2f6178737345694a30737452537031613231715378497a73764a6872565759476d51424a557a415a456252464f4c4b7a304165614f6358627a6350366a7944414a6b6153346c794b6a584b4350645448742b4a666550472b42346f3177566b7235327057453476636130574473666e677367343151734f6c36446f355975356b376a434f6971414a6e5143556f524b437a396b4d38745643774167675235744c635643777449584663342f50706c3074756566315869663537662f795941704c5a46624c417a4e786a70586c4d5454702f414d2b334557734d67514d4b62754c78576973316c6d52792f456c6a7441466d656279392b5063722b34504f463161564c41446b3577657557456f534c71696857475775416d426e414c466f6c534b326a576432795a4741797a56324d556f733566746557624e5a47514d654431626d646d5641474f464863756c4e6c332f796373692f70553165654c64536f7877633776663756432b7378656350514d416c6f6464494558444d4b66395a6d777a687559434a4c4476767031497452337a4f333477434546386d78444e363574396233323577515a685a574f65736f4d763163764e692f314e366757393930554450472f48654a62387774524f7941647145502b6e743854416d64546d2f3761674b73487739785a6754503335685041504c76574e6479594a4672713947652b34444c474b4d662b324a754c6c5874766241337373615767647776594d47477566476e414474587136627047674e524632765541686b41645979685672314d4447306747506439473044497475517951475a56685749595147724f565275546e764252414b6d6c54543078397153304561416c72436659625467494e656a64475152514730437741617765475343316d37594e7743592b71786d44414a6b3733626b6b51627857505257716e4450666c794b3573617233367334486b2b522b71376f47694c6e7a3877434565544e41614d756e4365435a644c704d4d756f4d64754364696872515572384e4473394c375a587a6c7474524e476941314962374a54785146327363514278597376697469632f63374e63424546517343415741354262516d666a3771644b316139576731703944426443393951514f476e6d574e436263327476427639754d2f4e714234545a4d3046376f635737534e6f44676f6174313646726c35646c7467647042674a683732393362506437366c464f6d6c6f4234437576357138484235366454615753374c7a684d4d4a545a59783531744d71705a4b4d6b79485535435379315743736b506e317a304266504a4a2f3753493155682f4a34447534374b6c36306d6d6e553071374e526a596a39426872656f682f342b623168385063625035683333575834744363736f32447459476e54594c3442435541456d4a59627436594d4d5647776b38764935304a716457724776446d494b4d6b534431426e7378365567324163654e773235345463326e6178753138465944776537646272342f5870533356703137625772567857314d48754848374f6a7661437656794c51485a6c31316667777a685a44496a31656234414259773146747578306d51477774354c6b314b68515149774c4c57416b423837677a3375475174337a4f4730396d4654376d59367a5772476561774e617a56363046564c62514c416f5765784647537045616e4f644b76457944426d55457a596c67416751414e6b4d32796e3645476344316f4132415551476f52504c6a346739786b32415462694b306c61793142726771514f6c4e686344455a323241362f796769714b56434462544a2f58376c544d43525278333073313178684e545849456447676a424746382b32436c347a6d334541755457662b584d514d734277415157655356756f57464656705a77566157654d7063375a5970356645346d556b693447684f6671655268347a546834626d336a39584b78526f48446148355a4b6862484841636f7979724e644571686251555047646957736b31486365686158526f464549747563325472327636377a51745748374a70396333457950506263706e61564b792b69754a7a4e6f7058723951786179764f585250716f49624164394f4875562f475154784b6656716c7366646e47473259655a7a507a4956684471644876624a4e6c34524730444854365565705741416b50556f415a436f41416868734778446273684f4175616f50435970376c6a6436675536595365335774675166786a54717a385a3575574c4431436877384c6d4c486c676e2f48556236515a49703768756959504567417041746c55367339593551396f552f64535450456a38745545326d43316232796a633132626b5558444d4b70375650452b2b69664d714b705a2f61776e70736347346d49653232736d444e7458673339316a6372487163304453533269694e4565753165704c394b4a41496542342b765370414949366d505050334647684863434e413869646564517a414a4962734968747758513837335a5330495939577853325267304d4732667057674145344752566c517830656e37614a4b7a58324c45683171374f4c476a6455556a5a6e4a66703571304251756472674441524f2b655a626a334d6932546a6352784136695065616b4932694e72633244726a7354632f4e6942727662664e4464776d5164776e53784c47564c74394963357831794167427458472b616a4e6d38452f694d353267416d6d746f474732554945436b6c486f557a6e2f763552615366724d574e6145496434486f44454c73554179487941784142786257684c6a344d44546d484f41333069424c486372323776524e58613639636d59656b62617a774d494a487572717558693156374f47714f5565746b466d4765724a726a6668594338774c6171324a697471537133617a6d6e755a75544f4c326b306339466348354e2f33332f6a6b556f346a6f744a4f42716c45715743304e504f5a4c52486471446a773847747a6d7857464d745766474c6c4d7a70546231344749717978725a74576c62794f766e6562547159342b594e777831542f466935564f594e3435616d3155436f49316c75504b6745364c5732666537473346497a3962545a774b4971736d70725142627a4b6e2b58594a326c41626838326e74755169434c424a77637270664e4d4867642b6f39393945326657614d4e7443357a3462372f4d526847757436446d446130513742634158724d38613470776f7341476d366d317437442b50304c4a553636755433477a71437a677a57633268706a56725955654f39584b783634435a594f6a4e7541515a566b722b76696d4b5679486f37663964417139327377774379382f52524c7a484e693177545665326c476b5a73767936414a4a4831553633743232642b58795a415a73395566375a496b4a5169755666432f664e3657764c51583375346d4673445a50765a7067685565304e4571426a36414d494169545575774a6b707577384e6b4f356350314a76454e65537974347171316941704162496d7335354479596a745374793876594f355071574c644b6b704433745a4e774d674e4447766f4b5959665045576b7730312b617a4c746967454f68704a477959716f6e55677a65584e48704863616836416d7375624b37635a7554614b7a594b494c57364d6777672b317566584b4a376331422f2b4c4942556e50776571776d515072354d674779304777567a31566d38466f74395870627852786d374e50332f653561474f6d375732773136466463424342497069777156514d6b6e324f417a4331495a4a5772747558736b634947746b316a4f39674177566135765a596e6c686b676d7a7437345645376b334f482b37714c575a41616744436d76614e4d626a324a71764b6453784b6b5a73773967486a44564b302b57447a54622b765134305334422f685a334b546d454b4d41556850384d4941633754344e446d4241316761346754394d6376697a4679314242706d474f62415a45642b2f5449417364676a455466544f743264656f6b42636e4c70304953644e707265594a6777676a3274765a6a5549636e2b6e58773449535451494550354755733349755649445a454b424c7138727a335a6d4d63386e344d685759444f356570344142327257717a635767306174596a3362466c684a64796c487236316375355871596748497475776b445064444f515959772f7073583455304b43354a54514b464e5863594e4f7034654b326231574b51653273567147356e4544536a694e5247366a4341444a4d47394b653251553450306b6764484a78566d72594457463430514161424f7767512b7631534153494a777235746e7a464a66337871377547686b6745582b71564c7a636e4e36586e666e566c4d443149356355713764384f314f79483948572b5453675a55456b524f67414741374239753935494a445154484e4b414e3232544d6d2b4d6430414439355858765775366a7635443750347050437944594c59664871547074334c7158344e66474c506f4c5150682b54783433326c2b6479564f41527a485a794d55614a4634542b69674a596843353037362f356a4c386468424177304143635267636e714261314e5571306a414a636e4738327a4d692b385a564a744d68574e704f5558335241426e6b754236723754305467394d6e667431472b7677354569514a7a6a456848774741424f6c32302b617755572b4a6c3644574b62597a73356c4672587535324d41584f574e53595a41414d2b564d394c5242506732517a65334850516c53712f6557554c7a62486a616a356d39554c2f7138726b795955413256676b512f746e62334177414852786b30584c312b4f324d7238316b42456f4467476763677a506e53354f5736615a2f4341767442366739727273322f476579676b54344d494c584e4d766a394f4255486f32736351476f625a6868414a7337363664715844613366444943593633724250566262494e617258785a415a75584663756174375132724f6137305962657978354a704a586d493536374152584b69796d664a343650394678495a665943634353415a346830466b4a3239334c466f7568756d677459415959317048364c6e4e5832326b38556d56423246666d4f6b7879476a4253447a4b7876684e703758446c54613370476b41304137657854414f3230574f76316a736d7642304e4f47394f4d41794b43494d5645504134696c517868483565443632764e5153354b32554c2b3945715063764730416d547a505065693147706953354463444943482b6935664538315a374331383251476155724a6a704a5a63395637584e615944594873324148616b644f6964644e7659706855336b575155677332582f5255715173365a62787139776441627753726b6d472b6c484a356c736d6849702f63314f644b7a6e715859574f53556c73686a324878636a6643376132543034756753516d595863574c656f2f554f30736173714c41426b64312b4775703435333951413661664f39774469584b7852584c36324d5962645578765a772b496f5670644747666e6d536f506657776f4e2b76475a4850764177302f2b394d476c6246426e3736495848367275616830624754513247632f5a524c722f5272314d314c565572502f6461494554414d50334f786a3439754e44574b474b464d4f5952527232624d3831524f69674749544b76597a74344542636d33617134783238567655346e65303771762f4c486336357a2b6935565762613856725754675a4c614b38704b75797a6b674d3055665151367067466b5a6633365a4c704b30736d316d315278545a5974347469652b337562775977554e654970674e57314471496e2f757359644133657a54704b77487349507770704a6d6343724935776b5952454a6e5458635644497367347265335a484b2b327668466a784974466348567a4f37646e7a327654397269726c367a34575146696f3933716a2f58496d6a4147566251517556564773446d737765432b3249627849764833494542326e7a3373545a776a6f76772b505448487759324732556a2b544b6538763143413147354b5a3777796e6b6a5a31344b526f6c45374e77626e372b6d7a584543464a694a747737614135323958756e2f4e684f72316f4e336e41636a4d544d594b754449764b744d314c503171415066426b516834616950384d774c6b3443673376464742455942454d46465369663477567068423766464c356a495475306d5a32357372756164385435496a456959466c4b416a4765324d6755416839793674724762675541414a7437516b43494361506e6c324e594455635968784c645847353643782f6a774147635646327954496759773833384e45576f2b326e737a476d70486358774d36504573563645564a454469686d59567a664a67504a77512b6566496b70745663507a4b565251444f4a514a414a736f416972373378694c75656279564e706a7a774b77716577336141534957555a374862313364784c5a41766561317265446e504655312b4742346e78456770314b5245794255656e51774e56552b786b4477635670325452326a7359706c4e792f50782b6167736731654c4e71625831794f49395365624f2f3376466a3047594245776d4f4a67317a73336238615147716a6656524c6777613646386553596878412f4675335053684e37422b642f446f414143414153555242564c34315a787955494363533054585843774e526e444f3342352b472b6a414b4948792b46326674765469413841787a66524f4344553049733837323958775a4a41437233764a6370335362635a31507075374e793231354c6a305042754377655669385342584c5764733562327744546e647462626a57612b522f587855674f6f66355569346272754873623735517653693834493155724a56642f637a4e74635863656f7358432b2f55773864504177414168464e724e335867614e6978736e32594877444365306675356f6930622f2f796167415a4e6b47444c645971516b3377356b4c6a41474b697341547976545648484b646934655a316a6f34357248587033775341304365494c2f54754568526b6a4861646f6b665832616978654156557a416e6e6474647a773168524a5168324952336d6c713964326c465a71366e504135434673394e4c4f2f5973516178693263302b364d5470535a414a635a6772534241436851613334787832734352744e4b464b4d552f31316f5365362f6c6b4b344377734c5153382f486f79624d41436f41424f4d63584f6c2b5247497073524c344849505364696f36527958315643564c4849595a426252694136732f4d6d55595a36625470776470543058637a706b453744694234736449677a333068316c647a30676b3076567756793761476a57436e554a67415551506f652b6a46657555342b715631484d447a75346b65417a54325078514a556d3948714e5669657846485364465a7454466f704e6341727231776e7a62534c35706e6b316d6239374f7157456951576d766f65794f7a766855714d6a5945687262744a44736a6d4d506a3751647073417367584b5361414a436a6b4949793743654c38324549514349703875794b4e6b6a745a6e3065674e51714766396d554f4d6b534b425a6f73343674376d73713475334155522b6a74364f4e6e74666d4c6963614e49595871365262705551417164666c6f79577267436b4c70324b7a6d32416f426d67596d43304f72556966503736776b786f5739347375306b646b6138396a3230416d5246415a71753934475a4758704f61776455756161747a5739504a78443472514d34756a6e706b4e51675571364941594731744c656141793079476633654f6e695654564c556272694e357847717631744635567067686554474b5369686d457778414e513167586d76642f764f48306e65626d37634e494b4e4573422f3276414368732b5a5739765a346363644a6b4b343445415347796f4845694453486b68377449346c6a496b4f6e765a7854784f63763273304c73546f746776465a6e54424157486855706e35745958464f7047724a724b3172327a71675a37424176414445746f6e566f373850514b59456b446d31593764717a6c556178583542554159485246592f5a33736d71347838566f41636e2b3566736846726a35776c49644a6a6658303956433044784e73496c71617a4a706f4467364c38754964634c5071384c5959544e436f624a4e525441535343737556306746764c773244522f79794b4e6e69787a4a556779454876305367526658533830794f2b596666552b7a6d476465556f55324643696e676641424d4430664f7158587a3069653841485a775876585476326557365744626962426933566632596c423939334f5544594777304d7465446a6f57556b435739753970344647354641626632384130477630494e4b46346f457946474d7530525770483933484e354d70654868306568657379705a436445766278784f78652b736b744d5046375863654f44775a687841416a762f376162395a4e504d6c7436554c327938325476504d7675654576305942794561767a4273635842576438565262526a5336332b35764f484a2f643738315054582b314f7069396d436f344657524c506e365a6b7145764f576f4e7764674c3979376c44466365467a66786c2f746d556b6a583773624b2b7474477a7131383251493650307046756a34323377443476514136326b42793559642b457751543975674469364849796c4e7a765561754d414d53414d6c4438376e476249566d367048726f544941735857547059304b4179434a2f6169474c467068497a4e314e774730617745776e64733331374543376b413051334e42576659625a49507358575a6a7465514779764c4234435344336a7a36364a45466f712f59714d6c65314856666271637a546a41672b505738356a6e717549705645544e5141535a704b6c59707a517a4a7765626d6d675a6d4647664e4c6c79416e78376b6c6b3446374c7a5144634d71314f32776947705167527a4c4b44424248705730414d3869364b736777546a70526a4d7852584c5a4e67686a514a6b67546d79665965364a727838576745364d6d694e717462646532327a4b426d684234397646467168516d346e6f75494344414f7534434945486768616e55573237357261753744366f2b377565424e6b47504177696c59734d326c4d5349434c6741776a7353684d386648583063767839303974695770513831772b452b3231793854306946536e736f553151676571644838546c6551414d6b30764c5a4b774b77537132746d3966792b414f446a48736461347151776375574947656e6d5178707664656543727475445a355241446c56536f4739586f4e52594976617352545347572b6b7451476b4c717a6d35395371707339494e41687144736d2f486467634a4249546a5056772f713442772b3959774d32396b313561694e57316573486241494b54777742786f4e574d6974396947343254494965644e493548535a4242674a427145683439535673496461744a4365566e75432b31476c76626a74786e64334255516c4833555564526b3772646a496e5973634138334c68784932694c5a316b4e35584f50396256376937324b6b4f7845744f664d326330764853415835316c347a4e347369386a6162516d686a774c4942616e57526356775651747a6359766a635142523748677366746f41347270527466354d67795a734633596242524372514b4e7350484e753373336c3766486a62794c707456316a41724b7131615a6954536c516d4f447375397672736a3949515066644e6d44665070436b6e78675045497073384c754f444b704945536b417763434b3975594f656f464f7a316d744162686f67786c4c326d76394d776d3166623441484c74694e6a4e38533056486141676e694f6e417a68776e794d4941336e78744c654d6a624b497168792f5a3830682f587a70414a425237726b2f62496257336830474f413868454b52726d73693932437452362f6a67456e466475786d4833745148457556596d384e716573504539536a703430657676427830416a4d4f536b586b785a2f4f695039764e5064712b61706536515456752f4a4f71436d4f41304d7867716f754a7067617137533234376245714b34365449494d4157644447705a4361425342544b35655058714174633366654c6346537776444b726277386d32744252624b353644647a34344e4972594834622b62497a6779723362542f3674326c58714332726f706943663353415449354d64397a47396f4f715430567a7559634a55465547656e5341413251576979504935437a7339544252313174414847524d38636d616f2b553361336a6a5054616c65302b57502f6d627859716a3358496f4364477036734d306a36704d6a6275362b7744747a576f32772b4f4534435932474b7262436d7177484d4e7a6c72465367443244366b354b66474855536f57686634694f304445545a734779495861434674674a6432786c6e676d647565486b586d627a2b38446f3837516e7355665875624a376e5447374f41783670776c726a315a6e6e5057374f6247664d2b6d716566764e38614c4e54573530444f51374c4677576759544348474d6b79417a4f6a374271527031634e4541635a786d4641424f54362b6d596c6b6c7241485344366a6c30634c6a334c7857495579457463484f76316e30724359495148536568397a626463414d493730656678316c626874376350367a2f7668547a62727368624e6e384c4b526e67514c734534566342736e5157714177506871674e44323146497975445353557979516e476941354347696c36564739724d5575797646475378427a447a73426133744b635a5130776872747236634b554331354530765971723955546a4f4f7177587556346b5035434f6d3476584564735a31623532445355476e4e57393054637a776177577a62574f61614c5a32793252324372396e652f4d64534f646f73514a616d5065496e427453516c6e785161784b6c4c62494f5a49396d7959654733776e757155316e72386668613735446971585a6e67592b4d384e6f494875617a48476834626a61665771337375524b3230542b6131324c6437327632776b344c66324a766a6532675443654c4674664871643974313479546b4d494234626d7376594e2f75634870397474716d596e477550526465724a67447651667a306a7658776e4c61496b6c546453777058632f372b7a7171576d43416e74797647766971577855704f6b664b73534b3234596737514f427a676f793062792b566f2f43573068764c755666647277423757612b67777a61414f49656f426b6a666979414f4f556d6b4f49734c387844585472556561632f4b714134416b466f464756534e504b4230356657395863384c454837447658416b6537554d3843417367646d7552506f38794154676b6f3743447a4f6b61794e34454354383754527467364932714b304b3143354771774e576d327141314c70357a34316341474a41315776445a323165724672467169574951556a66616f5a4a6d2f6c33456e4d6251446a58506f6775356c48414b4f384f4b4535315959447069617054624a4169395a78356a61784e6d4a354f6933634b36544d334e393044694f304e6e4367473447434d694834747a2b556d4e492f4c394e646a596d30414355752b4d674974667179766e562b41334e534e6152546973374644422f6a394f4951653750654c4d673853494c38334d4559444a4b746457485461355965716b446f3050752f63773279774d3147395771366e7554484971704a64676834666b657478414b6e4262535a696a6d346a7562374845323875654d6d6e722f3561392f666e6c6e543259466d53574d72756e3252457570596974597251706d625641456e75325338635a776c69626c75444938666144684169365148794146515749526538516e37774870586d7973566e324e776336594b3978664e524b543132357045322b69727371564a48694b4b6e394b46454552494446645471656231646f41346d6531355677625448414c784f5a673668556255424a49496c366c6a74786a523359384a4f704d50507a6b3445514277304d7746435a494e71317141494f7a7a49387752376b3154396d3839366e474b6b42476b48434c6f372f58504b4e424d5670562f6b326a735242376271596d357662737734585a42356c427657484a3432617149664e50694753556e475a30436132317653315737756d71734e536944765a366c3136466f64366b337369483859494a634e395834466561742b7465504139394a6b6d3575584f45694d4d326f45614b32525067474d6642664a782f634168354a42624339324468686a52514959494e786e5139734d626a3832576956596f554d53473131766d587470772f527146647a67694f63713364385330764e63617853744144476e386e74743043524144734f6f63746c364771636a3243494d6f673067546a58782b6c3165694a793873546149644e692b424d6b634a687478474d676d59507068413566373859357361312f7969564a6450434657527a79682b5a3662683059424a417a4e736776517a495450616d3556673739756838395a77467031724e50694c596c7274644e326f74656a33764256532b6f2b74792f2b304245414951344363646e6f5a717a707a556f4a6a433257514d3447427668584b30427738775968576f4b344f3255502f38776b56573279504a4f4259513575786d6b47526e39733539703232797537454f74416f62556541364657502f6c336a71505555706147595944343839724761775649444b34795774795972667a7a43346f33583934727a6a315a574f4367462f59665a594f636e6c772b59363757643933687177434579614b76454a616c434f327850584e4c655678616c6c3465307164464f44625065427345446e7370734b5166314a48396d69357253656e5062666677376b5242376e4e7556626849765a6a6c33654367445144435665765239527a61717a55434830304e6b45493742534135626732766d6f502b76773257746b6736414b482f4e73366e56506f6b41462b4d39586e5a49465962725837537467454f44546e397864354e4637594c5131784f466f4d616b46306962703562474a4456546a4d6a7a326c58627568424538414d36626d4d64484e676734516631794a38636971334d484b78774567534f756d55395547754e676734556b304746376a6d666837675342746b4f644f583077624249314a4c6b45593636584c78724c4839746873696d7a4567516261326a70735662625478324f694832387259417a6c693477464359596a61786a47587135305648702b4a744a6153426b323962345437374d63335143357876634c472b57304e6b4a6f542b686e322b593843434b6b6d4e704c4438496137426c504d6c3359747838566e4a6b532f527a3962556b304d454d7239684b31587a6e575a30742f3066336b327a787330364d304d6e5257424768784a68566f3337366d704133365034777a486a4e39346e6d7343723764623149613437316e5349615331684b6b5a536f436f7a5161786f646d7a366f756835496668356b3169797132624449524f3159627a49454a726958522b6c6e376f3267506b667a506771774c6b3272574e724a4f6b4c4535734565753055624a2f363753356666506d70635678544d4778687a594a637142435a4e3375355a4f5272436654567530473967494f717045734248506e514a63426b69377a7046414461664464414b6c4236505a743049344342352f5841436c615439784f51555149443165334c332f32397745494e676a724454435969396c796644634849504835556a657a63506d3343545872417350774f426848746174306c72724c2f4e4347353564375074356b773151744b5842596c41727a4a665041396c6b4e454e506778744c71703778636c3153752b6555562f5933786c4c705963353776452f4a4f3858353962546b364f79572f484174346f636a7a6a6a4a6f64587434446336667955756b5155385862316478657a63544f70714c52582b795759345a31746d4334614652354a56323930577768374a666c74637a6b376332634331396f413032374b6374494665674268366544676b64694233773342534257365678656f476c446339787270534a78754c636f74675437742f616b4c4f755768507a4d454b62553155507042592b654137546f54316e6a4e70704152693374386b35596a77596f706b4247385176355279767a614465374142586e7478454868627a6e63786b5a79657a567a6d3272364d3952474b79757166733339616d4f324947654f39455a316e557258442f4544776c734d5a4d51706a48463436426a3462524b50754c7a37764b78574b38787a6f72557176594c4d346d345a2b717443647850354c4e7953785a3072674a42797a496b47617355365567784d2b65615039344151692f737850437a3051565a737a4d613554764b5634744a78357537535764446d4d2b664962307358706c36574362787661633763554163676b48324937737441466b66546b6a3353724a464f6f54414e6e64525864766f764c322b644e53594c6a4545414249364a775358537a79396c356d3278357066304e4d52414849735734384f6a6c714674647a372f4367327a4e464c4d5354484b4d474349456a31346743494c5766753435784d484532656a3335667663436349392f5077694f6d6975504970385a4d52534964574642465461555773336b52335678395a2f4a357170544b5179384a4671707179704a61494234446c67344638646a77314963544b4d4c502f3867514359574b4a5347367a4e37694b614263794c564a70325a73582f5a734562374c35444a76736b36614c764741515155784671566e433756664e4d634b4b6770446b6f663372697a466e3265564d512b62465674304971345648486a2f767a5a626b383657733379382b69586d51336651582b41684e38376e50446f61535a54447136563237426b717156484858414e5231505a532f535a414c496b7a686a75576e48734f4b3951626c30363364554171535a78726748534d436632424364585949692f702b667972446d6349486e79543670686a555272454959345762533733492b615737564b514751354743596a43626a7332744e4d5545534e3761635130703037647937706b42347376772f4a7147665a792b515941354e4a6d30784f48616d333438484579322f624a4d6945437056784c53334e526d6f3166534c427a72736861534f7169777346534f4c384c6f387134374e6a7a5363416f5843433156672b39316c39392b2f66443363306958717a737a70795450323242496b74326e726c37354b5248422b6c4a772b5138506d75704531395857695039713853494f645276564c53534979437672483747776d35746a415439504c57362f66536f376e394e4f6a6d2f41537670334b794a453059357939567432705141677a61556c354c37683838355050442b336e38785444314354706b7a74322b616147574948564d35544d425a4b3463776a6858676d316e34766f4d6548462b72726c2b2f586f41684164547a6967384c365761784d78384d6170303044737178744d74374143646769726a4c4e7968577444674c484e394a626532517a7867466a6e465861705a33712b4e464d457741794263316a4d4e4c6b66676562642b3737515041344e375939464b6f4d30545755755a4e6f413030704735566c5a7950756776616f45506e2b51374a41764d424e3061676e2b6d4f61502f4377747a7a66346858707173336d46336332796c4c615531502f37343435672f2b756f3062674f454c647248616f64416262633746357877643464747061354f4f4e3373613739494d7467452b345732794f6159306d39375a516b69426848755751457943466d5367763766766234612b3869767253304655396a363548374d79316c555556464162796b5a3645633765544a7562536559656645353933684e513655726a7144594c6973362b75436a7835664341497970396f72686a4c474734766d7455315a73362f434d7a775351575846714872425174696765482b374876756a563563586b336971374567415268777676516d77366b6337597a54704758514746425834735734533847754a47555457504b4357535a4b4a76704e65637731795065394c4779477269586c7273454c6a7772567533656d35517130744f3362436a6f416149413065574e4b68442b64774d4e71476e417a787a387a61415445537557456f516242416d6d555542654c5442646676323751414a444f4b58762f796c4472796b6f6a712f30647a733759614f627057525255523641436a3062565173326e50535a6759356b59366f7645306a52357a55446b435357616d374f355263645931625358564632704f424646667757653674796645716874515a762b4f776c716244564b337a585935707a684f6a776f57714d752f302f2b374e367a45667975584a4d7778316c6d536b726f755459712b74614f7a6339326976324b676c33363466684d3645794e5856705636674c795355356864776f476f686d52382b3262336b4541716d572f4c576d4d746e4f68714f39617a4255647335567762497641792b694345494943447651414f694e4d32313961586d6c566465616336323768654a6b476b6d65774a50365049367870464f7a616e43585569516254616b79474f68746b4c564b63527a49694f78356834737943557656356d344a506f735a424263496c78376a525a682f5a4a68787954326a667745466a717873304d64647a4358717663374743433176574b766b5145372b44357a446e4256786277374855544e2f597a586b6f757849566e6770697a47677763505974486f45347538745a4e67595377383177446866674143674f47387a76716c767a73374b5855585a48383856535943686a39523544434f5a524d513349533477675058717a3263752b724f425a43556d4f6b3550424f446172764732534448484c4b704268534353432b56696e497a726d75725766707a2b396e5433443639757858727a37327a4d755452514a41476d394a4961676e536a31636b5144593256714e3774684e686570346a314b326a73366d73616c4b4b664667534742444d6e77486a50446662657258392b5a6b6c43445a49644567416f6547647257666856626c78626246352f6658586d354f746e2b5265636f6c344a6e3558746b595545533775724e6d4635537872492b6b5254707677514f6c2f437444517763506a314b744e73494d69736a62416a34383161515567646a6d7572437865536a6173415a4a53496a3141426c33747267374a5632795257733379766546734b4541655255514c496d77576839383478734a344752734c5350756f5333784866396a6a6a666f567a454f636348503757532f6d6b474f5874425a6e425344386a6e62775a4b55646b745665616f42734378414141536b304f77736e7a397052354364463457645672382b7846545655565542797a4c386167457a764977455349446752694473426a466c564c6d524f66766e524c7849414156714365736e6870384e75306d374469515437594c7a4d556d35396661336e4b6a6351754e64464b785a5862385934343069443468774a4455627a79334f593833686532614963396e4a523662492f6c7739522f5874377356595855396344494678627a35356f735336616d39666e6d7a666666444d414569565a5a4a527a415a446f724977334144477263362b6a6375426862724b5a4c4f64516b4c5957433336556b5736375a6d6d6a4e71494d45435a6e47454157532f2f4d485778664f46426e31616b7648624a395432436f6565714851566f62644a596b347a6a73716f6a5361707233616267694f59524f7536364b794267686443516369785963564d5a726348713949445441764c417732774d4943775a416d46506171674779714c7130653948332f4e3369346b797a764c515762652f7049426c2b59776d43527976472b4373477950575a564b32524441436175424d41495675587a332f386b782b6c5a437942515a4954773734736a476d36754b3674587466767a44767036313562563643453642315976585876725a695454423369494e45384c385a716c426d75327a4254724a3141593731596330764c5552634c44684471524c67743852486d506f786c42576b4367666f2b4f492b384c75475a4b53587a37367a745251626c676c51704f6e722f34524f70424565794c65416f38756a737052747a656937646336666e75647472543855576a6f37514135626a637759466f65316f43796e71302f5872613647612f4f786e50394e45793067767a68684c6a754349576f53313154794b792f74577a475563515861676252535268384f4163657361356d5a307374366f33364e693251697356554f724a5477666f4e696a777566684c7464344179796e454836436732345139334574577066656f51326e376a676f617966476f58374437376c517465626e6c6b714a7a74774c2f75777047343579487a65716c30794363715674655655625a456f67764c343633617a4c786b4c71666555725832732b39376e504e622f343559664e6e2f2f356e7a632f2b6647374f612b6c6f42394b582f536e4f455a57745746706c4170485278382f3368487770774e304d417348637531393745796e4d34693534727334587131342f57784c3876326f62504f323965334d4c69373141424b3657514649527776505150426968624574424b576f54434e38756d7a4e665050325751414543594a713865445255364835734e48783146706f65576b6b366b4e4e6d53726e543267785937456c59636a7a4f546c4e46796a507a6754486f33423545743841494f2b2b2b3236706e43687654466e616b6c5551676350317466534765472b344e2b62584b66666a4a49416a33614d57715730436279684f35477559516339593754327a4e4548646f6c306b77386b5a716c4d6649427973342b50464844793872475a6d44616955754f7a6f53344167495746454143546a4c776d51545a30763869494273693641457743384a6866336c3737307065623366752f336778362b39396666623737317257383148332b555470774a32567a4a6945724b75767247664d6d5231324d775a6a543165724765724b384c42554a4c72473263517769396e47624d6944466251747465693342447152704a473754764844666d68697545775a6972303131594449424d6c344e6d42495055465174414a76516543437732434143684935324c6a4864383965326c304b2b78515544756730386553784c7343772b5a50334d696955463742416f6a445634486d6b54554f716f48536d72735a356f4668477037414c51545538447a383474662f43496d41304e5644724b34414568682b684c724f6d56497a33454b69637434526971375969643468385a64746a4647416151746c2b6c754d534a48715169314e3473784d69594943453648432f66304844646e4879426b5274636e61446b325937335a51556371313066656d54785a34663557472f7832626a596c6453674278457932737a4461693549676e35744c572b6556313135742f746b2f2b32664e31333733472b46352b7a662f2f70764e582f7a46582b68416d3553774b716565586b733562384a375667417972304d3072636f36736d334335543676433077474a776a727a4f6659637444456a7578685a77487a6562326c316834765a795877765931354136544e7875784d7a383166424e4a4b656a4d416959344a474445516366543565656d32676a6f4c4445424376436d486763352f2f5974724764335561616347794c354f37356d656e55386a553134533773636d34667439485545575a56734b634c6430524a797a4d486b656659474434694b456b50674e452f483438574f705a575637627268694579534c69776d514f6757422b394e67532b2f4f5741366852735a35616470554e4777514c6e4f2f77625a7358454f6b6a4f7675336273784e7154482b2b2b2f722f67524f6e4f2f536b656d30575264584f6162756173354b2b316b634373424d7256456744614e634f61784f35504a6f767a4e665165617378634a6b4c64317a6a68452b5a577666625835462f2f69587a523337723357665076623332372b76332f3737324e384864584162514f496a576737554771764a764d416b384654534f5947444159477772786964774351326c613036756c31434f5974426d79446e6438424567446965386253783252334e6741796f386d4e446e6f4453386e464f747739694a79725159426346475832743139506479544837444b51527a72414a4c7730416b6a6b51616b7354496a45636f4437515552364f534972492b68374b683170473841417166647551465147794935382f4b685a32434547434c57513471793673724747506942786549657a6f7249387a2b584a717532513578484255324959524b314e314379474a534a743464623167694f4a3739323746366f6a592f72676777385557435656496e746f593931374d66673952463644722b61753461315a5372306361527a724b433957426c634c6b4d71573342636d51575a3249734c2f42332f34523832662f646d6668636277722f37567632722b30312f3856616f38596f6a68725a705550563639553655334142745355386330542b38456f463139704461692b54314d6c764b6e6d3575346437464e6c344a78576c313674704f327371574e51655931687a5a745a304b484267692f4362633452444a4f7865704d7a30545242674e6b7170787272525442644d4d71377772333354415669392f645558587343477270444469344851445a32646b564f35734f6a6e6d714f41634c754b394e39526c7074352b32484c474636375959624b452b465a65634a777a444433556b33614d792f6f756e783134666f73673230706b3070346c624e544c34527331423762577151574b704d4d7975714e7561314a5a45434e703746747758633632662f76536e636276393934434446335078384f464442516f336538315a62617a62723731776649365a434b4777364f4555574567704177446f2f35544f773068675a534745637830783979496c79473874486f5a782f6e752f2f342b62332f6d643335474b2f625435642f2f75337a552f65752b4457502b486a7a6648416d526c4b674f4e7469504363524342346253316b4c5a78364f596d52383052584d31747463367865794a37312f65477156416b4c334d4649375a6d77643847434f38356c306d6259774569517534424a4e79663554774e412b546b594865736b54366a683131545447546a2b6f31594341437975626d74616c564a4e427971434a4764794b305651436a4a63527942465151745663323252334441776f455a4b4e387a635a594b2b505a3968656448574b5036656132444a6a664e6943766a615a734147326d316168544f6975446f2f6133416f795952674842374f444b6b4a2f746c74794a7168753272576b3149562b7865382f6a706f35343978654e736a30414d615665674b75574c7a3543633547435248426e6243715a6456796f33566b3257536f63384b39517a425170664a45432b736e515972746a583333677a67502f676b36336d687a2f385966507834326378376d645338574a6355375052767a4e35623949475356562b3457497676473945313033303974706851354b576b6d47412f766d465473734a53646c3073654c596c6741414941424a5245465551325643726565716a354f6a485474762b41376d7958334d70526d4e5059436a316c637a4f715830714a51676762344b4949484349786e634145654f3758547a3568625557555859476444684a2f76794f4530314e3237646a676e345245646750586d7949384a505469634e4c53656f524c346232535242654d5576626f413475474d4f624f2b53335871704d75577a4952796e6e5468784d635233474b4d5a4f434f795466396347336655424641454c565762543973697a774f53633258616572494a674e623241333343316741387a4e332b507635376f734d62765344696730645a764c6c6773756652737575586c485a734b5757504a326a31516e4d6c3979736979524e5a557770584f42634143595a5541444c5279514f4d5870534b39615735336651793652787978726b704e526a4a2b47684c4949694235646a4f6457354871466f43534b69634a58445a315a59486d4279675231566a48584c4e416269496d6d4f777852516974562b4452794d79303666646c5932305533645648516536344437574954312f4a48696d704530445875314b6547442b4d6f2f73676264364f7849677377706f35774c3344354b764f65666548745777382b643453534136477a774d4a4249576977474b716756716d53446e385250726d4e56443747624c784d4f55424c537a4b56766e58412b594b6e736c31685548434b394479513439316a484851567a615742584a6854725a4f67684146526e7a656a7871624f555a593739757a6b3747703172516c3674636a4e56716d6f334a4f684236574536706a5341656533474b445369347974624b6976666a72744f5a726374666c79494a59746e784f517944697954466b4a5a384832497166375a51717475586c4b336d32464b7a6b784635624567496f484e3847495332704d6833714d486e7165342b6e55343375326e43306a76416f4e395a6e614770326967326a616c7535506a786c6178737135703072383656327858394946596e4f71496a535a7845705a4d31425444746c59472b703075653363525a30732f46715268482f4a6553683730737a4c6474304a345751566b67476e446b7358613138554d5867724d623054353945377254496444313045565a68426f676348336949643475436348554d59707462546761423544444f474a4d4736796b5339505776764b374765415a43786953364f6e59435737546b69374b6e7668526a557a433871397732594230457a56496d4f757a346d577948515a41366f5671552f4e4f5a325476315a65445257556a6c41455367416c327163554f616b763163614563776a6b53494f5271596441715a34712b7a4b7649513967366f5337725445416c4f3034574e373348344434506a723065692f38394a532f6575437662374850364245692f5a74616541534c676e694f574841714943696d794f38702b6d4435416b7546636e4f63374641557a386e2f4d765a3069664e3868306839304a705459417844476e3137636d41444a5051626f76393633344f4356505152494436514a31364e486a304b43574c393373515461547a317750304443392f754b553477444349586c6550612b586f6a5876584965525779455550386d70675934364d42737438534236724a4d77396570445745743447484d6a6d46596e6c4d4e30484d3831557365354f673179754355436f516c56366e6d774d4d656456724f43507a556477556f37507a4d7a505a53756b6e4153654c4d39396c4f457168394f636646374c717742464863676e36544d6341345a736d773050325a654e513038744c334c7452646d725a397942656b335131657456706a675464714771315357344c417a4c335868626e64517675514c6a387a37614f774d2f5647696b6a6162796b67424f68386e3142674d635a2f555141694779686d4a39547379367032664c37597a5270337451664865556f7359755a415a6433554546556c6c797231576d496171664f7672613145394a7432634d76686565446976746f4e432b4338523579426e437262627878417472567648434950674f6a644237594551426a773950616f7563336e563375716839356f6a6a75326c632f2b3556524a4132654d6e376f30563950737a796a2f2b66744a4a584b615752314b74526c336e56475a626467314d4b354f345978525879547372557a466c355557373332414a454c4f44524135567744304c4b7177466d4a47473536346c4569634e7161534576457538726975584f6f5a365a616a42496543364156626b4b734f7050707633696548496167616a786d4d6639396a4c4d574c4230427968324b6d534a3265736e3142746b6a456b2b54474c546d4148576b4b34646f3954645763557757594236585839703432544d4a316c75636d39657a304b484452415275613169737a504a39474548594941416f315235306a675a44506c35646e51344c772b337244454f42794b6b683472636a44696a4f2b4a547052685265764270444a7166454161664e5339504a5878704c685a2f2b536f37373667612b63713554597964466e696770526b7a6b6b6d746b435a43474d522f44786f415934634474635053397a547250306c43425468594e6178564b7074626a375441515576314a37304d47435643765765315a6578363732316435555456765536774f704f385236646e665a3535454d64462f63444b61477763773475587a327564576c6e6b326845366647586161313274746f63774261323150634a662f4f314b6a7a3838795558706f58714e574245336b3377726d6b704c5777665a55396e67417078304e50396a575132715866632f2b764c6b7866654148704e414f715861334f494b563642344e4c4833784f596e596f39304d547355624e6f745065415563377a6b567941514e58784b4d74434f5651737641714b745a6b4e6342684539326d596b323071464132316a3472524678327067356d6d5176793374576b57786f37725351574d4c6838653772394d55637331646341514761316353305a59487235764b50775172704e654134766b6f5032415a49414d6b446b6a412b4743554334582b63786852667543362f656a6f31675434344f6d682f2f2b4d63424568392f356e4d5a58546a61444e6a752f4a36397066596d46764f497446455863394254556375383141445a4c79726a6865717a70594f417a492f35357670365a6e496379363062587237647a49512b4f3067506c774679726b416c56793368616f485257562f71587153716c4b6a487a6e445179316d3257554643785264496253674645397a78544158492b72587a38796d326e437947617555416d623061644e5975585a377a5346625556597a306d59757247656d75707a527167526a665653357a5145643661794f6466792b493433704c6154384a73533950374f34653159665436614a6b393442524d67654b46327468507665554f4e3264445658684d5374784347556e4655446b4530374a4d6f5667697055784b7730384f484935696571364750447272372f652f4b4f76664c46352b2b32336d353839664c2f3571372f36712b593942515a646342715861306139383442524537675a7359454351393772357062705556634e4a7534783037414b716d4a54475363353251344a4d543139464d3669562b397175792b374f4c55684c657a653755787750425251496e702b566e4c4435764c3845622b536b52552f42744a2b59316e615a626865553966487a7341516432535448774b5158515530414169696e346d7762786d30456a6e6e6d5a77527834583678415378705a544c584c6a4f752f65476c2f6566666e496c4e2b2f4d3264586376464f4b2b492b37327479736265447850486c7876526646676351565a634b6d71706f3554513530577353334a644f6454686364756c652b702b68554253434c43797446785374466e3555733674535549495957674d7a466569766476486976626974792f385576667248356e2f2f7831357376662f6e4c7a51392f396a664e662f37502f376e3532372f393235366a5a3263484e59797478726453616856315049485a33787a4835302b6238524c4541444d4244774c6b5448476538497765506f7633727570735951752f3966724e654e2f667a7432594f382f327779342b3048626c594e4a4b6777346d5035387165682b49475a43313574465238596b4c682b636a766c4438397662564f3952503436685375583836677a302b314b56574765714863512f75333345585871775179534b4f7863585a35705831334833583051487173563943635241495a314e625331487a64737570727371784348473331486c7979622f653535595a61563963794c356148557a4139672b3149634676334d5743316c343475366e72484a36614d396132484176675934674e416d2b57636b72377970797143306f56344876556c436571453557522b535430324a3563504978706b36527a784f6b6c4636486e393865454f39646a3558312b4c67756a486374777a69544855674645756e75734651456f58576646657957544e356d61416165355a3166666f6a6a3072726a76327a656d6d6a2f2b347a39752f7642725834702b2f392f662b7265526358332f2f734e6541492f664c776849727252654a7946364f304a6d573075315733696c6c797243372b6f4163524a38326770756f33596738666e5756736b593647514a3350507a5a364542666537746d77486b625446673575746f397a4273342b316e71584a4e6136636c393231333074744b7742683731523432356a5338576e697842674843447777513067675154626e506d734e6d63684335554b51615a30365658344d417753345a642b326f634670735754302b304b5171323355314e2f4e50714b783970435972547343414141686c506e664f433863484948727533506e5451694239535757514d46685347506f415364576c3769382b3958465875454c4c6d655438323579654e6d306e44414c456e2f4d4f45457a596c6841386e383978586d777354516568305159565435346f457947426b65356837355678664d6f4173615168335a32466e46536b4f7432586471416b35353665796c324e42676953506d325235774e49567a496d63753230373450312b5079746c6561502f7569506d71392f3459336f4777416862662b54543534463136554c76434e426e436a49654a786a46374766456b414d787466634c4a6b416155733578387878747471375773667148495941494c545445554253326d354676393536383370733344726155397054425a437470786c696d4a4c6b676535334a376437546851664c55632f656f36556c666d70433474394a733437745177514671392f6643365a6d576b386d676a6241414c41326742436879666c73495a6f6269316c554a456370306775307735442b7253744b7578737074715237686a525a696744392b4f5a396e537a414a454e30492f665743526232686b6b67774470714a445a754b7432574e4347336435756830555a4278444135666c4b4470375a755162647a66567563467261514949385667345477455a46686444494f36715a54363275684965727047424d6c747932506b42633569636a326c525954425733364e69466d49384b763748564935595830344833696d74462f61422f4b2b645a48756c7272367731662f41486639433865544e50682f302f2f2f7862456666615556597439416e6e4a55574564336155306e63496c48634134784f67676d696a6447686d6533746a6d6957454755487350536f4f6938465948663362565758502b4b304145676d69453974422b4b2b2f75744b3838635962416b4a363334363142546e326b4769484a554476794c334f73335a6c4c6f7a54414d4a49727a766c4142344c7a2b63517264574b794134744f695764793455634c304765523856694571625032456e596261357237306c6b386971646e732b336c5972422b383578786d52327a6a4b335343477267506e73526272704f4867467637645645684d396b7a704f67725364636774596253387730643772627248666c36595a4a36676c432f6534502f7a627168482f646c4c6a3757747a766652744d6844593977494930716c42736c3647354549366c4b73324b6b386d4d786c7746454177796b4d646c6a75653531754e6347747441466d61304c5a723970724c6a516f742f4f4558377a58662b4d59336d6a5631692f372b48392f3844314a644f41497438366d5179416553396a774864527958384a48555a47686c5a575532796a525a71344377662f59675479587a586e497a36356f5265507831414e75674f5a414a7757383745336e557876545562744474375a757a736256675664734259767a61346f325a38457835676e47307466626d68357459735a7478444b357a6658572b4278436a32766b30455941524b74315a414d4b6738494259444c55424a4c642f6a72364f697772555654306c376c30566f6e6c75567a73573654673734756a506e71724138327741456c365145676d6462394c49776a6e70632b79736a70696f33482f6242796275494672357a636464646c62514e30735132326d31626d336a6339414734526c574735783951447557544e64584a344b7263673837385a342b54516b433064654f6a377276394e654f6a7a30786b725242536e316a75573844714356437a796d3953426f6b534b68584a56345a2b725665657955736b6d632f6b5669517473395569622f4d796e6d7a764e7874377335644248482f366539396f666e64332f33645a6d4c7653664f6a482f326f2b642b2f2f56314a4478676e535a544a6f4b676343564e486f6c41764c464f4c71504b53785367416944326b6a78356d3854364931704c4764676a6a734a4f69566c73764d597a397566536154757746674b666c747558653964564f784f587533566c4e2b6c55666f6f44643036782b416b433462334e696361674534627451343235744c4156414c4170425939335257717a466c6c6c397a36516e313072646370774e30685a484f4651364d2f666f745051676b6b5764577376374c476b586567677146684e31634a346267774249534c494b494842446474617972384453304f4377436a524b7854715338546e75436c64734f5a32714470784337467832596459417152655435397247473662434c6e625a4c6e41744a4971336b5a6f41584a765955747575346b7542736a4e787a7a426962594d553956634577503362736555323672646c43676a6264487470466530413653704c65456c323069734b6e622f31316c764e2f2f492f6661333537642f2b37656270427a2b4f6e59502f3134392f4a6f416b7731785747646e59346b4468616745534e524651314a4b5663544b6673636d4f6e594737335342594638657277632f7649507236716955706e382b6572365645364f7a32414d4a617a4d38656857522b2b3830734c416833344c357456625730424f487a523666395147346468374b4e30376c7a66615548454b65573838344e39754637687879664f77724f4d356d414e6f433075536c4a5675536565596c796e6a6d6e49736a3564336f754d4e4a5a36454d4267674673613042686f416f775849755349504338756a4a6850596c316f49344a3977495931416548342b4d6f634e32566c6178546862726c774b6b544c6d456d343051306657582b7a4446745848742b70785467756e35394d5259336e53463459354c3538477863366b67417573344c6155466459717439523470545841494965304c686d4c46502f614b352f2f465741715255547046674c6e4f51514e6e703253434f6e317957494b764b6b7558346764666b452f6e43463737512f472f2f394f73522f336a762b332f5a2f4f742f2f612b6262783051474d34673873704b71736565473074644f787273344141596348635977387a355172556862692b44654d58475a5635646e643867735354313379737a743250657a7339334569446134526732625763726b6d532f38506c3747576e5877434d656f6b4f546f6d355a6b5341663769324d6c7944336271374668696b576a4d5644584e55416f634e574d324a767564422b715077574a686364737730676253725759336d7679466379514c72534253434368584a653935476578575741494546437a53734155666d446e6d664e6e4c57657a436934585779445951445a50336779566f49677664665835364b4942467a50635348506b353061677971575254534c5652634e71474e424964336b7a7235784938395659573733644f4248536d5a73466b374a5456764574674e7a59317372474a68796e6359423547667650667755514e4a446b362f746f6d4b4a50655538584677477947326c624e442f562b624f77323336762f36543332316566665856356f66662f6d627a4c2f2f6c4e3574336c474a454652734173717753507048655557785666676678656c3934467453676548556a2b2b4275374d39666e736b64673968657a73436f67335975306d42705066682b66664731414e6a5a325859415a4571356562454836487737346e4a662b754b72365a48566d466d724178584c6a687252425344766236564e4f314a4656756a686769323144435a3066566e374746775a5563386a44367a54473044684e43675352487541596a45745a5669732b6f46774f7276735747522b3538314d4959355674614650774a6e34574e7349504c756573497a435667665a462f4a6d38307655624655526851433743432f79774b4b474c34584c537672474f527866526d5068714876365851675776534c5652762b4d4f455168494f37445a666e4b3762565930444e35327a3736364b506d5545596652515165376d656342715a424f387762593243735349444d522b726e586e6d42505162526a3441486365556871466244484766784154334d6c513139362b624d7a62314671723066716d6a49644e524b6e6c58397361674e645a684850337a34635261646536616b543658545265725a6a4541337954345058592b49672b424f5669434574626f6d4e33464963726e5a36634e64315231446137683965364835777a2f38772b624e4c39324b5a4e51662f75692f4e78392b2b4575566c43336e3142636268787849646746325a394f3573554d42447a6269545a664e554d562b6e5662564738623035546653486633304d58574c487a6237696e76696d702b6157416d674565694d5336703361416164544c765842705634503135354d2b687a547435492b7430744566584a673866522f3964755a4357556c564b67626c2b3168474645464233682f753938674e637261644b303167396d696837586c6a6f5839716859666544677875525553694d754653486f7a44434137425977635339497458684d517335345372675a492b55674e37767776504134594e41566749784373464d39724f7633775a6545375144584f4943456f5677414d68486e5670416c6d622f6631656552576c434352495246676a6b5567506a76323964586f6862787450796675445733465852695168394a776d533263306f36666b74374d4246653750347a3647756e5159492b64386668446b5576393177787a3045542b714633524e6f577246565735754c4f7650623736796a74476157766b687531734c695370562b56743837632f66526e4832646c6d473346433371626954446f55376636524a55523655685845306e62367a4c75772b345341644648334c6d733361316238324637724e3371687666716e58642f4b4b6543696d4d6f577a4b634f2b457445794f512b68667271324c61304d356a3153454f6456426c6637684f796a6b784d774a5142505475486358377670496459547a506e75537058444e546130453356476c4a514a51714a4e712f5567506b6250317a386664734a39336e4149542b7a4277546c31474a584a3363413042574652486e4f744b424b58486d434d6362362f72785a71592b63646d44526a756d3263363131616d4c576b65754e3842625478346e51635338416b7732324530454e697a74427257424751613477474741484f6d304b6e7433724a2f5847617a6568706c734a4466695a2b35534c6b6762514c7246746745675958663054744c364e4542696b676f7732453851544b4a496d4857704571675761374a486f6c713951424c4770644b6f6264795a69506d626a46625573375731396b436b50566f38333271674d36717a63485557376f6254555a615537354a5a48546279456d6579714651687645784c5378735a694e4f2b422f727a773739374c77456951786f4d4979476a4e724b32504c4d6d6d77785531307735746d4a46424d7836723271652b5030585872735642482f6a786d4b6f6d636379686a2f38384d506d6c77382b3042686c3630786d2f57476e684e41334a506d6371747a777577392b2b564536547372425362597857482b2b763331744e2b79377a735638414f542b52366c52414a4277384253567231505773564d41307446573431426a7237306434356953467a51437132645a46376c376c6c58376c37566e4879316f58616f532f546856376c38346f6951686563356a78644e5175634a75495775354847666563386c767245794744564b37316d7072766b32433647537849435472746561574a6d6744786d6f5437566d43424d65555339436479623356754a483743574d59694e626e6a65774d754f5635495434505a7051456d5a4554674f416d68423832696b52486349776f3369776a6c65417a444b515972316d6c6e4130337863306e516b45534b44776a43584b377558763765767a2b67614c4844783438615535302f6f6e6a467661676862644e774f646f74505831793263774d69383944306b78526d3177653836594978614b68535634754c6d35465730426b4e58564c4c4f614e586f50493544486e4d3876646b7052756a796a354668567a316e48372f33677835464d75694f31484f324737504d496e70594b68317553504d46356f3761576a4f4a793373634e54536a5065667465486d4d4151426a6e52342f6644344473614e316769696564767045625146506649343147616579733830392f396e3671364b706162756b664b6c4570463775322b446855772f6e5a6a596a49662f442b6b7942674142494548635735355a4974414f4851324b4348695039496e563939506671563537304c47437245787a56336b6674633570523954482f57564f5169677262612b42566e49457153684e4e672b57616f704b34436a3533706f754d526f5264446a4232464a6d41577a334544434a58306a3345534a4d2f707a71584e6471787a3533344463777944304e7a5377474f6e6c2b4d766a71696d5a79674a6d5030552f7133746d3351335a3348734e6f424d525158496c4154525475345069387151744b2f614175587637447633456476706c6a4e437344577779544479726975563959335837676278496b452b2f5042684d3674795235614f4a765145434147703434674451426a3264686b676471307a6c746f314866712f694163584a61704248726a7a4c45376b5a527a454a4e4b567973597a6e64436c7a364971694771587362694c4b39666a3930675137766e4233373462787735513949476855694d336a4874466a6c696251786d797a457533424759584242414b486478646e6f382b334e45784677546331745958772f62343233662f56697157456b52446d6f6e37617575714362384769446e782b2b2f2b744d63514d6c435a626e777a674e6e756f32682f596535616a4257416f414a4e543635477638366c496951674d6e674b514d4978564142794d5a2b375743654c4e302b6a366b6d5536492f3234414b4d4e526d6a6b64346a577958324a4b6d71666e697a31752b45684f58465a636e476d6b6257672b5a422b304753794f46514e67597a4b456755645478416a714b30364f41424e503367474f6b6833694c706549414a6767457671694b6a4a5967425976736c426c366b6d3132464c4162336f56366f716d5655532b45614a55456d425049777573732b4667415348436e326f6d705064636c4a366d67436f6742637050504c47794f51384f787452596b42496c76756849766d74566657513958596c337246676935646b2b477552513875686f5453692f47347843566a7441724a7538665563394f5346795343735151336b5a6d54735a67523449706b30617871626f396a5a453172376568585638364a5547385731774e593243436f5a2b2f392f4835495146644d6f6b5a75534735786c6c444656464344762b66454d47682f5154666a66486a72526f377a32714938574c4b39357058302b643537377a58662b377676436242487a617763432f5478554e6d534a6e7a6d77436f57784d696150666a6f6c386e7074573732626e4550665177517a54774d6c2b2f4d31457049533151736d45626e49695757363377426b4b41463752794d655a5a7a49646f5673454a7439776c64416b696f393863554731486864414745353631716e44787a666a4b7a49545a316f41397a436b414d38486f63796642464a2b764c457863596d4143454b6f5175727042632b716856676e414169783941473342684c7a674469514d2f5330796a35705257766134746c327a544d48517a56386d455a4f2b56492f6f32596c336636486b4130696e6e6737447a45386c4151484534514449654d314e69444143453532302b3355797656436d2b636664324e3279525358304952313365794751374739623268466864644f413137306d416b4c396d72353842597942464b6e59684e4f3468566b41624b5a485969556c5575692b31695a41764c34736871614a694549543266775241564a49545a384c6a79463456514d6939677547494964464841424b654d6c557a434c56495368642f7a796e77754b714530532f6675786c65752f56566e52616c64354a372f7671762f3772353776642f454847504f54464f43507863337169775159704f7a376b667146627a386f7a534c67666f784b5637556e307547524d366f59782b546e61667876765a795577572b336861396f2b63536770717245754c75516c5071575939674b524e553036626b706372387470307567433079346c6c724158534959436d736b4b4d6430584f694368524f356c6e624734392f446a5772316d2f455a4b46506a50505072386c7043715a784466575a7753514c46324a7138746c34704e4c4838524e343151734665473970454c5973446548334e6f696664766249744e7735444c783339363466736c497437466e746356636b333759344d2b556159346562706367574b62686c596f39796e32415541535453376c75635646794e647945705a703958344938693244647164796d71466f33726d56456555474c4164484f72327a30636f6e73666a57784d7861344f474e6750746d557868557148506c6d53436f74726a31546b5a7770454c425130536631687a3058744f4d61785676792b745675654e476c564345495a6a5a2b4e7947765435354d64534b4f2f456a75336a54696c5134564164564a46526d6e33564f704c675a49524c644c33624e354a53575333763756312b2b47354c6831597933335665677378653938357a764e582f3733373673764b75556b3731423450316654793456625064516e7452324145304159333746302f56687233574f413844754f384975617a6e4f63746a576c6b38766b55564f717a5a364d777044433268714c5858424e444d674143635972435a4c766d55323976486f74492f4f72362f462b49666331383542314435544864364154734e516e414d4c3379314d5a374837363859667876493761393246466649346442456973426e627533567138794e7838476c43796f4d536454304e7952554f4c2f776a5662774d6d787a50454749724e59733854334e61714268327a5679624a384e50586648482f385531743050744f632b5a772f576e69615a4f4a6a74514563556158517069647962305848426b58746f2f6365507832556b5a5a61445a57493147334b46516d335a73327436536a3064367031456d417443682f655a7733556335594f447568634c4a30305741674f746c586e444e50554d712b4947587848764676617533436c5a68777543377a794e38556a324d78446c5443694766516a74554f55724c68394943444843584779473865504f43636930595a715975394b44364170423357414b4b50754976554b78775a632f4d367445626a3374557a497067726b51484237696f4c6d757538374b4d35363653375577704c76424d6e5972336d5664306b7645654b38367a7053496d76662f6e56414f65627237305742503775422f65622f2f70662f32767a6f33632f7a726a567a454c4f537a6e367a6364687a476e2b49356375764941365a465737436d4e38536a734847424f4b51304658633749746f62586c6d784f68516e3779634464554e2b336754572f6433493159683264504d7743344943385563364f6369756733456f522b662b6d74312b4c76546a637a68576332586f6c35654b714d42476945633277672b4f6e6a725a5167326d4c4d484437374b4c31374f79706242434e67765141366e6a516b5763774e527961383863726152556248325a7953527a7644315341612b2b4444714e4d6b4a54497a45533374465553336a3754714a7a4457414c47364e416f67302b56676533757161672b506953676d524a4e6871525470377754446c495a6967454477635178434352516938726e5033673137726254394a47775375334f5079316a506971525a6c4c73714d67636b39634a744f4a58624d5365557845522f69494f45436c48694f4b695178422f34444230614d444378674d517037537751524d49386579794f36337a2b38352f763753526b6e6d6d4868534b792f506a7864737778586951576e393877626c35347067434a36756e7065584b5a7a7562653878334e43632f5a6c346f46674669666351435a6b4f345933464a37755a6e37745a6e544d4a722f344866656a764d2b5673733569582f3330772b6137333733753833505073774e6171645463796e706c4b334c373271417844674b5147376f6c4673416636796a32677751666764416d4b4f314f336c43463448434c5a3245664b6a6a4d47687656684832554e475547674b77357648334141416741456c45515652414672554e4972497953714151435149397648376e5274772f4a2b63452f623778316c6469767335566f7a6a5558456b2b36486a6934476e3039386e3766784f6c55522f2f3469663658744a454f577834305668443567397730462f2b485144352f4a733341694452535047674d454148425633626c422f59657752487868574b503331506e446358657a684148424565425a414c52612b3877382f41386e7659437355566174574e372f7065496f47673747755935324249416b49366b6f31376d4269344d735a61654f694b63593434436164456961525072475a71784a6e7341334b63466b714e57507738634d706c47616b526b78416a7072306a695779755252614e394244746559595475676f39414f463554704e2f513373536e456f4259664f735643395441727a36616b6f616e685571477a35374551372f2f766e506678356364586b357a7858685075615439764a34422b6e6132686b58367164554b37346a6c534f50774d76324f58364343334d3167464c326533424f4239654357485977482b326a6f4e2b3374622b4e6c4a492f2b50726e4975634b715178582f637676766476387a642f3854664e774d7830775278634c365270645348637241416c6a76787a66344d6a32717251532b6e4f68765052516a5570314641415358726337655554666a694c397357643850393342326a3253456c6f48787459536844684932497279334147594e3753664a747a694e393649584c4658662b65664e4b2b2f2f7272307a74737876734e797a50667379565a496a6e652b2f572b626233377a6d383348372f785630504d546565317752714247386a7a6d4e6f78336d43505a4377416b49712f6b703551507265737a34586237326c5870536e317759614c69427955706268524172434b4e4173694a6a6d6a4c746f6f5254566f4352686975764a37363569683133307545654b54574c517779334d45533762676c4e33536f4a77534e6e7a744b3359736f5136325262524874696b544353365a415978693763734f474331597662494e3544734a456653716c54314735494a49354d5950494a6470384772396256646b627550714a366c625a626f766a6a6a5735744f386467334331336c6b574549434967626c4346655743534c676e59697553514c5346326b576666764b546e2f54326839416534324e65624c41483035705a69764632437366633343546653516139624a4e514c6355687877486b656a6b343666794572616b587a6176584a364a4b2b7a652b2b6b5a7756635a495776742f2b65343763527a65336d6d65594c57766b38486f78367a53796745494e5a33446d79514a473043524f3558504679564b494d534a3433536a7a696a354d517867475956524257573935414471367a67785367414a6235654d644d5a48484351446a336d73784954327063527a74466b2b6373535738386936745874666148377274333672656531332f326d7a71766c73706e5473514832644a5750622f7547336f2f72384f392f356a794570506c53686462516d6d424c744f324f644e5178744268584c376c554478416178455a575236367975794f584668544462624241654f4f3436565a72454f4944306f2b763967314c6f6645512f32626b6d316f36444166637369336c544a7a354652586a6c334c4341547835736854716f724f7549716377556774414b424b66616b314558556b36414342656c314d77776d7555656970514671566a686b745447705641785258794d653033466f364d494e63584a534c556f42766175574465636d2b4c53544c6f6c586c59674a3471626d61383151384172426a48684e755a5a71445951415875396b5471492f514e78496d4971394e455a31556a783837563763532b4634486a475579586a68516f6d67415342585668795a44326f382f4a33424c393033625062392f68684150767a5374736c352b7172763355767748737343662b44482f79672b532f2f37643367774766542b627a646f2f6d304a525347434257726e4634374c783032414642556f5558464b2b4c37553434766b4845763445535155423554787279744b695138392f6777675852306b4b6b725a7966702f4345724f564e584d6c634b43524c724e4a2b427a4476542b384534726e2f7536383158762f7256357337582f75646d55524c68714a4d704e78514f7754637932796e37666a6266622f36626a6f62377a722f2f66384a742f57532f71484361643374776e526b514d6279374e78644b325a3930727733367356455a4d686e7638746b63304253766a6759365473577952325955534f53574871746931613566427a4d7a46694a445663384849446759794a6c6156384748757a657678554433646a4a32385051686f68326a50412f496e4332564958336b33436369674a67497851454d6b4c423969673044384e6a32696c63724745584a5531735273554a4147306f79394d4752394a576b52526a4a32747073694f3551387942552f54596c4e6674742b6a456e6941326751555257735641526e4e304c30635042487a356b73544f51685270464767734277716d6264344e7771484e6c6749524e655a4b3278306e5a77362b3969554d42636b4f4d6754596e5644364a647237786c64764e6e2f37706e7a5a662f734b7475502f37332f744271466266662b642b61686e64562b4e7a41424a472f5871787a515351554e456a6330486376514a4941454b7146514359562b434748597264574c655435763478456c6d5632493953637077655a325a436f7a5434364c393036496966366635517432576b4d32667a4b677042767a6455704345593478652b30587a39363139765876323950326b57705336644b6442344b41374b6a7377443264667a703871647738692f2f3365786a2b57372f2b482f62546937355653614166313139674a39355170316d6b6a367257757a4f70453363326e796c4b4a634242592f2f4d70773256426e4d7642696c3253676e6132555074787a68413043515979374671597a533357556b6335767738735530626f30316d305078664e467742416b354c41716e2f327264323647794e3364466a67344a464d63496a7872546b49736d6364645554357450644c6b4d55594177695368716e47646867326a45327056645352556f6d4b7a304134534361385a433364445871336337414e7a7962354176415476726c2f66534f4c5470495a485359514c6d484454416c703251467155687974542f5845556e5558335a694869442f667637776c494757426a333772732f6d696a755a486730736f454157387139326466527a4949782b6b7036325346524b5839786274366d5541703665317273716b573533564d6d636f6e4d4a352f2f4932377a542f2f352f396333717556364f392f2f4e5a2f436b4a3639384d38432f353036705567354d4e54655977305836657a78496d6b58686b595457624a6b7549524b70596b4342782b587077665a726d6755716b7768466e5a653944557a2f657a366767534a4f797a7334573069556f6b2f55426a43585662716c756f78746f2f452f4e6b43544b786d6537623137386145755456662f526e7a5773366e7677593052626a4a554653362f6e306f387871666b66676b4c506851366c614f452b32356532304b63463841313761397937487a73324e6267386761454f414638376b5343364459364a34305a41426b76754968586a566642306e51646f41736c61566e687a6d356731662b704241584d5957464f307657626b414242586b3958764b614e574537577874686f354a736d4a455668576751725668377a714536636a7259314653476f56706c474772424f655344584f6b342b4c5774416b6f306c714b306374783851434275356972445147426c48564179493436356d4a4c2b53756f554f73794946476644424441515a39495a4951527a51686b6d357655485576506d71593630754f5a5934676f63705330614e2f2f2f76656c33757a4c566c6d4c426352582f2b42425a7677654b78303934675a7956374d6d577a71664134424759694b4a6c776f676a675049716f7a6e52615849543534396958372b2f7464764e332f794a332f53334e596546565371372f37333734577a344f4d6e6d6156374d6e6b766733446e477a485075303265596d75417a4568536842644b5664736a546946764532446e6d41554176436956466163474149476d66725a4c755343745977464935794a74484c785972503275334c57304234634b4361355467514f41425342764c796141706d363848625962414d46596e3737392b57434b414951637448306c562b4b472f2b41372f3662353376652b3135777170347a6e2f5067584f67617653486e474137306a6f544b6b496365464268316e464961486f6351612f472b4c486873754c4941356e752f5a667349456c6568306b515357434f4864304342726e6335537749593433342b374c756d44654b4d30475242304a4a774a304b6464355a506a37377a51466b735a57363966792f4d4b4f2f745059674536716b5a4f4a5138786f6c4274304477694e562f484a66507351393058496a304933685832536770384d49754d576451654e6671553654414367596a617154716c6d5a354e7862797372362b4742776f69345466686734663936344c6774672b6c4372445454653769435052462f746d737a716466695064355261706a7a736863526857527168764772463673792f516b2b793045464d304c683834386b4b724e644a777133547a6339524b7845626349426b4671536a6d2b514279664d5a316f596d354a437133505a72724d62372b7947456236327378684150477676764f6a564f55574d7736317133493550503854755a4f78692b5a576275533853544b4643695376577442524f54446e5343646f4159693356416f30346d6d6239324e64357336566b4b6a32766e76304f414b345530706d444c57477655346136364c47485656754e753447494938552b4b542f58626d58615965365851416d504978364c61314d786a7a66653230786d4e4c645635654432432f6b7275532b4863574f474d2f3737386f775637496c62755849344a323547625966594967776756374d61355170526658574a4d5978304861746d6e4444494372755367504546552b4359785250302f375734374541715431696453355344424c6a72515567544c344e39637332694f776971545531514a59314961397470507431366d677a347a696e7841756b2f786541554e362f426b6848575a38476f64564d43444a423338394e43793557514e514869505470636b793677634676676e4f584447654d524266765a737a38746b374b33446c61433241634b444f67427368534966427a3954324d5868465171457a364f327a4341704370435534416b3834734c784a716e6b79565a415136524255414769415878536b4251494968466f423035436f4f4148657a4a734258586c304b4a3048334e452f6866662b392b3147747043767649427a3261435a647a5a737135687553765a4f4641514649654230466b485162352f707566765242454f707279786c666d744f36424c43504d7962306e634d4d7975466d503153326776695a6e7165434336756c2b6f6d32453452584b377879496c695636796b694d594470417a326e56564578547270615051737075367874426a77506749527165434c48676f4435354e464a714d54455738494a304b7946397844314b37795661694e546d624c4d55513867745231516330782b6c496d4c475a6d4f54686141384f43542f613278414448484479344761394446372f774b726a4c6d696d6555352f6f33546c6a45494436704a4d6969374b5a585a4279482f6152714a57473736496968794d31523252733461774a4569366d697a72796a516b4677646e58626a59324b46503532664f4561377969417a4d2b6b61382b414d6a4173565346534c73627034672b305a78313338304365496a675771544f3451794d6e546a47437375466f5431367a4d434356517856396b5430556155446c6a4a58704b5651516a6f5841734777613754634b6742784c74574a38314e6f4e46564d4143532b6c4b49336e5932714671714a6a4453437931646e30316e46714d527a34384f6d48345278342b7552516e4677635855656442556465796e3061682f4b4751517650646b72533445516548746f7070396c4f4b6b4c4e633535383947483034325a58657a4e45754c65364b626b75397038464966366c5647475048355764414f376132717032634e344e3444362b2f306b4354717038714e57796163507855326870646531757a722f4b2f675239544b634b3170466b7a58584c395a37734b4e384c372b63656a45534f453255684a3641335171717a4873354164714970387855414d5831613154436e3544305379596f52377a777045307a5944457246474b6469785751553161584767554859427042593548417a703775775672486948447364415259554952567254697435567751666863365563384e7a4433597946327050426e666b4a436c6c4c365258416369394f32736854684778634245796d4c6c387a454d62514b61316b34314653454264336c70725a6d43676557382f6e30662b6b6a723034466b6d3137487776414d5178727767465350694f647179437367576c554d566b57526c4a7765484b7a6c627336714b67765253656c526b4f4779474b7159416d593964566e776b357238417046747368426f677250453148554f42312b32726231344c2b2b66784c33346b37395537556b334b6f6148724b736b6b4662616a3344503664544b5244707a48327045587a4b4f6f507072594a4d795379724c2f4e4c652b5370454d742f64623274386674737a324a38484a2f387554787a304a476d634b7969764b66586475334171316450764a5672703556554f5a2b63484e6a695134597a46317a5854583067615a7a6b7a6e795a6e6342394a49736a4a75413052374a414f4965396f3446757054716333626e6238622f5741734c7056714352396146446149416448587766765672694e6a7333442f3445536771756a6b2f4734794f4e4a6f473853677133395441385a472f7967686773684c31536335315355625245522f534449534643476474697552656b734c486164647a65632b2b53326c4e527367474e314b71456976694141435546352f39586f50494f6c68536d385a555858625a4f4d6b794b52327367454d414f56556d486f2b365865492f464a654e4e4e365576396d6242382b53764366794b414b4a7144566945436276487570793664744f4b656374526937564b7949715a544d33706e3554446e52317042384c787568447252544c70775049706f674641474553307058744e6556305174687a387332575654327761324e7863684a2b747772716a5369766e3330775473363175446452767569776e4577713153504f464a5a576250382f6b5153676e6252596d4d2b46636c6e2f4f6554365254774d51756e7539765233316b7855676a2b387a726e6e484566627a384b572b7a6239396c766f347749655132353572583947454a643077354f376c7451726866506d39594f77736a756b4d595357515348715271666e65554773526e786566704e4d6d4e496b4649783039724f68597038784e61427a6150342f596b4b45635a384c4e324a7a77476838784274437351474b7a57716366614e56432b7533344e72565663745a5a3448494c55623032704b4454682f4e676f67454e5a494730546570514e71394261415542336c686f415279594b7257582f7038594f506b764e49664d6370707a4a6151785158674e78566267554c6c4256465343636e3364776276314b50485163514975365955565451634941317658717055744932684d45342b446335566e74377045396b636565486d2b6b4350685068783179526459764e495744777669526a505261356e4f634251434c485347307872736b7578723069784d58474f697a467548656c5170424247386c634d4e514345434c63426b69304c3763732f586a6c316c706d37327265494a6950662f486a4b4b4a41494235763237535349534859697a6e5654556274465543347a732f544b4a2b617a51794769366b384a504e4d565550436b614571444a4556726b67366b7572316c55774e4f643139484a7a374c783657576d73434350315a455443694672446d682f5a6575584d7435753330694d6f6c7044366b716e2b77702f3377595366635345417132544a6f552f47587543545a6659564b72524f7a49722f513534536f4547466f4e394e3572696272673966516c577573456e66306a35364b46536f54625a6433502b4353536c552b74425359694d4a6c6f7956494c43496973426a6c4f616d35393844674751554f506f39306a7372327351527838484a66577a3544483555455965455531676b56345858566d676f432f4f67584d5445416847446e67597938454a3369654c797669794443443639374949774956696e30796c7a7a6f734c4757416d6952304f445649614a31496c6955396d514a356d5266665832356d57356f4649595167484930796b6c3167476d7946546f413252476538624469796967684e517557324c6a6244505771457a61766b344a4a48467855777959615468523969723933634e645a34446f39306736507038583455524b6a64786974502f61776b55776c4876333775515a6b374a4a534b7a38364f4d5035494c6562376f4c3558687746566d495a454f6e3536742f4154785651596c413374787945503746564f6156486375495a7a7a552b47564f5a302f323476754e6d6252427a76665369664c445437494b792b37756b316950362f4a436b754a792f56704b324a76585a344f7062443337494a3548395562753239312b49676d6b7249614a4570645254686b304562475553737568446c6834756b6f52622b7963754b66517764465a78716d674d7742696a536b3859354b594854307341464b446f4661486174322f3576593964557370424d384c454b7454673637626351426838556172574e6f2f6f63332b51636b43435033656b4247496366666d7a6555593950305066313442524e3669382f537561434e4347733753434d4b6255657773522b346a2b305354433665766e526242485373334c2b77464f33792b5a4145484636337549554d5651455177733654616f354b46495533566b3275336577414a6c5369796a51574d41704254536254676e504c79684a7457786972506d49456f3166396e63704e795271414263716f395066782b46322b45512f616134426f676550486d796e484f58376f2b6c2b35524151544f766233314e4f496539782f6344386d6b625362684a5a74574b6b4c7344524c523874784f4b5a614e56796b496348346c766a2b58796875534d79546161624f326c4a587241516a3957696846734a556b462b76797a755a6132524a7750386a67726d7a434e78586f652b335631574277737a4e486d594a2b2f38664a414b2b6c2b33703738784d5a31334c525437795761543546557348636f45637a35624d346755427a5659704c414a413030704e5248756f34614e36684659414a4b4b4742486b425173635952614e74336e6450787556626f357256557173486e7a303151746231694e7a4f496a6d524354584a344d776f425a69542f714e6e696b4c3449524b526f76534d6a6e637a4d5632514d386c74734548546448565547346663714d684d4c413044674547637145784d3664504757575970596437552b4f6d6f6532424e65652b5147336551384f315369556b734d64597a6e4d5662694d35333572483750566e6c4c6a41695579536a6c766a4f3559526e6e6d64524a726d37356e4833537a4d7376746a344a2f6e42634172614869707a547469794e56446c34734e715a6c513750332f4f524d6144346a4c6251456d6634366b62754972307037676c4150744c7843336976506c4756683856464762596c61664e43556264776f3871766e546c4c795667652f6679442b4e3369527162384831326b445449316c35556f4f534f51386367306a4f6450486d784676326531543466782f66446a724a52354c4c6476704b4c4d6e63582b6d72666533496a33335a3050496b377879634f66424b4f366557736869466c4b58716875487a36656a766a47706e5a4f416d53712b52426d51714e6357684967352b56594349334974525a79362b2b4a626f793479744c316e6d304c6251452b762f6737624a413245497a3776673067644c7057325162564e784d4c6844674d494579367636754e5a67506b6d534b774e5542754c553346784c367165416741324879632b663162326c724873343456364f4b3346324b4e55625650355747732f6b554b5256477a4946592b6434724c4f49445965574375786273426a6d3254367143334e5766576371675a5349794663734a535a5067536b63376e326759356a7477744c504130506c4735754f386b5148666350424442745146456572534d38675459764f49436e4365356f54522b474d6a7633306c4763614e777a2f632b75742b38383834377a6159414351632f4543474664465679537269625a64424451435372524d4257786262523332653148344d7848366a794a6632626e7339492b356c45435a2f504b2b37434f4b594f387a794f52596c4b326e74766337576f334f6e6d6e7054334b647a427173344f4541345050677156372b6e6a39364b645737666c635a50456d35614b794c782b2f47773249755350486c4b304775654150486f4b6c7372336f4835712b3449416b6f793442457a6a544533553641785a54433973394c516e414245654d3433504f7a3676444a414a496a746a4c7278427667594e66443676565a4a684149456f48443878777333746d6444484a476c57457553476447596b794273336c6f4b7a415a4459424b50796d48433955376b39492f436b39396a726f67694341634943416843726c63384445457a67555143686e3035537845354155307144506a31534d66376c367a472b697968314a47395470574c524c67446863796c4f71566f4a494e466d79592f377042797565614a34422f636849554d364659364a6d6a554267577163744c636b517031586d73594e47634d776944392b492f6566724e7938462b312b373732504973312b527a73502b587866774977596d43677576463469757644576c574f684632586278447a4f7263553474695852655136634f5137516b62755a61314b6142675139646167394a4f7250736d77324a4d7a573262566b6f427048756c637a6562477253483634324338795057646e363850342b3836645047353854687531654e34443256356b35583777506763387352457553375765486956515a37737051634967442b644a656731505a54734858576c6e704d304c4d32444145523478564d6d72536842323749323766464953392f546479506b4c4f422f37344d6570575059474d516937526b503130435379634939554d66442f372b334e5969784e7a2f752b722f5a39583376665a2b484d634561636d517758616368494d5367466947495951526262736d4859695756496f65414643514c49305a56305952674963716e62424d694e5252757735555377424a6f4a4b5a5069554d4d684a63374f6e6c367275717536752f5a39792f2f336639366e36757561726e4e47484d68666f3347715470337a4c652f372f4a3939435973365643796c50326b424a36716e4e4d51525935305258486675334b6e75507777333472373062792b51434d70654a315853326376686859306f4e366f503756512f4355446133436b77616d4e53676954675567704657356e3151354d676a586b5430724179542f483246434d396a58414359393555766339357575564f346e7364736b3273576a4a4f6a4e7775315665776669634342454e5a3639556e4c772f6e47314c79344d42416233564b5a62564943414469334b6a684353643366752f644734366762796b41792f727469764d36306b38747249347535565a5a6a53774147566547744732506a6768344c71695a74516c7a63444c6d696f7a466e4d4a39465a326a456e567346574f396c4336767435364b3964647a324132374c48564a7a37613545656e335852307831324e5453593034544d3663476261744d4e67667a704d48697041446b412f6575793944503772624f45367a475a70435a386667495543433573495a6b67445a562f794749304669657770474a4943454d2b6454716c684b4a5777496b416a335231776c446674386861345a576441494947455152374e734e674b757734316e6f47312b4a627736474f6b6371703852514561717a317959744b71317276354862506a7432616a6a6f426255344a4b3731386162414a4a325137686c362f55617a565573736577436b496a5231473051434a763778567554715173707874506830546b6358697a63764137455a6d4f483471667155656d634f62643632795a414f4e654369426e436d595835496a47556d32514a49733776745a5a626d41654f4f49304149676e43655562565632706b5a4c41364e7834313344392f4c677a5537613468313539383537315161545a3752793042326761476f2f5a4757622b7357362f694443616759744f4d4b5a37694d6d455a357744336f514269695464416c38654236744c46613047515376376b50473043476d73796f6378725479395433712b4a55556d6c2f503368677a7378735772706e732f584b36654c5a3464734c37753065486f7141444b717a69766378377938654e676750336e2f7672366e4969323163544a676434613935693279695277584b5a35575a4b7a58572f546931394c784d554753646d3775343663475347664e332f776b704b526675523737794a397474425744395351624a442f4c75592b72574b684b43387170435975527a6d6871504b485054636d4439634c6c55363755493955456c654836725563475349744b637730456c534a36345354614d3270753936537a6534394b69736e6a616e536f303255425341515845795270754b4e2b70507652756a6e71695a34355057636451364f4845735332526e486a4d702f63484c382f6d6a456751537a784a466b674a414343424a6c6849463044674853556743414134626f5479726c434d6c785333414d563676565455624833514d30645347742f532b766b74427570544135516a6b32575372396c58366466635756582b456d53635051494f4761436e5a704a4c6f344e514f7975566b4d33624a414c35362b45424648584579524575796f772b5877435a474572624b35573357634150397278724b3145674265414f456c325a395861787267436d71685959367031357a7741424144647662556b674d39564b6e30764751656a76752f6437527868462b744a303276666a7a514f4d32716c3843547a356e6e597437516854522b66566f4a304e5a6e787879626b44535252574b5867356f706b61535242654b69546a4854484e3952504353394e4b772b73383549344d7a5852563731303757783138654a465a2f50696c586e2f2b6a3054667176454e4e66624c45313939365562597863773335423753766575585a755331396e4c36695351614e397141446c794c795a41324d53306f527752356d49367369436e56514477686e6c4f7653526c47757343434f6341494855625245492f5642464a44314a6a37756d63586a2b6c6474533956796c424f6b764c547657754d53464f796b744553736d5630324d3264723838465147316a783673327a682f56333270754f354b35366a76735564746d5a77397646556d4e366e553162586b576d677a7477657a426b4a485877443959616b4d504f694b706856397372464d6547493054715652317853415069356a33313166464247334b696c563356313035475a323933573568546d365647426c4c3937326975392f57456d543344634167666e4d4874773149425966376c6366667668684e546454694c78534832486e754b57584d5634726151776859654f564e494536773636443544384b514e694d42456a47442b6f41796679756b79524932674538784d6664764e4a626d54526c6e56694c695074517a7a777831714d70724f6674543663564a544f3833355078695a486370747062376f6461656f34644c5434306d344e71366743686267534a30756a51766c6d415958507a483644567656695a724d683736526e6857624949725558314d476d6b383570474f6a59494730516b33632f752b6734796e434b4c646f57754c754b6344346f4b65784a41756b724c7a675449564f2b2b4f6644564d2b4f325062347948554853642b387556472b2f2f62594b6d4351314d4a376268364e747a6d67307274755347395a784346587934667759564d5943594e2b6175526c746b416f5141496a744f48564b644d36564b686f744f526b44703856745532454e33787454453236414e6165494f482f6646584373697134752b583761705a6c594264597276774d514f786b454c4a6875416d526d2f343556784933564467503831765651745474617033323956646d6f4952564b723255316a6b7541654c32627a49397030574a38496a66766354764336504f646849696e6461654e56664c575243545a32335a535a62414752706b336353434f37676f39665a5850623670414a75324a644b6e5764666c6d5871345a74633233727838564331564535783751754c42585033504a46576237477442444f76504e757a5342567164304251705a61414443526e594c584e7866524f766a6d566a4d564956347476527157504a414c4841306663636257774a546165536c35456a505364352f4169525456394a4e7256346d68594f464c55474a5a486a46436d45706453504f46576f5a777a6a6a48694c6c6f6c68677168794d31412b4d396671787278534e50695536546b687963432f6a62644848363456725a35793132333175306b5975775545496446655656746b6e44656130727a574a2f516b33664b64556b717962414569644c5a487977664f346a6b56324257734175466876514f6a6d475a4a437641386f3069376c76503364352f78634272306b34764a4b784933614649486c666b64566347504a736872766f326168496b354e5439724a5544686838526b41414341415355524256505746696a552f762b4f492b384c444b4862613343704e746250557547673665387279445a45575468334750506a4938654c376b6236766c70462b6151715164492f56316148367a776d5137457a594c6f356c5137523464636255486473536f7a527941794238763755306b6437594833774d49476d58704a4845756572326935394e4335332f3736507a6b75653947316d63534a424270534e382f6f577231597376766d6762424466765237656a5939356d616143476975564e4c62454f65375951487a71635731542b38783441345838434a44715442476b6d554249515952416570636562794f4255656a393937507a6447627755374d684c4536706e524f675449414443333148396858566e75573054494a6c6d3477427151634e4a41446b5151487045314f50646b594d31716178586a4e7745794c353065727156344f6c6a505a686847417967745064786b3344574a75496537544a71733737467a394d57356468386c2f657a2b5231726c413268626554726e44784839757a6c746f3844784a5772617946424149685455395345672b2b754b2f4c4f352b6b503443346b59794d476174656f4d6e53527041393259776a71413972644b7639724d38597948436a723250542b6c7755514e756b6b63506839756966726f4c79527a33615772466261354d4131422b54764e6f4758326c2f3963416751466d78744e7770774d735844344e4635306c5861444343506c437177525931704b634142494d5071492f58464635397945662f4f526a535a4269415966796c424149687a68476f417961683533563062584f7554417953425975356a7a682f2b6567354879457375557a35765630396b435543415a6954464e674967664463445854526c734b535442496e496648526432532b4d4a7166543772512b6e6c7a617472587136773633343631546f4b31727a31304541516a4a69512f6b5869585164762f652f43467a434559526a517759343241766c4353496a652b794e786b6e474a61306a6d34746b52487271446f566e59554a514c534f6f32697465592f767056546c75587336547675364f374946777830656b66594f7062337a32644778594b4337557332676a58625a685236764946575a362f574e6b31474d63623962556c61553065794d36514349644f70675a4f6975764571436368796f52743537557279476c5a497541306e6c7458522f61537042307376304a4a4434664c516c4b5144687377444538596f436b463439714a46634970634168414d4a776f4b743734574b6c59746f51395571526b536a6b774f6e4650463361784a45436b5255447371497845325641506e53533039584c372f38636e57774536576a4839363462524738766865456835733341584b6b5970566e3058565478594a37485164495863564b554157586a36502b737a656c5a416d6b4679376a4f44783362332b3476774749435634417363724b4c444d645134506a5959536e717550437230696f744f70615a4d684a414f6c5572687a5847784a68344851344b344947494d39644f65586b7650636533626630655051776d6a5a6b6f7769757a334d764c38746752734956435a4b7164594c2f335054673466674141356f2b75624a4a2b43362f6f393757376376634f784d7037754357794d6264557741764370584b414a3053582b6c5478442b4f364c5056646d6a6a465a75694e7870367236716e723155306a59514c69525761533071516b7744536b56374b6e7859674547672b7a484537784f38666b79414d4c7a49686c48354c47496b325167555145373843544835516c365371756b756c4e4a474c6b384e7a6a6f67305857364e7646797272514e65454142436668494177516235776d6576655a343376586f68675065764b7831422f765731335644506c4e4e71676e7a6342766b34514c693342416a33482b704e314f625870554f7555594b6b546b686342326147473969786a4b4932636f377533764265685153683869397a31774c49414d516358482b3331424641346e7a68426478566e494e6a76774271702f54657a66756775776a504f3977654b7441464e5a5941474e633047416476305065752f385153467076424c5437462f5a4f49655735583735556a564d45536141504d2b76325a792b656a7836324c7a534b744a484f5a6f4a3230505649544d5330552b3958727478505368676933492b6c6961427a30417243306c61706c6c625534477a4c4668594166353972596936346f6d3173344230675643732f6a7468726278667145524e325430384e374a496b5a72794856747a56484a64346f6b72656f34446c586f366b455362666b53576f572b784647656c77514738514761624642656a7a476d444b3357464161314a6a77433044324f79594f3966486b7a4a796e4c695561325341724b7157304c693862684d38684d756b383876497a55694e65654d463973696a53662b6544362b5a6d43524169365362514a696f573532796b5975573665493172627576386d665744634e426138484b525a754955696c5339576a586a573643322b59455755464a4e306b6a763734746d443974716b576b6d6f7162555157515a4947774d6b4637352f5348554d616c57474c575868694e586a5541686e503662662f356e70536162755344525669696c5136704437476661566e45766b525943594a2b36654e596779766131396c5368535a52556a6251355571327171317563633230354f2f345842714165416747795345585a56357a4b39794e334e55656d696a42476758745a32336d6f39795266334b306539544d59332f5a75464977314138685736522f3255774d6b43365a4f416b687279596e4275724f454d41446b42536f3253646f67414d54326863634d414b54517a397436547a38476b485437316f33645267425a33492b4b773837693132346a4f553758667537696f48764d50762f4d4e5565493333342f4f4f57713668516369532b313273324d39445375547a4c536b78736d5a387a58584338324f5967707367486f377369354f432b66335a54374d6f693946476e704d2b456769465348626e557444344d2b6a486f6b534e6730735834376171396a77696b63387267585378313754617a5461763643784c69716f596165556136634e64372f6f782f516c4f362b4a4d43657745452f72326a355357544658712f78434268326c6f36544543623367575341324b6655316351636e485355596f786264634a46437a446c6357494e637633794d32616d2b7676442b664275735459686e614b31614b2b476272714a6d774b49735a594269463133715547434273507436497241487743426965437634622b53743832557a496c315a472f693743695a66634657314d4778306446556775534442586f66442b365a30786541484f6947777774544a416c62714963656b742f63524751395049313541424c31327833395a7738426b6f6d436161676e4a2b50334a396b672f48314242533845434c744b524c2b6c4e4b70373670516d714b7050306d73767632516a394d63714835325a75536541524e37556e6f785a53346553313357536d7a6674426863445063484e57326363645344482b78543452416f477062777742695149716b4f7148457471667333425769586a694879677146506f6b4a7333736f774c3179344161536d355770384549467a76744651724a4d64546b3332526e4b686d45397a444837373574695249354448523749373646367453396c6931754c6d32313444527a50624942526a63696f645545486d4a724d6f556b5043656a656b5346485637566b61666c5361456164416e514f374e5a4c6c42715544552b57304c435342386a34364b6f594b57597259436b5033436b4d636e59334151706b52347a7454696951373339415a6a72786c582f4a634a6b4c5242546b4c5a586e476649526d3830637771413767464b455071376830426e3341666271693442325172725561456f6b5334677a49485739394a57794f4d30414b3468766857307a5a357356724a76566c6639436448704635525233316874464b48774b396178614c6742676e69345a50694c453668463043345474737874616a75494c414b49503261774272474a3335392f6e4f6b6d735436684930516e726777534939756d767968686f65366364535074454877497356366c6e454d63745536633043444f794545414d4b36727274375056365a414e6d7575726b6e592b463151484d304c416e553977714176487074326d376531666d376a6e2b387259364e56466f69674144766e6767516e34664b547477494479505a303330316f35426a6545517a4e71536166616a5a67392f39376e76566b494363746d4951636d674b3657426872584d55524353436872755a74574a746535527461787455746b6659645246336f68637661387a554d2b776a34694d385434384b74376a6569674b4b7938753731666b7a555544566f632f792f57556c68654a3567775951744d52355358396e69436b71626d39763548357453614a6236696e4d344a4343624f634157745336353369467068496b4f53654c63317a66396e7646534738476b41354a437a5a345864424742434c356947433364476442797846414d696152686e416a416c73474948726742416a5a764a7137575a315447634258762f71667158334d7050566a6a4852367a4436774b69476956634555473953685261394c67654d41345a374a426f4144456b634249487947525531566f6736516b434a4272427955327a59365a505948454a784d683363766a5050305975334c362b59634c4b6c63334d756135724e45544f4754415954576e344437764261477a494c50797a596a386a7a7a6b3366636c507239655a774f30764f3148784466766c492b3174616b426f7559554c6d59545868425133536d54343346554d387a6b7762494f2b2b385858333732392b756470636a7479775a61563353383177514956496b527a7a77624141575547445948776349515671657431654d4e624951474f6d676a6a4f7269775947376c30622f347076735838546f33315277313661596a7a5552474432614673313858782b2f6c464d4730616934472f71317878357a72737465345631584e79497957554a6b47326c7546683155356b5539396b55494337554c79704f5864564a6f6b4c46346a674a494e6767674b79724e482f65556c774370314d474d4c7630594d645671547041654d68477878493178596a2b496b4847525074724f7639704255522f3452642b727270304c74703358723931742f725774373556335a6a64304959704931684e426f694c394767524767474561364f374f3939484377383373316446393558634d446d6e3362526c6f476b53664e70774a7a334474767a2f50434c2f6e61716943486f59785a466b7436316d6350774f5943437144593138414367416850633353302b4149776c79314157532b2b78586a676f453950535a6f65723535352b767676535a69313650742f2f30323955662f2f45665637645847536d7457686c64472f756a5254722f36717230656f4e62556b582f54797476363579796f35456b547a393978554435737a392f712f702f31535639386335526d6e2f635a346e5846433167626f3665777432486f78744d43385537786e723271734e6c6544456a594a7078447067596b6d4650675057384539577773302b416d484e513841534244366968424737725532656d2f66645a4a574f78722b6f67354f392f6546316a33514149556c4541366573626a68515970636d4853686271594674483244523742354853516e7a4b7275706d715359735a6830593665704c6f6d716a35725142514a513847334552706255377069495248735a6d7a446e66557a46394169536c56484a6b65373261415551313666594946594451376d6446443631612f2b723131312b756e726c367961724637646d3536672f2b34412b713932347379306856586255324272647658346d51352f4d636c7942774551694d525752443456703868732f7a48426d6e5366656e376565615245677634456b41325654417a3761483365503633313555556b6b4d6e6e31442b6e536f6e68482f77497356735a634136565a70753351535141626b4a6b56694142446d5a337a686d6650652b42392f2f317553414e2b72356e5a36776855726741774e6f5736555146735a5361662b6458722b376d704b33562b597a666a6363302b62324e393539382b6c596e323357706d4e314a62305850467135344f496a2f397a6336745373614b5a5839707a58442b693377382b427043754d6c686e53426b593042366348594173716f4e6e754a4644416831496854656e312f4d7a364f66536c59752b6a39737a74377976422f6f695575766439323936587150434f6355474850576562536d4c4f477a65434679324635754d686e5063583738476f334c397067437031334d636c79416d684f492b506b6d43745049514d725236706439366d6d673268786248594d506e6c3439534d354c776a6f677445685162486268355455427230652b5769734c6c5658464e6665304c5833693265756e355a79336937327132397a652f2b6333712f5a734c326d44736c7241706d6b6b51467450396f4e4237797743634a41494d7a76795a657759633659304b6f2f736f3565536b5a3969537a7a3653484b4d37536d6670694969526e67424a4c355a7a722f59797379484f7543506e684732516f714c68316b2f7078586f4f717830522b5647587872737441563636714f496f63646162372f35515462452f714a624b484132756231744266616b38356f324d576a3350394f6c51355161315a6b5465727a35317a6972626a527579583554637550315152565846376b6a707748316c64304c5743454c4e44414c5467414f514d66656b53375a5632434268334f506c4139426a347a456e6e754975463459706f4f6c5232444c57497751516362517565613441377156723053543839723372546a6d68367a2f66767a326a616b5131394e6163484c765336527250393962576f345037734b37763143684a44487672756a6639765a48783250656d414b6b544b43632b666a517a30672f5376536c47772f7a745157566a4f6c416d6478344c2b39464d475a46577844506e723375446d6a6b4a434254616f4338416f535a39556359624a7555724c312b304634767a4152437950572f50685a464e54627054477072594948773359774e775059444142764e644e386447656857376f793439495071365a44774a494876696845635352435a354151673252367059454e756139455a715532543946413959635973716b364552514559314538317466645463325431794e5247582b31397974334f31334f794d5a454b59474c59574e6f634a6375476575357063657a72474d5063507148326f6e4255547172586875575a6e377a68446f575831394b464843316f42414f7876756f4a35376e526f38484d6d4f724a324149514976654d376446765177554253564e724a715645446d3177736744453350784d3978645a463654356e4e4e5075466f4e42785470396673723364662b5273674a554b374f7631424c4d677856313076665967365849364768766a66523741474962706b396c77586a633543354f67486a7569377262752b39764d78584c735130626a52452f7141667765472b6a4a416d654a4546617141396d30493562364d546f4d6866396c3637624e2b38465238687a6d3368726274316d4b737061577a53573231324e6564796e426a585664456d4e6a50587a53382b66716c372f346d743238364a694f5764484b67756a6c4c6646636a3032574e39745a494e416e4377307a38716d63362f38446b4167704142304b597376337175304a394b5665784934654c2f4645654b7750397a6c584c5879475163782b47536b7831795261422f55586c4a776b46513839344779715132515179395758594c4966684c42457a6d2f49445748387737756877323173367a4d5633554332656f35342f506a4c634b3731612f787a68446b2f666b62656e2b2f4f6e4d756176636e7077634d454777532f33337572695477576a58632b6f776c7355634659504f555355305159795a31386e376b64345755346a3972436346447a4a46464559733349415948554b64505455545059486e4e4950433575646b59684b70707554787658782f3557504a67435342496e4246316a2b6459334641316f6a36766e494e51366557476a76574c6a4a444f6a6a4e656830305a353944446d4e363247752b41726661695533595249393347564465506664774d49474551486c584b326141706d325331513130714f453443434f35654f4246644a6d5347434341786c5656623777322b4c345a654230697157526c7a61535a42316c5633344568314151687466783670587977416565485a79656f72502f73467a344d67335a30484a3574335a6b596a6d62566645784e794d516f416a5141436d44414d75532b754132446472554d4545443164513632717131642f4559433079317553527272585675356e58744e497838306267795856684a764a56484c2f5261704b3243544e41444b68326d3238563965554d3258333638714d6e2b4e414e68737a487264374c7877434243414e616e5163424439372f377149536a586441735459574a64302f476b446a516c504246786e5a6856546b6c352f616578354738553547526169596e30344d693248765577364d76484c4a755139774948726e63524c4b6859672f4947424e6750786c4b6258656f6951346945782f7670657a4646587953446c464944484f56395373567a68324275712b75724f6f796a776b764f436f373172734554356f2b743862383846533536643752676532717336464935644d5137756361396c33684a32534e336872546c49644371464b517965484d535a756a4f453630326f2b665835573772312b507565484d3531715249634e632b586152456c52714948434f34596c58563232306b5552694273557a63594b5253686a30636b646d6d4a5a4475346130695a56476b7976776b54434e337941665553546e6853584956497247625338666e2f2f57742f4c5968374c6e546d4e392f48565373756949654738567765476854336c30437433312b6d526e41392f7337697067664c58695563376a7053372b64766464574b36473739372b6b42692f6449766b50333162564c4230576d4958452f4c61582f565965634355376c554b7a43584c6a55653279564372324455616b4d7541583152526a4173465156376e6c4332616f5130544f6e2b377a6841373168664c61304c336939317a332f76617275373038464952586a74314d424b79662f7165733649372b4a733531563374626c382b64382f6c55314177634d6d3272555a6a65334448676b775a796d4745446b50564a39624a424c312b66763341752f72322f4f3633755071764770446e7654756c5747424e422b2b4f36446f4a39536739395a624c354a465770354d68586a624856734b726268376a53364675656447703977527343704d7a45576d3951637435716458314b4d5a745a702b366656747252666c593657594e765266474a6462563974334d7647697a684c703155742b6966696a4f6e6f56707461307558566b4d2f374b4f4e4c31347461684353556c426a4a4e5950442b6a354e43436c46654c42392b6443624153532b475154425a7a4d4e41514965454f47484552707a7a6548456346512b7739385a69686c47624754334a6744446b46664e414f675833547747454832755277446850762b33582f2b726f644974336e5a6c34527676334e564771626d5933494f634434446b7658462f435936386672514b6a514267336e73644949773753334163765a62365a393962754c58716630765058414b457832725476527238705373363768742f54725a53485341746b6a416d504f57636d586e564141496e485654744e2b395075546e44534856684a4f62486a77784768643775775a794274712f4b4f6b352f612b4f4d4f5337546569306453306e796d6b62594c556c564a526679676f62535048503153756c5470526b6272686b7661656b43434c2f6676306448474c6c576c61304b6f62613344706b5155574d3850456a746534676a445932326550374967456f536b4654662f6348746f49746a414a6b596962674c74666b634f77707549554541434d38334d716747317a727670537552616f49626e443043494d7958353477512f464370644e7772627430743953666a656a33714d57773363736b7477775a7a724b5a6c4e5a774265347642554d62472b3273534a44617a54764138344a454b456874645637454f6c43505543434363722b354335624d705266695a32755136514d4b465754714745776351614f726e7a334f46313069636f4354367a564e637933646c744d4f537539586e6e507638352f2f67767a436e3652464859494438662f67525867347474694c4f6e477464635959366547326f6c5a6f4676682f5664536344684562554877664955614477754e7633754152706c2f2f644b6c6c4b56626c35445a53535737575a4b52536c42536b41345141674a6e534e493043486256466377505552366837432b2b66454579596e4a7a5176526632484b56456443394375623058366561393066645368742b3630466336385a45593072734162684c4f757551634c43354b5171694b34634b47312b73785431327762304c7358416c7058313362766a62712b493048754f79497679533862796f536c48654136674143567156504e486a785a716e2f5058716478706278776e332f3072542f7a2f706179466b6d654e684e71416f5447633262456f6a4d41426b44634c563764373245496e336b754976746b494342684668624378757053372b55454176744d3343325359614d4233754267314b3173715255706e794f566876746555564e746e6f636d324c5a424a71654747674945416a6b796d734d67664d78514c78332f3872336b384b6c6d705531785849314a6b4532716c57576d615667485043624a2b483453634949743752504f3253355a6967535a56327331717941415249766371594150312f6964762f74563532534e7461313731742b2f662b4d644758754c315a796158747354745247534d776b334a51694c4742494d3437675251456a66663977777a742f6a666c4e433557654f584c396373364d7a76673941494d7a4f3768686975564e717546633251727175465943306967417432524d676738717077586d6758446a757656644453336d654b334a57304e586c71644f6c7959454177764d75726437323338666c6a594a772f2b69746149743038346245716f3554556f4867764673367a384b4375707349495071595a6a2b656a6f36475573454d544155347a574155574553437a4e326a394659716c795a4d685a63797370676650567156386139497572786774754736742b78316d6c59444f4e62342f2f6e476d36484b6c4f786b4772386c5143445158616d576475424957324176466d6b6a7931424945546f303938797a3676456c35384b6549754f6b7a6977754d6f64456f395436314257534f53443658674c45626e4b744b3841616b5954692f49793542686944616762422b733272375a433963314a52595377745539504444565773374f6555424d2b4770343169466347546359394b59493844784a36453470554b556e6c63416946424d7669592b5663704a666873786d4871646b32437a656479386c70567a536d666e775577514341385352447536352f2b396465725631353570547176774d2f337676653936742f396878393551782b306a586e446c685131506b6e43575155724b6c626149476b374f572f487474506a453661436753516f596f5a3741507a4a414f6c534b617a58564e6679434c432b6d4c4b3649634f566136394b68435241346e4e68412b33594f796843376448554a393148707869466a5642314c7554367a3671484c6362355a6158784f68576a4c2f704f4c617a4d6d69416e7a307a59365037326e382f48464e7350376e6f6454302b5477547675436c42302b7a31783768356d64736872424746314b3676587153444d6e426542503553686a3745394c36617a5166396a6a526e67506e61564e6331394c7931745333724a76532f6a6e364f6a744232616d427a32382f376874392f772f53697650534c70756e6e654878384f4e2b3942475546485a306d6e4b6f6c686d326b4a4f4f7a4232644f4442676a3149514239525a4b502b782b51747a514367614644373074586a48684e754f6d48686950646e33454958413877384436654d724b2f64355232667968426a69544534796f574e3835444a67466e496c3573646f6a7344726c4c4777456b367744716b71482b65577951504f72657050773542382f55303039536f766765354955496745524c30514d4644673263496b482b385639397066724b563736694e4f38757a38662b762f2b2f4e363069724a51302b77634c6b5874547a79484b2b2b503843595354414f494731435538424f504964556e4a3138784937314842464342714b5a797a543433617548346b336131555730726a5a672f576c586b41514e706b764e73474b684a6d542b6e7765436d3635433245412f61704268336e7738386f494569362f33426e654e376b622f54356c74593038304d45504336756a6753352f71676a5a6847714c6830566158795552676d6a6b675278585272507354626f4b4b4736424a414846644f436553334a5052757144384f484145684951464a6b776f74464d77657051386f53647479694e3061394152692b2f79632f65753851494b78316d3636424d79414251706941382f45454848537573654f6b4f4331364e4a735142674254694577482b6d63704571364a783645756839655665704b676f536a71366c473868657576434d4138442b6f6a74415a743346414469345846474d66514d6a3478304643435248375230586941783155476e4a424830694f4e7a7a72426362503566532b3075656b52714e7146314d6455747151326651365135506944794e634a6736782b6a68596c6c79453435673469327a55423072712f3750502b3269382b582f33534c2f3153395977344b726c44762f2f4e373063747738676c452f38394758575a326c4b58595056724f4d355376466a484a55674367732f585056674a6b4855794a7874496b443656334c72336c7037625162544245612f506f365577616a485341794168695644467a4b455449495568444d6a6f4e6b42325637586833645672536b716b71387565576e62614b795864326c33754a574763506a4f6d6c48635a7754746459793659756e5037706c516b4559763658746c374a4a435a415571464d6b484b746e47675458614b43623051586e766657524d6d757239564b4e6c51426f69386435463148436f5a42417a68307830656d69426c684d2b39662f654750304e76596b7849616e6c4953427762476f6c49646d6d6b31796b6a334f6f764c6a396f6f3669593231494662554d55696261755a7436594264314b4f554b53394b6b497a4534686459546b2f6d6c666c50664439666656514243676e4a7157326966334d38434759647853376835303074524954324a50346b6c5863473536562b6d2b635a494e6b67424a6b4e533550393835734a7334796c48544f355a3243352f6c49524d6361614d6b4d5a6f6731626b74334a56504273682f2f2f4e5056622f387937396350617575344e2f34786a6571662f50763377684a4d2f6d5541586a33586a524c6a6d425646754d63656654734d7a64416f684473754a733341356b4a6c44704975453953727873425a454371483856516b483843684d2f5071327636773463695a686d505669324b7436323931506f4445414f622b536736426d5873327775317579784f4f46423936666b4c4c6a6e65584a6f7856357966312b686a71554c7271475079336662704d2f5932445a2f312b3350335a333276394c59644746426465556b4c563331657841666b48654e36464d5146515564717a66695a5a30714c6e394a317043506944514445786a52635770494c4b542f49394369315057576634655451784f787942486a4a6a72514a71522b7053556d413745765635454343514573397057535a426e7438662f6d52476e486f4f695261346f79687752303268446f644f62576d533832322b563648427666772b513346376478785564666e4f59626b354742504151685a7937423841504b2b79694e596c35626576714d424f7363336d52764c5a4c776a6742787863484e4a4c63527874534b355a784a79724d43546a7a35504c7a696166636a315841395146674a394d395774343359493737667151534d4f45716b6a653342553374384c62385a5872335a58762f456276324556693835372f38652f2f48644b383536767a722f3676502b2b4c4338554334486e676845465468675545555a77537a587570565670584475654155416e51316862697a6747635a723066695649624d5253584b486a754a4d69676f465231384179556e39684c69676a6e577574655236363668564b32366253374552414b7150506976767a5943386d5a5858755134533731626938525666556b4f484c4c312b786972572f736567302f376666653966686b6a625634466831554e4e6d31726848424d75426d7863677263727534506c476836493766702b614a3968644b3763764e676b5378436b59307555682f50616561774751705156666e3735566b586b51414d3479617459756b68556a465956794954734e396864636f34454e737279736a46364268436c5350597054324f6b69786753516835555359706f6f336a3536466a73725635494e37785746584e77763665727335596a734870362f57784b527463626f52714b744b4b447358722f464e6b4769494e6e4f6e446d6e544f576e71394f6e4c766d3566765457653436627453674336546e70542f722f4a494455597956576c615344483363447077715672343041496d666759305a79416752696330714148716f4f6b4c53583872316d41506b726c7a75727233337461395854553730327667444947322f637261592b653955626942634c49765a675346513068363253715141414941424a524546557749566b632b776e5573325067506c78674a41666c634854394d7a5a363149733965774e6c57755177444b5259754f56646b554245424641563252507277494f5558524b6a704d4173716553556337565859576b6d757264555862724a514f4544562b3872334a6a62665337482f776b366e435566653137303167434131724a674c617a424241336a6c4f4450774462722b7742376f652b5a6e774f43514a4144745356786f345470556173554c796c38515575684e4c76334163413466796b72374e3374706473484563574c7645483178675667477871624c4e7a3279517047506b6d33416b67636a596f684d2f33746a553241705672734d51746d4b7a463966764c48506e4e56614c73444248614d30416f654d494a4d366a526572695452395833793838727436326448636f6769487161324e75374d34797070747279744c4f64723135357a7676397a6f2b76753256745333645053304f414a494645594f37494a5a71417767594a5135612f42786e67543838576e48567038695367744e7464654552344e73693043426d6f4d7863704850693445632f374c636f4362535242766e4b7578514235515256554c4f542f2b612f2b55466d39373164396c36636a736c72714c63784653384179375133754a654d744a306d51394e4c6c732f47387648636f4958424a6370395059454c7868356a78324362577a4d613364345a584c774779567549304a3071516a5a4a43305270753764504432774c496c65714c4c796e7a566d6e674e7a396957753137726f74674b647330613944504b6b685a7031666b324f716c7571367a766b5453445636587442366f496a4e73466272554f4d4b735641382b743650504c7938665641385777696a76457643637164735439757161357142542b676f74734438416775794933753459493630636d5a41515131467975366c783137695655624747687a556454446f5366312b5538552f6c4b5143785a6f45486a567770425171524c477679797145424142425556435a48385875336b6a5478307045677939726a78597253352f4b6378527433622f354433392b774149584e39754a6e582f592b2f4f54444f303575625648796d636d7a7a765872687164505876507931474d47494c4e4849663677455268723561596346735031314a416e4165507776544a614c4e535771426450546e7763584858333771456b61774b514c303464564c2f3261332b2f657558716c414878662f33726231542f3974392b583678324f42714d7952334a5172506f4a6b79496f4c544a64476c6d38654b64424a43737455346742594d34416b686d2f4e5a746b7a72514f2b57463858636b5169414141424b534c5468364d776e53736c55435969334c4a727a547731765670557558717065566834594f66756557584c68534c572f64556549553135474b772f6b337970525841454c4a4c594530307530485657494c634c616c756844584f43766e427436756b59482b6b4c524b4e62483765586e4e4b547350466f4b686b515873446959713754554164795041436b694f41434a36555650726b434452666152314a4f357277313437355655707332527955696b69756b2f2b506e4e4c396f53496555432f5779564565676749593850525758466e36324655454a5a4d6745314e79335856703259774175776871596f6346463635446b6e30777634774b597637336436626c63716c5961566165794c384c37333469703044483132664d574e706b53705841504a6b4c706632516277475761644b415148335356657375304c524e63305252656831772f306b6b4f794c416f37413862676e4b4b353135416175412b62775a79314d49776e79387642423961752f2b697656467a397a7a68767a65332f7737657272582f2b6a616e4e6f4f486f354b56733255374472414f48616248786d704a34456b4f50314d73665679775262716c327049715a337346743143424866434e757254555a7542444142694468656b636f6e535a446537556843624b38654f52336e314968694132636e7136637668757553595a65344c652f65442f757176616645667a59693836433368333557524f6c49496c5839694c784d5044634159546a6f78496a6d467a4a75514d565533426353784d564f63342b6b2b31502f72786b694d49544f5347587056467a4868437a6641657439382b614d4a526535555751726433574d5243425270644b324751667568616f70593474637268456c6d33726172435149424833722b6b632b333142766679516c366d6359576b7151337237696e524e674d7a664f5a516b6b64756f36467939654e756e4241434b764c746f5339636d6d415342446b7952646b6e58425a793957547a2f31724b397a382b59744278374a69584d6e6c4b502f6a39736a77526b6a4634762f5166784871653841684b4d6553306c75366f307262726d5441484b6734464a3473594c7a4a75456e4d424d674a366f6f54514479764a4c692f7437662b32765636352b395a4938595871782f38532f2b5a62585766386f6244554453754f5a2b4d77505661537477516b64664d303653444f4c49534b2b7256485862492b3866496b694a6b756f5935307a58635963494b7742534569486c4a7555374b314935364e42423459383559496d31484466532b336548772f3071674f42634f4457794b333161387a394f6c3469346574726575544e54695a363138534b61336c4f5741412b6b486e4550585a326b456c484a474530302b685566674c42517351776765627a4965527057647861445833554c4d49323774322f4a32304f6856685167746171314b6138646b6f6877376f6e4a474d4f4e4875396e33516e62704b4e744b4f77536a57707a6f4c566255577339573836436e56532f4c674a2f6e536f35686f484e3372356a426a593645436f564b705a54617151714170797a352f6274767036666f7a434b4d57786c74496263747877544531456e5171465a714668685a394b456d2f4d3839376c6f4949487a67416a2f3254506e54624f7a796c616d32516654664938423548464a456c32396a31496d51673036416b692f4c73514432314e51314c456b4d74424b304b7252306549686a35474d57443948326a774a6d4f4f634f51467a494a32796b5152355769576e662f74762f324c316e2f374d56617363662f69645036742b372f642b72316f664f42635a78414a49456d7647574344517943347555646747414e6c55704c744c6e703573625a4d325737714d6332307966734c6d384c635139324a724d683444494f45396178564165483935725851584b553152546754497a70414a75654e6777576e355a796670337134707635507161434a565955587a7832646d486c5750564a57413864756d6447395570666d46714e656f355030536e596a7759675145626c345952702f65734d6f6e4e362f6471376f337032544971476564726e2f34766f68664b546a37796f44465a6c53456e476674374e6b304d4b625646494159466f327862654e73526d6c753630454d3164777563305257326e3969426b6b35424b2b5436734d4649794f436a7a647164584656376d47706563727535586b77306730304c5268722f64774c476f5574674d7a4f52735568626c72504b39473864745a36563433682b427a64326a4f626c3758486f637a37563139516670673452347a43506d74707966754c6934394356514d673348424b454276387861414d447070642f4936345a303553346b5339716e7a4c557373306171326a65726f727947774d6b44595a5666567841317737413366427553502f4b7746536a334c7a586a4f41584a5733346c642b355265716e2f2f634e52757435474a392f6574666c34703149546175464352356141764a6a3767677462445253446b796768744a6b4358707a584b79754a34625468632b2f694f417054637563377334317845444557666477326a55387a6d4447553663414a4764494c657363753461537043657a5a67763074577935506a4668564d37566c47556f6537376d5a752f6f3043673268564a315238635a4d373542542f582f596659422b724b727341683552764b4a444742456f2f4146686b5a44416e51576d5a51516959756e4a6f594e514639384e3437796d315462797a565662695a64483970544e323945564e7a7937686d556a6563715332414f49367948316d2b572b724b7a2f764c6252464a33356333464e5639544e4b4b363636725147783256743470415764456174363042766e77506d3565766b3863684f506c562f735041514a423077336641554b4e6b4f50593349674d677859466b75336d6c537335334c7a6873392f742b4569704d43526b5872434b525379467a32504d4f3943706a537557785a5035664b6f61435a726a6754426d464c4c357a744f527945734f6d716b68392b3439504c517873452f347a305a6778454f4d577a4c574171424853596c315738506f62334163644d654973746253304778623353384936716b397233587538356f3268542f38312f2f75337a5468727a79597166375a502f766e63682f47665379634f683263556f73437342304c4b4c4758574b6a776f703130444b755572373432787747636e722b365956342f31354b55343543676b574e46567172646d306f7449664f555a74592b50346e665a6c7848625948347656766a457a683633554369716c3663727351494c6c5a6e65794f48362b376465524673563356667a526c6d5a31586a6f62485452497a76616c414f6f2b6e477a385277555370654153704e4e67444d5348386b543936377361705842512f316631687453382b726b416b4f50585033747236765843665a436b47776b51765758586f504445705659313233565466436556714b46366d7a424676584651462f714a6e73473670766f616b435442305663485230774c51553066395645622f555236742f30585746612b654d4557634f444736554f466f454d48457a77786a36536c6355786959416d45323143634b6d6f44734b514e76555a4b7462743161723661315241344672516963767676534365786a4d7a3939334d64636e41736954395039444b61504347397833435241326d51584c444667654d67455174736d524a444b5932734c745741664a385a38624565696578766736665636737a30625965715138644f73364c4b795357717458583332682b71662f35482f305053376576313339316d2f3956765877666d7a4b79726e494b72586e52742b4c48724f6839764439346d552b38525947714745366c6f69595443536634324e5372385259414d32436b427071574b5232414a4477436b6244616e3576424a412b656145342b725550714643766e4f757a2f3339346e2f53504254385042444b2f313263437561577535784349707073374d613937694579434d4b4a355a6d6d4c56726b414241786d52564d526b4369396269536e34716c70545a665344773945514e657662315833746230415849346d303046584b5854726b4b3169677055367a75643768547a722f6956663763474465514657575241364c323135324175754f7a515571522f527654484b74646b4837674556306f5a366157567144575967417248426450476b785243664155335235547737366d3450775739747262763047734134693165324b7a6247774b4e54586966583045693975765a55314c30734c79766a572b76544643446d446b586c65744c72726f62416b6271514e38316d313731616a36736f5a515a47555a314d684b715965394b52627479304330366930473046764f77664c7a4d474151694c32313545714a7163564b2b39396d7a31572f2f7a507a546e5752424166764d3366374e366341387558565550565a547358423374516b5a2b49553762426670756575354f75723769636a5741504b3665326d67743536354832586d326447513831503247635238536772547453487368746b513962324f417443724668474e5967634b7071636e713957656e7243716f595a5739567a775847372f554d7543733362666e346369536c73724263737046645473497249796a674e48596c696a647a326d47376b77424d5147342b4a6e7043647357713471733331555a383430486f567152336573346a73356a6c62524d464750474947724c354d696f61615258666449343570586151746639525155366f31387647516d5271476a4e6776777a4f53717754644f4f797772415a476973323242335a414b3071444c56456b79326b31552b6c656f3636316976424242336c664e487a746d3247516b7a616452525233477839593142522b4c356d5858427859794b6949726c4f76746d4b6c6164757a384a4948765359636d59644331444b55664e33435a554257346d62596f36305965524b74315a6e6534346a7173672b566b627367324f6266556436744c4339306d30636e2b373468446f3171306b414f6f59306e36382b4f4c56366e2f3632712f36486c63663361742b2b37642f7531705a6f4a397356643249476141666378416b4d444c346564497444423554554f76714954386e4d4c6832716e4932486e467836755350644c386859594c444d6749746242513858597971617779516a65306c6633394b30324176583735512f654c4c6c2b794d574a3935337846306d4956566a4f35784737306672595a4e7548445146396b442b7a66447935614f46366d7156717531374c77675365794746315a5a70796d3144344c676962693755476f74334c79645a57354861356c44666943647a656b36497637783855485a4549707469426147465a6e33506f6844513741667a6358304b5a684372686576346369674469645465343743432b6b743548504476634f2b7a7034692f4d464d49784f4373516c6546336e306f71736a6b6670466657374c6a4a4c6576716a54566375306e324e2b2f7148704156653356554e4a47477a417067437032775a312b79506662355752436549354b635267497457566e4836675638525a656f6b637563554872676478476f554975554d50574164484773514a6b49796b6e3053674f314a423267575167644a59675a46727a734973414d454a2f66787a3536762f35522f3975676d6c456966356e642f354859304e4a6e6c506753345a7036684979615853357647694f35656f73513079576d716d6e785445354a34544645365930374f6e4b7a7664774b744b746b7a627767536c36376e7067414243664b49317066634a4e73695365747079336c504b58794b31354b2b3838705142736e6a37506564677666504f2b32366c6339412f3666335a376a766c7062797478685a777a74625769475233796e3056337034797231477a48646d3359515855374a37576462692f59546b6a574d645768636268734f76714b734d654559427a344b396f48423369364b7770453734673046377059507a65723561694c6f535339784b4376534f4a6c765a714271475467635235673045657176546c35365348766f50544962465536526a32586b6b306c656a6a4f37517735626c70595771766e5352632f4237753676576838554b4c34615242596e456761626255704b3870514936446f6935464f464762686d636d51444b7a745a367941566f7a78776b5279324a785467396d6c4e39365478566f3952684b45755a4a527531786f47774c49473249556b6b78446744433964706479425763372f795a7765702f6c596f46415932725541614176506e476e3151335a735374565a4b616a6f6838446d39736956567335446a634578413671555337424566396e764e6e70327a58564e5330522f4a315637317a6258755545577555674471434c6a7349466241746130784f414d693231424c414e793276424a36596e3333756e4c315971374d2f7352482b725739393448566f55534e71645048326953742b6b6873504e7779513976596f4c4f736f4567434157503054494342514268445a733666664157797669716451735143494d7845366c43436f4738586f7452545175754f56374a5954426f6259727a6b666e483962514b474e455054584c342b58697451464d4e6b655a587831426d4b52334169434443335973345a6371456e71783337656f727958436e5270415a4c43687945497456786c585a6c35474f755036686665776a776e767939494a6550767068582f49584c776b44537530326d6d5969584865354a36355274587370306a714b574f322b69722b666e5242794532766f39787943627857596a414866784b795773436f35373778493347545a3938554e426e50377732324c455447574e3466395251304472746a6e4b5a53462f34482f374f33374358346d6b6c38763375372f3675736a562f6f4c6d463474357136707a427745696d36346b4e39616254414b46344655363468644853757a67426b5a4968667965616e5a795156395942776b6b39756c754764524241474f656243707a47694f68504270424e44474d425a45527033656a617a3579682f6c7a3278634b736b7a5066667a384363614a597178593733534f2b7a744a3253506f6372397865786b376e59783549315170624b65496731477367326470462b416139334b7747694a774c5a684436764a2b396a4e674c646956766d485130316e4e4c365277416771626c654d6e497a634934687a4b54435238795237334e4c61634e56312f367571546d2f646169686b6f2b4b595a443355646d634d532b62636745734f726c414865634b5231462f4c356b5a77784d6f4f78444766564765727744707330416b7048773431777756537a637167533463734d664277692b387a4a6d5148666a3862307947434843424d69384d6a685472637267594430536e314c704a496741454f756b3468446563475764636968587a6262526e6c5157744b3358582f754d49375176793433332b372f2f2b3671686e713175336c48397475596c524a314a754a36354e3834585870546f574e4c6f474378786b794d7047466b48795155765844687464624d2b58496131537074745943516967516d514451456a596a434d656f353250493238574976692b4d35756c5352794c7061614d5544414f33492f3362753334487578356c5279764f34704f6b397738304270395443733161553558352f353679593445537a584b334e6e74416134514155434130514146344654676b744e2b4f616d414152643054496f4b2f65556e5730507075376445667269626d6371426a6f2b76644747687644576851545a6b5273376259713638344c336b6a6b3357763975526552544176687a636934453046514a71333844536c614d6747797344364e30584b436d413142497754544467672b626668543334584d4467784677624e464e4e497944684c37573446444a4b78657153354173634f4a477873644844516149487430546750444b37377a2f316f382f61486a365648394f2b6c444f6e704e7a4f64616e7a43585246735258744259544d684a662f706b58445a4137743236364e6e315669586951784a34657a7752524e6952666b314373747a5934477139653436586a727a326158383452674a4961674d735654717a34537679654f6b624767314b6978757542694e656552726b7a76656c6c5a6d45724d525458594153684f74314b2f3764305872766856594c4547324f4b463769504c6f4d30796f45377461765534387a4e50516733756c4b4b306e31765931724e2f32416d713871574d454d6a2b636e2b347642376b354a6961566e32426476457a316879396443494165376548676178474a54756858703078307a3050644d4d6275455347475174324a753034354b706a7254462f73424d4f502b416e46714d62514238394f4d6c6b555062376f3651636c525a616f6c2f2b444f7378366a6d792b4e306f4a414c527261344643584a3579394d325a623731414270312b697a757372417a5561674b36727a4842585677774961466854396c56645879656e3975365658376f6b41614f4a472b6951414756496c3238587a5a2b33666671414f5a7839386345736c712b4a6d326953383647476b507736532f31674136644463387453334c586b4d6b46707154786e4f655a69555657717a6f2f5a4f4779376a6c4f6f2b764564326b2b715a624f534b626d415252506b354d485535727a4c6648674e49473453746f3132752b6e444a683470634b6c30504a597148352b6d384445726c614d6e4b78744b65794a52763479415a56536c544b4c325a6b53522b7a714b78737661346a2f663351344b6e49747464504b476d4831327258797036616853326c56436e6138364f6961356f5768346c4369334b415273705452783248642f417a59745467586f62366b5257565438534471584977626f796574564a6e65504b454f416379354b38415054306d54486e5a6a554653444d567031764e6b2b7649356d597a4473497259416a3167746c7a55545041353050746b4934504a3274774e497544354961636449704d48636c30474b354c61536e53413036356f5652766a757a55556e6368707275783451312b796a2b717574786e4f41524a7a554131346162676f506c75334f6c6a7237736c465354666c63504b67432b6c384d71656a592f6e2b653049466147575a697471396f42364a513472627834455334557251724f55774375624e56536a6c432f5a52663751554336644871325459552b6b424665334758756c537561454e473054336e35786e6e514a4d5241716b6a2b79624f4f2b53626342714b6c756f53366d36753331304e2b514d71672f374f6c55377932446d497043396f3438744369316a653774524d366a2b586a7875736c5a45445161335478666d2f79384d77747742334f6556645877632b33784366586d6b6d52704370426d3262696461722b664c74493071434871544f666d49634c5048546c564242574438426a49714d31716b6b72536e503461473946636e33714875756644486f7569566d306461773136334776587a4d33632f5034616630494f314d63394e4d6365523079785548696535786851704675546c7054764574466d5366474141594b366977502b6e762f7a4d706e486b4c2b6e766b31505869624e4c7178454c434942306c6c4b646c6b334f724e6e4b315174714338637a364f7a794a324f734146385054494963526662364e575a494f512b71576a75345376437272743548634e77344c54595172695937537749377872767577525844676e337a2b712b4551484b346f556247526b4f776c59394345346775734948674b4c78426b4e414f5139654e786a33712b502f6951467936765345416265784654304b4270534334644c695a6a5a494d7939536d7934634b737052506c5559724d47705173384d3863376e3446494142426361372b2b6d694436426a74495a63424b5a7365446d6b4d58497a4d3864484d37465a6d675053437955687339666e4d7367686c564b52636e6a754176624843396448696663514a37327077564b52717a357668304368554c544f5641306f4d50336a3075512f674b51517736765578675542526d704b746b72564e374f6e2f6c59796d38757978784a3961587a58684c2b7365524945306a375269704957796d703364582b5158415046384c57534463707a6372746653773244382f547277346a6b3650444a53637241444b6b4169796b5133747271456831454b54334d72324a76475a73684e64553151484a366335564f332b4768315831694c4e43586a4d41744b454d44376445316351704a325571726f48456f766a4b636267534472673838627056724b6e704566393961796461716a497635424d5a366330496c49352b385943506b306875634e314c793374482f344e676c64586438476747304759417355693339304a6342446572454d6f434f3835423557424a7161694435433943374a386549454861682b74532b356e337939674d4c66435456617765715667324f70584a79385976617869662b30546f342f68583441302b742f6148563972716d4a6d563634794c69634f306875524e633364333966714638373739336e586e576d6c696d645269465472316a345271624d62475363504c6447636d5a716251424946583276525956544c446a454b6c555a577a6e70714955747464526167683867476c4437735466492b437863576d345076703762506a515364676e394a446d7259746e33654e696742795a536a6d6735773965795936767174685848684a6f3466773959382b634d5165565976726a63675935377862436f5279505144437561686435377a62366772444e5a6b58416d43615370426d784b496b3573654d7a4d63327577416970517570367a446b6c4361383379514f46394864426b63434a442b536b6d5150355a6c44473971467530355573456c394f4933755342765673532b4155494e643936306639374d335978425a703946736e553736653574556b515248456d367356337a6a594c383866315a4f48624e427875566d75485a74764c7238314450577a322f636e584d5736706f436a6d78347871446178516873354d7271733070637a4f494c3078476247566468455633584c31313931697278642f37307265724e4e392f5556474470347a4a792b306555586949474d36664345754966654c57774a322f646a746f57736e506436543543446e617a417a7743754d3746476f2b4d695755315a50504d46626d566b43425459394656424f345077546f3270762f5272434e475a5754324c74666e75357748596763517a342b6463783048494f473966716c797a7258532b494e5173575a64636a79765677413171616e484551694f41712f4f36646439667561695750586644516e533169486149444f6b6d597256624f4e376c4979574b6c5671497946756a3153756c414b6b6f5a63325234656e625a7a494554474f547775516669334d6757356f6a555a73454a67576f6f58676c7a6168573546694532495267526e677932762b5a514f6b525277316a37434e6375324b6479324e34424d416372353356636d596e3674652b394c506d584f2b2f63454e70356a4d50346f63725a7970534f71484355497157514b4533306637466a7a495575326671733939376e505671352f2f4f5250616a7a2b3458763377687a2f55794c6f5a653457474a364943383650627338356436704352417348646e516c332f5a4c474a61786f316e49326f56614a756769737a54313941636a5943416d4157346f2f4d58684873624d79512f44436d56304442534946494f3753535064344252595256464e5430554d332f783439746b4c3934663258706d49474a6465492b464b6b75324f44414b627869524776783932374e33322f55307132684b5941694945794545306161447242336d2f744b46394c467a3445434c5452444154482f3536364f752f3371723036535856315854647032743653786a5a307864686d6c5436624c2f4939523862315337635759456e65706a5a313858597556786b4c304b3766725a7469494672556878654b446f536843444f3943675659507875784a592f37494f49455056494a34633435765a796549334336744a5871755a47386c335a556673625070464e6942484e36314a6a485663656a33376b656d3568484f6938696a535736774f79553171766f3742784a59496678466264566970515a446c71434f71664e7761335736737a415776586c4c2f397339584e662f72496c78702f2b344532314e58716a6d6c6446484c2b76655279436771574f6963687a564671475169514f71476d6b6d547365617034366850584b6c544e7566304f5a414954366f782f2b3249533274686471715a4950544d51486172364137722b7537745a4537472f6669365964366f45523636734d41516a794b312f3666485878346b57646638644e45443736305a2b34585642337356457558426d4d71564e6a7077336752347537427543535a704d416844476c313050383078724259416b352b774e643734374f7a39795379657271344838624a623661616569424f68314244323261474d58364450524743635047356a332f50717841716f647a79726e6b414f4c4552617459585832616b67754137305366725a33564575482f4e4142784b6f414945472f5578304255336d4378306a354a4a4b5a6a68723952324b542b6243373178492b2f7174535166715645643668472b4b48615758617139746935585752314d68736331324142794a36706d515130725038436b42596872674641657555314155644b3276545871415431364c4d536b496f7332714b76363534775641454b5a6b784b7333426a42314353476452426b6e595836384f6d6656714147446a466c6d6a584f524d67334d3977363671796c5339584c346e37512b42335a7536367a505752356e64772f6330794c6e6d7a47444e74536b7450317a304157565833787546683666524b566547387a307a46754f69726d6f634f52373535343035305a6c794a314a4950483234354e5878504f56675131713469317168307432624a78534c4f456f796a5378734c3466374e2f2b612f4d6f4633374b34344e327a6d766264694a7149436d3953375544453549494e3961466a6a336253336d3975647673354b475863396f4e46714273445a4b4a5a3675507168367a513665725a73584139742f594b5a3050685956485232746f6445627457634435362f53376c6d4564643535503062565032446b7963564d4f4c3337534531694e4235757a70476f786e467a476155326d35486c33716449336e5778346d636435366b6b39653950526a707073646a583766485249514931367262487237356f6f4935396941644633656b4f6d45365a575635646466743639736b776d2f6530706a67675a4167474966576f625769415a435336566d614b752b724c6f543339316f46454c7651644165574943567774523839584a56384837717869423769336972462b7842445a686d6a2f354c5042644537596441, 0, '1970-01-01', 'lawyer', 'Graduation', '2016-06-22 07:16:06', '2016-06-22 06:42:28', 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `visitorRegistration`
--

CREATE TABLE IF NOT EXISTS `visitorRegistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldValue` text NOT NULL,
  `formOptionId` int(11) NOT NULL,
  `uploadMediaId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorShareExhibitor`
--

CREATE TABLE IF NOT EXISTS `visitorShareExhibitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorId` int(11) NOT NULL,
  `noOfShares` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitorVisitedExhibitor`
--

CREATE TABLE IF NOT EXISTS `visitorVisitedExhibitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitorId` int(11) NOT NULL,
  `flag` binary(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
