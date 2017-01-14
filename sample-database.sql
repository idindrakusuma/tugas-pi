-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 14, 2017 at 05:05 
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u5961869_bai_main`
--
CREATE DATABASE IF NOT EXISTS `u5961869_bai_main` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `u5961869_bai_main`;

-- --------------------------------------------------------

--
-- Table structure for table `calon_anggota`
--

DROP TABLE IF EXISTS `calon_anggota`;
CREATE TABLE `calon_anggota` (
  `id_calon` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `line_bbm` varchar(30) DEFAULT NULL,
  `mentoring` enum('Sudah','Belum') DEFAULT 'Belum',
  `tanggal_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Pending','Tolak','Terima') NOT NULL DEFAULT 'Pending',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calon_anggota`
--

INSERT INTO `calon_anggota` (`id_calon`, `nama_lengkap`, `nim`, `jenis_kelamin`, `no_hp`, `line_bbm`, `mentoring`, `tanggal_daftar`, `status`, `id_user`) VALUES
(1, 'Indra Kusuma', 'A11.2014.08316', 'L', '08952248642', '@indra.update', 'Belum', '2016-12-26 18:43:55', 'Pending', 1),
(2, 'Zakiy Anwar F', 'A11.2014.08326', 'L', '08122334444', '@zakiyanwar', 'Belum', '2016-12-27 03:14:03', 'Pending', 1),
(3, 'M Nurul Irfan', 'A11.2014.08363', 'L', '089522248642', '@mnirfan', 'Sudah', '2017-01-01 15:18:33', 'Pending', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calon_anggota`
--
ALTER TABLE `calon_anggota`
  ADD PRIMARY KEY (`id_calon`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calon_anggota`
--
ALTER TABLE `calon_anggota`
  MODIFY `id_calon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
