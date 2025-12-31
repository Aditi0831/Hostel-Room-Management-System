-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2025 at 02:15 PM
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
-- Database: `hostel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(50) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `medical` varchar(255) DEFAULT NULL,
  `affidavit` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`id`, `name`, `roll`, `course`, `year`, `gender`, `address`, `parent_name`, `contact`, `medical`, `affidavit`, `status`) VALUES
(1, 'Aditi pandey', 'csjma23001390269', 'B.Tech', '1st Year', 'Female', 'RA tower,IIT kanpur', 'Devendra Nath Pandey', '7000173078', 'uploads/1000085561.pdf', 'uploads/aditireport.docx', 'Approved'),
(3, 'Aryan Raj', 'csjma23001390272', 'B.Tech', '3rd Year', 'Male', 'IIT kanpur', 'Rekha sahu', '7808030705', 'uploads/anti-ragging_compressed.pdf', 'uploads/FeeReceipt hostel.pdf', 'Approved'),
(2, 'Raj verma', 'csjma23001390271', 'B.Tech', '4th Year', 'Male', 'mall road , Kanpur', 'Ram verma', '7000178075', 'uploads/aadhar card.pdf', 'uploads/anti-ragging_compressed.pdf', 'Approved'),
(4, 'Ruqqiya Noor', 'csjma23001390273', 'B.Tech', '3rd Year', 'Female', 'MG road , Kanpur', 'NOOR MD', '7999178076', 'uploads/aadhar card .pdf', 'uploads/anti-ragging_compressed.pdf', 'Approved'),
(5, 'Sita Sharma', 'csjma23001390274', 'B.Tech', '2nd Year', 'Female', 'Gt road , Kanpur', 'Ramesh Sharma', '7888178078', 'uploads/aadhar card.pdf', 'uploads/anti-ragging_compressed.pdf', 'Approved'),
(6, 'Geeta Pandey', 'csjma23001390275', 'B.Tech', '1st Year', 'Female', 'mall road , Kanpur', 'Ram lal Pandey', '988908078', 'uploads/aadhar card.pdf', 'uploads/anti-ragging_compressed.pdf', 'Pending'),
(7, 'Aman dubey', 'csjma23001390276', 'B.Tech', '2nd Year', 'Male', 'gunti road , Kanpur', 'shiv Dubey', '9888178079', 'uploads/aadhar card.pdf', 'uploads/anti-ragging_compressed.pdf', 'Pending'),
(8, 'Vineet ', 'csjma23001390277', 'B.Tech', '3rd Year', 'Male', 'hall 12,iit Kanpur', 'Rakesh soni', '7000173099', 'uploads/final hostel pdf.pdf', 'uploads/ApplicationForm.pdf', 'Pending'),
(9, 'Areen ', 'csjma23001390278', 'B.Tech', '3rd Year', 'Male', 'iit kanpur', 'Ramesh', '9500067890', 'uploads/ApplicationForm.pdf', 'uploads/final hostel pdf.pdf', 'Pending'),
(10, 'Ram ', 'csjma23001390279', 'B.Tech', '4th Year', 'Male', 'gunati,kanpur', 'Ramesh ', '6789056780', 'uploads/ApplicationForm.pdf', 'uploads/final hostel pdf.pdf', 'Approved');

--
-- Triggers `admissions`
--
DELIMITER $$
CREATE TRIGGER `trg_admissions_set_id` BEFORE INSERT ON `admissions` FOR EACH ROW BEGIN
    DECLARE sid INT;

    -- Fetch the id from students where username = roll number
    SELECT s.id INTO sid
    FROM students s
    WHERE s.username = NEW.roll;

    -- Assign fetched value to NEW.id
    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(50) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `hostel` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `proof` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `name`, `roll`, `room`, `hostel`, `type`, `description`, `proof`) VALUES
(1, 'Aditi pandey', 'csjma23001390269', '3', 'Hostel A', 'Cleanliness', 'washroom are not cleaned .', 'uploads/anti-ragging-declaration-2024-2025.pdf'),
(3, 'Aryan raj ', 'csjma23001390272', '6', 'Hostel B', 'Maintenance', 'water issue', 'uploads/FeeReceipt hostel.pdf'),
(1, 'Aditi pandey', 'csjma23001390269', '3', 'Hostel A', 'Maintenance', 'water issue', 'uploads/final hostel pdf.pdf'),
(3, 'Aryan Raj ', 'csjma23001390272', '6', 'Hostel B', 'Food Quality', 'mess foods are not up top the mark', 'uploads/final hostel pdf.pdf'),
(3, 'Ruqqiya Noor', 'csjma23001390272', '3', 'Hostel A', 'Water/Electricity', 'No electricity', 'uploads/final hostel pdf.pdf'),
(2, 'Raj Verma', 'csjma23001390271', '1', 'Hostel B', 'Cleanliness', 'Dirty washroom and dishes in mess are not cleaned nicely', 'uploads/final hostel pdf.pdf'),
(5, 'Sita Sharma', 'csjma23001390274', '5', 'Hostel A', 'Discipline', 'other students in hostel makes noise at night time', 'uploads/final hostel pdf.pdf'),
(1, 'Aditi pandey', 'csjma23001390269', '3', 'Hostel A', 'Food Quality', 'Insect is found on mess food', 'uploads/final hostel pdf.pdf'),
(3, 'Aryan Raj', 'csjma23001390272', '6', 'Hostel B', 'Maintenance', 'Mirror in washroom is broken', 'uploads/final hostel pdf.pdf'),
(2, 'Raj Verma', 'csjma23001390271', '1', 'Hostel B', 'Water/Electricity', 'there is no water supply in washroom number 1 from 3 days', 'uploads/final hostel pdf.pdf'),
(4, 'Ruqqiya Noor', 'csjma23001390273', '3', 'Hostel A', 'Discipline', 'rude behavior of mess worker', 'uploads/final hostel pdf.pdf'),
(10, 'Ram', 'csjma23001390279', '9', 'Hostel B', 'Maintenance', 'chair is not in proper condition', 'uploads/anti-ragging_compressed.pdf');

--
-- Triggers `complaints`
--
DELIMITER $$
CREATE TRIGGER `trg_complaints_set_id` BEFORE INSERT ON `complaints` FOR EACH ROW BEGIN
    DECLARE sid INT;

    SELECT id INTO sid FROM students WHERE username = NEW.roll;
    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(50) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `name`, `roll`, `room`, `email`, `amount`, `month`, `method`, `receipt`, `notes`) VALUES
(1, 'Aditi pandey', 'csjma23001390269', '3', 'aditipandey0831@gmail.com', 10000.00, 'January', 'UPI', 'uploads/WhatsApp Image 2025-08-28 at 17.25.59.jpeg', ''),
(3, 'Aryan raj', 'csjma23001390272', '6', 'aryanraj@gmail.com', 10000.00, 'January', 'UPI', 'uploads/aadhar card.pdf', ''),
(2, 'Raj Verma', 'csjma23001390271', '1', 'raj@gmail.com', 10000.00, 'January', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(4, 'Ruqqiya Noor', 'csjma23001390273', '3', 'ruqqiya@gmail.com', 10000.00, 'January', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(5, 'Sita Sharma', 'csjma23001390274', '5', 'Sita123@gmail.com', 10000.00, 'January', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(1, 'Aditi Pandey', 'csjma23001390269', '3', 'aditipandey0831@gmail.com', 10000.00, 'February', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(2, 'Raj Verma', 'csjma23001390271', '1', 'Raj@gmail.com', 10000.00, 'February', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(3, 'Aryan Raj', 'csjma23001390272', '6', 'Aryanraj@gmail.com', 10000.00, 'February', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(1, 'Aditi Pandey', 'csjma23001390269', '3', 'Aditipandey0831@gmail.com', 10000.00, 'March', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(2, 'Raj Verma', 'csjma23001390271', '1', 'Raj@gmail.com', 10000.00, 'March', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(3, 'Aryan Raj', 'csjma23001390272', '6', 'Aryanraj@gmail.com', 10000.00, 'March', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(4, 'Ruqqiya Noor', 'csjma23001390273', '3', 'ruqqiya@gmail.com', 10000.00, 'March', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(5, 'Sita Sharma', 'csjma23001390274', '5', 'Sita123@gmail.com', 10000.00, 'March', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(5, 'Sita Sharma', 'csjma23001390274', '5', 'Sita123@gmail.com', 10000.00, 'April', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(1, 'Aditi Pandey', 'csjma23001390269', '3', 'aditipandey0831@gmail.com', 10000.00, 'April', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(2, 'Raj Verma', 'csjma23001390271', '1', 'raj@gmail.com', 10000.00, 'April', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(1, 'Aditi pandey', 'csjma23001390269', '3', 'aditipandey0831@gmail.com', 10000.00, 'November', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(2, 'Raj Verma ', 'csjma23001390271', '1', 'Raj@gmail.com', 10000.00, 'November', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(3, 'Aryan Raj', 'csjma23001390272', '6', 'aryanraj@gmail.com', 10000.00, 'November', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(4, 'Ruqqiya Noor', 'csjma23001390273', '3', 'ruqqiya@gmail.com', 10000.00, 'November', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(5, 'Sita Sharma', 'csjma23001390274', '5', 'Sita123@gmail.com', 10000.00, 'November', 'UPI', 'uploads/fee receipt_compress.pdf', ''),
(10, 'Ram ', 'csjma23001390279', '9', 'ram@gmail.com', 10000.00, 'November', 'UPI', 'uploads/final hostel pdf.pdf', '');

--
-- Triggers `fees`
--
DELIMITER $$
CREATE TRIGGER `trg_fees_set_id` BEFORE INSERT ON `fees` FOR EACH ROW BEGIN
    DECLARE sid INT;

    SELECT id INTO sid FROM students WHERE username = NEW.roll;
    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(50) DEFAULT NULL,
  `hostel` varchar(100) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `warden` varchar(100) DEFAULT NULL,
  `leave_from` date DEFAULT NULL,
  `leave_to` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `parent_contact` varchar(20) DEFAULT NULL,
  `medical` varchar(255) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `name`, `roll`, `hostel`, `room`, `warden`, `leave_from`, `leave_to`, `reason`, `parent_contact`, `medical`, `approved`) VALUES
(1, 'Aditi pandey', 'csjma23001390269', 'Hostel A', '3', 'Riya verma ', '2025-10-31', '2025-11-20', 'for wedding of my relative .', '7000173078', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 1),
(3, 'Aryan raj', 'csjma23001390272', 'Hostel B', '6', 'VijayYadav', '2025-11-03', '2025-11-16', 'wedding of relative', '7808030705', 'uploads/aadhar card.pdf', 1),
(1, 'Aditi pandey', 'csjma23001390269', 'Hostel A', '3', 'Riya Verma', '2025-11-18', '2025-11-24', 'health issues', '7000173078', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 1),
(3, 'Aryan Raj', 'csjma23001390272', 'Hostel B', '6', 'Vijay Yadav', '2025-11-12', '2025-11-24', 'health issues', '7808030705', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 1),
(5, 'Sita Sharma', 'csjma23001390274', 'Hostel A', '5', 'Riya Verma', '2025-11-18', '2025-11-24', 'wedding of relative', '7888178078', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 0),
(5, 'Sita Sharma', 'csjma23001390274', 'Hostel A', '5', 'Riya Verma', '2025-12-06', '2026-01-08', 'wanted to go home after exams', '7888178078', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 0),
(1, 'Aditi Pandey', 'csjma23001390269', 'Hostel A', '3', 'Riya Verma', '2025-12-06', '2026-01-08', 'wanted to go home after exams', '7000173078', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 0),
(3, 'Aryan Raj', 'csjma23001390272', 'Hostel B', '6', 'Vijay Yadav', '2025-12-06', '2026-01-08', 'wanted to go home after exams', '7808030705', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 1),
(2, ' Raj Verma', 'csjma23001390271', 'Hostel A', '1', 'Vijay Yadav', '2025-12-06', '2026-01-08', 'wanted to go home after exams', '7000178075', 'uploads/medical certificate Aditi Pandey_compressed.pdf', 1),
(10, 'Ram', 'csjma23001390279', 'Hostel B', '9', 'Vijay Yadav', '2025-12-06', '2025-01-08', 'going home for hoilday after exam', '9407790522', 'uploads/aadhar card.pdf', 1);

--
-- Triggers `leaves`
--
DELIMITER $$
CREATE TRIGGER `trg_leaves_set_id` BEFORE INSERT ON `leaves` FOR EACH ROW BEGIN
    DECLARE sid INT;

    SELECT id INTO sid FROM students WHERE username = NEW.roll;
    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_number` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_number`, `status`) VALUES
('1', 'occupied'),
('10', 'Vacant'),
('11', 'Vacant'),
('12', 'Vacant'),
('13', 'Vacant'),
('14', 'Vacant'),
('2', 'Vacant'),
('3', 'occupied'),
('4', 'Vacant'),
('5', 'occupied'),
('6', 'occupied'),
('7', 'Vacant'),
('8', 'Vacant'),
('9', 'occupied');

-- --------------------------------------------------------

--
-- Table structure for table `room_allocation`
--

CREATE TABLE `room_allocation` (
  `id` int(11) DEFAULT NULL,
  `roll_number` varchar(20) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `hostel_name` varchar(100) NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `allocation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_allocation`
--

INSERT INTO `room_allocation` (`id`, `roll_number`, `student_name`, `hostel_name`, `room_number`, `allocation_date`) VALUES
(1, 'csjma23001390269', 'Aditi Pandey', 'Hostel A', '3', '2025-11-02 18:45:31'),
(3, 'csjma23001390272', 'Aryan Raj', 'Hostel B', '6', '2025-11-03 05:52:12'),
(2, 'csjma23001390271', 'Raj Verma', 'Hostel B', '1', '2025-11-09 06:35:43'),
(4, 'csjma23001390273', 'Ruqqiya Noor', 'Hostel A', '3', '2025-11-09 06:37:38'),
(5, 'csjma23001390274', 'Sita Sharma', 'Hostel A', '5', '2025-11-09 06:40:26'),
(10, 'csjma23001390279', 'Ram', 'Hostel A', '9', '2025-11-09 13:07:27');

--
-- Triggers `room_allocation`
--
DELIMITER $$
CREATE TRIGGER `trg_room_allocation_set_id` BEFORE INSERT ON `room_allocation` FOR EACH ROW BEGIN
    DECLARE sid INT;

    SELECT id INTO sid FROM students WHERE username = NEW.roll_number;
    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `email`, `password`) VALUES
(1, 'csjma23001390269', 'aditipandey0831@gmail.com', '$2y$10$0DxnVz8hy9SkiOQSHlEj9.A/Uh/QpMlP5PkUmpcDoP89dVKaR2hia'),
(2, 'csjma23001390271', 'raj@gmail.com', '$2y$10$Rncw7tFUq1lHD26HqCb1HOAglGpskKtpyqYksNIl9gMiCJ.3ERq.2'),
(3, 'csjma23001390272', 'aryanraj@gmail.com', '$2y$10$DXIES/htveHZJKNCxL3AzOfhVgnxcfaptt7agNyhSDTg68GGoQg/u'),
(4, 'csjma23001390273', 'ruqqiya@gmail.com', '$2y$10$JSNyE5hT4gS2wGkOTptMtufgH8SJhFTyFmkw9AdiiDhjGuB54SnZC'),
(5, 'csjma23001390274', 'Sita123@gmail.com', '$2y$10$QC/W0DT93A/AArAgryT94uBx.86im7AgBnzEdQ4N7tlc6OX29z8yq'),
(6, 'csjma23001390275', 'geeta123@gmail.com', '$2y$10$azp6zm.Fw80.shRGwsTaaeDR1epdSJqcvXJXSt9zoo/1D0lJehv36'),
(7, 'csjma23001390276', 'Aman@gmail.com', '$2y$10$.6QVthxJOhLUFVIrxqV7/ebMFUH/rPcITPivM8iX.0oNuGvDi8HX6'),
(8, 'csjma23001390277', 'vineet@gmail.com', '$2y$10$Nrjj0xbi4UqU33mPsjsEZeCpHVaIvz.nzMHqU1xqZtiALdUd5GdSm'),
(9, 'csjma23001390278', 'areen@gmail.com', '$2y$10$ShZlb91EjVEewxRGtKNo0.62xXaljXKVtsMcK7/4LmQ4PmPz8RCBq'),
(10, 'csjma23001390279', 'ram@gmail.com', '$2y$10$fJUdatVwqR1HWQRa2EwxcefC5uPr1Rc49oOUpmddXQ.QV9kTfeNxG');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mother_phone` varchar(20) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(20) DEFAULT NULL,
  `roll` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `name`, `mother_name`, `dob`, `address`, `mother_phone`, `father_name`, `father_phone`, `roll`) VALUES
