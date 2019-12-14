-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Dez-2019 às 22:16
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalho`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `ID_CATEGORIA` int(4) NOT NULL,
  `NOME` varchar(40) NOT NULL,
  `DESCRICAO` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`ID_CATEGORIA`, `NOME`, `DESCRICAO`) VALUES
(1, 'pequeno porte', 'empresa de tecnologia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `ID_EMPRESA` int(4) NOT NULL,
  `NOME` varchar(40) DEFAULT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `CNPJ` varchar(40) DEFAULT NULL,
  `TELEFONE` varchar(12) DEFAULT NULL,
  `VLR_INVESTIDO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`ID_EMPRESA`, `NOME`, `EMAIL`, `CNPJ`, `TELEFONE`, `VLR_INVESTIDO`) VALUES
(1, 'Godoy Tec', 'godoytec@gmail.com', '123.456.789/0001-01', '1635485624', 5),
(2, 'Tec Guerra', 'tecguerra@gmail.com', '789.456.123/0001-02', '1638547856', 3),
(3, 'Cinnamon', 'cinnamon@gmail.com', '456.789.123/0001-03', '1638965875', 50000),
(4, 'CRP Tec', 'crptec@gmail.com', '147.258.369/0001-04', '1639785426', 500);

-- --------------------------------------------------------

--
-- Estrutura da tabela `investidor`
--

CREATE TABLE `investidor` (
  `ID_INVESTIDOR` int(4) NOT NULL,
  `NOME` varchar(40) NOT NULL,
  `PROFISSAO` varchar(40) DEFAULT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `CPF` varchar(40) DEFAULT NULL,
  `TELEFONE` varchar(12) DEFAULT NULL,
  `SENHA` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `investidor`
--

INSERT INTO `investidor` (`ID_INVESTIDOR`, `NOME`, `PROFISSAO`, `EMAIL`, `CPF`, `TELEFONE`, `SENHA`) VALUES
(2, 'admin', 'administrador', 'adimin@admin.com.br', '123', '39283', '202cb962ac59075b964b07152d234b70'),
(3, 'Pepe', 'pepe', 'adimin@admin', '123.456.789-11', '16 9991-1234', '202cb962ac59075b964b07152d234b70'),
(4, 'paulo ', 'empresario', 'paulo@gmail.com', '999.999.999-99', '23 4874-5398', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estrutura da tabela `parcelas`
--

CREATE TABLE `parcelas` (
  `ID_PARCELAS` int(4) NOT NULL,
  `VL_TOTAL` float NOT NULL,
  `QTD_PARCELAS` int(10) NOT NULL,
  `ID_EMPRESA` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `parcelas`
--

INSERT INTO `parcelas` (`ID_PARCELAS`, `VL_TOTAL`, `QTD_PARCELAS`, `ID_EMPRESA`) VALUES
(2, 5000, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rentabilidade`
--

CREATE TABLE `rentabilidade` (
  `ID_RENTABILIDADE` int(11) NOT NULL,
  `RENDIMENTO` float DEFAULT NULL,
  `TEMPO_RETORNO` date DEFAULT NULL,
  `VLR_INVESTIDO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`ID_EMPRESA`);

--
-- Índices para tabela `investidor`
--
ALTER TABLE `investidor`
  ADD PRIMARY KEY (`ID_INVESTIDOR`);

--
-- Índices para tabela `parcelas`
--
ALTER TABLE `parcelas`
  ADD PRIMARY KEY (`ID_PARCELAS`);

--
-- Índices para tabela `rentabilidade`
--
ALTER TABLE `rentabilidade`
  ADD PRIMARY KEY (`ID_RENTABILIDADE`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_CATEGORIA` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `ID_EMPRESA` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `investidor`
--
ALTER TABLE `investidor`
  MODIFY `ID_INVESTIDOR` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `parcelas`
--
ALTER TABLE `parcelas`
  MODIFY `ID_PARCELAS` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `rentabilidade`
--
ALTER TABLE `rentabilidade`
  MODIFY `ID_RENTABILIDADE` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `empresa` (`ID_EMPRESA`);

--
-- Limitadores para a tabela `parcelas`
--
ALTER TABLE `parcelas`
  ADD CONSTRAINT `parcelas_ibfk_1` FOREIGN KEY (`ID_PARCELAS`) REFERENCES `investidor` (`ID_INVESTIDOR`);

--
-- Limitadores para a tabela `rentabilidade`
--
ALTER TABLE `rentabilidade`
  ADD CONSTRAINT `rentabilidade_ibfk_1` FOREIGN KEY (`ID_RENTABILIDADE`) REFERENCES `investidor` (`ID_INVESTIDOR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
