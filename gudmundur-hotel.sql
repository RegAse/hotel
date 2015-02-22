-- Create Database
CREATE DATABASE IF NOT EXISTS gudmundur_hotel;

-- Countries
CREATE TABLE IF NOT EXISTS `countries` (
  `alpha336612` char(2) NOT NULL,
  `alpha336613` char(3) NOT NULL,
  `alpha31662` char(13) NOT NULL,
  `numeric33661` int(11) NOT NULL,
  `countryName` varchar(75) NOT NULL,
  PRIMARY KEY (`alpha336612`)
);

-- Guests
CREATE TABLE IF NOT EXISTS `guests` (
  `guestID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `nationality` char(2) NOT NULL,
  PRIMARY KEY (`guestID`),
  FOREIGN KEY (nationality) REFERENCES countries(alpha336612)
);

-- Hotels
CREATE TABLE IF NOT EXISTS `hotels` (
  `hotelID` int(11) NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(55) NOT NULL,
  `streetAddress` varchar(125) NOT NULL,
  `cityName` varchar(75) NOT NULL,
  `countryID` char(2) NOT NULL,
  PRIMARY KEY (`hotelID`),
  FOREIGN KEY (countryID) REFERENCES countries(alpha336612)
);

CREATE TABLE IF NOT EXISTS `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(350) NOT NULL,
  `guestID` int(11) NOT NULL,
  PRIMARY KEY (`commentID`),
  FOREIGN KEY (guestID) REFERENCES guests(guestID)
);