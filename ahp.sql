-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2017 at 03:19 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ahp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE IF NOT EXISTS `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `kode` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `kode`, `nama`) VALUES
(1, 'A01', 'Hendry Sudjana'),
(2, 'A02', 'Mario Gerungan'),
(3, 'A03', 'Riko Hantono'),
(4, 'A04', 'Rizky Effendi'),
(5, 'A05', 'Rony Gunawan');

-- --------------------------------------------------------

--
-- Table structure for table `data_alternatif`
--

CREATE TABLE IF NOT EXISTS `data_alternatif` (
  `id` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_alternatif`
--

INSERT INTO `data_alternatif` (`id`, `id_alternatif`, `id_kriteria`, `value`) VALUES
(1, 1, 1, 7),
(2, 2, 1, 6),
(3, 3, 1, 8),
(4, 4, 1, 9),
(5, 5, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kode` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kode`, `nama`) VALUES
(1, 'F01', 'Shooting'),
(2, 'F02', 'Passing'),
(3, 'F03', 'Rebound'),
(4, 'F04', 'Dribbling'),
(6, 'F05', 'Fisik');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_alternatif`
--

CREATE TABLE IF NOT EXISTS `nilai_alternatif` (
  `id_nilai_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `id_alternatif_1` int(11) NOT NULL,
  `id_alternatif_2` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `nilai_alternatif`
--

INSERT INTO `nilai_alternatif` (`id_nilai_alternatif`, `id_kriteria`, `id_alternatif_1`, `id_alternatif_2`, `nilai`) VALUES
(90, 1, 4, 5, 3),
(89, 1, 3, 5, 3),
(88, 1, 3, 4, 2),
(87, 1, 2, 5, 2),
(86, 1, 2, 4, 3),
(85, 1, 2, 3, 3),
(84, 1, 1, 5, 1),
(83, 1, 1, 4, 2),
(82, 1, 1, 3, 5),
(81, 1, 1, 2, 2),
(11, 2, 1, 2, 2),
(12, 2, 1, 3, 2),
(13, 2, 1, 5, 2),
(14, 2, 2, 3, 4),
(15, 2, 2, 4, 3),
(16, 2, 2, 5, 3),
(17, 2, 3, 5, 2),
(18, 2, 3, 4, 6),
(19, 2, 4, 5, 2),
(20, 2, 1, 4, 3),
(21, 3, 1, 2, 3),
(22, 3, 1, 3, 3),
(23, 3, 1, 4, 3),
(24, 3, 1, 5, 2),
(25, 3, 2, 3, 3),
(26, 3, 2, 4, 2),
(27, 3, 2, 5, 2),
(28, 3, 3, 4, 2),
(29, 3, 3, 5, 2),
(30, 3, 4, 5, 8),
(31, 4, 1, 2, 4),
(32, 4, 1, 3, 4),
(33, 4, 1, 4, 5),
(34, 4, 1, 5, 3),
(35, 4, 2, 3, 7),
(36, 4, 2, 4, 7),
(37, 4, 2, 5, 7),
(38, 4, 3, 4, 3),
(39, 4, 3, 5, 5),
(40, 4, 4, 5, 3),
(41, 6, 1, 2, 2),
(42, 6, 1, 3, 2),
(43, 6, 1, 4, 2),
(44, 6, 1, 5, 2),
(45, 6, 2, 3, 3),
(46, 6, 2, 4, 5),
(47, 6, 2, 5, 3),
(48, 6, 3, 4, 3),
(49, 6, 3, 5, 2),
(50, 6, 4, 5, 3),
(110, 0, 4, 5, 1),
(109, 0, 3, 5, 1),
(108, 0, 3, 4, 1),
(107, 0, 2, 5, 1),
(106, 0, 2, 4, 1),
(105, 0, 2, 3, 1),
(104, 0, 1, 5, 2),
(103, 0, 1, 4, 5),
(102, 0, 1, 3, 3),
(101, 0, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kriteria`
--

CREATE TABLE IF NOT EXISTS `nilai_kriteria` (
  `id_nilai_kriteria` int(11) NOT NULL,
  `id_kriteria_1` int(11) NOT NULL,
  `id_kriteria_2` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `nilai_kriteria`
--

INSERT INTO `nilai_kriteria` (`id_nilai_kriteria`, `id_kriteria_1`, `id_kriteria_2`, `nilai`) VALUES
(1, 1, 2, 5),
(2, 1, 3, 2),
(3, 1, 4, 4),
(4, 1, 6, 3),
(5, 2, 3, 2),
(6, 2, 4, 2),
(7, 2, 6, 2),
(8, 3, 4, 3),
(9, 3, 6, 3),
(10, 4, 6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `data_alternatif`
--
ALTER TABLE `data_alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  ADD PRIMARY KEY (`id_nilai_alternatif`);

--
-- Indexes for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilai_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `data_alternatif`
--
ALTER TABLE `data_alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  MODIFY `id_nilai_alternatif` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilai_kriteria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
