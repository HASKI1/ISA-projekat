-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for isa
DROP DATABASE IF EXISTS `isa`;
CREATE DATABASE IF NOT EXISTS `isa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `isa`;

-- Dumping structure for table isa.bukiranje
DROP TABLE IF EXISTS `bukiranje`;
CREATE TABLE IF NOT EXISTS `bukiranje` (
  `BukiranjeId` int(11) NOT NULL AUTO_INCREMENT,
  `NalogId` int(11) NOT NULL,
  `MestoId` int(11) NOT NULL,
  `HranaId` int(11) DEFAULT NULL,
  `PiceId` int(11) DEFAULT NULL,
  `BrojPozvanih` int(11) NOT NULL,
  `UkupnaCena` float NOT NULL,
  PRIMARY KEY (`BukiranjeId`) USING BTREE,
  KEY `bukiranje_fk1` (`MestoId`),
  KEY `bukiranje_fk3` (`HranaId`),
  KEY `bukiranje_fk4` (`PiceId`),
  KEY `NalogId` (`NalogId`),
  CONSTRAINT `bukiranje_fk1` FOREIGN KEY (`MestoId`) REFERENCES `mesto` (`MestoId`) ON UPDATE CASCADE,
  CONSTRAINT `bukiranje_fk2` FOREIGN KEY (`NalogId`) REFERENCES `nalog` (`NalogId`) ON UPDATE CASCADE,
  CONSTRAINT `bukiranje_fk3` FOREIGN KEY (`HranaId`) REFERENCES `hrana` (`HranaId`) ON UPDATE CASCADE,
  CONSTRAINT `bukiranje_fk4` FOREIGN KEY (`PiceId`) REFERENCES `pice` (`PiceId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table isa.hrana
DROP TABLE IF EXISTS `hrana`;
CREATE TABLE IF NOT EXISTS `hrana` (
  `HranaId` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` char(50) NOT NULL,
  `Sastojci` char(50) NOT NULL,
  `Cena` float NOT NULL,
  `Kolicina` int(11) NOT NULL,
  PRIMARY KEY (`HranaId`),
  UNIQUE KEY `Ime` (`Ime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table isa.mesto
DROP TABLE IF EXISTS `mesto`;
CREATE TABLE IF NOT EXISTS `mesto` (
  `MestoId` int(11) NOT NULL AUTO_INCREMENT,
  `Adresa` char(50) NOT NULL,
  `Vreme` int(11) NOT NULL,
  `Kvadratura` int(11) NOT NULL,
  `Dodatne Pogodnosti` int(11) DEFAULT NULL,
  `Uslovi` int(11) DEFAULT NULL,
  `Cena` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`MestoId`),
  UNIQUE KEY `Adresa` (`Adresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table isa.nalog
DROP TABLE IF EXISTS `nalog`;
CREATE TABLE IF NOT EXISTS `nalog` (
  `NalogId` int(11) NOT NULL AUTO_INCREMENT,
  `KorisnickoIme` char(50) NOT NULL,
  `Lozinka` char(50) NOT NULL,
  `BrojTelefona` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`NalogId`),
  UNIQUE KEY `BrojTelefona` (`BrojTelefona`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table isa.pice
DROP TABLE IF EXISTS `pice`;
CREATE TABLE IF NOT EXISTS `pice` (
  `PiceId` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` char(50) NOT NULL,
  `Sastojci` char(50) NOT NULL,
  `Cena` float NOT NULL,
  `Kolicina` int(11) NOT NULL,
  PRIMARY KEY (`PiceId`),
  UNIQUE KEY `Name` (`Ime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
