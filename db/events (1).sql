-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2012 at 06:47 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `events`
--

-- --------------------------------------------------------
DROP SCHEMA IF EXISTS `events` ;
CREATE SCHEMA IF NOT EXISTS `events` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `events` ;

--
-- Table structure for table `billinginformation`
--

DROP TABLE IF EXISTS `billinginformation`;
CREATE TABLE IF NOT EXISTS `billinginformation` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `creditcard` varchar(45) DEFAULT NULL,
  `creditcardnumber` varchar(45) DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `cvv` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billinginformation`
--


-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `booking_status_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_booking_event1` (`event_id`),
  KEY `fk_booking_booking_status1` (`booking_status_id`),
  KEY `fk_booking_payment1` (`payment_id`),
  KEY `fk_booking_buyer1` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--


-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
CREATE TABLE IF NOT EXISTS `booking_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_status`
--

INSERT INTO `booking_status` (`id`, `name`) VALUES
(1, 'successfull booking');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
CREATE TABLE IF NOT EXISTS `buyer` (
  `id` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phoneno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--


-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `details` varchar(1500) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `eventstarts` datetime DEFAULT NULL,
  `eventends` datetime DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  `eventrepeats` tinyint(1) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  `eventcategory_id` int(11) DEFAULT NULL,
  `privacy_id` int(11) DEFAULT NULL,
  `webaddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_privacy` (`privacy_id`),
  KEY `fk_event_eventcategory1` (`eventcategory_id`),
  KEY `fk_event_venue1` (`venue_id`),
  KEY `fk_event_host1` (`host_id`),
  KEY `fk_event_logo1` (`logo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--


-- --------------------------------------------------------

--
-- Table structure for table `eventcategory`
--

DROP TABLE IF EXISTS `eventcategory`;
CREATE TABLE IF NOT EXISTS `eventcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventcategory`
--

INSERT INTO `eventcategory` (`id`, `name`) VALUES
(1, 'Business/Finance/Sales'),
(2, 'Classes/Workshops'),
(3, 'Comedy'),
(4, 'Conferences/Seminars'),
(5, 'Conventions/Tradeshows/Expos'),
(6, 'Endurance'),
(7, 'Festivals/Fairs'),
(8, 'Food/Wine'),
(9, 'Fundraisers/Charities/Giving'),
(10, 'Just Testing'),
(11, 'Movies/Film'),
(12, 'Music/Concerts'),
(13, 'Networking/Clubs/Associations'),
(14, 'Other Entertainment'),
(15, 'Other Events'),
(16, 'Outdoors/Recreation'),
(17, 'Performing Arts'),
(18, 'Religion/Spirituality'),
(19, 'Schools/Reunions/Alumni'),
(20, 'Social Events/Mixers'),
(21, 'Sporting Events'),
(22, 'Travel');

-- --------------------------------------------------------

--
-- Table structure for table `event_has_tags`
--

DROP TABLE IF EXISTS `event_has_tags`;
CREATE TABLE IF NOT EXISTS `event_has_tags` (
  `event_id` int(11) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_has_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `event_has_tickets`
--

DROP TABLE IF EXISTS `event_has_tickets`;
CREATE TABLE IF NOT EXISTS `event_has_tickets` (
  `event_id` int(11) NOT NULL,
  `ticket_id` varchar(45) NOT NULL,
  KEY `event_id` (`event_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_has_tickets`
--


-- --------------------------------------------------------

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE IF NOT EXISTS `host` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phoneno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host`
--


-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

DROP TABLE IF EXISTS `logo`;
CREATE TABLE IF NOT EXISTS `logo` (
  `id` int(11) NOT NULL,
  `logopath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logo`
--


-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_mode_id` int(11) DEFAULT NULL,
  `payment_status_id` int(11) DEFAULT NULL,
  `billinginformation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_payment_status1` (`payment_status_id`),
  KEY `fk_payment_payment_mode1` (`payment_mode_id`),
  KEY `fk_payment_billinginformation1` (`billinginformation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
CREATE TABLE IF NOT EXISTS `payment_mode` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `name`) VALUES
(1, 'COD'),
(2, 'NEFT'),
(3, 'Cheque'),
(4, 'Counter Cash'),
(5, 'Pay at Event'),
(6, 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE IF NOT EXISTS `payment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`) VALUES
(1, 'TEST'),
(2, 'Requested'),
(3, 'Authorization Pneding'),
(4, 'Success'),
(5, 'Failure'),
(6, 'Error'),
(7, 'Cancelled'),
(8, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `privacy`
--

DROP TABLE IF EXISTS `privacy`;
CREATE TABLE IF NOT EXISTS `privacy` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privacy`
--

INSERT INTO `privacy` (`id`, `name`) VALUES
(1, 'private'),
(2, 'public');

-- --------------------------------------------------------

--
-- Table structure for table `servicefeetype`
--

DROP TABLE IF EXISTS `servicefeetype`;
CREATE TABLE IF NOT EXISTS `servicefeetype` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicefeetype`
--

INSERT INTO `servicefeetype` (`id`, `name`) VALUES
(1, 'ADD fees on top of total ticket price'),
(2, 'INCLUDE fees into total ticket price');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL,
  `ticket_type_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `salesstart` datetime DEFAULT NULL,
  `salesend` varchar(45) DEFAULT NULL,
  `min_per_order` int(11) DEFAULT NULL,
  `max_per_order` int(11) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `servicefeetype_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_event1` (`event_id`),
  KEY `fk_ticket_servicefeetype1` (`servicefeetype_id`),
  KEY `fk_ticket_ticket_type1` (`ticket_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--


-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
CREATE TABLE IF NOT EXISTS `ticket_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`id`, `name`) VALUES
(1, 'Paid'),
(2, 'Free'),
(3, 'Donation');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
CREATE TABLE IF NOT EXISTS `venue` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `toshowGoogleMap` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_booking_booking_status1` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_booking_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_booking_buyer1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_privacy` FOREIGN KEY (`privacy_id`) REFERENCES `privacy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_eventcategory1` FOREIGN KEY (`eventcategory_id`) REFERENCES `eventcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_venue1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_host1` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_logo1` FOREIGN KEY (`logo_id`) REFERENCES `logo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event_has_tags`
--
ALTER TABLE `event_has_tags`
  ADD CONSTRAINT `event_has_tags_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_has_tags` (`event_id`);

--
-- Constraints for table `event_has_tickets`
--
ALTER TABLE `event_has_tickets`
  ADD CONSTRAINT `event_has_tickets_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `event_has_tickets` (`ticket_id`),
  ADD CONSTRAINT `event_has_tickets_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_has_tickets` (`event_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_payment_status1` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_payment_payment_mode1` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_payment_billinginformation1` FOREIGN KEY (`billinginformation_id`) REFERENCES `billinginformation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_servicefeetype1` FOREIGN KEY (`servicefeetype_id`) REFERENCES `servicefeetype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_ticket_type1` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
