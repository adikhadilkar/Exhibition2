-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2016 at 02:05 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `link`, `type`) VALUES
(1, 'http://radio.tekticks.com/uploads/makeinindia.jpg', ''),
(2, 'http://radio.tekticks.com/uploads/makeinindia.jpg', ''),
(3, 'http://radio.tekticks.com/uploads/makeinindia.jpg', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `name`, `emailId`, `mobileNo`, `password`, `otpVerified`, `gcmId`, `createdOn`, `modifiedOn`) VALUES
(4, 'aditya khadilkar', 'ak@gmail.com', '9999999999', '123456', 0, '', '2016-05-06 06:24:58', '2016-05-06 06:24:58'),
(5, 'reshma', 'chandanvidyarthi@hotmail.com', '8149662817', '123456', 0, '', '2016-05-26 11:19:24', '2016-05-26 11:19:24'),
(6, 'robert', 'robert@gmail.com', '9373728727', 'robert', 0, '', '2016-06-01 10:49:21', '2016-06-01 10:49:21'),
(7, 'sandeep', 'sandy161192@gmail.com', '9022216857', '123456', 0, '', '2016-06-02 06:06:31', '2016-06-02 06:06:31'),
(8, 'Ranjeet Bhardwaj', 'ranjeet@gmail.com', '9876567432', 'ranjeet', 0, '', '2016-06-07 05:50:03', '2016-06-07 05:50:03');

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
  `flag` int(11) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `visitorProfile`
--

INSERT INTO `visitorProfile` (`id`, `name`, `profilePic`, `gender`, `dateOfBirth`, `profession`, `education`, `createdOn`, `modifiedOn`, `createdBy`, `modifiedBy`) VALUES
(4, 'aditya khadilkar', NULL, 0, '0000-00-00', '', '', '2016-05-06 06:24:58', '2016-05-06 06:24:58', 4, 4),
(5, 'reshma', NULL, 0, '0000-00-00', '', '', '2016-05-26 11:19:24', '2016-05-26 11:19:24', 5, 5),
(6, 'robert', NULL, 0, '0000-00-00', '', '', '2016-06-01 10:49:21', '2016-06-01 10:49:21', 6, 6),
(7, 'sandeep', NULL, 0, '0000-00-00', '', '', '2016-06-02 06:06:31', '2016-06-02 06:06:31', 7, 7),
(8, 'Ranjeet Bhardwaj', NULL, 0, '0000-00-00', '', '', '2016-06-07 05:50:03', '2016-06-07 05:50:03', 8, 8);

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
