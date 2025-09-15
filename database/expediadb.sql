/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expediaflights
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediaflights` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expediaflights`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(30) DEFAULT NULL,
  `airlinelogo` varchar(30) DEFAULT NULL,
  `airportid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airlineid`),
  KEY `airportid` (`airportid`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`airportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB AUTO_INCREMENT=4004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`airlineid`,`airlinename`,`airlinelogo`,`airportid`) values 
(4000,'Kenya Airways','0',1000),
(4001,'Jambo Jet','1',1001),
(4002,'Air Serv Limited','1',1005),
(4003,'Emirates','1',1000);

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airportid` int(11) NOT NULL AUTO_INCREMENT,
  `airportcode` varchar(3) DEFAULT NULL,
  `airportname` varchar(30) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airportid`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`airportid`,`airportcode`,`airportname`,`cityid`) values 
(1000,'JKA','Jommo Kenyatta Airport',101),
(1001,'WLA','Wilson Airport',101),
(1002,'KIA','Kisumu International Airport',102),
(1003,'MIA','Mombasa International Airport',103),
(1004,'EIA','Eldoret International Airport',105),
(1005,'EA','Entebbe International Airport',107),
(1006,'JIN','Jinja Airport',106);

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `bookingclassid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`bookingclassid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingclass` */

insert  into `bookingclass`(`bookingclassid`,`classname`) values 
(1,'Economy'),
(3,'Business'),
(4,'First'),
(5,'Premium ');

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `bookingtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bookingtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

insert  into `bookingtype`(`bookingtypeid`,`typename`) values 
(2,'One way'),
(3,'Multi city'),
(4,'Return');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(30) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `countryid` (`countryid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

insert  into `city`(`cityid`,`cityname`,`countryid`) values 
(101,'Nairobi',1),
(102,'Kisumu',1),
(103,'Mombasa',1),
(105,'Eldoret',1),
(106,'Jinja',2),
(107,'Entebbe',2),
(108,'Bujumbura',9),
(109,'Kampala',2);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryname`) values 
(1,'Kenya'),
(2,'Uganda'),
(4,'Ethiopia'),
(5,'Sudan'),
(6,'Rwanda'),
(7,'Djibouti'),
(8,'Eritrea'),
(9,'Burundi');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currencyid` int(11) NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(4) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`currencyid`),
  KEY `countryid` (`countryid`),
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currency` */

insert  into `currency`(`currencyid`,`currencyname`,`countryid`) values 
(6000,'KSH',1),
(6001,'UGX',2),
(6002,'ETB',4),
(6003,'RF',6);

/*Table structure for table `flightbookingclasses` */

DROP TABLE IF EXISTS `flightbookingclasses`;

CREATE TABLE `flightbookingclasses` (
  `flightbookingclassesid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightbookingclassesid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `currencyid` (`currencyid`),
  CONSTRAINT `flightbookingclasses_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `flightbookingclasses_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingclasses` */

insert  into `flightbookingclasses`(`flightbookingclassesid`,`bookingclassid`,`noofseats`,`unitprice`,`currencyid`) values 
(1,1,1,10000,6000),
(2,1,2,20000,6001),
(3,3,1,10000,6001),
(4,3,1,100000,6003);

/*Table structure for table `flightbookingdate` */

DROP TABLE IF EXISTS `flightbookingdate`;

CREATE TABLE `flightbookingdate` (
  `flightbookingid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingdate` date DEFAULT NULL,
  `bookingtypeid` int(11) DEFAULT NULL,
  `methodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightbookingid`),
  KEY `flightid` (`flightid`),
  KEY `bookingtypeid` (`bookingtypeid`),
  KEY `methodid` (`methodid`),
  CONSTRAINT `flightbookingdate_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightbookingdate_ibfk_2` FOREIGN KEY (`bookingtypeid`) REFERENCES `bookingtype` (`bookingtypeid`),
  CONSTRAINT `flightbookingdate_ibfk_3` FOREIGN KEY (`methodid`) REFERENCES `paymentmethod` (`methodid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingdate` */

insert  into `flightbookingdate`(`flightbookingid`,`flightid`,`bookingdate`,`bookingtypeid`,`methodid`) values 
(4,1,'2025-08-02',4,1),
(5,1,'2025-11-12',4,1),
(6,1,'2025-08-02',4,1),
(8,2,'2025-12-25',4,1);

/*Table structure for table `flightbookingpassengers` */

DROP TABLE IF EXISTS `flightbookingpassengers`;

CREATE TABLE `flightbookingpassengers` (
  `flightbookingpassengersid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `firstname` varchar(30) NOT NULL,
  `secondname` varchar(30) DEFAULT NULL,
  `surname` varchar(30) NOT NULL,
  `gender` varchar(9) NOT NULL,
  `dob` date NOT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flightbookingpassengersid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `documentid` (`documentid`),
  CONSTRAINT `flightbookingpassengers_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `flightbookingpassengers_ibfk_2` FOREIGN KEY (`documentid`) REFERENCES `traveldocuments` (`documentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingpassengers` */

insert  into `flightbookingpassengers`(`flightbookingpassengersid`,`bookingclassid`,`documentid`,`firstname`,`secondname`,`surname`,`gender`,`dob`,`phonenumber`) values 
(1,1,1,'John','Doe','','Male','2000-09-12','0712345678'),
(3,3,1,'Jane','Doe','','Female','2003-03-02','0712354678'),
(4,3,1,'Deng','Jr','','Male','2003-03-02','0712334678');

/*Table structure for table `flightclasses` */

DROP TABLE IF EXISTS `flightclasses`;

CREATE TABLE `flightclasses` (
  `flightclassesid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingclassid` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightclassesid`),
  KEY `flightid` (`flightid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `currencyid` (`currencyid`),
  CONSTRAINT `flightclasses_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightclasses_ibfk_2` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `flightclasses_ibfk_3` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightclasses` */

insert  into `flightclasses`(`flightclassesid`,`flightid`,`bookingclassid`,`noofseats`,`unitprice`,`currencyid`) values 
(1,2,1,200,10000,6000),
(2,1,3,100,20000,6000),
(3,3,4,60,40000,6001);

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `airlineid` int(11) DEFAULT NULL,
  `flightname` varchar(30) DEFAULT NULL,
  `flightno` int(11) DEFAULT NULL,
  `departurecityid` int(11) DEFAULT NULL,
  `destinationcityid` int(11) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `departuretime` time DEFAULT NULL,
  `departureairportid` int(11) DEFAULT NULL,
  `destinationairportid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `airlineid` (`airlineid`),
  KEY `departurecityid` (`departurecityid`),
  KEY `destinationcityid` (`destinationcityid`),
  KEY `departureairportid` (`departureairportid`),
  KEY `destinationairportid` (`destinationairportid`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`departurecityid`) REFERENCES `city` (`cityid`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`destinationcityid`) REFERENCES `city` (`cityid`),
  CONSTRAINT `flights_ibfk_4` FOREIGN KEY (`departureairportid`) REFERENCES `airport` (`airportid`),
  CONSTRAINT `flights_ibfk_5` FOREIGN KEY (`destinationairportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flights` */

insert  into `flights`(`flightid`,`airlineid`,`flightname`,`flightno`,`departurecityid`,`destinationcityid`,`duration`,`departuretime`,`departureairportid`,`destinationairportid`) values 
(1,4000,'KQ705',55,101,106,'1hr 30min','15:00:00',1000,1006),
(2,4000,'KQ701',25,102,101,'1hr','09:00:00',1002,1000),
(3,4000,'KQ702',50,101,102,'1hr','02:00:00',1000,1002),
(4,4000,'KQ705',60,106,101,'1hr 30min','21:00:00',1006,1000);

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `methodid` int(11) NOT NULL AUTO_INCREMENT,
  `methodname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`methodid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethod` */

insert  into `paymentmethod`(`methodid`,`methodname`) values 
(1,'Mpesa'),
(2,'Cash');

/*Table structure for table `traveldocuments` */

DROP TABLE IF EXISTS `traveldocuments`;

CREATE TABLE `traveldocuments` (
  `documentid` int(11) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(25) DEFAULT NULL,
  `documentexpires` date DEFAULT NULL,
  PRIMARY KEY (`documentid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `traveldocuments` */

insert  into `traveldocuments`(`documentid`,`documentname`,`documentexpires`) values 
(1,'Passport','0000-00-00'),
(2,'ID','0000-00-00'),
(3,'Work permit','0000-00-00'),
(5,'Birth certificate','2027-09-12');

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`($countryid int, $countryname varchar(30))
BEGIN
		select * from `country`
		where `countryid` != $countryid and `countryname` = $countryname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`($airlineid int)
BEGIN
		delete from `airline`
		where `airlineid` = $airlineid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`($airportid int)
BEGIN
		delete from `airport`
		where `airportid` = $airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`($bookingclassid int)
BEGIN
		delete from `bookingclass`
		where `bookingclassid` = $bookingclassid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`($bookingtypeid int)
BEGIN
		delete from `bookingtype`
		where `bookingtypeid` = $bookingtypeid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`($cityid int)
BEGIN
		delete from `city`
		where `cityid` = $cityid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`($countryid int)
BEGIN
		delete from `country`
		where `countryid` = $countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`($currencyid int)
BEGIN
		delete from `currency`
		where `currencyid` = $currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingclasses`($flightbookingclassesid int)
BEGIN
		delete from `flightbookingclasses`
		where `flightbookingclassesid` = $flightbookingclassesid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingdate`($flightbookingid int)
BEGIN
		delete from `flightbookingdate`
		where `flightbookingid` = $flightbookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclasses`($flightclassesid int)
BEGIN
		delete from `flightclasses`
		where `flightclassesid` = $flightclassesid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflights`($flightid int)
BEGIN
		delete from `flights`
		where `flightid` = $flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethod`($methodid int)
BEGIN
		delete from `paymentmethod`
		where `methodid` = $methodid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletetraveldocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletetraveldocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletetraveldocs`($documentid int)
BEGIN
		delete from `traveldocuments`
		where `documentid` = $documentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairports`($cityname varchar(30), $airportname varchar(30))
BEGIN
		if $cityname = '' then
			set $cityname = '@@@@';
		end if;
		
		if $airportname = '' then
			set $airportname = '@@@@';
		end if;
		
		select a.*, cityname
		from `airport` a
		join `city` c on c.cityid = a.cityid
		where c.cityname like concat('%',$cityname,'%')
		or a.airportname like concat('%',$airportname,'%')
		order by cityname, airportname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercity`($countryid int)
BEGIN
	select c.*, countryname
	from `city` c
	join `country` o on o.countryid = c.countryid
	where ($countryid = 0 or c.countryid = $countryid)
	order by countryname, cityname;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_flightbookingdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_flightbookingdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_flightbookingdate`($flightbookingid INT, $flightid INT, $bookingdate DATE, $bookingtypeid INT, $methodid INT)
BEGIN
		IF $flightbookingid = 0 THEN
			IF NOT EXISTS(SELECT * FROM `flightbookingdate` WHERE `flightbookingid` = $flightbookingid) THEN
				INSERT INTO `flightbookingdate`(`flightbookingid`, `flightid`, `bookingdate`, `bookingtypeid`, `methodid`)
				VALUES($flightbookingid, $flightid, $bookingdate, $bookingtypeid, $methodid);
			END IF;
		ELSE
			UPDATE `flightbookingdate`
			SET `flightid` = $flightid,
			    `bookingdate` = $bookingdate,
			    `bookingtypeid` = $bookingtypeid,
			    `methodid` = $methodid
			WHERE `flightbookingid` = $flightbookingid;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`()
BEGIN
		select * from `airline`
		order by `airlinename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`()
BEGIN
		select * from `airport`
		order by `airportcode`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportdetails`($airportid int)
BEGIN
		select a.*, c.cityname, n.countryname
		from `airport` a
		join `city` c on c.cityid = a.cityid
		join `country` n on n.countryid = c.countryid
		where a.airportid = $airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`()
BEGIN
		select * from `bookingclass`
		order by `classname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`()
BEGIN
		Select * from `bookingtype`
		order by `typename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`()
BEGIN
		select * from `city`
		order by `cityname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountry`()
BEGIN
		select * from `country`
		order by `countryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrency`()
BEGIN
		select * from `currency`
		order by `currencyname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclasses`()
BEGIN
		select * from `flightbookingclasses`
		order by `unitprice`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingdate`()
BEGIN
		select * from `flightbookingdate`
		order by `bookingdate`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingpassengers`()
BEGIN
		select * from `flightbookingpassengers`
		order by `firstname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`()
BEGIN
		select * from `flightclasses`
		order by `bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`()
BEGIN
		select * from `flights`
		order by `flightno`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettraveldocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettraveldocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettraveldocs`()
BEGIN
		select * from `traveldocuments`
		order by `documentname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`($airlineid int, $airlinename varchar(30),$airlinelogo bit(1), $airportid int)
BEGIN
		if $airlineid = 0 then
			if not exists(select * from `airline` where `airlineid` and `airlinename`)then
			insert into `airline`(`airlinename`, `airlinelogo`, `airportid`)
			values($airlinename, $airlinelogo, $airportid);
			end if;
		else
			update `airline`
			set `airlinename` = $airlinename,
			    `airlinelogo` = $airlinelogo,
			    `airportid` = $airportid
			where `airlineid` = $airlineid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`($airportid int, $airportcode varchar(3), $airportname varchar(30), $cityid int)
BEGIN
		if $airportid = 0 then
			if not exists(select * from `airport` where `airportname` = $airportname and `airportcode` = $airportcode) then
				insert into `airport`(`airportcode`,`airportname`,`cityid`)
				values($airportcode, $airportname, $cityid);
			end if;
		else
			IF NOT EXISTS(SELECT * FROM `airport` WHERE `airportid` = $airportid and (`airportname` = $airportname or `airportcode` = $airportcode)) THEN
				UPDATE `airport`
				SET `airportcode` = $airportcode,
				    `airportname` = $airportname,
				    `cityid` = $cityid
				WHERE `airportid` = $airportid;
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclass`($bookingclassid int, $classname varchar(8))
BEGIN
		if $bookingclassid = 0 then
			if not exists(select * from `bookingclass` where `classname` = $classname)then
				insert into `bookingclass`(`bookingclassid`, `classname`)
				values($bookingclassid, $classname);
			end if;
		else
			update `bookingclass`
			set `classname` = $classname
			where `bookingclassid` = bookingclassid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`($bookingtypeid INT, $typename VARCHAR(20))
BEGIN
		if $bookingtypeid = 0 then
			if not exists(select * from `bookingtype` where `typename` = $typename) then
				insert into `bookingtype`(`bookingtypeid`, `typename`)
				values($bookingtypeid, $typename);
			end if;
		else
			update `bookingtype`
			set `typename` = $typename
			where `bookingtypeid` = $bookingtypeid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`($cityid int, $cityname varchar(30), $countryid int)
BEGIN
		if $cityid = 0 then
			if not exists(select * from `city` where `cityname` = $cityname and `countryid` = $countryid) then
				insert into `city`(`cityname`, `countryid`)
				values($cityname, $countryid);
			end if;
		else
			UPDATE `city`
			SET `cityname` = $cityname,
			    `countryid` = $countryid
			where `cityid` = $cityid;	
		end if;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`($countryid int, $countryname varchar(30))
BEGIN
		if $countryid = 0 then
			if not exists(select * from `country` where `countryname` = $countryname) then
				insert into `country`(`countryname`)
				values ($countryname);
			end if;
		else
			update `country`
			set `countryname` = $countryname
			where `countryid` = $countryid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrency`($currencyid int, $currencyname varchar(4), $countryid int)
BEGIN
		if $currencyid = 0 then
			if not exists(select * from `currency` where `currencyid` = $currencyid and `currencyname` = $currencyname) then 
				 insert into `currency`(`currencyname`, `countryid`)
				 values($currencyname, $countryid);
			 end if;
		else
			update `currency`
			set `currencyname` = $currencyname,
			    `countryid` = $countryid
			where `currencyid` = $currencyid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingclasses`($flightbookingclassesid int, $bookingclassid int, $noofseats int, $unitprice double, $currencyid int)
BEGIN
		IF $flightbookingclassesid = 0 THEN
			INSERT INTO `flightbookingclasses`(`flightbookingclassesid`, `bookingclassid`, `noofseats`, `unitprice`, `currencyid`)
			VALUES($flightbookingclassesid, $bookingclassid, $noofseats, $unitprice, $currencyid);
		ELSE
			UPDATE `flightbookingclasses`
			SET `bookingclassid` = $bookingclassid,
			    `noofseats` = $noofseats,
			    `unitprice` = $unitprice,
			    `currencyid` = $currencyid
			WHERE `flightbookingclassesid` = $flightbookingclassesid;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingdate`($flightbookingid int, $flightid int, $bookingdate date, $bookingtypeid int, $methodid int)
BEGIN
		if $flightbookingid = 0 then
			if not exists(select * from `flightbookingdate` where `flightbookingid` = $flightbookingid) then
				insert into `flightbookingdate`(`flightbookingid`, `flightid`, `bookingdate`, `bookingtypeid`, `methodid`)
				values($flightbookingid, $flightid, $bookingdate, $bookingtypeid, $methodid);
			end if;
		else
			update `flightbookingdate`
			set `flightid` = $flightid,
			    `bookingdate` = $bookingdate,
			    `bookingtypeid` = $bookingtypeid,
			    `methodid` = $methodid
			where `flightbookingid` = $flightbookingid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingpassengers`($flightbookingpassengerid int, $bookingclassid int, $documentid int, $firstname varchar(30), $secondname varchar(30), $surname varchar(30), $gender varchar(9), $dob date, $phonenumber varchar(30))
BEGIN
		if $flightbookingpassengerid = 0 then
			if not exists(select * from `flightbookingpassengers` where `phonenumber` = $phonenumber) then
				insert into `flightbookingpassengers`(`flightbookingpassengersid`, `bookingclassid`, `documentid`, `firstname`, `secondname`, `surname`, `gender`, `dob`, `phonenumber`)
				values($flightbookingpassengerid, $bookingclassid , $documentid, $firstname, $secondname, $surname, $gender, $dob, $phonenumber);
			end if;
		else
			IF NOT EXISTS(SELECT * FROM `flightbookingpassengers` WHERE `phonenumber` = $phonenumber) THEN
				update `flightbookingpassengers`
				set `bookingclassid` = $bookingclassid,
				    `documentid` = $documentid,
				    `firstname` = $firstname,
				    `secondname` = $secondname,
				    `surname` = $surname,
				    `gender` = $gender,
				    `dob` = $dob,
				    `phonenumber` = $phonenumber
				where `flightbookingpassengersid` = $flightbookingpassengerid;
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclasses`($flightclassesid int, $flightid int, $bookingclassid int, $noofseats int, $unitprice double, $currencyid int)
BEGIN
		if $flightclassesid = 0 then
			if not exists(select * from `flightclasses` where `flightclassesid` = $flightclassesid) then
				insert into `flightclasses`(`flightclassesid`, `flightid`, `bookingclassid`, `noofseats`, `unitprice`, `currencyid`)
				values($flightclassesid, $flightid, $bookingclassid, $noofseats, $unitprice, $currencyid);
			end if;
		else
			update `flightclasses`
			set `flightid` = $flightid,
			    `bookingclassid` = $bookingclassid,
			    `noofseats` = $noofseats,
			    `unitprice` = $unitprice,
			    `currencyid` = $currencyid
			where `flightclassesid` = $flightclassesid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflights`($flightid int, $airlineid int, $flightname varchar(30), $flightno int, $departurecityid int, $destinationcityid int, $duration varchar(10), $departuretime time, $departureairportid int, $destinationairportid int)
BEGIN
		if $flightid = 0 then
			if not exists(select * from `flights` where `flightid` = $flightid and `flightname` = $flightname) then
				insert into `flights`(flightid, airlineid, flightname, flightno, departurecityid, destinationcityid, duration, departuretime, departureairportid, destinationairportid)
				values($flightid, $airlineid, $flightname, $flightno, $departurecityid, $destinationcityid, $duration, $departuretime, $departureairportid, $destinationairportid);
			end if;
		else
			update `flights`
			set `airlineid` = $airlineid,
			    `flightname` = $flightname,
			    `flightno` = $flightno,
			    `departurecityid` = $departurecityid,
			    `destinationcityid` = $destinationcityid,
			    `duration` = $duration,
			    `departuretime` = $departuretime,
			    `departureairportid` = $departureairportid,
			    `destinationairportid` = $destinationairportid
			where `flightid` = $flightid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepaymentmethod`($methodid int, $methodname varchar(15))
BEGIN
		if $methodid = 0 then
			if not exists(select * from `paymentmethod` where `methodname` = $methodname)then
				insert into `paymentmethod`(`methodid`, `methodname`)
				values($methodid, $methodname);
			end if;
		else
			update `paymentmethod`
			set `methodname` = $methodname
			where `methodid` = $methodid;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savetraveldocs` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savetraveldocs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savetraveldocs`($documentid int, $documentname varchar(25), $documentexpires date)
BEGIN
		if $documentid = 0 then
			if not exists (select * from `traveldocuments` where `documentid` = $documentid and `documentname` = $documentname) then
				insert into `traveldocuments`(`documentname`, `documentexpires`)
				values($documentname, $documentexpires);
			end if;
		else
			update `traveldocuments`
			set `documentname` = $documentname,
			     `documentexpires` = $documentexpires
			where `documentid` = $documentid;    
		end if;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
