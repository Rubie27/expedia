/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expedia`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(30) DEFAULT NULL,
  `airlinelogo` varchar(200) DEFAULT NULL,
  `airportid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airlineid`),
  KEY `airportid` (`airportid`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`airportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airportid` int(11) NOT NULL AUTO_INCREMENT,
  `airportcode` varchar(30) DEFAULT NULL,
  `airportname` varchar(30) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airportid`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `bookingclassid` int(11) NOT NULL,
  `classname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingclass` */

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `bookingtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bookingtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(30) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `countryid` (`countryid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryname`) values 
(1,'Republic of Kenya'),
(2,'Uganda'),
(4,'Eritrea'),
(5,'Burundi'),
(6,'Tanzania'),
(7,'Tanzania'),
(8,'Tanzania'),
(9,'Tanzania'),
(10,'SouthAfrica'),
(11,'Burundi'),
(12,'Eritrea'),
(13,'Eritrea'),
(14,'Tanzania'),
(15,'Ethiopia'),
(16,'	Korea'),
(17,'Jamaica');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currencyid` int(11) NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(30) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`currencyid`),
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`currencyid`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currency` */

/*Table structure for table `flightbooking` */

DROP TABLE IF EXISTS `flightbooking`;

CREATE TABLE `flightbooking` (
  `flightbookingid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingdate` datetime DEFAULT NULL,
  `bookingtypeid` int(11) DEFAULT NULL,
  `paymentmethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightbookingid`),
  KEY `flightid` (`flightid`),
  KEY `bookingtypeid` (`bookingtypeid`),
  KEY `paymentmethodid` (`paymentmethodid`),
  CONSTRAINT `flightbooking_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightbooking_ibfk_2` FOREIGN KEY (`bookingtypeid`) REFERENCES `bookingtype` (`bookingtypeid`),
  CONSTRAINT `flightbooking_ibfk_3` FOREIGN KEY (`paymentmethodid`) REFERENCES `paymentmethod` (`methodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbooking` */

/*Table structure for table `flightbookingclass` */

DROP TABLE IF EXISTS `flightbookingclass`;

CREATE TABLE `flightbookingclass` (
  `flightbookingclassid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` int(11) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightbookingclassid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `currencyid` (`currencyid`),
  CONSTRAINT `flightbookingclass_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `flightbookingclass_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingclass` */

/*Table structure for table `flightbookingpassanger` */

DROP TABLE IF EXISTS `flightbookingpassanger`;

