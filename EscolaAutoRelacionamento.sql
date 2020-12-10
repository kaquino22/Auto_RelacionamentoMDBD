-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 10:07 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escola`
--

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `codCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`codCargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Coordenador Pedagógico'),
(3, 'Coordenador  Informática'),
(4, 'Coordenador  Recursos Humanos'),
(5, 'Coordenador Biblioteca Ativa'),
(6, 'Coordenador Ensino Médio');

-- --------------------------------------------------------

--
-- Table structure for table `cargofunc`
--

CREATE TABLE `cargofunc` (
  `codFuncionario` int(11) NOT NULL,
  `codCargo` int(11) NOT NULL,
  `D_Entrada` date NOT NULL,
  `D_Saida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargofunc`
--

INSERT INTO `cargofunc` (`codFuncionario`, `codCargo`, `D_Entrada`, `D_Saida`) VALUES
(4, 3, '2020-12-10', NULL),
(2, 5, '2020-12-06', '2020-12-10'),
(3, 5, '1999-12-11', NULL),
(1, 1, '1960-10-20', NULL),
(2, 2, '1970-12-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `idfunc` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `DataEntrada` date NOT NULL,
  `DataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`idfunc`, `nome`, `DataEntrada`, `DataSaida`) VALUES
(1, 'Claudinho', '2019-04-11', NULL),
(2, 'Alanzoka', '2020-10-05', NULL),
(3, 'Felps', '2019-12-11', NULL),
(4, 'Maicon kuster', '2020-12-10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codCargo`);

--
-- Indexes for table `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD KEY `codFuncionario` (`codFuncionario`),
  ADD KEY `codCargo` (`codCargo`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfunc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idfunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD CONSTRAINT `cargofunc_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `cargo` (`codCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofunc_ibfk_2` FOREIGN KEY (`codFuncionario`) REFERENCES `funcionario` (`idfunc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
