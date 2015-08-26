-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.96-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for traveloholic
CREATE DATABASE IF NOT EXISTS `traveloholic` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `traveloholic`;


-- Dumping structure for table traveloholic.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `uname` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`uname`, `apass`, `status`) VALUES
	('admin', 'mypass', 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Dumping structure for table traveloholic.bill
CREATE TABLE IF NOT EXISTS `bill` (
  `billno` int(11) NOT NULL auto_increment,
  `cname` varchar(50) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `addr` varchar(50) NOT NULL default '0',
  `amt` double NOT NULL default '0',
  `disc` double NOT NULL default '0',
  `vat` double NOT NULL default '0',
  `gross` double NOT NULL default '0',
  `dog` date default NULL,
  `status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`billno`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.bill: ~26 rows (approximately)
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` (`billno`, `cname`, `cid`, `addr`, `amt`, `disc`, `vat`, `gross`, `dog`, `status`) VALUES
	(1, 'name', 1, 'kolkata', 4500, 200, 100, 0, NULL, 1),
	(2, 'Next User', 0, 'kolkata', 1400, 100, 4, 1304, '2014-09-27', 0),
	(3, 'Next User', 0, 'kolkata', 900, 100, 4, 804, '2014-09-27', 0),
	(4, 'Next User', 0, 'kolkata', 700, 100, 4, 604, '2014-09-27', 0),
	(5, 'Next User', 0, 'kolkata', 3500, 100, 4, 3404, '2014-09-27', 0),
	(6, 'Next User', 0, 'kolkata', 900, 100, 4, 804, '2014-09-27', 0),
	(7, 'Iam User', 0, 'mumbai', 650, 100, 4, 554, '2014-09-27', 0),
	(8, 'Iam User', 0, 'mumbai', 900, 100, 4, 804, '2014-09-27', 0),
	(9, 'Iam User', 0, 'mumbai', 700, 100, 4, 604, '2014-09-27', 0),
	(10, 'Iam User', 0, 'mumbai', 1000, 100, 4, 904, '2014-09-27', 0),
	(11, 'Iam User', 0, 'mumbai', 1000, 100, 4, 904, '2014-09-27', 0),
	(12, 'Iam User', 0, 'mumbai', 1200, 100, 4, 1104, '2014-09-27', 0),
	(16, 'IamUser', 0, 'mumbai', 4800, 100, 4, 4704, '2014-10-08', 0),
	(18, 'Iam User', 0, 'mumbai', 5900, 100, 4, 5804, '2014-10-09', 0),
	(19, 'Next User', 0, 'kolkata', 1500, 100, 4, 1404, '2014-10-19', 0),
	(20, 'Iam User', 0, 'mumbai', 2300, 100, 4, 2204, '2014-10-19', 0),
	(21, 'Iam User', 0, 'mumbai', 5600, 100, 4, 5504, '2014-10-20', 0),
	(22, 'Iam User', 0, 'mumbai', 4600, 100, 4, 4504, '2014-10-20', 0),
	(23, 'Iam User', 0, 'mumbai', 32800, 100, 4, 32704, '2014-10-27', 0),
	(24, 'Next User', 0, 'kolkata', 8400, 100, 4, 8304, '2014-11-09', 0),
	(25, 'Next User', 0, 'kolkata', 15300, 100, 4, 15204, '2014-11-09', 0),
	(26, 'Iam User', 0, 'mumbai', 18000, 100, 4, 17904, '2014-11-11', 0),
	(27, 'Next User', 0, 'kolkata', 5200, 100, 4, 5104, '2014-11-15', 0),
	(28, 'Iam User', 0, 'kolkata', 21600, 100, 4, 21504, '2014-12-13', 0),
	(29, 'Iam User', 0, 'kolkata', 35100, 100, 4, 35004, '2014-12-16', 0),
	(30, 'Subinoy Ghosh', 0, 'kolkata', 17100, 100, 4, 17004, '2014-12-21', 0);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;


-- Dumping structure for table traveloholic.bill_delv
CREATE TABLE IF NOT EXISTS `bill_delv` (
  `did` int(11) NOT NULL auto_increment,
  `billno` int(11) NOT NULL default '0',
  `billamt` double NOT NULL default '0',
  `name` double NOT NULL default '0',
  `addr` varchar(50) NOT NULL default '0',
  `dod` date NOT NULL,
  `emp` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.bill_delv: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill_delv` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_delv` ENABLE KEYS */;


-- Dumping structure for table traveloholic.booking_c
CREATE TABLE IF NOT EXISTS `booking_c` (
  `date` date NOT NULL,
  `cname` varchar(50) NOT NULL,
  `carid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  KEY `carid` (`carid`),
  CONSTRAINT `FK_booking_c_stock_c` FOREIGN KEY (`carid`) REFERENCES `stock_c` (`carid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.booking_c: ~33 rows (approximately)
/*!40000 ALTER TABLE `booking_c` DISABLE KEYS */;
INSERT INTO `booking_c` (`date`, `cname`, `carid`, `qty`) VALUES
	('2014-10-31', 'Next User', 6, 1),
	('2014-11-01', 'Next User', 6, 1),
	('2014-11-02', 'Next User', 6, 1),
	('2014-11-03', 'Next User', 6, 1),
	('2014-10-27', 'Iam User', 1, 1),
	('2014-10-28', 'Iam User', 1, 1),
	('2014-10-29', 'Iam User', 5, 2),
	('2014-10-30', 'Iam User', 5, 2),
	('2014-10-31', 'Iam User', 5, 2),
	('2014-11-01', 'Iam User', 5, 2),
	('2014-11-23', 'Iam User', 3, 1),
	('2014-11-24', 'Iam User', 3, 1),
	('2014-11-25', 'Iam User', 3, 1),
	('2014-11-26', 'Iam User', 3, 1),
	('2014-11-09', 'Next User', 2, 1),
	('2014-11-10', 'Next User', 2, 1),
	('2014-11-14', 'Next User', 4, 1),
	('2014-11-15', 'Next User', 4, 1),
	('2014-11-16', 'Next User', 4, 1),
	('2014-11-05', 'Iam User', 1, 1),
	('2014-11-06', 'Iam User', 1, 1),
	('2014-11-07', 'Iam User', 1, 1),
	('2014-11-22', 'Next User', 2, 1),
	('2014-11-23', 'Next User', 2, 1),
	('2014-12-26', 'Iam User', 5, 1),
	('2014-12-27', 'Iam User', 5, 1),
	('2014-12-28', 'Iam User', 5, 1),
	('2014-12-12', 'Iam User', 6, 1),
	('2014-12-13', 'Iam User', 6, 1),
	('2014-12-14', 'Iam User', 6, 1),
	('2014-12-11', 'Subinoy Ghosh', 3, 2),
	('2014-12-12', 'Subinoy Ghosh', 3, 2),
	('2014-12-13', 'Subinoy Ghosh', 3, 2);
/*!40000 ALTER TABLE `booking_c` ENABLE KEYS */;


-- Dumping structure for table traveloholic.booking_h
CREATE TABLE IF NOT EXISTS `booking_h` (
  `date` date NOT NULL,
  `hotelid` int(11) NOT NULL,
  `sbr` int(11) NOT NULL,
  `dbr` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  KEY `hotelid` (`hotelid`),
  CONSTRAINT `FK_booking_h_stock_h` FOREIGN KEY (`hotelid`) REFERENCES `stock_h` (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.booking_h: ~36 rows (approximately)
/*!40000 ALTER TABLE `booking_h` DISABLE KEYS */;
INSERT INTO `booking_h` (`date`, `hotelid`, `sbr`, `dbr`, `cname`) VALUES
	('2014-11-18', 5, 5, 2, 'Next User'),
	('2014-11-10', 1, 3, 2, 'Iam User'),
	('2014-11-24', 3, 2, 4, 'Iam User'),
	('2014-10-31', 6, 3, 2, 'Next User'),
	('2014-11-01', 6, 3, 2, 'Next User'),
	('2014-11-02', 6, 3, 2, 'Next User'),
	('2014-11-03', 6, 3, 2, 'Next User'),
	('2014-10-27', 1, 2, 2, 'Iam User'),
	('2014-10-28', 1, 2, 2, 'Iam User'),
	('2014-10-29', 5, 0, 3, 'Iam User'),
	('2014-10-30', 5, 0, 3, 'Iam User'),
	('2014-10-31', 5, 0, 3, 'Iam User'),
	('2014-11-01', 5, 0, 3, 'Iam User'),
	('2014-11-23', 3, 3, 2, 'Iam User'),
	('2014-11-24', 3, 3, 2, 'Iam User'),
	('2014-11-25', 3, 3, 2, 'Iam User'),
	('2014-11-26', 3, 3, 2, 'Iam User'),
	('2014-11-09', 3, 2, 2, 'Next User'),
	('2014-11-10', 3, 2, 2, 'Next User'),
	('2014-11-14', 7, 1, 1, 'Next User'),
	('2014-11-15', 7, 1, 1, 'Next User'),
	('2014-11-16', 7, 1, 1, 'Next User'),
	('2014-11-05', 4, 1, 1, 'Iam User'),
	('2014-11-06', 4, 1, 1, 'Iam User'),
	('2014-11-07', 4, 1, 1, 'Iam User'),
	('2014-11-22', 3, 1, 1, 'Next User'),
	('2014-11-23', 3, 1, 1, 'Next User'),
	('2014-12-26', 5, 1, 1, 'Iam User'),
	('2014-12-27', 5, 1, 1, 'Iam User'),
	('2014-12-28', 5, 1, 1, 'Iam User'),
	('2014-12-12', 7, 3, 2, 'Iam User'),
	('2014-12-13', 7, 3, 2, 'Iam User'),
	('2014-12-14', 7, 3, 2, 'Iam User'),
	('2014-12-11', 3, 1, 2, 'Subinoy Ghosh'),
	('2014-12-12', 3, 1, 2, 'Subinoy Ghosh'),
	('2014-12-13', 3, 1, 2, 'Subinoy Ghosh');
/*!40000 ALTER TABLE `booking_h` ENABLE KEYS */;


-- Dumping structure for table traveloholic.client
CREATE TABLE IF NOT EXISTS `client` (
  `cid` int(11) NOT NULL auto_increment,
  `cname` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.client: ~6 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`cid`, `cname`, `uname`, `addr`, `email`, `phone`, `status`) VALUES
	(1, 'Hilton', 'cli1', 'kolkata', 'hasjhdkhsak', '1231231', 1),
	(2, 'MyCar', 'trr', 'mumbai', 'mycar@car.com', '13213123', 1),
	(3, 'Ginger', 'tre', 'chennai', 'sdsdsa', '12321312', 1),
	(4, 'Grand', 'grd', 'kolkata', 'sdasda', '45646465', 1),
	(5, 'Hyatt', 'hty1', 'chennai', 'sdasda', '454545454', 1),
	(6, 'QuickCab', 'qcab', 'kolkata', 'dgsgsdg', '454555554', 1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


-- Dumping structure for table traveloholic.comms
CREATE TABLE IF NOT EXISTS `comms` (
  `comid` int(11) NOT NULL auto_increment,
  `comamt` double NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `per` double NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `cdate` date NOT NULL,
  `saleamt` double NOT NULL,
  PRIMARY KEY  (`comid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.comms: ~0 rows (approximately)
/*!40000 ALTER TABLE `comms` DISABLE KEYS */;
/*!40000 ALTER TABLE `comms` ENABLE KEYS */;


-- Dumping structure for table traveloholic.company
CREATE TABLE IF NOT EXISTS `company` (
  `coname` varchar(50) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY  (`coname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.company: ~0 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


-- Dumping structure for table traveloholic.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `sid` int(11) NOT NULL auto_increment,
  `uname` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `sdate` date NOT NULL,
  `tid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `db` int(11) NOT NULL default '0',
  `item` varchar(50) NOT NULL,
  `rate` double NOT NULL,
  `dbr` double NOT NULL default '0',
  `total` double NOT NULL,
  `disc` double NOT NULL,
  `gross` double NOT NULL,
  `doj` date NOT NULL default '2014-10-10',
  `dos` int(11) NOT NULL,
  PRIMARY KEY  (`sid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `FK_sales_client` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.sales: ~48 rows (approximately)
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`sid`, `uname`, `cid`, `sdate`, `tid`, `name`, `qty`, `db`, `item`, `rate`, `dbr`, `total`, `disc`, `gross`, `doj`, `dos`) VALUES
	(19, 'user1', 3, '2014-09-25', 3, 'Next User', 1, 0, '3Hotel atmumbai', 200, 0, 200, 0, 200, '2014-10-10', 0),
	(20, 'user1', 2, '2014-09-25', 3, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-10', 0),
	(23, 'user1', 1, '2014-09-25', 5, 'Next User', 1, 0, '1Hotel atmumbai', 400, 0, 400, 0, 400, '2014-10-10', 0),
	(24, 'user1', 2, '2014-09-25', 5, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-10', 0),
	(25, 'user1', 3, '2014-09-25', 6, 'Next User', 1, 0, '3Hotel atmumbai', 200, 0, 200, 0, 200, '2014-10-10', 0),
	(26, 'user1', 2, '2014-09-25', 6, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-10', 0),
	(27, 'user1', 3, '2014-09-25', 7, 'Next User', 1, 0, '3Hotel atmumbai', 200, 0, 200, 0, 200, '2014-10-10', 0),
	(36, 'user1', 2, '2014-09-25', 7, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-10', 0),
	(37, 'user1', 1, '2014-09-25', 8, 'Next User', 1, 0, '1Hotel atmumbai', 400, 0, 400, 0, 400, '2014-10-10', 0),
	(38, 'user1', 2, '2014-09-25', 8, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-10', 0),
	(44, 'user', 1, '2014-09-25', 9, 'Iam User', 1, 0, '1Hotel atmumbai', 400, 0, 400, 0, 400, '2014-10-10', 0),
	(45, 'user', 2, '2014-09-25', 9, 'Iam User', 1, 0, 'tatasafari', 250, 0, 250, 0, 250, '2014-10-10', 0),
	(46, 'user', 5, '2014-09-25', 10, 'Iam User', 1, 0, '5Hotel atkolkata', 700, 0, 700, 0, 700, '2014-11-20', 0),
	(47, 'user', 2, '2014-09-25', 10, 'Iam User', 1, 0, 'tempo', 200, 0, 200, 0, 200, '2014-11-20', 0),
	(48, 'user', 3, '2014-09-25', 11, 'Iam', 1, 0, '3Hotel atmumbai', 200, 0, 200, 0, 200, '2014-10-24', 0),
	(49, 'user', 2, '2014-09-25', 11, 'Iam', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-24', 0),
	(50, 'user', 4, '2014-09-25', 12, 'Iam', 1, 0, '4Hotel atkolkata', 800, 0, 800, 0, 800, '2014-10-17', 0),
	(51, 'user', 2, '2014-09-25', 12, 'Iam', 1, 0, 'tempo', 200, 0, 200, 0, 200, '2014-10-17', 0),
	(52, 'user', 4, '2014-09-25', 13, 'Iam', 1, 0, '4Hotel atkolkata', 800, 0, 800, 0, 800, '2014-10-25', 0),
	(53, 'user', 2, '2014-09-25', 13, 'Iam', 1, 0, 'indigo', 400, 0, 400, 0, 400, '2014-10-25', 0),
	(54, 'user', 3, '2014-10-08', 14, 'Iam', 10, 3, '3Hotel atmumbai', 200, 400, 3800, 0, 3800, '2014-11-27', 0),
	(55, 'user', 2, '2014-10-08', 14, 'Iam', 2, 0, 'scorpio', 500, 0, 1000, 0, 1000, '2014-11-27', 0),
	(56, 'user', 5, '2014-10-09', 15, 'Iam User', 3, 2, '5Hotel atchennai', 900, 400, 5300, 0, 5300, '2014-11-29', 0),
	(57, 'user', 6, '2014-10-09', 15, 'Iam User', 2, 0, 'bulero', 300, 0, 600, 0, 600, '2014-11-29', 0),
	(58, 'user1', 3, '2014-10-19', 16, 'Next User', 2, 1, '3Hotel atmumbai', 200, 400, 1000, 0, 1000, '2014-10-23', 0),
	(59, 'user1', 2, '2014-10-19', 16, 'Next User', 1, 0, 'scorpio', 500, 0, 500, 0, 500, '2014-10-23', 0),
	(60, 'user', 3, '2014-10-19', 17, 'Iam User', 2, 1, '3Hotel atchennai', 500, 400, 1900, 0, 1900, '2014-10-24', 0),
	(61, 'user', 6, '2014-10-19', 17, 'Iam User', 1, 0, 'indigo', 400, 0, 400, 0, 400, '2014-10-24', 0),
	(62, 'user', 4, '2014-10-20', 18, 'Iam User', 2, 3, '4Hotel atkolkata', 800, 400, 5200, 0, 5200, '2014-10-31', 0),
	(63, 'user', 2, '2014-10-20', 18, 'Iam User', 1, 0, 'indigo', 400, 0, 400, 0, 400, '2014-10-31', 0),
	(64, 'user', 5, '2014-10-20', 19, 'Iam User', 3, 1, '5Hotel atchennai', 900, 400, 4000, 0, 4000, '2014-10-31', 0),
	(65, 'user', 6, '2014-10-20', 19, 'Iam User', 2, 0, 'bulero', 300, 0, 600, 0, 600, '2014-10-31', 0),
	(66, 'user', 3, '2014-10-27', 20, 'Iam User', 3, 2, '3Hotel atmumbai', 200, 400, 7200, 0, 7200, '2014-11-27', 4),
	(67, 'user', 2, '2014-10-27', 20, 'Iam User', 1, 0, 'tatasafari', 250, 0, 1000, 0, 1000, '2014-11-27', 4),
	(68, 'user1', 3, '2014-11-09', 21, 'Next User', 2, 2, '3Hotel atmumbai', 200, 400, 3200, 0, 3200, '2014-11-11', 2),
	(69, 'user1', 2, '2014-11-09', 21, 'Next User', 1, 0, 'scorpio', 500, 0, 1000, 0, 1000, '2014-11-11', 2),
	(70, 'user1', 3, '2014-11-09', 22, 'Next User', 1, 1, '3Hotel atchennai', 500, 400, 4200, 0, 4200, '2014-11-17', 3),
	(71, 'user1', 6, '2014-11-09', 22, 'Next User', 1, 0, 'bulero', 300, 0, 900, 0, 900, '2014-11-17', 3),
	(72, 'user', 5, '2014-11-11', 23, 'Iam User', 1, 1, '5Hotel atkolkata', 700, 400, 5400, 0, 5400, '2014-11-08', 3),
	(73, 'user', 2, '2014-11-11', 23, 'Iam User', 1, 0, 'tempo', 200, 0, 600, 0, 600, '2014-11-08', 3),
	(74, 'user1', 3, '2014-11-15', 24, 'Next User', 1, 1, '3Hotel atmumbai', 200, 400, 1600, 0, 1600, '2014-11-24', 2),
	(75, 'user1', 2, '2014-11-15', 24, 'Next User', 1, 0, 'scorpio', 500, 0, 1000, 0, 1000, '2014-11-24', 2),
	(76, 'user', 4, '2014-12-13', 25, 'Iam User', 1, 1, '4Hotel atkolkata', 800, 400, 6000, 0, 6000, '2014-12-29', 3),
	(77, 'user', 2, '2014-12-13', 25, 'Iam User', 1, 0, 'indigo', 400, 0, 1200, 0, 1200, '2014-12-29', 3),
	(78, 'user', 3, '2014-12-16', 26, 'Iam User', 3, 2, '3Hotel atchennai', 500, 400, 9900, 0, 9900, '2014-12-15', 3),
	(79, 'user', 6, '2014-12-16', 26, 'Iam User', 1, 0, 'indigo', 600, 0, 1800, 0, 1800, '2014-12-15', 3),
	(80, 'subi100', 3, '2014-12-21', 27, 'Subinoy Ghosh', 1, 2, '3Hotel atmumbai', 200, 400, 4200, 0, 4200, '2014-12-14', 3),
	(81, 'subi100', 2, '2014-12-21', 27, 'Subinoy Ghosh', 2, 0, 'tatasafari', 250, 0, 1500, 0, 1500, '2014-12-14', 3);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;


-- Dumping structure for table traveloholic.stock_c
CREATE TABLE IF NOT EXISTS `stock_c` (
  `carid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `rate` double NOT NULL default '0',
  `qty` int(11) NOT NULL default '0',
  `addr` varchar(50) NOT NULL default '0',
  `car` varchar(50) NOT NULL,
  PRIMARY KEY  (`carid`),
  KEY `FK_stock_c_client` (`cid`),
  CONSTRAINT `FK_stock_c_client` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.stock_c: ~6 rows (approximately)
/*!40000 ALTER TABLE `stock_c` DISABLE KEYS */;
INSERT INTO `stock_c` (`carid`, `cid`, `rate`, `qty`, `addr`, `car`) VALUES
	(1, 2, 200, 3, 'kolkata', 'tempo'),
	(2, 2, 500, 2, 'mumbai', 'scorpio'),
	(3, 2, 250, 7, 'mumbai', 'tatasafari'),
	(4, 6, 300, 7, 'chennai', 'bulero'),
	(5, 2, 400, 5, 'kolkata', 'indigo'),
	(6, 6, 600, 8, 'chennai', 'indigo');
/*!40000 ALTER TABLE `stock_c` ENABLE KEYS */;


-- Dumping structure for table traveloholic.stock_g
CREATE TABLE IF NOT EXISTS `stock_g` (
  `gid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL,
  `rate` double NOT NULL,
  `qty` int(11) NOT NULL,
  `addr` varchar(50) NOT NULL,
  PRIMARY KEY  (`gid`),
  KEY `cid` (`cid`),
  CONSTRAINT `FK_stock_g_client` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.stock_g: ~2 rows (approximately)
/*!40000 ALTER TABLE `stock_g` DISABLE KEYS */;
INSERT INTO `stock_g` (`gid`, `cid`, `rate`, `qty`, `addr`) VALUES
	(1, 2, 190, 5, 'mumbai'),
	(2, 3, 450, 3, 'mumbai');
/*!40000 ALTER TABLE `stock_g` ENABLE KEYS */;


-- Dumping structure for table traveloholic.stock_h
CREATE TABLE IF NOT EXISTS `stock_h` (
  `hid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `rate` double NOT NULL default '0',
  `qty` int(11) NOT NULL default '0',
  `addr` varchar(50) NOT NULL default '0',
  `dbrate` double NOT NULL default '400',
  `dbqty` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hid`),
  KEY `cid` (`cid`),
  CONSTRAINT `FK_stock_h_client` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.stock_h: ~7 rows (approximately)
/*!40000 ALTER TABLE `stock_h` DISABLE KEYS */;
INSERT INTO `stock_h` (`hid`, `cid`, `rate`, `qty`, `addr`, `dbrate`, `dbqty`) VALUES
	(1, 1, 700, 10, 'kolkata', 800, 10),
	(2, 1, 400, 11, 'mumbai', 1100, 12),
	(3, 3, 200, 17, 'mumbai', 400, 6),
	(4, 5, 700, 8, 'kolkata', 400, 6),
	(5, 4, 800, 10, 'kolkata', 400, 8),
	(6, 5, 900, 6, 'chennai', 400, 2),
	(7, 3, 500, 28, 'chennai', 400, 9);
/*!40000 ALTER TABLE `stock_h` ENABLE KEYS */;


-- Dumping structure for table traveloholic.trans
CREATE TABLE IF NOT EXISTS `trans` (
  `tid` int(11) NOT NULL auto_increment,
  `billno` int(11) default NULL,
  `utype` int(11) default NULL,
  `buyer` varchar(50) default NULL,
  `tdate` date default NULL,
  `tamt` double default NULL,
  PRIMARY KEY  (`tid`),
  KEY `billno` (`billno`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.trans: ~24 rows (approximately)
/*!40000 ALTER TABLE `trans` DISABLE KEYS */;
INSERT INTO `trans` (`tid`, `billno`, `utype`, `buyer`, `tdate`, `tamt`) VALUES
	(4, 2, 1, 'Next User', '2014-09-27', 1400),
	(5, 3, 1, 'Next User', '2014-09-27', 900),
	(6, 4, 1, 'Next User', '2014-09-27', 700),
	(7, 5, 1, 'Next User', '2014-09-27', 3500),
	(8, 6, 1, 'Next User', '2014-09-27', 900),
	(9, 7, 1, 'Iam User', '2014-09-27', 650),
	(10, 8, 1, 'Iam User', '2014-09-27', 900),
	(11, 9, 1, 'Iam User', '2014-09-27', 700),
	(12, 10, 1, 'Iam User', '2014-09-27', 1000),
	(13, 12, 1, 'Iam User', '2014-09-27', 1200),
	(14, 16, 1, 'Iam User', '2014-10-08', 4800),
	(15, 18, 1, 'Iam User', '2014-10-09', 5900),
	(16, 19, 1, 'Next User', '2014-10-19', 1500),
	(17, 20, 1, 'Iam User', '2014-10-19', 2300),
	(18, 21, 1, 'Iam User', '2014-10-20', 5600),
	(19, 22, 1, 'Iam User', '2014-10-20', 4600),
	(20, 23, 1, 'Iam User', '2014-10-27', 32800),
	(21, 24, 1, 'Next User', '2014-11-09', 8400),
	(22, 25, 1, 'Next User', '2014-11-09', 15300),
	(23, 26, 1, 'Iam User', '2014-11-11', 18000),
	(24, 27, 1, 'Next User', '2014-11-15', 5200),
	(25, 28, 1, 'Iam User', '2014-12-13', 21600),
	(26, 29, 1, 'Iam User', '2014-12-16', 35100),
	(27, 30, 1, 'Subinoy Ghosh', '2014-12-21', 17100);
/*!40000 ALTER TABLE `trans` ENABLE KEYS */;


-- Dumping structure for table traveloholic.users
CREATE TABLE IF NOT EXISTS `users` (
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `remarks` varchar(50) default NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) default NULL,
  `status` int(11) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  PRIMARY KEY  (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traveloholic.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uname`, `pass`, `type`, `remarks`, `phone`, `email`, `status`, `addr`, `fullname`) VALUES
	('cli1', 'clipass', '2', NULL, '123456789', NULL, 1, 'kolkata', 'Hilton'),
	('qcab', 'qcab', '2', NULL, '555555555', 'qcab@qca.com', 1, 'mumbai', 'Quick Cab'),
	('subhuser', 'subh', '1', 'No Remarks', '9996664444', 'subh.sany@gmail.com', 1, 'Jadavpur', 'Subhadeep Sanyal'),
	('subi100', 'subi', '1', 'No Remarks', '5555555555', 'subi@gmail.com', 1, 'kolkata', 'Subinoy Ghosh'),
	('tre', 'tre', '2', 'No Remarks', '55555555', 'gin@ginger.com', 1, 'chennai', 'Ginger'),
	('trr', 'trr', '2', 'No Remarks', '89566656', 'car@car.com', 1, 'Kolkata', 'MyCar'),
	('user', 'user', '1', 'No Remarks', '123456789', 'i.am.user@gmail.com', 1, 'kolkata', 'Iam User'),
	('user1', 'user1', '1', NULL, '123456789', NULL, 1, 'kolkata', 'Next User');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