CREATE TABLE `flightbookingpassanger` (
  `flightbookingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `secondname` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`flightbookingid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `documentid` (`documentid`),
  CONSTRAINT `flightbookingpassanger_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `flightbookingpassanger_ibfk_2` FOREIGN KEY (`documentid`) REFERENCES `traveldocuments` (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingpassanger` */

/*Table structure for table `flightclasses` */

DROP TABLE IF EXISTS `flightclasses`;

CREATE TABLE `flightclasses` (
  `flightclassid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingclassid` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` int(11) DEFAULT NULL,
  `currency` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`flightclassid`),
  KEY `flightid` (`flightid`),
  KEY `bookingclassid` (`bookingclassid`),
  CONSTRAINT `flightclasses_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightclasses_ibfk_2` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightclasses` */

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `airlineid` int(11) DEFAULT NULL,
  `flightname` varchar(30) DEFAULT NULL,
  `flightno` int(11) DEFAULT NULL,
  `departurecity` varchar(30) DEFAULT NULL,
  `destinationcity` varchar(30) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `departuretime` datetime DEFAULT NULL,
  `departureairportid` varchar(30) DEFAULT NULL,
  `destinationairportid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `airlineid` (`airlineid`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flights` */

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `methodid` int(11) NOT NULL AUTO_INCREMENT,
  `methodname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`methodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethod` */

/*Table structure for table `traveldocuments` */

DROP TABLE IF EXISTS `traveldocuments`;

CREATE TABLE `traveldocuments` (
  `documentid` int(11) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(30) DEFAULT NULL,
  `documentexpires` datetime DEFAULT NULL,
  PRIMARY KEY (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `traveldocuments` */

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`(
    $countryid int, $countryname varchar(100) 
)
BEGIN
    select * from `country`
    where `countryid`!=$countryid and `countryname`=$countryname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`(IN p_airlineid INT)
BEGIN
    DELETE FROM airline WHERE airlineid = p_airlineid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`(IN p_airportid INT)
BEGIN
    DELETE FROM airport WHERE airportid = p_airportid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`(IN p_bookingclassid INT)
BEGIN
    DELETE FROM bookingclass WHERE bookingclassid = p_bookingclassid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`(IN p_bookingtypeid INT)
BEGIN
    DELETE FROM bookingtype WHERE bookingtypeid = p_bookingtypeid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`(IN p_cityid INT)
BEGIN
    DELETE FROM city WHERE cityid = p_cityid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`(IN $countryid INT)
BEGIN
    DELETE FROM country WHERE `countryid` = $countryid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`(IN p_currencyid INT)
BEGIN
    DELETE FROM currency WHERE currencyid = p_currencyid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbooking`(IN p_flightbookingid INT)
BEGIN
    DELETE FROM flightbooking WHERE flightbookingid = p_flightbookingid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingclass`(IN p_flightbookingclassid INT)
BEGIN
    DELETE FROM flightbookingclass WHERE flightbookingclassid = p_flightbookingclassid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingpassenger`(IN p_flightbookingid INT)
BEGIN
    DELETE FROM flightbookingpassanger WHERE flightbookingid = p_flightbookingid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclasses`(IN p_flightclassid INT)
BEGIN
    DELETE FROM flightclasses WHERE flightclassid = p_flightclassid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflights`(IN p_flightid INT)
BEGIN
    DELETE FROM flights WHERE flightid = p_flightid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethod`(IN p_methodid INT)
BEGIN
    DELETE FROM paymentmethod WHERE methodid = p_methodid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletetraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletetraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletetraveldocuments`(IN p_documentid INT)
BEGIN
    DELETE FROM traveldocuments WHERE documentid = p_documentid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`(IN p_airlineid INT)
BEGIN
    IF p_airlineid IS NULL THEN
        SELECT * FROM airline;
    ELSE
        SELECT * FROM airline WHERE airlineid = p_airlineid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`(IN p_airportid INT)
BEGIN
    IF p_airportid IS NULL THEN
        SELECT * FROM airport;
    ELSE
        SELECT * FROM airport WHERE airportid = p_airportid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`(IN p_bookingclassid INT)
BEGIN
    IF p_bookingclassid IS NULL THEN
        SELECT * FROM bookingclass;
    ELSE
        SELECT * FROM bookingclass WHERE bookingclassid = p_bookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`(IN p_bookingtypeid INT)
BEGIN
    IF p_bookingtypeid IS NULL THEN
        SELECT * FROM bookingtype;
    ELSE
        SELECT * FROM bookingtype WHERE bookingtypeid = p_bookingtypeid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`()
BEGIN

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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrency`(IN p_currencyid INT)
BEGIN
    IF p_currencyid IS NULL THEN
        SELECT * FROM currency;
    ELSE
        SELECT * FROM currency WHERE currencyid = p_currencyid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbooking`(IN p_flightbookingid INT)
BEGIN
    IF p_flightbookingid IS NULL THEN
        SELECT * FROM flightbooking;
    ELSE
        SELECT * FROM flightbooking WHERE flightbookingid = p_flightbookingid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclass`(IN p_flightbookingclassid INT)
BEGIN
    IF p_flightbookingclassid IS NULL THEN
        SELECT * FROM flightbookingclass;
    ELSE
        SELECT * FROM flightbookingclass WHERE flightbookingclassid = p_flightbookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingpassenger`(IN p_flightbookingid INT)
BEGIN
    IF p_flightbookingid IS NULL THEN
        SELECT * FROM flightbookingpassanger;
    ELSE
        SELECT * FROM flightbookingpassanger WHERE flightbookingid = p_flightbookingid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`(IN p_flightclassid INT)
BEGIN
    IF p_flightclassid IS NULL THEN
        SELECT * FROM flightclasses;
    ELSE
        SELECT * FROM flightclasses WHERE flightclassid = p_flightclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`(IN p_flightid INT)
BEGIN
    IF p_flightid IS NULL THEN
        SELECT * FROM flights;
    ELSE
        SELECT * FROM flights WHERE flightid = p_flightid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethod`(IN p_methodid INT)
BEGIN
    IF p_methodid IS NULL THEN
        SELECT * FROM paymentmethod;
    ELSE
        SELECT * FROM paymentmethod WHERE methodid = p_methodid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettraveldocuments`(IN p_documentid INT)
BEGIN
    IF p_documentid IS NULL THEN
        SELECT * FROM traveldocuments;
    ELSE
        SELECT * FROM traveldocuments WHERE documentid = p_documentid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`(
    IN p_airlineid INT,
    IN p_airlinename VARCHAR(30),
    IN p_airlinelogo VARCHAR(200),
    IN p_airportid INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM airline 
                   WHERE airlineid = p_airlineid) THEN
        INSERT INTO airline (airlineid, airlinename, airlinelogo, airportid)
        VALUES (p_airlineid, p_airlinename, p_airlinelogo, p_airportid);
    ELSE
        UPDATE airline
        SET 
            airlinename = p_airlinename,
            airlinelogo = p_airlinelogo,
            airportid   = p_airportid
        WHERE airlineid = p_airlineid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`(
    IN p_airportid INT,
    IN p_airportcode VARCHAR(30),
    IN p_airportname VARCHAR(30),
    IN p_cityid INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM airport WHERE airportid = p_airportid) THEN
        INSERT INTO airport (airportid, airportcode, airportname, cityid)
        VALUES (p_airportid, p_airportcode, p_airportname, p_cityid);
    ELSE
        UPDATE airport
        SET 
            airportcode = p_airportcode,
            airportname = p_airportname,
            cityid      = p_cityid
        WHERE airportid = p_airportid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclass`(
    IN p_bookingclassid INT,
    IN p_classname VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM bookingclass WHERE bookingclassid = p_bookingclassid) THEN
        INSERT INTO bookingclass (bookingclassid, classname)
        VALUES (p_bookingclassid, p_classname);
    ELSE
        UPDATE bookingclass
        SET classname = p_classname
        WHERE bookingclassid = p_bookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`(
    IN p_bookingtypeid INT,
    IN p_typename VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM bookingtype WHERE bookingtypeid = p_bookingtypeid) THEN
        INSERT INTO bookingtype (bookingtypeid, typename)
        VALUES (p_bookingtypeid, p_typename);
    ELSE
        UPDATE bookingtype
        SET typename = p_typename
        WHERE bookingtypeid = p_bookingtypeid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`(
    IN $cityid INT,
    IN $cityname VARCHAR(50),
    in $countryid int
)
BEGIN
    -- If ID exists, update. If not, insert new.
    IF $cityid = 0 THEN
	    IF NOT EXISTS (SELECT * FROM `city` WHERE `cityyname` = $cityyname and `countryid`=$countryid) THEN
		    INSERT INTO `city` (`cityname`,`countryid`)
		    VALUES ($cityname, $countryid);
		END IF;
        ELSE
		UPDATE `city` 
		SET `cityname` = $cityname,
		     `countryid`=$countryid
		WHERE `cityid` = $cityid;
    
        
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`(
    IN $countryid INT,
    IN $countryname VARCHAR(50)
)
BEGIN
    -- If ID exists, update. If not, insert new.
    if $countryid = 0 then
    IF not EXISTS (SELECT * FROM `country` WHERE `countryname` = $countryname) THEN
    INSERT INTO `country` (`countryname`)
        VALUES ($countryname);
        end if;
        else
        UPDATE `country` 
        SET `countryname` = $countryname
        WHERE `countryid` = $countryid;
    
        
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrency`(
    IN p_currencyid INT,
    IN p_currencyname VARCHAR(30),
    IN p_countryid INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM currency WHERE currencyid = p_currencyid) THEN
        INSERT INTO currency (currencyid, currencyname, countryid)
        VALUES (p_currencyid, p_currencyname, p_countryid);
    ELSE
        UPDATE currency
        SET 
            currencyname = p_currencyname,
            countryid    = p_countryid
        WHERE currencyid = p_currencyid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbooking`()
BEGIN

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingclass`(
    IN p_flightbookingclassid INT,
    IN p_bookingclassid INT,
    IN p_noofseats INT,
    IN p_unitprice INT,
    IN p_currencyid INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM flightbookingclass WHERE flightbookingclassid = p_flightbookingclassid) THEN
        INSERT INTO flightbookingclass (flightbookingclassid, bookingclassid, noofseats, unitprice, currencyid)
        VALUES (p_flightbookingclassid, p_bookingclassid, p_noofseats, p_unitprice, p_currencyid);
    ELSE
        UPDATE flightbookingclass
        SET 
            bookingclassid = p_bookingclassid,
            noofseats      = p_noofseats,
            unitprice      = p_unitprice,
            currencyid     = p_currencyid
        WHERE flightbookingclassid = p_flightbookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingpassenger`(
    IN p_flightbookingid INT,
    IN p_bookingclassid INT,
    IN p_documentid INT,
    IN p_firstname VARCHAR(30),
    IN p_secondname VARCHAR(30),
    IN p_surname VARCHAR(30),
    IN p_gender VARCHAR(30),
    IN p_dob DATE
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM flightbookingpassanger WHERE flightbookingid = p_flightbookingid) THEN
        INSERT INTO flightbookingpassanger (flightbookingid, bookingclassid, documentid, firstname, secondname, surname, gender, dob)
        VALUES (p_flightbookingid, p_bookingclassid, p_documentid, p_firstname, p_secondname, p_surname, p_gender, p_dob);
    ELSE
        UPDATE flightbookingpassanger
        SET 
            bookingclassid = p_bookingclassid,
            documentid     = p_documentid,
            firstname      = p_firstname,
            secondname     = p_secondname,
            surname        = p_surname,
            gender         = p_gender,
            dob            = p_dob
        WHERE flightbookingid = p_flightbookingid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclasses`(
    IN p_flightclassid INT,
    IN p_flightid INT,
    IN p_bookingclassid INT,
    IN p_noofseats INT,
    IN p_unitprice INT,
    IN p_currency VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM flightclasses WHERE flightclassid = p_flightclassid) THEN
        INSERT INTO flightclasses (flightclassid, flightid, bookingclassid, noofseats, unitprice, currency)
        VALUES (p_flightclassid, p_flightid, p_bookingclassid, p_noofseats, p_unitprice, p_currency);
    ELSE
        UPDATE flightclasses
        SET 
            flightid       = p_flightid,
            bookingclassid = p_bookingclassid,
            noofseats      = p_noofseats,
            unitprice      = p_unitprice,
            currency       = p_currency
        WHERE flightclassid = p_flightclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflights`(
    IN p_flightid INT,
    IN p_airlineid INT,
    IN p_flightname VARCHAR(30),
    IN p_flightno INT,
    IN p_departurecity VARCHAR(30),
    IN p_destinationcity VARCHAR(30),
    IN p_duration VARCHAR(30),
    IN p_departuretime DATETIME,
    IN p_departureairportid VARCHAR(30),
    IN p_destinationairportid VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM flights WHERE flightid = p_flightid) THEN
        INSERT INTO flights (flightid, airlineid, flightname, flightno, departurecity, destinationcity, duration, departuretime, departureairportid, destinationairportid)
        VALUES (p_flightid, p_airlineid, p_flightname, p_flightno, p_departurecity, p_destinationcity, p_duration, p_departuretime, p_departureairportid, p_destinationairportid);
    ELSE
        UPDATE flights
        SET 
            airlineid            = p_airlineid,
            flightname           = p_flightname,
            flightno             = p_flightno,
            departurecity        = p_departurecity,
            destinationcity      = p_destinationcity,
            duration             = p_duration,
            departuretime        = p_departuretime,
            departureairportid   = p_departureairportid,
            destinationairportid = p_destinationairportid
        WHERE flightid = p_flightid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepaymentmethod`(
    IN p_methodid INT,
    IN p_methodname VARCHAR(30)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM paymentmethod WHERE methodid = p_methodid) THEN
        INSERT INTO paymentmethod (methodid, methodname)
        VALUES (p_methodid, p_methodname);
    ELSE
        UPDATE paymentmethod
        SET methodname = p_methodname
        WHERE methodid = p_methodid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savetraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savetraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savetraveldocuments`()
BEGIN

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
