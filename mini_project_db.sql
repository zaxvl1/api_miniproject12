-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 06:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'อุปกรณ์อิเล็กทรอนิกส์'),
(2, 'เครื่องใช้ไฟฟ้า'),
(3, 'เครื่องสำอาง'),
(4, 'เครื่องแต่งกาย'),
(5, 'อาหารและเครื่องดื่ม');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FullName`, `Email`, `Password`, `Phone`, `Address`, `CreatedAt`) VALUES
(1, 'สมชาย ใจดี', 'somchai@example.com', 'hashed_password_1', '0812345678', '123 ถนนสุขุมวิท กรุงเทพฯ', '2025-02-15 15:54:45'),
(2, 'สมหญิง สวยงาม', 'somhying@example.com', 'hashed_password_2', '0898765432', '45/6 ถนนรามอินทรา กรุงเทพฯ', '2025-02-15 15:54:45'),
(3, 'Mew', 'mewza001@gmail.com', '$2a$08$TX.Voc5dKZwap63kJRIDLepb1P.v8apyCzlJn3cSbQ5nJM4PJtfy.', NULL, NULL, '2025-02-15 16:13:43'),
(4, 'Mew', 'mewza002@gmail.com', '$2a$08$t7k5fgoxakd.qhZeBiFaguFNxMlnwAGqOQtaHJVap.cjKiJ0RYhDG', NULL, NULL, '2025-02-15 18:52:59'),
(5, 'Mew', 'mewza003@gmail.com', '$2a$08$LN5OcHUdsOEBAVGqO9UQlu.gr0wzc2nzfRgMmJRWNT3XKc4daBQdG', NULL, NULL, '2025-02-16 09:24:34'),
(6, 'Mew', 'mewza004@gmail.com', '$2a$08$ZffeEgiKZR5qBXQG4QI7m.8Bp07i.f6yARARogwjzxGQjzz9vypFm', NULL, NULL, '2025-02-18 13:05:23'),
(7, 'mer', 'mewza006@gmail.com', '$2a$08$zM1dSMr5WIjpGAOTTixPuevyO/hp2lvs3zX1w2xfP3pSG43xP35N6', NULL, NULL, '2025-02-20 05:36:17'),
(8, 'mewza', 'mewza007@gmail.com', '$2a$08$najsKz3TZUXjJ9RKc5Ia4eqNeX7.zgsEJsds1leFvE6TMiXXBHgBe', NULL, NULL, '2025-02-20 05:39:29'),
(10, 'MewZa', 'mewza009@gmail.com', '$2a$08$dU0QG2aT.Oiwh9X2ZKBBB.ESJnrxEltC8ma9I0t5I/NibOcplxew6', NULL, NULL, '2025-02-20 05:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0),
  `Subtotal` decimal(10,2) NOT NULL CHECK (`Subtotal` >= 0),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Subtotal`, `CreatedAt`) VALUES
