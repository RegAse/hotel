-- Create Database
CREATE DATABASE IF NOT EXISTS gudmundur_hotel_basic;

-- Countries
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`countries` (
`alpha336612` char(2) NOT NULL,
`alpha336613` char(3) NOT NULL,
`alpha31662` char(13) NOT NULL,
`numeric33661` int(11) NOT NULL,
`countryName` varchar(75) NOT NULL,
PRIMARY KEY (`alpha336612`)
);

-- Guests
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`guests` (
`guestID` int(11) NOT NULL AUTO_INCREMENT,
`firstName` varchar(45) NOT NULL,
`lastName` varchar(45) NOT NULL,
`nationality` char(2) NOT NULL,
PRIMARY KEY (`guestID`),
FOREIGN KEY (nationality) REFERENCES countries(alpha336612)
);

-- Hotels
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`hotels` (
`hotelID` int(11) NOT NULL AUTO_INCREMENT,
`hotelName` varchar(55) NOT NULL,
`streetAddress` varchar(125) NOT NULL,
`cityName` varchar(75) NOT NULL,
`countryID` char(2) NOT NULL,
PRIMARY KEY (`hotelID`),
FOREIGN KEY (countryID) REFERENCES countries(alpha336612)
);

-- Comments
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`comments` (
`commentID` int(11) NOT NULL AUTO_INCREMENT,
`content` varchar(350) NOT NULL,
`guestID` int(11) NOT NULL,
PRIMARY KEY (`commentID`),
FOREIGN KEY (guestID) REFERENCES guests(guestID)
);

-- Bookings
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`bookings` (
`bookingNumber` int(11) NOT NULL AUTO_INCREMENT,
`checkIn` date NOT NULL,
`checkOut` date NOT NULL,
`dateOfBooking` datetime NOT NULL,
`roomNumber` int(11) NOT NULL,
`guestID` int(11) NOT NULL,
PRIMARY KEY (`bookingNumber`),
FOREIGN KEY (guestID) REFERENCES guests(guestID)
);

-- RoomType
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`roomtype` (
`roomTypeID` int(11) NOT NULL AUTO_INCREMENT,
`roomType` varchar(120) NOT NULL,
PRIMARY KEY (`roomTypeID`)
);


-- Rooms
CREATE TABLE IF NOT EXISTS gudmundur_hotel_basic.`rooms` (
`roomNumber` int(11) NOT NULL AUTO_INCREMENT,
`roomTypeID` int(11) NOT NULL,
`recommendedPrice` int(11) NOT NULL,
`hotelID` int(11) NOT NULL,
PRIMARY KEY (`roomNumber`),
FOREIGN KEY (hotelID) REFERENCES hotels(hotelID),
FOREIGN KEY (roomTypeID) REFERENCES roomtype(roomTypeID)
);