-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2024 at 04:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dried`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_replies`
--

CREATE TABLE `admin_replies` (
  `id` int(11) NOT NULL,
  `message_id` int(11) DEFAULT NULL,
  `reply_message` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_replies`
--

INSERT INTO `admin_replies` (`id`, `message_id`, `reply_message`, `timestamp`) VALUES
(7, 27, 'yes sir good evening', '2024-09-14 22:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `messagein`
--

CREATE TABLE `messagein` (
  `Id` int(11) NOT NULL,
  `SendTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ReceiveTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `SMSC` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messagein`
--

INSERT INTO `messagein` (`Id`, `SendTime`, `ReceiveTime`, `MessageFrom`, `MessageTo`, `SMSC`, `MessageText`, `MessageType`, `MessageParts`, `MessagePDU`, `Gateway`, `UserId`) VALUES
(39, '0000-00-00 00:00:00', '2024-09-01 06:33:22', 'MPLA', 'delacruzjohnanthon@gmail.com', NULL, 'OTP code is 848047', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messagelog`
--

CREATE TABLE `messagelog` (
  `Id` int(11) NOT NULL,
  `SendTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ReceiveTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `StatusCode` int(11) DEFAULT NULL,
  `StatusText` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageId` varchar(80) DEFAULT NULL,
  `ErrorCode` varchar(80) DEFAULT NULL,
  `ErrorText` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text DEFAULT NULL,
  `Connector` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messageout`
--

CREATE TABLE `messageout` (
  `Id` int(11) NOT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Scheduled` datetime DEFAULT NULL,
  `ValidityPeriod` int(11) DEFAULT NULL,
  `IsSent` tinyint(1) NOT NULL DEFAULT 0,
  `IsRead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messageout`
--

INSERT INTO `messageout` (`Id`, `MessageTo`, `MessageFrom`, `MessageText`, `MessageType`, `Gateway`, `UserId`, `UserInfo`, `Priority`, `Scheduled`, `ValidityPeriod`, `IsSent`, `IsRead`) VALUES
(1, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(2, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(3, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(4, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(5, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(6, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(7, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(8, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(9, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(10, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `reply_message` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `message`, `user_email`, `reply_message`, `timestamp`, `image_path`, `session_id`) VALUES
(27, 'John Anthon Dela Cruz', 'sir Good evening', '', 0, '2024-09-14 14:39:26', NULL, '66e5a01ebec2f'),
(28, 'John Anthon Dela Cruz', 'naa koy problema sa product sir', '', 0, '2024-09-14 14:39:54', NULL, '66e5a01ebec2f');

-- --------------------------------------------------------

--
-- Table structure for table `orderpos`
--

CREATE TABLE `orderpos` (
  `id` int(11) NOT NULL,
  `orNumber` varchar(10) DEFAULT NULL,
  `productDetails` text DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderpos`
--

INSERT INTO `orderpos` (`id`, `orNumber`, `productDetails`, `totalPrice`, `orderDate`) VALUES
(26, '39069', 'Hammer SAM High Carbon Tool Steel Claw :5', 17575.00, '2024-08-16 06:32:59'),
(27, '61539', 'Garden Round Head Micro Steels Shove Spade:1, NDUSTRIAL CHLO-RUB FINISH 7900S WHITE:1', 1799.00, '2024-08-16 07:47:29'),
(28, '26364', 'Garden Round Head Micro Steels Shove Spade:2', 2400.00, '2024-08-16 07:48:02'),
(29, '31831', 'Pliers:4', 1280.00, '2024-08-16 07:48:28'),
(30, '52995', 'Boysen Paint 1 Liter White Semi Gloss Latex B-715:3', 627.00, '2024-08-16 07:56:08'),
(31, '27939', 'RS PRO  Carbon  Steel  Claw Hammer  with Fibreglass Handle:2', 6344.00, '2024-08-16 07:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` int(11) NOT NULL,
  `orNumber` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `orNumber`, `productName`, `productPrice`, `productStock`, `created_at`) VALUES
(1, 71306, 'Hey', 23.00, 1, '2024-07-06 04:32:43'),
(2, 55503, 'Hey', 46.00, 2, '2024-07-06 04:45:51'),
(3, 23540, 'Hey', 46.00, 2, '2024-07-06 04:48:14'),
(4, 84982, 'Hey', 23.00, 1, '2024-07-06 05:33:51'),
(5, 59422, 'Hey', 23.00, 1, '2024-07-06 05:37:11'),
(6, 70196, 'Hey', 23.00, 1, '2024-07-06 05:54:32'),
(7, 85278, 'Hey', 23.00, 1, '2024-07-06 06:15:16'),
(8, 73123, 'Hey', 230.00, 10, '2024-07-06 06:16:17'),
(9, 94323, 'Joshua', 23.00, 1, '2024-07-06 06:23:55'),
(10, 93419, 'Hey', 23.00, 1, '2024-07-06 09:02:18'),
(11, 67583, 'sad', 0.00, 1, '2024-07-08 06:17:12'),
(12, 67583, 'Hey', 0.00, 1, '2024-07-08 06:17:12'),
(13, 61040, 'Hey', 0.00, 1, '2024-07-08 06:36:00'),
(14, 61040, 'sad', 0.00, 1, '2024-07-08 06:36:00'),
(15, 34226, 'Hey', 0.00, 1, '2024-07-08 06:47:31'),
(16, 34226, 'sad', 0.00, 1, '2024-07-08 06:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `PROID` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCategory` varchar(100) DEFAULT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int(11) NOT NULL,
  `checkStock` int(11) DEFAULT NULL,
  `productDate` date DEFAULT NULL,
  `productStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `images`, `productName`, `productCategory`, `productPrice`, `productStock`, `checkStock`, `productDate`, `productStatus`) VALUES
(29, 'agent.jpg', 'Hey', 'Paint', 232.00, 36, 20, '2024-08-18', ''),
(30, 'admins.png', 'Hammer SAM High Carbon Tool Steel Claw', 'Paint', 150.00, 118, 20, '2024-08-18', ''),
(31, 'huss.png', 'sad', 'Ordinary Portland Cement', 23.00, 86, 10, '2024-08-19', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblautonumber`
--

CREATE TABLE `tblautonumber` (
  `ID` int(11) NOT NULL,
  `AUTOSTART` int(250) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOKEY` varchar(12) NOT NULL,
  `AUTONUM` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblautonumber`
--

INSERT INTO `tblautonumber` (`ID`, `AUTOSTART`, `AUTOINC`, `AUTOEND`, `AUTOKEY`, `AUTONUM`) VALUES
(1, 10, 1, 136, 'PROID', 10),
(2, 0, 1, 101, 'ordernumber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CATEGID` int(11) NOT NULL,
  `CATEGORIES` varchar(255) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CATEGID`, `CATEGORIES`, `USERID`) VALUES
(19, 'Hand Held Tools', 0),
(20, 'Paint', 0),
(21, 'Ordinary Portland Cement', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `CUSTOMERID` int(11) NOT NULL,
  `FNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `MNAME` varchar(30) NOT NULL,
  `CUSHOMENUM` varchar(90) NOT NULL,
  `STREETADD` text NOT NULL,
  `BRGYADD` text NOT NULL,
  `CITYADD` text NOT NULL,
  `LMARK` varchar(50) NOT NULL,
  `PROVINCE` varchar(80) NOT NULL,
  `COUNTRY` varchar(30) NOT NULL,
  `DBIRTH` date NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAILADD` varchar(40) NOT NULL,
  `ZIPCODE` int(6) NOT NULL,
  `CUSUNAME` varchar(250) NOT NULL,
  `CUSPASS` varchar(90) NOT NULL,
  `CUSPHOTO` varchar(255) NOT NULL,
  `TERMS` tinyint(4) NOT NULL,
  `STATUS` varchar(250) NOT NULL,
  `DATEJOIN` timestamp NOT NULL DEFAULT current_timestamp(),
  `code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`CUSTOMERID`, `FNAME`, `LNAME`, `MNAME`, `CUSHOMENUM`, `STREETADD`, `BRGYADD`, `CITYADD`, `LMARK`, `PROVINCE`, `COUNTRY`, `DBIRTH`, `GENDER`, `PHONE`, `EMAILADD`, `ZIPCODE`, `CUSUNAME`, `CUSPASS`, `CUSPHOTO`, `TERMS`, `STATUS`, `DATEJOIN`, `code`) VALUES
(109, 'John Anthon', 'Dela Cruz', '', '', '', '', 'Mancilang. Madridejos, Cebu', 'asdasd', '', '', '0000-00-00', 'Male', '09996884424', '', 0, 'delacruzjohnanthon@gmail.com', 'f222e3e3a319a95ef21de806314fc6ffebeaa71a', '', 1, '', '2024-09-02 12:02:56', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomerreview`
--

CREATE TABLE `tblcustomerreview` (
  `REVIEWID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `CUSTOMERNAME` varchar(255) NOT NULL,
  `RATING` int(1) NOT NULL,
  `REVIEWTEXT` text NOT NULL,
  `REVIEWDATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcustomerreview`
--

INSERT INTO `tblcustomerreview` (`REVIEWID`, `PROID`, `CUSTOMERNAME`, `RATING`, `REVIEWTEXT`, `REVIEWDATE`) VALUES
(1, 10133, 'John Anthon Dela Cruz', 2, 'Great product sir', '2024-09-14 05:10:27'),
(2, 10133, 'Alfred Dela Cruz', 1, 'Hakdog', '2024-09-14 05:11:52'),
(3, 10133, 'Anthony Dela Cruz', 5, 'sd', '2024-09-14 05:14:32'),
(4, 10133, 'Maria Mercy', 3, 'Nindut kaayu sya sir', '2024-09-14 05:39:29'),
(5, 10133, 'Bryan James Desuyo', 5, 'Ang ganda naman sir', '2024-09-14 07:48:06'),
(6, 10133, 'Chad Rhino Quijano', 3, 'Yes sir nindut kaayu sya', '2024-09-14 07:51:53'),
(7, 10134, 'Samuel Desuyo', 4, 'Chuya kaayu amego o', '2024-09-14 14:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `ORDERID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `ORDEREDQTY` int(11) NOT NULL,
  `ORDEREDPRICE` double NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`ORDERID`, `PROID`, `ORDEREDQTY`, `ORDEREDPRICE`, `ORDEREDNUM`, `USERID`) VALUES
(148, 1099, 1, 205, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `PROID` int(11) NOT NULL,
  `PRODESC` varchar(255) DEFAULT NULL,
  `Description` varchar(1200) NOT NULL,
  `INGREDIENTS` varchar(255) NOT NULL,
  `PROQTY` int(11) DEFAULT NULL,
  `ORIGINALPRICE` double NOT NULL,
  `PROPRICE` double DEFAULT NULL,
  `CATEGID` int(11) DEFAULT NULL,
  `IMAGES` varchar(255) DEFAULT NULL,
  `PROSTATS` varchar(30) DEFAULT NULL,
  `OWNERNAME` varchar(90) NOT NULL,
  `OWNERPHONE` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`PROID`, `PRODESC`, `Description`, `INGREDIENTS`, `PROQTY`, `ORIGINALPRICE`, `PROPRICE`, `CATEGID`, `IMAGES`, `PROSTATS`, `OWNERNAME`, `OWNERPHONE`) VALUES
(10133, 'sad', 'Made in China<br />Much better in Philipines<br />Not expensive<br />But good quality', '', 2, 0, 23, 20, 'uploaded_photos/cal.png', 'Available', '', ''),
(10134, 'Hey', 'Made in China<br />The best Product in the world<br />Yes it is the best product', '', 2, 0, 232, 20, 'uploaded_photos/1280 x 720.png', 'Available', '', ''),
(10135, 'Hammer SAM High Carbon Tool Steel Claw', 'Hey you<br />Yes isr', '', 2, 0, 150, 19, 'uploaded_photos/dash.png', 'Available', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblpromopro`
--

CREATE TABLE `tblpromopro` (
  `PROMOID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `PRODISCOUNT` double NOT NULL,
  `PRODISPRICE` double NOT NULL,
  `PROBANNER` tinyint(4) NOT NULL,
  `PRONEW` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpromopro`
--

INSERT INTO `tblpromopro` (`PROMOID`, `PROID`, `PRODISCOUNT`, `PRODISPRICE`, `PROBANNER`, `PRONEW`) VALUES
(91, 1095, 0, 3515, 0, 0),
(93, 1097, 0, 1200, 0, 0),
(94, 1098, 0, 599, 0, 0),
(95, 1099, 0, 205, 0, 0),
(96, 10100, 0, 150, 0, 0),
(97, 10101, 0, 320, 0, 0),
(104, 10108, 0, 150, 0, 0),
(105, 10109, 0, 150, 0, 0),
(113, 10117, 0, 23, 0, 0),
(117, 10121, 0, 23, 0, 0),
(129, 10133, 0, 23, 0, 0),
(130, 10134, 0, 232, 0, 0),
(131, 10135, 0, 150, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblsetting`
--

CREATE TABLE `tblsetting` (
  `SETTINGID` int(11) NOT NULL,
  `PLACE` text NOT NULL,
  `BRGY` varchar(90) NOT NULL,
  `DELPRICE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsetting`
--

INSERT INTO `tblsetting` (`SETTINGID`, `PLACE`, `BRGY`, `DELPRICE`) VALUES
(12, 'Kaongkod', '', 15),
(13, 'Talangnan', '', 15),
(14, 'Poblacion', '', 15),
(15, 'Malbago', '', 20),
(16, 'Tarong', '', 40),
(17, 'San Agustin', '', 45),
(18, 'Pili', '', 50),
(19, 'Maalat', '', 50),
(20, 'Kodia', '', 60),
(21, 'Tugas', '', 55),
(22, 'Tabagak', '', 70),
(23, 'Bunakan', '', 70),
(24, 'Kangwayan', '', 80);

-- --------------------------------------------------------

--
-- Table structure for table `tblstockin`
--

CREATE TABLE `tblstockin` (
  `STOCKINID` int(11) NOT NULL,
  `STOCKDATE` datetime DEFAULT NULL,
  `PROID` int(11) DEFAULT NULL,
  `STOCKQTY` int(11) DEFAULT NULL,
  `STOCKPRICE` double DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblsummary`
--

CREATE TABLE `tblsummary` (
  `SUMMARYID` int(11) NOT NULL,
  `ORDEREDDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `CUSTOMERID` int(11) NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `DELFEE` double NOT NULL,
  `PAYMENT` double NOT NULL,
  `PAYMENTMETHOD` varchar(30) NOT NULL,
  `ORDEREDSTATS` varchar(30) NOT NULL,
  `ORDEREDREMARKS` varchar(125) NOT NULL,
  `CLAIMEDADTE` datetime NOT NULL,
  `HVIEW` tinyint(4) NOT NULL,
  `DELADD` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsummary`
--

INSERT INTO `tblsummary` (`SUMMARYID`, `ORDEREDDATE`, `CUSTOMERID`, `ORDEREDNUM`, `DELFEE`, `PAYMENT`, `PAYMENTMETHOD`, `ORDEREDSTATS`, `ORDEREDREMARKS`, `CLAIMEDADTE`, `HVIEW`, `DELADD`) VALUES
(139, '2024-08-18 21:03:33', 73, 100, 50, 255, 'Cash on Delivery', 'Delivered Successfully', 'Your package has been delivered to the specified address.', '2024-08-19 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbluseraccount`
--

CREATE TABLE `tbluseraccount` (
  `USERID` int(11) NOT NULL,
  `U_NAME` varchar(122) NOT NULL,
  `U_USERNAME` varchar(122) NOT NULL,
  `U_CON` varchar(11) NOT NULL,
  `U_EMAIL` varchar(225) NOT NULL,
  `U_PASS` varchar(122) NOT NULL,
  `U_ROLE` varchar(30) NOT NULL,
  `USERIMAGE` varchar(255) NOT NULL,
  `Code` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluseraccount`
--

INSERT INTO `tbluseraccount` (`USERID`, `U_NAME`, `U_USERNAME`, `U_CON`, `U_EMAIL`, `U_PASS`, `U_ROLE`, `USERIMAGE`, `Code`) VALUES
(7, 'John Anthon Dela Cruz', 'delacruzjohnanthon@gmail.com', '09692870485', 'delacruzjohnanthon@gmail.com', 'f222e3e3a319a95ef21de806314fc6ffebeaa71a', 'Administrator', '', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_replies`
--
ALTER TABLE `admin_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messagein`
--
ALTER TABLE `messagein`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messagelog`
--
ALTER TABLE `messagelog`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_MessageId` (`MessageId`,`SendTime`);

--
-- Indexes for table `messageout`
--
ALTER TABLE `messageout`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_IsRead` (`IsRead`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderpos`
--
ALTER TABLE `orderpos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CATEGID`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`CUSTOMERID`);

--
-- Indexes for table `tblcustomerreview`
--
ALTER TABLE `tblcustomerreview`
  ADD PRIMARY KEY (`REVIEWID`),
  ADD KEY `PROID` (`PROID`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`ORDERID`),
  ADD KEY `USERID` (`USERID`),
  ADD KEY `PROID` (`PROID`),
  ADD KEY `ORDEREDNUM` (`ORDEREDNUM`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`PROID`),
  ADD KEY `CATEGID` (`CATEGID`);

--
-- Indexes for table `tblpromopro`
--
ALTER TABLE `tblpromopro`
  ADD PRIMARY KEY (`PROMOID`),
  ADD UNIQUE KEY `PROID` (`PROID`);

--
-- Indexes for table `tblsetting`
--
ALTER TABLE `tblsetting`
  ADD PRIMARY KEY (`SETTINGID`);

--
-- Indexes for table `tblstockin`
--
ALTER TABLE `tblstockin`
  ADD PRIMARY KEY (`STOCKINID`),
  ADD KEY `PROID` (`PROID`,`USERID`),
  ADD KEY `USERID` (`USERID`);

--
-- Indexes for table `tblsummary`
--
ALTER TABLE `tblsummary`
  ADD PRIMARY KEY (`SUMMARYID`),
  ADD UNIQUE KEY `ORDEREDNUM` (`ORDEREDNUM`),
  ADD KEY `CUSTOMERID` (`CUSTOMERID`),
  ADD KEY `USERID` (`DELADD`);

--
-- Indexes for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_replies`
--
ALTER TABLE `admin_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messagein`
--
ALTER TABLE `messagein`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `messagelog`
--
ALTER TABLE `messagelog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messageout`
--
ALTER TABLE `messageout`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orderpos`
--
ALTER TABLE `orderpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CATEGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `CUSTOMERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `tblcustomerreview`
--
ALTER TABLE `tblcustomerreview`
  MODIFY `REVIEWID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `ORDERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `tblpromopro`
--
ALTER TABLE `tblpromopro`
  MODIFY `PROMOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `tblsetting`
--
ALTER TABLE `tblsetting`
  MODIFY `SETTINGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblstockin`
--
ALTER TABLE `tblstockin`
  MODIFY `STOCKINID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblsummary`
--
ALTER TABLE `tblsummary`
  MODIFY `SUMMARYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblcustomerreview`
--
ALTER TABLE `tblcustomerreview`
  ADD CONSTRAINT `tblcustomerreview_ibfk_1` FOREIGN KEY (`PROID`) REFERENCES `tblproduct` (`PROID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
