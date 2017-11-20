-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2017 at 07:13 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypro2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Pack');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `fullname` text NOT NULL,
  `occupation` text NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `district` text NOT NULL,
  `city` text NOT NULL,
  `phone` text NOT NULL,
  `dated` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `customer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `invoiceId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `weight` float DEFAULT NULL,
  `description` text,
  `image` text,
  `thumbnail` text,
  `name` text NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `username`, `price`, `weight`, `description`, `image`, `thumbnail`, `name`, `categoryId`, `createdDate`) VALUES
(5, 'k', 100, 10, 'this is wiki', '/PRO2/resource/wiki.jpg', '/PRO2/resource/wiki.jpgthumbnail', 'wiki', 1, '2017-11-19 15:01:37'),
(6, 'k', 20, 200, 'ki', '/PRO2/resource/ik.jpg', '/PRO2/resource/ik.jpgthumbnail', 'ik', 1, '2017-11-19 18:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shop_info`
--

CREATE TABLE `shop_info` (
  `logo` text,
  `name` varchar(100) NOT NULL,
  `phone` text,
  `messenger` varchar(50) DEFAULT NULL,
  `fanpage_url` text NOT NULL,
  `mail` text,
  `address` text NOT NULL,
  `twitter` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_info`
--

INSERT INTO `shop_info` (`logo`, `name`, `phone`, `messenger`, `fanpage_url`, `mail`, `address`, `twitter`) VALUES
('/PRO2/resource/logo.jpg', 'doggy', '01215878387', 'https://www.facebook.com/messages/t/NguyenDanh1995', 'https://www.facebook.com/messages', 'example@gmail.com', 'ho chi minh', ''),
('/PRO2/resource/logo.jpg', 'myshopname', '01215878387', 'https://www.facebook.com/messages/t/NguyenDanh1995', 'https://www.facebook.com/messages', 'example@gmail.com', 'ho chi minh', ''),
('/PRO2/resource/logo.jpg', 'shopname', '01215878387', 'https://www.facebook.com/messages/t/NguyenDanh1995', 'https://www.facebook.com/messages', 'example@gmail.com', 'ho chi minh', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `shop_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `pwd`, `role`, `shop_name`) VALUES
('k', 'a', 'ROLE_ADMIN', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`invoiceId`,`productId`),
  ADD KEY `invoice_detail_product` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category` (`categoryId`),
  ADD KEY `product_user` (`username`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_customer` (`customerId`);

--
-- Indexes for table `shop_info`
--
ALTER TABLE `shop_info`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD KEY `user_shop_idx` (`shop_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_invoice` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoice_detail_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_shop` FOREIGN KEY (`shop_name`) REFERENCES `shop_info` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
