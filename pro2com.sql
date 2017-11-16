-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2017 at 05:23 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro2com`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertise`
--

CREATE TABLE `advertise` (
  `ID` binary(16) NOT NULL,
  `AdTypeID` binary(16) DEFAULT NULL,
  `ProdTypeID` binary(16) DEFAULT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Description` text,
  `Image` varchar(256) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advertisetype`
--

CREATE TABLE `advertisetype` (
  `ID` binary(16) NOT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` binary(16) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Firstname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Birthday` date NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(512) DEFAULT NULL,
  `Image` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` binary(16) NOT NULL,
  `NewsTypeID` binary(16) DEFAULT NULL,
  `ProdTypeID` binary(16) DEFAULT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Name` varchar(150) NOT NULL,
  `Image` varchar(256) DEFAULT NULL,
  `ThumbImage` varchar(256) DEFAULT NULL,
  `Description` text,
  `Updated` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newstype`
--

CREATE TABLE `newstype` (
  `ID` binary(16) NOT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `ID` int(11) NOT NULL,
  `OrderID` binary(16) NOT NULL,
  `ProductID` binary(16) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` binary(16) NOT NULL,
  `CustomerID` binary(16) NOT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `Updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `UserName` varchar(100) NOT NULL,
  `Series` varchar(64) DEFAULT NULL,
  `Token` varchar(64) NOT NULL,
  `Last_Used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` binary(16) NOT NULL,
  `ProdTypeID` binary(16) DEFAULT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Name` varchar(150) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Image` varchar(256) DEFAULT NULL,
  `ThumbImage` varchar(256) DEFAULT NULL,
  `Description` text,
  `Created` datetime DEFAULT NULL,
  `Updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `ID` binary(16) NOT NULL,
  `Code` varchar(7) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unregisterdcustomer`
--

CREATE TABLE `unregisterdcustomer` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` binary(16) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Image` varchar(512) DEFAULT NULL,
  `Role` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userconnection`
--

CREATE TABLE `userconnection` (
  `UserID` varchar(255) NOT NULL,
  `ProviderID` varchar(255) NOT NULL,
  `ProviderUserID` varchar(255) NOT NULL,
  `Rank` int(11) NOT NULL,
  `DisplayName` varchar(255) DEFAULT NULL,
  `ProfileURL` varchar(512) DEFAULT NULL,
  `ImageURL` varchar(512) DEFAULT NULL,
  `AccessToken` varchar(255) NOT NULL,
  `Secret` varchar(255) DEFAULT NULL,
  `RefreshToken` varchar(255) DEFAULT NULL,
  `ExpireTime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertise`
--
ALTER TABLE `advertise`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AdTypeID` (`AdTypeID`),
  ADD KEY `ProdTypeID` (`ProdTypeID`);

--
-- Indexes for table `advertisetype`
--
ALTER TABLE `advertisetype`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_UK` (`Name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL_UK` (`Email`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NewsTypeID` (`NewsTypeID`),
  ADD KEY `ProdTypeID` (`ProdTypeID`);

--
-- Indexes for table `newstype`
--
ALTER TABLE `newstype`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_UK` (`Name`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProdTypeID` (`ProdTypeID`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_UK` (`Name`);

--
-- Indexes for table `unregisterdcustomer`
--
ALTER TABLE `unregisterdcustomer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL_UK` (`Email`);

--
-- Indexes for table `userconnection`
--
ALTER TABLE `userconnection`
  ADD PRIMARY KEY (`UserID`,`ProviderID`,`ProviderUserID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`ProviderID`,`Rank`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unregisterdcustomer`
--
ALTER TABLE `unregisterdcustomer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertise`
--
ALTER TABLE `advertise`
  ADD CONSTRAINT `advertise_ibfk_1` FOREIGN KEY (`AdTypeID`) REFERENCES `advertisetype` (`ID`),
  ADD CONSTRAINT `advertise_ibfk_2` FOREIGN KEY (`ProdTypeID`) REFERENCES `producttype` (`ID`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`NewsTypeID`) REFERENCES `newstype` (`ID`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`ProdTypeID`) REFERENCES `producttype` (`ID`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProdTypeID`) REFERENCES `producttype` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
