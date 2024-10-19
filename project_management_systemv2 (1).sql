-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2024 at 12:00 PM
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
-- Database: `project_management_systemv2`
--
CREATE DATABASE IF NOT EXISTS `project_management_systemv2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project_management_systemv2`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `addFile`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addFile` (IN `fileName` VARCHAR(255), IN `action` VARCHAR(255), IN `fileType` VARCHAR(50), IN `filePath` VARCHAR(255))   BEGIN
    INSERT INTO files (fileName, action, fileType, filePath)
    VALUES (fileName, action, fileType, filePath);
END$$

DROP PROCEDURE IF EXISTS `addProject`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProject` (IN `projectName` VARCHAR(100), IN `projectDescription` TEXT, IN `startDate` DATE, IN `endDate` DATE, IN `projectStatus` ENUM('Pending','In Progress','Completed'), IN `userMail` VARCHAR(100))   BEGIN
    INSERT INTO projects (projectName, projectDescription, startDate, endDate, projectStatus, userMail)
    VALUES (projectName, projectDescription, startDate, endDate, projectStatus, userMail);
END$$

DROP PROCEDURE IF EXISTS `addUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `userName` VARCHAR(255), IN `email` VARCHAR(255), IN `password` VARCHAR(255), IN `roleName` VARCHAR(50), IN `roleDescription` TEXT, IN `firstName` VARCHAR(100), IN `lastName` VARCHAR(100))   BEGIN
    INSERT INTO Users (userName, email, password, roleName, roleDescription, firstName, lastName)
    VALUES (userName, email, password, roleName, roleDescription, firstName, lastName);
END$$

DROP PROCEDURE IF EXISTS `deleteFile`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFile` (IN `fileID` INT)   BEGIN
    DELETE FROM files WHERE fileID = fileID; -- Make sure the column name matches your table
END$$

DROP PROCEDURE IF EXISTS `deleteProject`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProject` (IN `projectID` INT)   BEGIN
    DELETE FROM projects
    WHERE projectID = projectID;
END$$

DROP PROCEDURE IF EXISTS `getAllFiles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllFiles` ()   BEGIN
    SELECT * FROM files; -- Assuming your table is named 'files'
END$$

DROP PROCEDURE IF EXISTS `getUserByEmail`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByEmail` (IN `userEmail` VARCHAR(255))   BEGIN
    SELECT firstName, lastName, password, roleName
    FROM Users
    WHERE email = userEmail;
END$$

DROP PROCEDURE IF EXISTS `updateProject`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProject` (IN `projectID` INT, IN `projectName` VARCHAR(100), IN `projectDescription` TEXT, IN `startDate` DATE, IN `endDate` DATE, IN `projectStatus` ENUM('Pending','In Progress','Completed'), IN `userMail` VARCHAR(100))   BEGIN
    UPDATE projects
    SET projectName = projectName,
        projectDescription = projectDescription,
        startDate = startDate,
        endDate = endDate,
        projectStatus = projectStatus,
        userMail = userMail
    WHERE projectID = projectID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `fileType` varchar(50) DEFAULT NULL,
  `filePath` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(100) NOT NULL,
  `projectDescription` text DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `projectStatus` enum('Pending','In Progress','Completed') NOT NULL,
  `userMail` varchar(100) NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDescription` text DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `password`, `roleName`, `roleDescription`, `firstName`, `lastName`, `created_at`) VALUES
(1, 'yuraichima', 'yuraichima@gmail.com', '12345', 'Creator', 'description', 'Yura', 'chima', '2024-10-17 17:49:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
