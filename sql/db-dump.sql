-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 13 nov 2014 kl 19:30
-- Serverversion: 5.6.17
-- PHP-version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `webshop`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `streetname` varchar(255) DEFAULT NULL,
  `streetnumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `login`
--

INSERT INTO `login` (`email`, `password`) VALUES
('banana@fruits.com', 'password'),
('hugo@boss.com', 'banan');

-- --------------------------------------------------------

--
-- Tabellstruktur `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
`id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `pcategories`
--

CREATE TABLE IF NOT EXISTS `pcategories` (
`catid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

--
-- Dumpning av Data i tabell `pcategories`
--

INSERT INTO `pcategories` (`catid`, `name`, `description`) VALUES
(1, 'Teddybears', '<p>Fluffy, lovely and irresistible.</p><p>Our cute Teddybears are all made in China of the finest material.</p>'),
(2, 'Elephants', '<p>Sturdy, grey and irresistible.</p><p>Our plastic Elephants are all made in China of the finest material.</p>'),
(3, 'Strange things', '<p>Really strange things in sturdy plastic.</p>');

-- --------------------------------------------------------

--
-- Tabellstruktur `postcodes`
--

CREATE TABLE IF NOT EXISTS `postcodes` (
  `postcode` varchar(255) NOT NULL DEFAULT '',
  `town` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`pid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `description` text,
  `catid` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

--
-- Dumpning av Data i tabell `products`
--

INSERT INTO `products` (`pid`, `name`, `price`, `description`, `catid`) VALUES
(1, 'Yellow Teddybear', 99, 'A yellow teddybear.', 1),
(2, 'Pink Teddybear', 120, 'A pink teddybear.', 1),
(3, 'Yellow Submarine', 300, 'A yellow submarine.', 3),
(5, 'Small Elephant', 75, 'A small elephant.', 2),
(6, 'Medium Elephant', 155, 'A medium elephant.', 2),
(7, 'Bazooka', 1000, 'A really large Bazooka.', 3),
(8, 'Black Teddy', 400, 'A rare Teddybear.', 1),
(9, 'Brown Teddybear', 232, 'A new color.', NULL),
(10, 'White Teddybear', 295, 'White and clean', NULL),
(11, 'Gray Teddybear', 50, 'A grey teddybear', 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`uid` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `email`) VALUES
(1, 'Hugo', 'Boss', 'hugo@boss.com'),
(2, 'Banana', 'fruit', 'banana@fruits.com');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`);

--
-- Index för tabell `login`
--
ALTER TABLE `login`
 ADD UNIQUE KEY `email` (`email`);

--
-- Index för tabell `orderitems`
--
ALTER TABLE `orderitems`
 ADD PRIMARY KEY (`id`), ADD KEY `orderid` (`orderid`), ADD KEY `productid` (`productid`);

--
-- Index för tabell `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`orderid`), ADD KEY `userid` (`userid`);

--
-- Index för tabell `pcategories`
--
ALTER TABLE `pcategories`
 ADD PRIMARY KEY (`catid`);

--
-- Index för tabell `postcodes`
--
ALTER TABLE `postcodes`
 ADD PRIMARY KEY (`postcode`);

--
-- Index för tabell `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`pid`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `orderitems`
--
ALTER TABLE `orderitems`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `orders`
--
ALTER TABLE `orders`
MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `pcategories`
--
ALTER TABLE `pcategories`
MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `products`
--
ALTER TABLE `products`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`uid`);

--
-- Restriktioner för tabell `login`
--
ALTER TABLE `login`
ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Restriktioner för tabell `orderitems`
--
ALTER TABLE `orderitems`
ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`pid`),
ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`);

--
-- Restriktioner för tabell `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
