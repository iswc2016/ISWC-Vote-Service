-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2016 at 12:41 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iswc2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `ISWCKEYS`
--

CREATE TABLE IF NOT EXISTS `ISWCKEYS` (
  `iswckey` varchar(10) NOT NULL,
  PRIMARY KEY (`iswckey`),
  UNIQUE KEY `iswckey_UNIQUE` (`iswckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ISWCKEYS`
--

INSERT INTO `ISWCKEYS` (`iswckey`) VALUES
('a1'),
('a2'),
('a3'),
('a4'),
('a5'),
('a6'),
('a7'),
('a8'),
('a9');

-- --------------------------------------------------------

--
-- Table structure for table `ISWCTYPES`
--

CREATE TABLE IF NOT EXISTS `ISWCTYPES` (
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ISWCTYPES`
--

INSERT INTO `ISWCTYPES` (`type`) VALUES
('demo'),
('poster');

-- --------------------------------------------------------

--
-- Table structure for table `ISWCVOTES`
--

CREATE TABLE IF NOT EXISTS `ISWCVOTES` (
  `iswckey` varchar(10) NOT NULL,
  `iswctype` varchar(10) NOT NULL,
  `votefor` varchar(50) NOT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iswckey`,`iswctype`),
  UNIQUE KEY `iswckey` (`iswckey`,`iswctype`),
  KEY `iswc_type` (`iswctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ISWCVOTES`
--

INSERT INTO `ISWCVOTES` (`iswckey`, `iswctype`, `votefor`) VALUES
('a1', 'demo', 'demo_smith_2'),
('a1', 'poster', 'poster_rathachai_55'),
('a2', 'demo', 'demo_miel_7'),
('a2', 'poster', 'poster_rathachai_55'),
('a3', 'demo', 'demo_peter_1'),
('a3', 'poster', 'poster_honda_16'),
('a4', 'demo', 'demo_peter_1'),
('a5', 'demo', 'demo_peter_1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ISWCVOTE_SCORES`
--
CREATE TABLE IF NOT EXISTS `ISWCVOTE_SCORES` (
`type` varchar(10)
,`votefor` varchar(50)
,`score` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `ISWCVOTE_SCORES`
--
DROP TABLE IF EXISTS `ISWCVOTE_SCORES`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `iswcvote_scores` AS select `ISWCVOTES`.`iswctype` AS `type`,`ISWCVOTES`.`votefor` AS `votefor`,count(0) AS `score` from `ISWCVOTES` group by `ISWCVOTES`.`iswctype`,`ISWCVOTES`.`votefor` order by `ISWCVOTES`.`iswctype`,`score` desc;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ISWCVOTES`
--
ALTER TABLE `ISWCVOTES`
  ADD CONSTRAINT `iswc_type` FOREIGN KEY (`iswctype`) REFERENCES `ISWCTYPES` (`type`),
  ADD CONSTRAINT `iswc_key` FOREIGN KEY (`iswckey`) REFERENCES `ISWCKEYS` (`iswckey`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
