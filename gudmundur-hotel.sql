-- Create Database
CREATE DATABASE IF NOT EXISTS gudmundur_hotel;

-- Countries
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Guests
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Comments
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `content` varchar(320) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (guest_id) REFERENCES guests(id)
);

-- Roomtypes
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`roomtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Employees
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` int(11) NOT NULL,
  `last_name` int(11) NOT NULL,
  `birth_day` date NOT NULL,
  PRIMARY KEY (`id`)
);

-- Jobs
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
);

-- Statuses
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Priority
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Floors
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`floors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Rooms
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `roomtype_id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `info` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (floor_id) REFERENCES floors(id),
  FOREIGN KEY (roomtype_id) REFERENCES roomtypes(id)
);

-- Bookings
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (room_id) REFERENCES rooms(id),
  FOREIGN KEY (status_id) REFERENCES statuses(id),
  FOREIGN KEY (guest_id) REFERENCES guests(id)
);

-- Cleaning
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`cleaning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `room_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- Hotels
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `street_address` varchar(125) NOT NULL,
  `city_name` varchar(75) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Employee_has_job
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`employee_has_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `started` date NOT NULL,
  `ended` date NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  FOREIGN KEY (job_id) REFERENCES jobs(id)
);

-- Hotel_has_floors
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`hotel_has_floors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (floor_id) REFERENCES floors(id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

-- Hotel_has_rooms
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`hotel_has_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

-- Issues
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue` varchar(400) NOT NULL,
  `priority_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (priority_id) REFERENCES priority(id)
);

-- Room_has_issue
CREATE TABLE IF NOT EXISTS gudmundur_hotel.`room_has_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (issue_id) REFERENCES issues(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);