-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2023 at 09:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khamang_restaurants`
--

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category`
--

CREATE TABLE `restaurant_category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_category`
--

INSERT INTO `restaurant_category` (`id`, `name`, `status`) VALUES
(1, 'Indian Chinese', 'Enable'),
(2, 'South Indian', 'Enable'),
(3, 'Muglai', 'Enable'),
(4, 'Indian', 'Enable'),
(6, 'asdfghjkl', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_items`
--

CREATE TABLE `restaurant_items` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_items`
--

INSERT INTO `restaurant_items` (`id`, `name`, `price`, `category_id`, `status`) VALUES
(1, 'Paneer Chili Dry', '12.00', 1, 'Enable'),
(2, 'Sweet Corn Soup', '15.00', 1, 'Enable'),
(3, 'Chicken Curry', '24.00', 3, 'Enable'),
(5, 'dufbugdfg', '1234.00', 6, 'Enable'),
(6, 'rftgtyb', '23456.00', 2, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_order`
--

CREATE TABLE `restaurant_order` (
  `id` int(11) NOT NULL,
  `table_id` varchar(250) NOT NULL,
  `gross_amount` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) NOT NULL,
  `net_amount` decimal(12,2) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` enum('admin','waiter','cashier') NOT NULL,
  `status` enum('In Process','Completed') NOT NULL DEFAULT 'In Process'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_order`
--

INSERT INTO `restaurant_order` (`id`, `table_id`, `gross_amount`, `tax_amount`, `net_amount`, `created`, `created_by`, `status`) VALUES
(1001, '3', '36.00', '10.00', '46.00', '2023-02-28 10:49:43', 'admin', 'Completed'),
(1005, '1', '36.00', '4.68', '40.68', '2020-12-27 22:54:11', 'admin', 'In Process'),
(1006, '1', '36.00', '4.68', '40.68', '2020-12-27 22:49:56', 'admin', 'In Process'),
(1007, '1', '51.00', '6.63', '57.63', '2020-12-27 22:51:46', 'admin', 'In Process'),
(1008, '7', '195.00', '25.35', '220.35', '2023-02-28 10:26:06', 'admin', 'Completed'),
(1009, '2', '51.00', '6.63', '57.63', '2023-02-28 10:49:35', 'admin', 'In Process');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_order_item`
--

CREATE TABLE `restaurant_order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `rate` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_order_item`
--

INSERT INTO `restaurant_order_item` (`id`, `order_id`, `category_id`, `item_id`, `quantity`, `rate`, `amount`) VALUES
(3, 1005, 1, 1, 1, '12.00', '12.00'),
(4, 1006, 1, 1, 1, '12.00', '12.00'),
(5, 1007, 1, 1, 1, '12.00', '12.00'),
(6, 1007, 1, 2, 1, '15.00', '15.00'),
(7, 1007, 3, 3, 1, '24.00', '24.00'),
(8, 1008, 1, 1, 10, '12.00', '120.00'),
(9, 1008, 1, 2, 5, '15.00', '75.00'),
(10, 1009, 1, 1, 3, '12.00', '36.00'),
(11, 1009, 1, 2, 1, '15.00', '15.00'),
(12, 1001, 1, 1, 1, '12.00', '12.00'),
(13, 1001, 3, 3, 1, '24.00', '24.00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `capacity` int(3) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_table`
--

INSERT INTO `restaurant_table` (`id`, `name`, `capacity`, `status`) VALUES
(1, 'Table 1', 4, 'Disable'),
(2, 'Table 2', 2, 'Enable'),
(3, 'Table 3', 4, 'Enable'),
(4, 'Table 4', 2, 'Enable'),
(5, 'Table 5', 4, 'Enable'),
(7, 'sdfgtfvbj', 10, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_tax`
--

CREATE TABLE `restaurant_tax` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `percentage` decimal(4,2) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_tax`
--

INSERT INTO `restaurant_tax` (`id`, `tax_name`, `percentage`, `status`) VALUES
(1, 'SGST', '5.50', 'Enable'),
(2, 'CGST', '7.50', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_user`
--

CREATE TABLE `restaurant_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','waiter','cashier') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `restaurant_user`
--

INSERT INTO `restaurant_user` (`id`, `first_name`, `last_name`, `gender`, `email`, `password`, `mobile`, `address`, `created`, `role`) VALUES
(1, 'yash', 'waghadhare', 'Male', 'admin@yash.com', '202cb962ac59075b964b07152d234b70', '1234567890', '', '2020-11-28 22:45:58', 'admin'),
(2, 'waiter', 'waiter', 'Male', 'waiter@yash.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2020-11-28 22:45:58', 'waiter'),
(3, 'cashier', 'cashier', 'Male', 'cashier@yash.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2020-11-28 22:45:58', 'cashier');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurant_category`
--
ALTER TABLE `restaurant_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_items`
--
ALTER TABLE `restaurant_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_order`
--
ALTER TABLE `restaurant_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_order_item`
--
ALTER TABLE `restaurant_order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_tax`
--
ALTER TABLE `restaurant_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_user`
--
ALTER TABLE `restaurant_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurant_category`
--
ALTER TABLE `restaurant_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restaurant_items`
--
ALTER TABLE `restaurant_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restaurant_order`
--
ALTER TABLE `restaurant_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `restaurant_order_item`
--
ALTER TABLE `restaurant_order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `restaurant_tax`
--
ALTER TABLE `restaurant_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurant_user`
--
ALTER TABLE `restaurant_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
