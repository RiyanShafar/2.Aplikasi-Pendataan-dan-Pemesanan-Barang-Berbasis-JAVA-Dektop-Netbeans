-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 05:17 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loivent`
--

-- --------------------------------------------------------

--
-- Table structure for table `databarang`
--

CREATE TABLE `databarang` (
  `no_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databarang`
--

INSERT INTO `databarang` (`no_barang`, `nama_barang`, `harga`, `jumlah`, `jenis`) VALUES
(123, 'Bangku Serum', 50000, 88, 'TQR'),
(6564, 'KAIN', 100000, 90, 'LAP');

-- --------------------------------------------------------

--
-- Table structure for table `databeli`
--

CREATE TABLE `databeli` (
  `id_beli` varchar(10) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `no_barang` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tanggal_beli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databeli`
--

INSERT INTO `databeli` (`id_beli`, `nama_customer`, `no_barang`, `jumlah`, `total`, `tanggal_beli`) VALUES
('4444', 'PT INDAH TERSAKITI', '6564', 1, 100000, '2021-07-03'),
('4444', 'PT INDAH TERSAKITI', '123', 1, 50000, '2021-07-03'),
('3535', 'PT INDAH TERSAKITI', '6564', 2, 200000, '2021-07-03'),
('3535', 'PT INDAH TERSAKITI', '123', 1, 50000, '2021-07-03'),
('2425', 'PT INDAH TERSAKITI', '123', 4, 200000, '2021-07-03'),
('2425', 'PT INDAH TERSAKITI', '6564', 3, 300000, '2021-07-03'),
('1313', 'Riyan S', '6564', 2, 200000, '2021-07-03'),
('1313', 'Riyan S', '123', 4, 200000, '2021-07-03'),
('9897', 'PT INDAH TERSAKITI', '6564', 5, 500000, '2021-07-03'),
('9897', 'PT INDAH TERSAKITI', '123', 4, 200000, '2021-07-03');

--
-- Triggers `databeli`
--
DELIMITER $$
CREATE TRIGGER `belibarang` AFTER INSERT ON `databeli` FOR EACH ROW BEGIN
update databarang SET jumlah = jumlah - new.jumlah
WHERE no_barang = new.no_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `datacustomer`
--

CREATE TABLE `datacustomer` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datacustomer`
--

INSERT INTO `datacustomer` (`id`, `nama`, `no_telp`, `fax`, `tanggal`, `alamat`) VALUES
(414, 'PT INDAH TERSAKITI', '878787686', '66666666', '2021-06-27', 'BEKASIH'),
(2323, 'Riyan S', '7276', '83683', '2021-06-14', 'poltangan JAK');

-- --------------------------------------------------------

--
-- Table structure for table `datapengiriman`
--

CREATE TABLE `datapengiriman` (
  `nopb` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `idcus` int(11) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `id_beli` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_pengiriman` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datapengiriman`
--

INSERT INTO `datapengiriman` (`nopb`, `tanggal`, `idcus`, `nama_customer`, `id_beli`, `kode_barang`, `nama_barang`, `harga`, `jumlah`, `harga_pengiriman`, `total`, `bayar`, `kembalian`) VALUES
(2112, '2021-07-03', 414, 'PT INDAH TERSAKITI', 4444, 123, 'Bangku Serum', 50000, 1, 18000, 168000, 200000, 32000),
(2525, '2021-07-03', 2323, 'Riyan S', 1313, 123, 'Bangku Serum', 50000, 4, 150000, 550000, 600000, 50000),
(5656, '2021-07-03', 2323, 'Riyan S', 2323, 123, 'Bangku Serum', 50000, 1, 30000, 580000, 600000, 20000),
(5757, '2021-07-03', 414, 'PT INDAH TERSAKITI', 9897, 123, 'Bangku Serum', 50000, 4, 140000, 840000, 850000, 10000),
(6767, '2021-07-03', 414, 'PT INDAH TERSAKITI', 3535, 123, 'Bangku Serum', 50000, 1, 20000, 270000, 300000, 30000),
(9897, '2021-07-03', 414, 'PT INDAH TERSAKITI', 2425, 6564, 'KAIN', 100000, 3, 60000, 560000, 600000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`id`, `nama`, `password`, `no_telp`, `alamat`) VALUES
(1, 'indah', '202cb962ac59075b964b07152d234b70', '0888888', 'bekasi'),
(324, 'INDAH KINARSIH', 'a01610228fe998f515a72dd730294d87', '09898', 'bekasi jauh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `databarang`
--
ALTER TABLE `databarang`
  ADD PRIMARY KEY (`no_barang`);

--
-- Indexes for table `datacustomer`
--
ALTER TABLE `datacustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datapengiriman`
--
ALTER TABLE `datapengiriman`
  ADD PRIMARY KEY (`nopb`);

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `databarang`
--
ALTER TABLE `databarang`
  MODIFY `no_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6565;
--
-- AUTO_INCREMENT for table `datacustomer`
--
ALTER TABLE `datacustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2324;
--
-- AUTO_INCREMENT for table `datapengiriman`
--
ALTER TABLE `datapengiriman`
  MODIFY `nopb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9898;
--
-- AUTO_INCREMENT for table `datauser`
--
ALTER TABLE `datauser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
