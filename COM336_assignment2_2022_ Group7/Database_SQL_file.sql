-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2022 at 10:59 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `CustomerId` int(11) NOT NULL,
  `CPassword` varchar(120) DEFAULT NULL,
  `CCardNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `AuthorId` int(11) NOT NULL AUTO_INCREMENT,
  `AName` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`AuthorId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorId`, `AName`) VALUES
(1, 'Stephen King'),
(2, 'J.K. Rowling'),
(3, 'Danielle Steel'),
(4, 'Agatha Christie'),
(5, 'James Patterson'),
(6, 'John Grisham'),
(7, 'Dan Brown'),
(8, 'William Shakespeare'),
(9, 'Barbara Cartland'),
(10, 'Georges Simenon');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `ISBN` varchar(13) NOT NULL,
  `BookTitle` varchar(150) DEFAULT NULL,
  `BookDescription` varchar(120) DEFAULT NULL,
  `BookGenre` varchar(60) DEFAULT NULL,
  `QuantityInStock` int(11) DEFAULT NULL,
  `RunningQuantitySold` int(11) DEFAULT NULL,
  `CostPrice` decimal(7,2) DEFAULT NULL,
  `SellPrice` decimal(7,2) DEFAULT NULL,
  `AuthorId` int(11) NOT NULL,
  `PublisherId` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `AuthorId` (`AuthorId`),
  KEY `PublisherId` (`PublisherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `BookTitle`, `BookDescription`, `BookGenre`, `QuantityInStock`, `RunningQuantitySold`, `CostPrice`, `SellPrice`, `AuthorId`, `PublisherId`) VALUES
