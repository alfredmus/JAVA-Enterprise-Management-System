-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2016 at 05:11 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `billingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_info`
--

CREATE TABLE IF NOT EXISTS `bill_info` (
  `date` datetime NOT NULL,
  `bill_no` int(6) NOT NULL DEFAULT '101',
  `customer_idno` int(8) NOT NULL,
  `customer_name` text NOT NULL,
  `cellphone_number` int(10) NOT NULL,
  `subtotal` int(12) NOT NULL,
  `tax` int(12) NOT NULL,
  `total` int(12) NOT NULL,
  UNIQUE KEY `bill_no` (`bill_no`),
  KEY `customer_idno` (`customer_idno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_info`
--

INSERT INTO `bill_info` (`date`, `bill_no`, `customer_idno`, `customer_name`, `cellphone_number`, `subtotal`, `tax`, `total`) VALUES
('2016-02-15 05:51:53', 1, 6479384, 'nakumatt supermarket', 724537678, 19200, 384, 19584);

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE IF NOT EXISTS `customer_master` (
  `customer_idno` int(8) NOT NULL,
  `customer_name` text NOT NULL,
  `cellphone_number` int(10) NOT NULL,
  `email_id` varchar(26) NOT NULL,
  PRIMARY KEY (`customer_idno`),
  UNIQUE KEY `cellphone_number` (`cellphone_number`,`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`customer_idno`, `customer_name`, `cellphone_number`, `email_id`) VALUES
(3782902, 'kutus traders', 728568330, 'kutus@gmail.com'),
(6479384, 'nakumatt supermarket', 724537678, 'nakumatt@gmail.com'),
(9843849, 'tawakal ltd', 724763892, 'tawakal@yahoo.com'),
(29843323, 'Tuskys supermarket', 711359336, 'tuskyssup@gmail.com'),
(73838992, 'Uchumi Supermarket', 707094088, 'uchumi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `final_bill`
--

CREATE TABLE IF NOT EXISTS `final_bill` (
  `item_no` int(3) NOT NULL AUTO_INCREMENT,
  `item_name` text NOT NULL,
  `item_type` text NOT NULL,
  `item_srno` int(10) NOT NULL,
  `item_bales` int(12) NOT NULL,
  `bale_kgs` int(12) NOT NULL,
  `price_per_kg` int(12) NOT NULL,
  `total_price` int(12) NOT NULL,
  PRIMARY KEY (`item_no`),
  UNIQUE KEY `item_srno` (`item_srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE IF NOT EXISTS `item_master` (
  `item_no` int(3) NOT NULL,
  `item_name` text NOT NULL,
  `item_type` text NOT NULL,
  `item_srno` int(12) NOT NULL,
  `item_bales` int(12) NOT NULL,
  `bale_kgs` int(12) NOT NULL,
  `price_per_kg` int(12) NOT NULL,
  PRIMARY KEY (`item_no`),
  UNIQUE KEY `item_srno` (`item_srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`item_no`, `item_name`, `item_type`, `item_srno`, `item_bales`, `bale_kgs`, `price_per_kg`) VALUES
(101, 'famila', 'wimbi', 657489784, 900, 12, 60),
(102, 'soko', 'maize', 345267891, 400, 24, 85),
(103, 'atta', 'ngano', 243578463, 500, 24, 110),
(104, 'weetabix', 'ngano', 245387398, 300, 6, 120),
(105, 'ndovu', 'maize', 758392084, 400, 24, 95);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE IF NOT EXISTS `login_info` (
  `user_name` text NOT NULL,
  `password` int(12) NOT NULL,
  `reg_no` int(5) NOT NULL,
  UNIQUE KEY `UserName` (`password`),
  UNIQUE KEY `reg_no` (`reg_no`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`user_name`, `password`, `reg_no`) VALUES
('mercy', 123456789, 4786),
('phd.dkt alfred', 298433234, 6022),
('alfred', 298433239, 3726);

-- --------------------------------------------------------

--
-- Table structure for table `tax_adjust`
--

CREATE TABLE IF NOT EXISTS `tax_adjust` (
  `tax_value` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax_adjust`
--

INSERT INTO `tax_adjust` (`tax_value`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `user_registration`
--

CREATE TABLE IF NOT EXISTS `user_registration` (
  `full_name` text NOT NULL,
  `user_name` text NOT NULL,
  `password` varchar(12) NOT NULL,
  `confirm_password` varchar(12) NOT NULL,
  `contact` int(10) NOT NULL,
  `reg_no` int(5) NOT NULL,
  `email_id` varchar(26) NOT NULL,
  UNIQUE KEY `password` (`password`,`confirm_password`,`contact`,`reg_no`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_registration`
--

INSERT INTO `user_registration` (`full_name`, `user_name`, `password`, `confirm_password`, `contact`, `reg_no`, `email_id`) VALUES
('mercy mwende muoki', 'mercy', '123456789', '123456789', 707094088, 4786, 'mercymwende@yahoo.com'),
('phd.dkt alfred muoki musyoka', 'phd.dkt alfred', '298433234', '298433234', 711359336, 6022, 'musyoka.alfred@yahoo.com'),
('alfred muoki musyoka', 'alfred', '298433239', '298433239', 711359338, 3726, 'musyokamuoki@yahoo.com'),
('fortune sango muoki', 'sango', 'myson12345', 'myson12345', 728568330, 3478, 'sangomuoki@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