(3, 'Aryan Raj', 'Rekha Sahu', '2005-08-09', 'madhubani,bihar', '7808070001', 'Rakesh Sahu', '7000173079', 'csjma23001390272'),
(1, 'Aditi Pandey', 'Pushpa Pandey ', '2005-08-31', '	Ra tower, IIT Kanpur', '9990008880', 'Devender Nath Pandey', '7000173078', 'csjma23001390269'),
(4, 'Ruqqiya Noor ', 'Nafiza Bano', '2005-10-25', 'Fatehpur', '8955559880', 'Noor MD', '9000193098', 'csjma23001390273'),
(2, 'Raj Verma', 'Rani Verma', '2003-10-10', 'Delhi', '8955559889', 'Ram Verma', '7000178075', 'csjma23001390271'),
(5, 'Sita Sharma', 'Vina Sharma', '2007-11-08', 'Bhopal', '9955599880', 'Ramesh Sharma', '7888178078', 'csjma23001390274'),
(6, 'Geeta Pandey', 'Soni Pandey', '2008-11-01', 'Varanasi', '9255599888', 'Ram Lal Pandey', '	 988908078', 'csjma23001390275'),
(7, 'Aman Dubey', 'Meena Dubey', '2005-05-02', 'Delhi', '9255599000', 'Shiv Dubey', '9888178079', 'csjma23001390276'),
(10, 'RAM', 'Reena', '2007-11-08', 'gt road,kanpur', '8909978060', 'Ramesh', '9407790522', 'csjma23001390279');