('9712783423559', 'Pride and Prejudice', 'Loved for their unique relationship comprised of witty banter and flirting, Elizabeth and Mr. Darcy fall for each other ', 'Romance', 31, 426, '102.50', '159.99', 8, 8),
('9724679012469', 'The Midnight Library', 'Nora Seed feels stuck in her life, bound to the choices she made that she still isn\'t sure were right.', 'Drama', 30, 199, '15.50', '22.99', 1, 1),
('9746238346729', 'The Invisible Life of Addie LaRue', 'A young woman named Addie who, in 1714, makes a bargain with a dark god and becomes cursed to be forgotten by everyone s', 'Fantasy', 25, 700, '15.00', '28.99', 2, 2),
('9764647576903', 'The Vanishing Half', 'Though the Vignes twin sisters grew up identical in their small, southern community, their lives split in young adulthoo', 'Fiction', 11, 519, '64.50', '75.99', 10, 10),
('9772392747202', 'To Kill a Mockingbird', 'Her father, Atticus Finch, is a lawyer defending a Black man wrongly accused of a terrible crime as he faces a community', 'Fiction', 30, 322, '79.50', '99.99', 4, 4),
('9772392748720', 'The Seven Husbands of Evelyn Hugo', 'Evelyn Hugo was an iconic Hollywood actress, just as notoriously remembered for her seven marriages as she was for her m', 'Romance', 5, 560, '12.00', '23.99', 3, 3),
('9778347548569', '1984', 'A dystopian future ruled by a totalitarian state, perpetually at war and at the mercy of strong propaganda.', 'Sci-Fi', 30, 600, '64.00', '74.99', 7, 7),
('9783672821639', 'Where the Crawdads Sing', 'Kya Clark is known to most as the Marsh Girl, running barefoot and wild in her quiet fishing village, having attended on', 'Romance', 20, 199, '22.99', '33.99', 6, 6),
('9784846252940', 'The Great Gatsby', 'When Nick Carraway moved to Long Island to find a job in New York City as a bond salesman, he meets his next-door neighb', 'Drama', 15, 588, '44.00', '74.99', 5, 5),
('9786879047362', 'The Song of Achilles', 'Patroclus is an awkward young prince, exiled by his father because of a misunderstanding when he meets the legendary Ach', 'Fantasy', 52, 688, '65.50', '75.99', 9, 9),
('9863512139391', 'The Guest List', 'Set on a remote island off the coast of Ireland, a fascinating group of friends and family converge to celebrate the mar', 'Crime', 15, 95, '35.50', '45.99', 1, 10),
('9874575945923', 'People We Meet on Vacation', 'Alex and Poppy became best friends on a happenstance summer road trip in college, spurring a tradition of summer trips t', 'Drama', 5, 25, '90.50', '124.99', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `customeralerts`
--

DROP TABLE IF EXISTS `customeralerts`;
CREATE TABLE IF NOT EXISTS `customeralerts` (
  `AuthorId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`AuthorId`,`CustomerId`),
  KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `CFirstName` varchar(120) DEFAULT NULL,
  `CLastName` varchar(120) DEFAULT NULL,
  `CEmail` varchar(120) DEFAULT NULL,
  `CPhone` varchar(12) DEFAULT NULL,
  `CAddress` varchar(120) DEFAULT NULL,
  `CPostCode` varchar(8) DEFAULT NULL,
  `CCity` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerId`, `CFirstName`, `CLastName`, `CEmail`, `CPhone`, `CAddress`, `CPostCode`, `CCity`) VALUES
(1, 'Jake', 'Mount', 'jm.77@outlook.co.uk', '4383940577', '66 Park View', 'BT48 7RF', 'Belfast'),
(2, 'Jason', 'Fleming', 'jf86@outlook.co.uk', '2234612180', '2 Yana Lane', 'BT49 2DC', 'Omagh'),
(3, 'Elenor', 'King', 'ek13@outlook.co.uk', '7313233414', '44 Lag Road', 'BT47 3YK', 'Tyrone'),
(4, 'Harry', 'Potter', 'hp19@yahoo.co.uk', '6472839029', '15 Hagrid Street', 'BT47 1PO', 'Derry'),
(5, 'Jill', 'Valentine', 'jl49@gmail.co.uk', '5318289385', '9 Temper Park', 'BT46 7QV', 'Belfast'),
(6, 'Zack', 'Snyder', 'zs56@outlook.co.uk', '9512781718', '37 Super Street', 'BT56 7WC', 'Omagh'),
(7, 'Chris', 'Redfield', 'cr11@gmail.co.uk', '5391948752', '21 Jump Park', 'BT48 6RD', 'Derry'),
(8, 'Niamh', 'McConnell', 'nmc93@yahoo.co.uk', '2861456738', '16 Cane View', 'BT43 P9J', 'Derry'),
(9, 'Kyle', 'Walker', 'kw61@gmail.co.uk', '7129876642', '98 Jerry Lane', 'BT47 5PL', 'Belfast'),
(10, 'Clare', 'Redfield', 'cr24@outlook.co.uk', '7413559851', '31 Fall Park', 'BT48 3GH', 'Derry');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` date DEFAULT NULL,
  `QuantityOrdered` int(11) DEFAULT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `PublisherId` int(11) NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  KEY `ISBN` (`ISBN`),
  KEY `PublisherId` (`PublisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderNumber`, `OrderDate`, `QuantityOrdered`, `ISBN`, `PublisherId`) VALUES
(1, '2011-01-04', 3, '9724679012469', 1),
(2, '2016-02-01', 3, '9746238346729', 2),
(3, '2012-11-01', 9, '9772392748720', 3),
(4, '2018-11-02', 3, '9772392747202', 4),
(5, '2014-02-03', 2, '9784846252940', 5),
(6, '2013-04-05', 1, '9783672821639', 6),
(7, '2015-11-07', 3, '9778347548569', 7),
(8, '2012-03-08', 1, '9712783423559', 8),
(9, '2011-04-08', 1, '9786879047362', 9),
(10, '2014-05-09', 1, '9764647576903', 10),
(11, '2012-06-08', 6, '9724679012469', 1),
(12, '2018-01-07', 5, '9746238346729', 2),
(13, '2019-04-06', 1, '9772392748720', 3),
(14, '2018-05-05', 5, '9772392747202', 4),
(15, '2019-07-04', 4, '9784846252940', 5),
(16, '2011-10-02', 3, '9783672821639', 6),
(17, '2016-01-04', 2, '9778347548569', 7),
(18, '2017-05-01', 3, '9712783423559', 8),
(19, '2015-06-01', 1, '9786879047362', 9),
(20, '2015-07-01', 3, '9764647576903', 10),
(21, '2014-06-05', 20, '9863512139391', 10),
(22, '2017-03-02', 30, '9874575945923', 9);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE IF NOT EXISTS `publishers` (
  `PublisherId` int(11) NOT NULL AUTO_INCREMENT,
  `PWebsite` varchar(120) DEFAULT NULL,
  `PEmail` varchar(120) DEFAULT NULL,
  `PPhone` varchar(12) DEFAULT NULL,
  `PAddress` varchar(120) DEFAULT NULL,
  `PCity` varchar(120) DEFAULT NULL,
  `PPostCode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`PublisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`PublisherId`, `PWebsite`, `PEmail`, `PPhone`, `PAddress`, `PCity`, `PPostCode`) VALUES
(1, 'McGraw-hill.com', 'McGraw-hill@gmail.com', '1341572884', '123 Faro Avenue', 'Belfast', 'BT49 6WV'),
(2, 'pearson.org', 'pearson@outlook.co.uk', '8472635491', '1 Jima Park', 'Derry', 'BT47 5WE'),
(3, 'relx.com', 'relx@gmail.com', '9475274659', '56 Hatfield View', 'Tyrone', 'BT45 8RH'),
(4, 'thomsonreuters.info', 'thomsonreuters@yahoo.com', '9887526492', '77 Honing Street', 'London', 'LN13 0NQ'),
(5, 'penguinrandomhouse.blog', 'penguinrandomhouse@outlook.com', '9182749287', '32 Lucky Lane', 'Manchester', 'MN87 0MR'),
(6, 'hachetterlivre.net', 'hachetterlivre@gmail.com', '8372978923', '52 Blue Street', 'Belfast', 'BT49 3NZ'),
(7, 'harpercollins.org', 'harpercollins@outlook.com', '9865132782', '94 Bronze Park', 'London', 'LN13 8TB'),
(8, 'macmillan.blog', 'macmillan@yahoo.co.uk', '1529162063', 'P.O. Box 178, 13 Faulty Towers', 'London', 'LN89 0CL'),
(9, 'bertelsmann.info', 'bertelsmann@outlook.co.uk', '9898436251', '23 Eriksen View', 'London', 'LN59 8RF'),
(10, 'scholastic.blog', 'scholasti@gmail.com', '9287504732', '76 Fair Lane', 'Derry', 'BT48 4YH');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `PurchaseId` int(11) NOT NULL,
  `Price` decimal(7,2) DEFAULT NULL,
  `QuantityPurchased` int(11) DEFAULT NULL,
  `ISBN` varchar(13) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  `PurchaseDate` date DEFAULT NULL,
  PRIMARY KEY (`PurchaseId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `WarehouseId` (`WarehouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`PurchaseId`, `Price`, `QuantityPurchased`, `ISBN`, `CustomerId`, `WarehouseId`, `PurchaseDate`) VALUES
(1, '22.99', 4, '9724679012469', 1, 1, '2016-02-14'),
(2, '28.99', 5, '9746238346729', 2, 1, '2016-03-24'),
(3, '23.99', 3, '9772392748720', 3, 1, '2016-11-10'),
(4, '99.99', 2, '9772392747202', 4, 1, '2016-12-07'),
(5, '74.99', 5, '9784846252940', 5, 1, '2017-06-09'),
(6, '33.99', 3, '9783672821639', 6, 1, '2017-08-25'),
(7, '74.99', 5, '9778347548569', 7, 1, '2017-12-22'),
(8, '159.99', 3, '9712783423559', 8, 1, '2018-02-16'),
(9, '75.99', 5, '9786879047362', 9, 1, '2018-04-05'),
(10, '75.99', 1, '9764647576903', 10, 1, '2018-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `ReviewId` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewDate` date DEFAULT NULL,
  `ReviewRating` int(11) DEFAULT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `AuthorId` int(11) NOT NULL,
  `PublisherId` int(11) NOT NULL,
  PRIMARY KEY (`ReviewId`),
  KEY `ISBN` (`ISBN`),
  KEY `AuthorId` (`AuthorId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `PublisherId` (`PublisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewId`, `ReviewDate`, `ReviewRating`, `ISBN`, `CustomerId`, `AuthorId`, `PublisherId`) VALUES
(1, '2014-02-08', 5, '9724679012469', 1, 1, 1),
(2, '2017-03-09', 4, '9746238346729', 2, 2, 2),
(3, '2013-11-12', 3, '9772392748720', 3, 3, 3),
(4, '2019-09-12', 4, '9772392747202', 4, 4, 4),
(5, '2019-01-02', 3, '9784846252940', 5, 5, 5),
(6, '2020-04-02', 4, '9783672821639', 6, 6, 6),
(7, '2021-01-02', 2, '9778347548569', 7, 7, 7),
(8, '2013-03-07', 5, '9712783423559', 8, 8, 8),
(9, '2012-07-02', 5, '9786879047362', 9, 9, 9),
(10, '2016-05-04', 5, '9764647576903', 10, 10, 10),
(11, '2014-03-02', 2, '9724679012469', 1, 1, 1),
(12, '2020-04-03', 1, '9746238346729', 2, 2, 2),
(13, '2020-04-05', 4, '9772392748720', 3, 3, 3),
(14, '2021-11-04', 3, '9772392747202', 4, 4, 4),
(15, '2021-01-10', 3, '9784846252940', 5, 5, 5),
(16, '2012-06-11', 3, '9783672821639', 6, 6, 6),
(17, '2019-07-10', 3, '9778347548569', 7, 7, 7),
(18, '2019-03-10', 4, '9712783423559', 8, 8, 8),
(19, '2018-12-12', 5, '9786879047362', 9, 9, 9),
(20, '2017-10-11', 5, '9764647576903', 10, 10, 10),
(21, '2016-10-10', 5, '9863512139391', 1, 1, 10),
(22, '2021-03-06', 2, '9874575945923', 2, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `WarehouseId` int(11) NOT NULL AUTO_INCREMENT,
  `QuantityInStocks` int(11) DEFAULT NULL,
  `ISBN` varchar(13) NOT NULL,
  PRIMARY KEY (`WarehouseId`,`ISBN`),
  KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`WarehouseId`, `QuantityInStocks`, `ISBN`) VALUES
(1, 21, '9712783423559'),
(1, 40, '9724679012469'),
(1, 21, '9746238346729'),
(1, 19, '9764647576903'),
(1, 27, '9772392747202'),
(1, 0, '9772392748720'),
(1, 15, '9778347548569'),
(1, 32, '9783672821639'),
(1, 20, '9784846252940'),
(1, 22, '9786879047362'),
(1, 20, '9863512139391'),
(1, 30, '9874575945923');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `WarehouseId` int(11) NOT NULL AUTO_INCREMENT,
  `WAddress` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`WarehouseId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`WarehouseId`, `WAddress`) VALUES
(1, '22 Park Rd.,Hill-Top,BT47 2HY,Londonderry');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorId`) REFERENCES `authors` (`AuthorId`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`PublisherId`) REFERENCES `publishers` (`PublisherId`);

--
-- Constraints for table `customeralerts`
--
ALTER TABLE `customeralerts`
  ADD CONSTRAINT `customeralerts_ibfk_1` FOREIGN KEY (`AuthorId`) REFERENCES `authors` (`AuthorId`),
  ADD CONSTRAINT `customeralerts_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PublisherId`) REFERENCES `publishers` (`PublisherId`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouses` (`WarehouseId`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`AuthorId`) REFERENCES `authors` (`AuthorId`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`),
  ADD CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`PublisherId`) REFERENCES `publishers` (`PublisherId`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouses` (`WarehouseId`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
