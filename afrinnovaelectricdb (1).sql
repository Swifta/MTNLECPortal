-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2014 at 05:18 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `afrinnovaelectricdb`
--
CREATE DATABASE IF NOT EXISTS `afrinnovaelectricdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `afrinnovaelectricdb`;

-- --------------------------------------------------------

--
-- Table structure for table `adminrole`
--

CREATE TABLE IF NOT EXISTS `adminrole` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminrole`
--

INSERT INTO `adminrole` (`id`, `name`, `description`) VALUES
(1, 'admin', 'admin'),
(2, 'superadmin', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `datecreated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `datecreated`) VALUES
(1, 'liberia', 'password', '2014-01-31'),
(2, 'backoffice', 'password', '2014-01-31'),
(3, 'coach', 'coachile', '2014-01-31'),
(4, 'oonwuzu', 'onwuzu', '2014-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `admin_adminrole`
--

CREATE TABLE IF NOT EXISTS `admin_adminrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admins_id` bigint(20) NOT NULL,
  `adminrole_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin_adminrole`
--

INSERT INTO `admin_adminrole` (`id`, `admins_id`, `adminrole_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

CREATE TABLE IF NOT EXISTS `audittrail` (
  `id` bigint(20) NOT NULL,
  `originator_name` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `action_performed` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `originator_ipaddress` char(30) DEFAULT NULL,
  `originator_id` int(11) NOT NULL,
  `originatorschooladmin_id` int(11) NOT NULL,
  `originator_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audittrail`
--

INSERT INTO `audittrail` (`id`, `originator_name`, `date_created`, `action_performed`, `description`, `originator_ipaddress`, `originator_id`, `originatorschooladmin_id`, `originator_type`) VALUES
(4, 'backoffice', '2014-01-31 09:46:55', 'CREATE', 'CREATE - on ADMINS', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 15:18:29', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 15:24:30', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 15:24:38', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 23:23:37', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 23:23:45', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 23:23:50', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-01-31 23:23:56', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-02-03 11:25:58', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-02-03 12:43:02', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-02-03 12:43:18', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-02-03 12:54:14', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(4, 'backoffice', '2014-02-03 12:54:24', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(5, 'backoffice', '2014-05-31 16:48:16', 'CREATE', 'CREATE - on ADMINS', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(5, 'backoffice', '2014-06-02 07:11:11', 'CREATE', 'CREATE - on EXCHANGERATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(5, 'backoffice', '2014-06-02 07:33:24', 'CREATE', 'CREATE - on MINIMUMRATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN'),
(5, 'backoffice', '2014-06-02 07:33:37', 'CREATE', 'CREATE - on MINIMUMRATE', '0:0:0:0:0:0:0:1', 2, 0, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `errorcodes`
--

CREATE TABLE IF NOT EXISTS `errorcodes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rate`
--

CREATE TABLE IF NOT EXISTS `exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lsd_value` float NOT NULL,
  `timecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `exchange_rate`
--

INSERT INTO `exchange_rate` (`id`, `lsd_value`, `timecreated`) VALUES
(1, 500, '2014-01-31 14:18:29'),
(2, 200, '2014-01-31 14:24:30'),
(3, 210, '2014-01-31 14:24:38'),
(4, 900, '2014-01-31 22:23:37'),
(5, 150, '2014-01-31 22:23:45'),
(6, 250, '2014-01-31 22:23:50'),
(7, 850, '2014-01-31 22:23:56'),
(8, 230, '2014-02-03 10:25:58'),
(9, 22, '2014-02-03 11:43:02'),
(10, 2, '2014-02-03 11:43:18'),
(11, 50.9993, '2014-02-03 11:54:14'),
(12, 300, '2014-02-03 11:54:24'),
(13, 404, '2014-06-02 06:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `min_transaction`
--

CREATE TABLE IF NOT EXISTS `min_transaction` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `min_transaction`
--

INSERT INTO `min_transaction` (`id`, `amount`, `datecreated`) VALUES
(1, 400, '2014-05-30 15:18:42'),
(2, 300, '2014-06-02 06:33:24'),
(3, 415, '2014-06-02 06:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `msg_notification`
--

CREATE TABLE IF NOT EXISTS `msg_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionhistory_id` varchar(11) NOT NULL,
  `subscriber_number` varchar(256) NOT NULL,
  `token_generated` varchar(256) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `partner_balance`
--

CREATE TABLE IF NOT EXISTS `partner_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `account_balance` bigint(20) NOT NULL DEFAULT '16',
  `maximum_amount` bigint(20) NOT NULL,
  `minimum_amount` bigint(20) NOT NULL,
  `paymode_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`paymode_id`),
  KEY `paymode_id` (`paymode_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `partner_service`
--

CREATE TABLE IF NOT EXISTS `partner_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Last_update` datetime NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `partner_service`
--

INSERT INTO `partner_service` (`id`, `Last_update`, `Name`) VALUES
(1, '2012-07-24 15:34:37', 'School'),
(2, '2012-07-24 15:34:47', 'Electricity Company');

-- --------------------------------------------------------

--
-- Table structure for table `partner_service_unit`
--

CREATE TABLE IF NOT EXISTS `partner_service_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `payment_mode_id` int(11) NOT NULL,
  `has_admin` int(20) NOT NULL,
  `sc` varchar(30) DEFAULT NULL,
  `school_code` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `payment_mode_id` (`payment_mode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `partner_service_unit`
--

INSERT INTO `partner_service_unit` (`id`, `partner_id`, `name`, `payment_mode_id`, `has_admin`, `sc`, `school_code`) VALUES
(1, 1, 'Judith Foundation school', 1, 1, NULL, 'JF'),
(2, 1, 'Raneh Christian School', 2, 1, NULL, 'RC'),
(3, 1, 'emmanuel schools', 1, 1, NULL, 'OC'),
(4, 2, 'Opeyemi Community School', 2, 1, NULL, 'OS'),
(5, 1, 'kaka schools', 1, 1, NULL, 'KS'),
(6, 1, 'Catherine schools', 1, 1, NULL, 'CS'),
(7, 1, 'Modupe school', 1, 1, NULL, 'MS'),
(8, 1, 'Ayo schools', 1, 1, NULL, 'FS'),
(9, 1, 'Fidelity Schools', 1, 1, NULL, 'SS'),
(10, 1, 'high schools', 1, 1, NULL, 'HS'),
(11, 1, 'maroko high school', 1, 1, NULL, 'MH'),
(12, 1, 'opeyemi community schools', 1, 1, NULL, 'OP'),
(13, 1, 'DANIiel schools', 1, 1, NULL, 'DS'),
(14, 1, 'Ghana Comprehensive School', 1, 1, NULL, 'GH'),
(15, 1, 'Crown Court Schools', 1, 1, NULL, 'CC'),
(16, 1, 'Opeyemi comprehensive school', 1, 1, NULL, 'PS'),
(17, 1, 'Etim Okon Schools', 1, 1, NULL, 'EO'),
(18, 1, 'kachi schools', 1, 1, NULL, 'KH'),
(19, 1, 'Akane Schools', 1, 1, NULL, 'AL'),
(20, 1, 'Surulere School', 1, 1, NULL, 'SU'),
(21, 1, 'Richy Partner Schools', 1, 1, NULL, 'RP'),
(22, 1, 'Doh Liberia Schools', 1, 1, NULL, 'DL'),
(23, 1, 'Nadien Schools', 1, 1, NULL, 'NA'),
(24, 1, 'richy schools', 1, 1, NULL, 'RI'),
(25, 1, 'Foundation Schools', 1, 1, NULL, 'FD');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE IF NOT EXISTS `payment_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `last_update`, `type`) VALUES
(1, '2012-07-24 15:37:16', 'FLAT'),
(2, '2012-07-24 21:57:22', 'VARIABLE');

-- --------------------------------------------------------

--
-- Table structure for table `person_info`
--

CREATE TABLE IF NOT EXISTS `person_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `identification_no` varchar(20) NOT NULL,
  `payment_serviceunit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`identification_no`),
  KEY `payment_serviceunit_id` (`payment_serviceunit_id`),
  KEY `identification_no` (`identification_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schooladmins`
--

CREATE TABLE IF NOT EXISTS `schooladmins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `emailaddress` varchar(255) NOT NULL,
  `schoolid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `dateregistered` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `status_codes`
--

CREATE TABLE IF NOT EXISTS `status_codes` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `name` text NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `payer_id` varchar(50) NOT NULL,
  `payer_name` varchar(50) DEFAULT NULL,
  `payment_ref` varchar(100) DEFAULT NULL,
  `fundamo_id` varchar(30) DEFAULT NULL,
  `status_code_id` varchar(20) NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `last_update`, `person_id`, `amount`, `payer_id`, `payer_name`, `payment_ref`, `fundamo_id`, `status_code_id`, `reference_no`) VALUES
(1, '2013-11-19 12:30:13', '111222333', 8000, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '186957212047'),
(2, '2013-11-19 12:36:44', '1112223303', 8000, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '015103324561'),
(3, '2013-11-19 12:37:27', '90111224322', 80088, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '808859762809'),
(4, '2013-11-19 12:37:27', '90111224322', 80088, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '437115606635'),
(5, '2013-11-19 12:37:27', '90111224322', 80088, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '726498351271'),
(6, '2013-11-19 12:37:27', '90111224322', 80088, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '017350530261'),
(7, '2013-11-19 12:37:27', '90111224322', 80088, '329839823', 'onwuzu', '3732723878', '30278998328932', '01', '957471735545');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(100) NOT NULL,
  `meter_no` varchar(100) NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transaction_id` int(11) DEFAULT NULL,
  `redeemed` tinyint(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `repCount` int(11) NOT NULL,
  `origTime` varchar(100) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `reference_no`, `meter_no`, `pay_type`, `transaction_type`, `status`, `last_update`, `transaction_id`, `redeemed`, `date_created`, `repCount`, `origTime`) VALUES
(1, '164366019756', '111222333', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:30:05', NULL, 0, '2013-11-19 12:30:05', 0, '2013-11-19 12:30:05 +0100'),
(2, '186957212047', '111222333', 'OTHER', 'VENDREQ', 'COMPLETE', '2013-11-19 11:30:22', 1, 0, '2013-11-19 12:30:13', 0, '2013-11-19 12:30:13 +0100'),
(3, '335033418996', '1112223303', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:36:35', NULL, 0, '2013-11-19 12:36:35', 0, '2013-11-19 12:36:35 +0100'),
(4, '015103324561', '1112223303', 'OTHER', 'VENDREQ', 'COMPLETE', '2013-11-19 11:36:53', 2, 0, '2013-11-19 12:36:44', 0, '2013-11-19 12:36:44 +0100'),
(5, '819424135743', '90111224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:37:19', NULL, 0, '2013-11-19 12:37:19', 0, '2013-11-19 12:37:19 +0100'),
(6, '572688959354', '90111224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:37:19', NULL, 0, '2013-11-19 12:37:19', 0, '2013-11-19 12:37:19 +0100'),
(7, '966516191232', '90111224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:37:19', NULL, 0, '2013-11-19 12:37:19', 0, '2013-11-19 12:37:19 +0100'),
(8, '719493227589', '90111224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:37:19', NULL, 0, '2013-11-19 12:37:19', 0, '2013-11-19 12:37:19 +0100'),
(9, '932632511852', '90111224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-11-19 11:37:19', NULL, 0, '2013-11-19 12:37:19', 0, '2013-11-19 12:37:19 +0100'),
(10, '808859762809', '90111224322', 'OTHER', 'VENDREQ', 'PENDING', '2013-11-19 11:37:27', 3, 0, '2013-11-19 12:37:27', 0, '2013-11-19 12:37:27 +0100'),
(11, '726498351271', '90111224322', 'OTHER', 'VENDREQ', 'PENDING', '2013-11-19 11:37:27', 3, 0, '2013-11-19 12:37:27', 0, '2013-11-19 12:37:27 +0100'),
(12, '437115606635', '90111224322', 'OTHER', 'VENDREQ', 'PENDING', '2013-11-19 11:37:27', 3, 0, '2013-11-19 12:37:27', 0, '2013-11-19 12:37:27 +0100'),
(13, '017350530261', '90111224322', 'OTHER', 'VENDREQ', 'PENDING', '2013-11-19 11:37:27', 3, 0, '2013-11-19 12:37:27', 0, '2013-11-19 12:37:27 +0100'),
(14, '957471735545', '90111224322', 'OTHER', 'VENDREQ', 'PENDING', '2013-11-19 11:37:27', 3, 0, '2013-11-19 12:37:27', 0, '2013-11-19 12:37:27 +0100'),
(15, '218907016269', '9011224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-12-02 10:48:39', NULL, 0, '2013-12-02 11:48:39', 0, '2013-12-02 11:48:39 +0100'),
(16, '801749319164', '9011224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-12-02 10:57:01', NULL, 0, '2013-12-02 11:57:01', 0, '2013-12-02 11:57:01 +0100'),
(17, '481424960510', '9011224322', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-12-02 11:01:30', NULL, 0, '2013-12-02 12:01:30', 0, '2013-12-02 12:01:30 +0100'),
(18, '793896945624', '01451489049', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2013-12-02 11:04:17', NULL, 0, '2013-12-02 12:04:17', 0, '2013-12-02 12:04:17 +0100'),
(19, '320057696427', '111222333', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2014-01-31 23:25:33', 1, 0, '2014-02-01 00:25:33', 0, '2014-02-01 12:25:33 +0100'),
(20, '888576760427', '111222333', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2014-02-02 21:31:27', 1, 0, '2014-02-02 22:31:27', 0, '2014-02-02 10:31:27 +0100'),
(21, '634200525026', '111222333', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2014-02-11 16:12:58', 1, 0, '2014-02-11 17:12:58', 0, '2014-02-11 05:12:58 +0100'),
(22, '081202975183', '111222333', 'OTHER', 'CUSTINFOREQ', 'COMPLETE', '2014-02-13 11:14:32', 1, 0, '2014-02-13 12:14:32', 0, '2014-02-13 12:14:32 +0100');

-- --------------------------------------------------------

--
-- Table structure for table `user_account_tab`
--

CREATE TABLE IF NOT EXISTS `user_account_tab` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `account_balance` bigint(20) NOT NULL,
  `amount_due` bigint(20) NOT NULL,
  `minimun_due` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `partner_service_unit`
--
ALTER TABLE `partner_service_unit`
  ADD CONSTRAINT `partnerservice-parternfk` FOREIGN KEY (`partner_id`) REFERENCES `partner_service` (`id`),
  ADD CONSTRAINT `partnerservice-paymodefk` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_mode` (`id`);

--
-- Constraints for table `person_info`
--
ALTER TABLE `person_info`
  ADD CONSTRAINT `person_partnerservicefk` FOREIGN KEY (`payment_serviceunit_id`) REFERENCES `partner_service_unit` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
