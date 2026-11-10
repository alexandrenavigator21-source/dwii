-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2026 às 20:44
-- Versão do servidor: 10.11.16-MariaDB
-- versão do PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dados: `gestao_ginasio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas`
--

CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL,
  `id_modalidade` int(11) NOT NULL,
  `id_treinador` int(11) NOT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `hora` time NOT NULL,
  `duracao_minutos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `aulas`
--

INSERT INTO `aulas` (`id_aula`, `id_modalidade`, `id_treinador`, `dia_semana`, `hora`, `duracao_minutos`) VALUES
(1, 1, 1, 'Segunda-feira', '09:00:00', 60),
(2, 2, 2, 'Terca-feira', '10:00:00', 45),
(3, 3, 3, 'Quarta-feira', '18:00:00', 60),
(4, 4, 4, 'Quinta-feira', '11:00:00', 50),
(5, 5, 5, 'Sexta-feira', '17:00:00', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_inscricao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `email`, `telefone`, `data_nascimento`, `data_inscricao`) VALUES
(1, 'Joao Silva', 'joao@gmail.com', '912345678', '2000-05-12', '2026-01-10'),
(2, 'Maria Costa', 'maria@gmail.com', '913456789', '1998-08-20', '2026-01-15'),
(3, 'Pedro Santos', 'pedro@gmail.com', '914567890', '1995-03-15', '2026-02-01'),
(4, 'Ana Lopes', 'ana@gmail.com', '915678901', '2002-11-25', '2026-02-10'),
(5, 'Tiago Sousa', 'tiago@gmail.com', '916789012', '1999-07-08', '2026-03-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricoes`
--

CREATE TABLE `inscricoes` (
  `id_inscricao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_modalidade` int(11) NOT NULL,
  `data_inscricao` date NOT NULL,
  `estado` varchar(20) DEFAULT 'Ativa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `inscricoes`
--

INSERT INTO `inscricoes` (`id_inscricao`, `id_cliente`, `id_modalidade`, `data_inscricao`, `estado`) VALUES
(1, 1, 1, '2026-01-10', 'Ativa'),
(2, 2, 2, '2026-01-15', 'Ativa'),
(3, 3, 3, '2026-02-01', 'Ativa'),
(4, 4, 4, '2026-02-10', 'Ativa'),
(5, 5, 5, '2026-03-01', 'Ativa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modalidades`
--

CREATE TABLE `modalidades` (
  `id_modalidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco_mensal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `modalidades`
--

INSERT INTO `modalidades` (`id_modalidade`, `nome`, `descricao`, `preco_mensal`) VALUES
(1, 'Musculacao', 'Treino de forca', 30.00),
(2, 'Yoga', 'Relaxamento e flexibilidade', 25.00),
(3, 'Crossfit', 'Treino funcional', 40.00),
(4, 'Pilates', 'Postura e controlo corporal', 28.00),
(5, 'Cardio', 'Treino cardiovascular', 22.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_pagamento` date NOT NULL,
  `metodo_pagamento` varchar(30) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id_pagamento`, `id_cliente`, `valor`, `data_pagamento`, `metodo_pagamento`, `estado`) VALUES
(1, 1, 30.00, '2026-01-10', 'Cartao', 'Pago'),
(2, 2, 25.00, '2026-01-15', 'Dinheiro', 'Pago'),
(3, 3, 40.00, '2026-02-01', 'MB WAY', 'Pago'),
(4, 4, 28.00, '2026-02-10', 'Cartao', 'Pago'),
(5, 5, 22.00, '2026-03-01', 'Transferencia', 'Pago');

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinadores`
--

CREATE TABLE `treinadores` (
  `id_treinador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `treinadores`
--

INSERT INTO `treinadores` (`id_treinador`, `nome`, `email`, `telefone`, `especialidade`) VALUES
(1, 'Carlos Ferreira', 'carlos@gmail.com', '917111111', 'Musculacao'),
(2, 'Rita Martins', 'rita@gmail.com', '917222222', 'Yoga'),
(3, 'Andre Oliveira', 'andre@gmail.com', '917333333', 'Crossfit'),
(4, 'Sofia Pereira', 'sofia@gmail.com', '917444444', 'Pilates'),
(5, 'Miguel Rodrigues', 'miguel@gmail.com', '917555555', 'Cardio');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `id_modalidade` (`id_modalidade`),
  ADD KEY `id_treinador` (`id_treinador`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD PRIMARY KEY (`id_inscricao`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_modalidade` (`id_modalidade`);

--
-- Índices para tabela `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`id_modalidade`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `treinadores`
--
ALTER TABLE `treinadores`
  ADD PRIMARY KEY (`id_treinador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  MODIFY `id_inscricao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `id_modalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `treinadores`
--
ALTER TABLE `treinadores`
  MODIFY `id_treinador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`),
  ADD CONSTRAINT `aulas_ibfk_2` FOREIGN KEY (`id_treinador`) REFERENCES `treinadores` (`id_treinador`);

--
-- Limitadores para a tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD CONSTRAINT `inscricoes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `inscricoes_ibfk_2` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`);

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
