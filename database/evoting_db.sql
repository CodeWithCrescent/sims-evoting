-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 10:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evoting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `candidate_year` int(11) NOT NULL,
  `candidate_photo` varchar(255) DEFAULT NULL,
  `fellow_candidate_name` varchar(255) DEFAULT NULL,
  `fellow_candidate_year` int(11) DEFAULT NULL,
  `fellow_candidate_photo` varchar(255) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `election_id`, `category_id`, `name`, `candidate_year`, `candidate_photo`, `fellow_candidate_name`, `fellow_candidate_year`, `fellow_candidate_photo`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Elizabeth David', 3, '', 'Joseph Isaya', 1, '', 1, NULL, '2024-06-13 19:55:49', NULL),
(2, 1, 1, 'Abdallah Jobe', 3, '', 'Devotha Sefania', 2, '', 1, NULL, '2024-06-13 19:57:09', NULL),
(3, 1, 1, 'Crescent Geniius', 3, '111718308830666b4fde5a584.png', 'Vaileth Brown', 1, '111718308830666b4fde5b170.jpg', 1, NULL, '2024-06-13 20:00:30', NULL),
(4, 1, 3, 'Irene Elias', 3, '', '', 0, '', 1, NULL, '2024-06-13 20:00:55', NULL),
(5, 1, 3, 'George Mdapo', 2, '', '', 0, '', 1, NULL, '2024-06-13 20:01:10', NULL),
(6, 1, 3, 'Hassan Hassan', 2, '', '', 0, '', 1, NULL, '2024-06-13 20:01:30', NULL),
(7, 1, 3, 'Paul Joseph', 3, '', '', 0, '', 1, NULL, '2024-06-13 20:01:52', NULL),
(8, 1, 4, 'Wawa Kulwa', 2, '', '', 0, '', 1, NULL, '2024-06-13 20:02:11', NULL),
(9, 1, 4, 'Swaumu Ally Masoud', 3, '', '', 0, '', 1, NULL, '2024-06-13 20:02:36', NULL),
(10, 1, 4, 'Yusta Mwaisaka', 2, '', '', 0, '', 1, NULL, '2024-06-13 20:02:56', NULL),
(11, 1, 4, 'Davis Gonza', 1, '', '', 0, '', 1, NULL, '2024-06-13 20:03:23', NULL),
(12, 1, 4, 'Quincy Jonnes', 3, '', '', 0, '', 1, NULL, '2024-06-13 20:03:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `election_id`, `name`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chairman & Vice Chairman', 1, 1, '2024-06-13 19:53:49', '2024-06-13 19:56:27'),
(3, 1, 'Project Manager', 1, NULL, '2024-06-13 19:54:16', NULL),
(4, 1, 'Board Representative', 1, NULL, '2024-06-13 19:54:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `election`
--

CREATE TABLE `election` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `voters` varchar(255) NOT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Is not active, 1 - Is Active',
  `can_vote` tinyint(4) DEFAULT NULL,
  `report_path` varchar(255) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `election`
--

INSERT INTO `election` (`id`, `title`, `year`, `voters`, `starttime`, `endtime`, `description`, `status`, `can_vote`, `report_path`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'TEST ELECTION', '2024', 'Students', '2024-06-30 21:00:00', '2024-12-30 21:00:00', 'This is the test election added by Crescent, System Developer.', 1, 1, NULL, 1, 1, '2024-06-13 19:53:20', '2024-06-13 20:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `profile_picture`, `password`, `type`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Crescent Geniius', 'crescent', NULL, NULL, NULL, '$2y$10$TlxIfkd4eBWJAyw9/Pr3l.qdOuL15jycsqiThXs2wWsg8FMQ0LxVO', 0, NULL, '2024-06-13 18:17:31', '2024-06-13 18:17:45'),
(2, 'System Administrator ', 'admin', NULL, NULL, NULL, '$2y$10$krDZhFMDDqMK0H6C1iE56OACi7C2o/fwvIsNGjEmhxueFY4P8NlQm', 0, 2, '2024-06-13 19:45:58', '2024-06-13 19:48:31'),
(3, 'Test User', 'user', NULL, NULL, NULL, '$2y$10$TycXDUVQX9cjAQmU3RXw8.2IHhsj/voUooDEeTxFAtvz0PVMHE3BO', 1, NULL, '2024-06-13 19:50:13', NULL),
(4, 'Juliana Malima', 'juliana', NULL, NULL, NULL, '$2y$10$X9VGm4P.VsYzmqBt3rEVZO0qNVmTyIU8E5uKJyp4y90rTTS1QHQ2O', 1, NULL, '2024-06-13 20:04:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `voted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`) COMMENT 'From Categories table',
  ADD KEY `election_id` (`election_id`) COMMENT 'From Election table',
  ADD KEY `added_by` (`added_by`,`updated_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`,`updated_by`),
  ADD KEY `election_id` (`election_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`,`updated_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `Email` (`email`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `election_id` (`election_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `election`
--
ALTER TABLE `election`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `candidates_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `election`
--
ALTER TABLE `election`
  ADD CONSTRAINT `election_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `election_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`voter_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votes_ibfk_4` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