--
-- Triggers `student_details`
--
DELIMITER $$
CREATE TRIGGER `trg_student_details_set_id` BEFORE INSERT ON `student_details` FOR EACH ROW BEGIN
    DECLARE sid INT;

    SELECT id INTO sid
    FROM students
    WHERE username = NEW.roll;

    SET NEW.id = sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vacants`
--

CREATE TABLE `vacants` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `roll` varchar(50) DEFAULT NULL,
  `current_room` varchar(50) DEFAULT NULL,
  `hostel` varchar(100) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `vacate_date` date DEFAULT NULL,
  `transfer` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `new_room` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vacants`
--

INSERT INTO `vacants` (`id`, `name`, `roll`, `current_room`, `hostel`, `reason`, `vacate_date`, `transfer`, `remarks`, `status`, `new_room`) VALUES
(3, 'Aryan Raj', 'csjma23001390272', '4', 'Hostel B', 'want to transfer into room number 6', '2025-11-03', 'Yes, request room transfer', '', 'Approved', '6');

-- --------------------------------------------------------

--
-- Table structure for table `wardens`
--

CREATE TABLE `wardens` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardens`
--

INSERT INTO `wardens` (`id`, `username`, `email`, `password`) VALUES
(1, 'Riya0831', 'riya@gmail.com', '$2y$10$dQmp.VZlT7DwPZmWBJyKJOAU/QjlQKgNsX33RO2U1Z5cUlE5NVyZu'),
(2, 'Vijay Yadav', 'Vijay123@gmail.com', '$2y$10$toup639hGr6PmWACGMuaLuhv9//ygbNHr87fG.K0vTIHyG7Sf1vmi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD KEY `fk_admissions` (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD KEY `fk_complaints` (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD KEY `fk_fees` (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD KEY `fk_leaves` (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_number`);

--
-- Indexes for table `room_allocation`
--
ALTER TABLE `room_allocation`
  ADD KEY `fk_room` (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vacants`
--
ALTER TABLE `vacants`
  ADD KEY `fk_vacants` (`id`);

--
-- Indexes for table `wardens`
--
ALTER TABLE `wardens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wardens`
--
ALTER TABLE `wardens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `fk_admissions` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `fk_complaints` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fk_fees` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `fk_leaves` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_allocation`
--
ALTER TABLE `room_allocation`
  ADD CONSTRAINT `fk_room` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacants`
--
ALTER TABLE `vacants`
  ADD CONSTRAINT `fk_vacants` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