(1, 1, 1, 1, 12900.00, '2025-02-15 15:54:45'),
(2, 2, 3, 2, 17800.00, '2025-02-15 15:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `TotalPrice` decimal(10,2) NOT NULL CHECK (`TotalPrice` >= 0),
  `Status` enum('Pending','Paid','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalPrice`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 1, '2025-02-15 15:54:45', 12900.00, 'Pending', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(2, 2, '2025-02-15 15:54:45', 17800.00, 'Paid', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(24, 4, '2025-02-18 11:36:45', 35900.00, '', '2025-02-18 11:36:45', '2025-02-18 11:46:23'),
(27, 4, '2025-02-18 13:04:41', 35900.00, 'Pending', '2025-02-18 13:04:41', '2025-02-18 13:04:41'),
(28, 4, '2025-02-18 13:06:50', 35900.00, 'Pending', '2025-02-18 13:06:50', '2025-02-18 13:06:50'),
(29, 4, '2025-02-18 15:59:16', 35900.00, '', '2025-02-18 15:59:16', '2025-02-18 15:59:21'),
(30, 4, '2025-02-20 05:36:25', 35900.00, '', '2025-02-20 05:36:25', '2025-02-20 05:36:29'),
(31, 4, '2025-02-20 05:41:15', 35900.00, 'Pending', '2025-02-20 05:41:15', '2025-02-20 05:41:15'),
(32, 4, '2025-02-20 05:42:08', 35900.00, '', '2025-02-20 05:42:08', '2025-02-20 05:44:10'),
(33, 4, '2025-02-20 05:44:50', 35900.00, '', '2025-02-20 05:44:50', '2025-02-20 05:44:58'),
(34, 4, '2025-02-20 05:45:49', 35900.00, '', '2025-02-20 05:45:49', '2025-02-20 05:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `TrackingID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Status` enum('Pending','Processing','Shipped','Delivered') NOT NULL DEFAULT 'Pending',
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`TrackingID`, `OrderID`, `Status`, `UpdatedAt`) VALUES
(1, 1, 'Processing', '2025-02-15 15:54:45'),
(2, 2, 'Shipped', '2025-02-15 15:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentMethod` enum('Credit Card','PayPal','Bank Transfer') NOT NULL,
  `Amount` decimal(10,2) NOT NULL CHECK (`Amount` >= 0),
  `PaymentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Pending','Completed','Failed') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `PaymentMethod`, `Amount`, `PaymentDate`, `Status`) VALUES
(1, 1, 'Credit Card', 12900.00, '2025-02-15 15:54:45', 'Pending'),
(2, 2, 'Bank Transfer', 17800.00, '2025-02-15 15:54:45', 'Completed'),
(13, 24, 'Bank Transfer', 35900.00, '2025-02-18 04:46:21', 'Completed'),
(16, 29, 'PayPal', 35900.00, '2025-02-18 08:59:20', 'Completed'),
(17, 30, 'PayPal', 35900.00, '2025-02-19 22:36:28', 'Completed'),
(18, 32, 'Credit Card', 35900.00, '2025-02-19 22:44:08', 'Completed'),
(19, 33, 'Credit Card', 35900.00, '2025-02-19 22:44:57', 'Completed'),
(20, 34, 'Bank Transfer', 35900.00, '2025-02-19 22:46:09', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL CHECK (`Price` >= 0),
  `Stock` int(11) NOT NULL CHECK (`Stock` >= 0),
  `CategoryID` int(11) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `Price`, `Stock`, `CategoryID`, `ImageURL`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'โทรศัพท์มือถือ', 'โทรศัพท์มือถือจอ 6.5 นิ้ว กล้อง 50MP', 12900.00, 50, 1, 'images/phone.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(2, 'แล็ปท็อป', 'แล็ปท็อปประสิทธิภาพสูงสำหรับงานหนัก', 35900.00, 30, 1, 'images/laptop.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(3, 'เครื่องซักผ้า', 'เครื่องซักผ้าอัตโนมัติขนาด 8 กก.', 8900.00, 20, 2, 'images/washing_machine.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(4, 'ลิปสติก', 'ลิปสติกสีแดงสดติดทนนาน', 350.00, 100, 3, 'images/lipstick.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(5, 'เสื้อยืด', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', 199.00, 200, 4, 'images/tshirt.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(6, 'หูฟังบลูทูธ', 'หูฟังบลูทูธตัดเสียงรบกวน คุณภาพเสียงระดับพรีเมียม', 4900.00, 60, 3, 'url3', '2025-02-16 15:52:09', '2025-02-16 15:52:09'),
(7, 'สมาร์ทวอทช์', 'สมาร์ทวอทช์ตรวจจับสุขภาพ แบตอึด', 9900.00, 40, 2, 'url2', '2025-02-16 15:52:21', '2025-02-16 15:52:21'),
(8, 'กางเกงในสีแดง', 'ยืดดดดด หดดดด ไม่เท่ากัน', 9999.00, 1, 2, 'url2', '2025-02-16 15:53:12', '2025-02-16 15:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL CHECK (`Rating` between 1 and 5),
  `Comment` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerID`, `ProductID`, `Rating`, `Comment`, `CreatedAt`) VALUES
(1, 1, 1, 5, 'โทรศัพท์ดีมาก แบตอึด ใช้งานลื่นไหล', '2025-02-15 15:54:45'),
(2, 2, 3, 4, 'เครื่องซักผ้าใช้งานง่าย ราคาคุ้มค่า', '2025-02-15 15:54:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD PRIMARY KEY (`TrackingID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ordertracking`
--
ALTER TABLE `ordertracking`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD CONSTRAINT `ordertracking_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
