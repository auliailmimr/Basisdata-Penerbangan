-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 04:27 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penerbangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `ID_EVENT` varchar(100) NOT NULL,
  `DISKON` decimal(10,0) DEFAULT NULL,
  `EXPIRED_TIME` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`ID_EVENT`, `DISKON`, `EXPIRED_TIME`) VALUES
('dskn_12', '100000', '2022-12-01 00:18:43'),
('dskn_15', '1000000', '2022-11-23 00:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pesawat`
--

CREATE TABLE `jenis_pesawat` (
  `MASKAPAI_PENERBANGAN` varchar(100) NOT NULL,
  `JENIS_PESAWAT` varchar(100) DEFAULT NULL,
  `TAHUN_PRODUKSI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_pesawat`
--

INSERT INTO `jenis_pesawat` (`MASKAPAI_PENERBANGAN`, `JENIS_PESAWAT`, `TAHUN_PRODUKSI`) VALUES
('AirAsinah', 'Airbus A330', '2009-06-11'),
('Batuk Air', 'Boing 737', '2014-12-03'),
('Gapura IND', 'Airbus 340', '2013-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_PEGAWAI` varchar(100) NOT NULL,
  `NAMA_PEGAWAI` varchar(100) DEFAULT NULL,
  `ALAMAT_PEGAWAI` varchar(100) DEFAULT NULL,
  `TELP_PEGAWAI` varchar(100) DEFAULT NULL,
  `EMAIL_PEGAWAI` varchar(100) DEFAULT NULL,
  `JK_PEGAWAI` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`ID_PEGAWAI`, `NAMA_PEGAWAI`, `ALAMAT_PEGAWAI`, `TELP_PEGAWAI`, `EMAIL_PEGAWAI`, `JK_PEGAWAI`) VALUES
('p_1', 'Amin', 'jl.kebakaran', '07610761', 'aminkeren@gmail.com', 'L'),
('p_2', 'Dodi', 'jl.jalan', '07615432', 'dodihappy@gmail.com', 'L'),
('p_3', 'Surya', 'jl.gudang garam', '07611234', 'Suryaa@gmail.com', 'L'),
('p_4', 'Ussi', 'jl.kenangan', '07610956', 'ussi12@gmail.com', 'P'),
('p_5', 'Lulu', 'jl.setapak', '07618877', 'lulu33@gmail.com', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_KTP` varchar(100) NOT NULL,
  `NAMA_PELANGGAN` varchar(100) DEFAULT NULL,
  `ALAMAT_PELANGGAN` varchar(100) DEFAULT NULL,
  `JK_PELANGGAN` varchar(100) DEFAULT NULL,
  `TELP_PELANGGAN` varchar(100) DEFAULT NULL,
  `USIA_PELANGGAN` int(11) DEFAULT NULL,
  `EMAIL_PELANGGAN` varchar(100) DEFAULT NULL,
  `REKENING_PELANGGAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_KTP`, `NAMA_PELANGGAN`, `ALAMAT_PELANGGAN`, `JK_PELANGGAN`, `TELP_PELANGGAN`, `USIA_PELANGGAN`, `EMAIL_PELANGGAN`, `REKENING_PELANGGAN`) VALUES
('34258787GH', 'Andi', 'Jl.Melati, no 67', 'L', '0875364486521', 18, 'andi@gmail.com', '4453-2314-9983'),
('36072588AU', 'Purnama', 'Jl.Sigura-gura, no.28', 'P', '081543889654', 23, 'purnama@gmail.com', '2110-6754-9876'),
('55692764DK', 'Afladhia', 'Jl.Jambu, no.43', 'L', '087534888654', 40, 'afladhia@gmail.com', '8766-8899-3243'),
('76982331HJ', 'Harum', 'Jl.Kenanga, no 87', 'P', '089532876995', 22, 'harum@gmail.com', '4430-2110-7765'),
('87443625PR', 'Fira', 'Jl.Mawar, no.14', 'P', '081333019903', 15, 'fira@gmail.com', '2110-8843-5567');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `ASAL_RESERVASI` varchar(100) DEFAULT NULL,
  `TUJUAN_RESERVASI` varchar(100) DEFAULT NULL,
  `TANGGAL_RESERVASI` date DEFAULT NULL,
  `KODE_RESERVASI` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`ASAL_RESERVASI`, `TUJUAN_RESERVASI`, `TANGGAL_RESERVASI`, `KODE_RESERVASI`) VALUES
('JAKARTA', 'SURABAYA', '2022-08-01', 'r_1'),
('BANDUNG', 'PADANG', '2022-12-01', 'r_2'),
('TANGERANG', 'JAKARTA', '2022-08-03', 'r_3');

-- --------------------------------------------------------

--
-- Table structure for table `tiket_penerbangan`
--

CREATE TABLE `tiket_penerbangan` (
  `KODE_RESERVASI` varchar(100) DEFAULT NULL,
  `ID_TIKET` varchar(100) NOT NULL,
  `ID_KTP` varchar(100) DEFAULT NULL,
  `ASAL_PENERBANGAN` varchar(100) DEFAULT NULL,
  `TUJUAN_PENERBANGAN` varchar(100) DEFAULT NULL,
  `MASKAPAI_PENERBANGAN` varchar(100) DEFAULT NULL,
  `BERANGKAT_PENERBANGAN` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TIBA_PENERBANGAN` datetime DEFAULT NULL,
  `HARGA_PENERBANGAN` decimal(8,2) DEFAULT NULL,
  `TANGGAL_PENERBANGAN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket_penerbangan`
--

INSERT INTO `tiket_penerbangan` (`KODE_RESERVASI`, `ID_TIKET`, `ID_KTP`, `ASAL_PENERBANGAN`, `TUJUAN_PENERBANGAN`, `MASKAPAI_PENERBANGAN`, `BERANGKAT_PENERBANGAN`, `TIBA_PENERBANGAN`, `HARGA_PENERBANGAN`, `TANGGAL_PENERBANGAN`) VALUES
('r_1', '126-234567', '34258787GH', 'JAKARTA', 'SURABAYA', 'AirAsinah', '2023-08-06 06:50:00', '2023-08-06 15:20:00', '650000.00', '2023-08-06'),
('r_2', '128-234568', '36072588AU', 'BANDUNG', 'PADANG', 'Batuk Air', '2022-12-11 15:00:00', '2022-12-12 05:35:00', '800000.00', '2022-12-11'),
('r_3', '130-234560', '55692764DK', 'MALANG', 'JAKARTA', 'Gapura IND', '2023-01-18 03:00:00', '2023-01-18 11:25:00', '550000.00', '2023-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_KTP` varchar(100) DEFAULT NULL,
  `ID_TRANSAKSI` varchar(100) NOT NULL,
  `ID_EVENT` varchar(100) DEFAULT NULL,
  `ID_PEGAWAI` varchar(100) DEFAULT NULL,
  `WAKTU_TRANSAKSI` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TOTAL_BIAYA` decimal(8,2) DEFAULT NULL,
  `STATUS_TRANSAKSI` varchar(100) DEFAULT NULL,
  `WAKTU_BOOKING` date DEFAULT NULL,
  `TANGGAL_TRANSAKSI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_KTP`, `ID_TRANSAKSI`, `ID_EVENT`, `ID_PEGAWAI`, `WAKTU_TRANSAKSI`, `TOTAL_BIAYA`, `STATUS_TRANSAKSI`, `WAKTU_BOOKING`, `TANGGAL_TRANSAKSI`) VALUES
('34258787GH', '234-67-178', 'dskn_12', 'p_1', '2022-12-09 14:22:08', '150000.00', 'BERHASIL', '2022-12-09', '2022-12-09'),
('36072588AU', '234-67-179', 'dskn_15', 'p_2', '2022-12-11 14:39:01', '250000.00', 'BERHASIL', '2022-12-01', '2022-12-01'),
('55692764DK', '234-67-180', 'dskn_12', 'p_3', '2022-12-11 14:45:52', '100000.00', 'BERHASIL', '2022-12-02', '2022-12-02'),
('76982331HJ', '234-67-181', 'dskn_12', 'p_4', '2022-12-11 14:45:52', '120000.00', 'BERHASIL', '2022-12-12', '2022-12-12'),
('87443625PR', '234-67-182', 'dskn_15', 'p_5', '2022-12-11 14:47:02', '300000.00', 'PROSES', '2022-12-10', '2022-12-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`ID_EVENT`);

--
-- Indexes for table `jenis_pesawat`
--
ALTER TABLE `jenis_pesawat`
  ADD PRIMARY KEY (`MASKAPAI_PENERBANGAN`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_PEGAWAI`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_KTP`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`KODE_RESERVASI`);

--
-- Indexes for table `tiket_penerbangan`
--
ALTER TABLE `tiket_penerbangan`
  ADD PRIMARY KEY (`ID_TIKET`),
  ADD KEY `KODE_RESERVASI` (`KODE_RESERVASI`),
  ADD KEY `ID_KTP` (`ID_KTP`),
  ADD KEY `MASKAPAI_PENERBANGAN` (`MASKAPAI_PENERBANGAN`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `ID_PEGAWAI` (`ID_PEGAWAI`),
  ADD KEY `ID_EVENT` (`ID_EVENT`),
  ADD KEY `ID_KTP` (`ID_KTP`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tiket_penerbangan`
--
ALTER TABLE `tiket_penerbangan`
  ADD CONSTRAINT `tiket_penerbangan_ibfk_1` FOREIGN KEY (`KODE_RESERVASI`) REFERENCES `reservasi` (`KODE_RESERVASI`),
  ADD CONSTRAINT `tiket_penerbangan_ibfk_2` FOREIGN KEY (`ID_KTP`) REFERENCES `pelanggan` (`ID_KTP`),
  ADD CONSTRAINT `tiket_penerbangan_ibfk_3` FOREIGN KEY (`MASKAPAI_PENERBANGAN`) REFERENCES `jenis_pesawat` (`MASKAPAI_PENERBANGAN`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_PEGAWAI`) REFERENCES `pegawai` (`ID_PEGAWAI`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_EVENT`) REFERENCES `diskon` (`ID_EVENT`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ID_KTP`) REFERENCES `pelanggan` (`ID_KTP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
