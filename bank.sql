-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2020 at 10:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id15300157_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_sampah`
--

CREATE TABLE `tb_sampah` (
  `id_sampah` int(24) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_sampah`
--

INSERT INTO `tb_sampah` (`id_sampah`, `jenis`, `harga`) VALUES
(1, 'Plastik', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tabungan`
--

CREATE TABLE `tb_tabungan` (
  `id_tabungan` int(25) NOT NULL,
  `norek` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `setor` varchar(255) NOT NULL,
  `tarik` varchar(255) NOT NULL,
  `berat` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tabungan`
--

INSERT INTO `tb_tabungan` (`id_tabungan`, `norek`, `tanggal`, `setor`, `tarik`, `berat`, `jenis`) VALUES
(5, 'BS-002', '2020-10-11', '10000', '0', '0', '0'),
(6, 'BS-002', '2020-12-20', '0', '5000', '15kg', 'Kertas'),
(8, 'BS-003', '2020/2/10', '', '0', '5', 'Plastik'),
(9, 'BS-003', '2020/10/14', '', '0', '123', '123'),
(10, 'BS-003', '2020-12-10', '15000', '0', '12', 'Buku'),
(11, 'BS-005', '2020-10-19', '15000', '0', '12', 'Plastik'),
(12, 'BS-005', '2020-10-30', '0', '20000', '0', '0'),
(13, 'bs-003', '2020/11/1', '50000', '0', '12', 'Kertas'),
(14, 'bs-002', '2020-07-19', '0', '500', '0', '0'),
(15, 'bs-003', '2020-12-20', '30000', '0', '15', 'Plastik'),
(16, 'bs-004', '20-12-2020', '300', '0', '12 kg', 'Plastik'),
(17, 'bs-004', '20-11-2020', '0', '500', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `norek` varchar(244) NOT NULL,
  `password` varchar(244) NOT NULL,
  `nama` varchar(244) NOT NULL,
  `alamat` varchar(244) NOT NULL,
  `notel` varchar(244) NOT NULL,
  `status` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`norek`, `password`, `nama`, `alamat`, `notel`, `status`) VALUES
('admin', '13', '1234', 'asjdklsaj', 'sjdkalds', 'admin'),
('BS-002', '1234', 'WAHYONO', 'Jalan Jalan', '00000', 'user'),
('BS-003', '1234', 'SULASTRI', 'Jalan Jalan', '123543543', 'user'),
('BS-004', '1234', 'SUHARTATI', 'JL PUSPONJOLO', '123456789', 'user'),
('BS-005', '1234', 'dsadsa', 'rinjani timur 24', '123444', 'user'),
('bs-0055', '1234', 'vania', 'semarang', '33445566', 'user'),
('bs-013', '1234', 'adsa', 'qweqewqe', '1232132', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_sampah`
--
ALTER TABLE `tb_sampah`
  ADD PRIMARY KEY (`id_sampah`);

--
-- Indexes for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD PRIMARY KEY (`id_tabungan`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`norek`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_sampah`
--
ALTER TABLE `tb_sampah`
  MODIFY `id_sampah` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  MODIFY `id_tabungan` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
