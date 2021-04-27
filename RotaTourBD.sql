-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mar 16, 2021 as 09:35 PM
-- Versão do Servidor: 5.5.8
-- Versão do PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `rotatourbd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE IF NOT EXISTS `acesso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `tipoLogin` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `acesso`
--

INSERT INTO `acesso` (`id`, `login`, `senha`, `tipoLogin`) VALUES
(1, 'administrador', '12345', 1),
(2, 'armando', '12345', 0),
(3, 'armando@gmil.com', '95015363', 0),
(4, 'armando@gmil.com', '95015363', 0),
(5, 'armando@gmil.com', '95015363', 0),
(6, 'armando@gmil.com', '95015363', 0),
(7, 'armando@gmil.com', '95015363', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhantes`
--

CREATE TABLE IF NOT EXISTS `acompanhantes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataNacimento` date DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `clientesFK_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o41ju7qpa421qk51pba51hv41` (`clientesFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `acompanhantes`
--

INSERT INTO `acompanhantes` (`id`, `dataNacimento`, `nome`, `clientesFK_id`) VALUES
(1, '1980-03-12', 'Maria JosÃ© dos Santos', 1),
(2, '2000-08-23', 'Alex Lima de Orleans e BraganÃ§a', 1),
(3, '2002-07-12', 'sdfsdfsdfdsfdsfsdfsdf', 2),
(4, '2011-04-12', 'eqweqweqwwetrterter', 2),
(5, '2012-06-30', 'wasasaASDASDDFDFGDG', 2),
(6, '2002-07-12', 'sdfsdfsdfdsfdsfsdfsdftretrt', 3),
(7, '2011-04-12', 'ewrwerwerewrwerwer', 3),
(8, '2012-06-30', 'rrwerwerwerwerfsdfsdfsdfsdf', 3),
(9, '2001-04-12', 'rewrwerwerewrwerwerwerw', 3),
(10, '2000-09-23', 'ttrtewrwerwrwerwerewrwerwerwe', 3),
(11, '2002-07-12', 'sdfsdfsdfdsfdsfsdfsdftretrt', 4),
(12, '2002-07-12', 'sdfsdfsdfdsfdsfsdfsdftretrt', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE IF NOT EXISTS `cartao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codSeguranca` varchar(3) NOT NULL,
  `contato` varchar(9) NOT NULL,
  `cpfTitular` varchar(11) NOT NULL,
  `dataNacimento` date DEFAULT NULL,
  `ddd` varchar(2) NOT NULL,
  `nomeTitular` varchar(25) NOT NULL,
  `numeroCartao` varchar(16) NOT NULL,
  `validade` varchar(4) NOT NULL,
  `pagamento_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fhwp47cwxdwiaocisccr4ir10` (`pagamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `cartao`
--

INSERT INTO `cartao` (`id`, `codSeguranca`, `contato`, `cpfTitular`, `dataNacimento`, `ddd`, `nomeTitular`, `numeroCartao`, `validade`, `pagamento_id`) VALUES
(1, '323', '995015362', '09995609834', '1999-08-23', '81', 'Armando P S Neto', '1222332343444434', '1223', 1),
(2, '233', '977675564', '21232132434', '2010-09-12', '81', 'Aerjjxjc djsiduisdd', '1223233434343454', '0723', 2),
(3, '233', '654534231', '21232132434', '2010-09-12', '97', 'Aerjjxjc djsiduisdd', '2321323432434345', '0523', 3),
(4, '233', '654534231', '21232132434', '2010-09-12', '97', 'Aerjjxjc djsiduisdd', '2342343242343242', '1124', 4),
(5, '233', '654534231', '21232132434', '2010-09-12', '97', 'Aerjjxjc djsiduisdd', '3123213123123123', '0923', 5),
(6, '233', '144324342', '12121212121', '2010-09-12', '98', 'Aerjjxjc djsiduisdd', '1313434435565465', '0923', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(35) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `cidade` varchar(35) NOT NULL,
  `contato` varchar(9) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataNacimento` date DEFAULT NULL,
  `ddd` varchar(2) NOT NULL,
  `email` varchar(40) NOT NULL,
  `logradouro` varchar(35) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `bairro`, `cep`, `cidade`, `contato`, `cpf`, `dataNacimento`, `ddd`, `email`, `logradouro`, `nome`, `numero`, `sexo`, `uf`) VALUES
(1, 'Sto AntÃ´nio', '55700000', 'Limoeiro', '995015362', '55700000000', '1999-08-23', '81', 'armandopaulinosilvaneto@gmail.com', 'rua Margarida Xavier Ferreira', 'Armando Paulino da Silva Neto', '123', 'M', 'PE'),
(2, 'rrsedfdfsdf', '55700000', '3213123131', '654534231', '12323332432', '2010-09-12', '97', 'asdcasdsafsdfsdg@gmail.com', 'ggfghggjjghj', 'fdgffdgfdfgsdfdASasASasads', '333', 'M', 'pe'),
(3, 'rrsedfdfsdf', '55700000', '3213123131', '654534231', '12323332432', '2010-09-12', '97', 'asdcasdsafsdfsdg@gmail.com', 'ggfghggjjghj', 'fdgffdgfdfgWEFRWEREWRWER', '333', 'M', 'pe'),
(4, 'rrsedfdfsdf', '55700000', '3213123131', '654534231', '12323332432', '2010-09-12', '97', 'asdcasdsafsdfsdg@gmail.com', 'ggfghggjjghj', 'fdgffdgfdfgWEFRWEREWRWER', '333', 'M', 'pe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigoNotaFisca` varchar(25) NOT NULL,
  `dataCompra` date DEFAULT NULL,
  `quantidade` smallint(6) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `acessoFK_id` bigint(20) NOT NULL,
  `pagamentoFK_id` bigint(20) NOT NULL,
  `viagemFK_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_j3ku0042h0fiji7pnla9hsf1k` (`acessoFK_id`),
  KEY `FK_d6p2lnm6lh438h1upmgy4o3lb` (`pagamentoFK_id`),
  KEY `FK_jtgq1jov7h69wchou0om6taeo` (`viagemFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`id`, `codigoNotaFisca`, `dataCompra`, `quantidade`, `valor`, `acessoFK_id`, `pagamentoFK_id`, `viagemFK_id`) VALUES
(1, '5363806716441186371767023', '2020-06-01', 4, '9616.00', 2, 1, 1),
(2, '6255424382745055321705251', '2021-02-27', 5, '2480.00', 5, 4, 2),
(3, '6231325463750717714348215', '2021-02-27', 7, '12670.00', 6, 5, 3),
(4, '3775877257230012203815751', '2021-02-27', 3, '5430.00', 7, 6, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

CREATE TABLE IF NOT EXISTS `imagens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(25) NOT NULL,
  `imagemPacotesFK` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `imagens`
--

INSERT INTO `imagens` (`id`, `imagem`, `imagemPacotesFK`) VALUES
(1, 'itacare1.jpg', 1),
(2, 'itacare2.jpg', 1),
(3, 'itacare3.jpg', 1),
(4, 'itacare4.jpg', 1),
(5, 'lisboa1.jpg', 2),
(6, 'lisboa2.jpg', 2),
(7, 'lisboa3.jpg', 2),
(8, 'lisboa4.jpg', 2),
(9, 'torresdelpaine1.jpg', 3),
(10, 'torresdelpaine2.jpg', 3),
(11, 'torresdelpaine3.jpg', 3),
(12, 'torresdelpaine4.jpg', 3),
(13, 'fernandonoronha1.jpg', 4),
(14, 'fernandonoronha2.jpg', 4),
(15, 'fernandonoronha3.jpg', 4),
(16, 'fernandonoronha4.jpg', 4),
(17, 'buzios1.jpg', 5),
(18, 'buzios2.jpg', 5),
(19, 'buzios3.jpg', 5),
(20, 'buzios4.jpg', 5),
(21, 'miami1.jpg', 6),
(22, 'miami2.jpg', 6),
(23, 'miami3.jpg', 6),
(24, 'miami4.jpg', 6),
(25, 'desertoatacama1.jpg', 7),
(26, 'desertoatacama2.jpg', 7),
(27, 'desertoatacama3.jpg', 7),
(28, 'desertoatacama4.jpg', 7),
(29, 'roma1.jpg', 8),
(30, 'roma2.jpg', 8),
(31, 'roma3.jpg', 8),
(32, 'roma4.jpg', 8),
(33, 'orlando1.jpg', 9),
(34, 'orlando2.jpg', 9),
(35, 'orlando3.jpg', 9),
(36, 'orlando4.jpg', 9),
(37, 'florianopolis1.jpg', 10),
(38, 'florianopolis2.jpg', 10),
(39, 'florianopolis3.jpg', 10),
(40, 'florianopolis4.jpg', 10),
(41, 'londres1.jpg', 11),
(42, 'londres2.jpg', 11),
(43, 'londres3.jpg', 11),
(44, 'londres4.jpg', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lugares`
--

CREATE TABLE IF NOT EXISTS `lugares` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `capital` varchar(25) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `detalhe` text,
  `imagem` varchar(25) NOT NULL,
  `moeda` varchar(15) NOT NULL,
  `pais` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `lugares`
--

INSERT INTO `lugares` (`id`, `capital`, `cidade`, `detalhe`, `imagem`, `moeda`, `pais`) VALUES
(1, 'Brasília', 'Itacaré - BA', 'Itacaré foi, durante anos, um paraíso quase secreto, conhecido apenas entre pescadores, surfistas e amantes de praias desertas. A intensa faixa de Mata Atlântica que recobre a região a manteve assim, quase intocada. Com o passar do tempo, viajantes de todo o Brasil começaram a desvendar os segredos desse pequeno povoado no Litoral Sul da Bahia.', 'itacare.jpg', 'Real', 'Brasil'),
(2, 'Lisboa', 'Lisboa', 'Lisboa é um lugar de perder o fôlego com suas belas paisagens e ladeiras. Nada melhor do que caminhar pelas estreitas ruas de Alfama e se encantar com cada cantinho que a capital portuguesa tem a oferecer. Um belo passeio pelas margens do Rio Tejo não pode faltar em seu roteiro, assim como uma subida ao Bairro Alto e uma caminhada pelo centro apreciando as lojas e os doces portugueses. A capital de Portugal também é um belo destino para quem busca comer bem. Em nossos guias de Lisboa e do Porto você encontra informações e dicas para planejar e aproveitar melhor a sua viagem para Portugal.', 'lisboa.jpg', 'Euro', 'Portugal'),
(3, 'Santiago', 'Comuna do Chile', 'Torres del Paine - No extremo sul das Américas está um dos lugares mais selvagens do planeta. Uma paisagem quase intocada aguarda para ser descoberta e explorada. Essa é a sensação dos viajantes que chegam à Patagônia e ao Parque Torres del Paine . O acesso ao parque se dá pelo aeroporto de Punta arenas, cidade também famosa pela colônia de pinguins em Isla Magdalena e próxima à estação de esqui Club Andino de Punta Arenas, lugar que tem uma das poucas pistas de esqui do mundo com vista pro mar.', 'torresdelpaine.jpg', 'Peso chileno', 'Chile'),
(4, 'Brasília', 'Fernando de Noronha - PE', 'Fernando de Noronha - Comumente chamado de paraíso brasileiro, Fernando de Noronha surpreende pela cor do mar, pela natureza bem preservada e pela intensa vida marinha, que pode ser vista de pertinho em passeios de barco, mergulhos ou mesmo com snorkel. Destino perfeito para quem procura tranquilidade e inspiração.', 'fernandonoronha.jpg', 'Real', 'Brasil'),
(5, 'Brasília', 'Lagos - RJ', 'Búzios Beach Resort - Ideal para toda família, o Búzios Beach Resort é considerado o maior resort da Região dos Lagos. A estada, repleta de lazer e bem-estar, é para quem deseja aproveitar um dos destinos mais famosos do Rio de Janeiro, com ótima localização à beira da Praia de Tucuns e a cerca de 7 km da Orla Bardot e da Rua das Pedras.', 'buzios.jpg', 'Euro', 'Brasil'),
(6, 'Washington', 'Miami', 'Miami é uma das cidades preferidas dos brasileiros. E não faltam motivos para isso: para além das atrações culturais e ampla variedade gastronômica, a cidade da Flórida oferece ótimas opções para as compras e praias belíssimas!', 'miami.jpg', 'Dolar', 'Estados Unidos'),
(7, 'Santiago', 'San Pedro de Atacama', 'O Deserto do Atacama é considerado o mais seco do mundo e vai muito além das dunas de areia: lagos em que não se afunda, formações rochosas esculpidas pelo vento, vida selvagem, sítios arqueológicos, deserto de sal…e um céu azul como em nenhum outro lugar. Clique nas imagens abaixo pra ter uma ideia do que lhe espera: Não é a toa que os leitores do Melhores Destinos deram nota 10 para este lugar no nosso Guia de Destinos.', 'desertoatacama.jpg', 'Peso chileno', 'Chile'),
(8, 'Roma', 'Roma', 'Roma - Não é à toa que Roma é conhecida como “A Cidade Eterna”. A capital da Itália oferece ao visitante uma viagem no tempo por meio de patrimônio histórico riquíssimo  — além, é claro, dos museus interessantes, bons restaurantes e tantos outros motivos que levam uma grande quantidade de turistas à cidade todos os anos. Uma cidade que vai te surpreender a cada esquina!', 'roma.jpg', 'Euro', 'Itália'),
(9, 'Washington', 'Orlando', 'Mesmo que você leia todas as notícias e dicas sobre a Disney, você só vai saber como é a sensação mágica dos parques estando lá. É impossível descrever! Se você se deixar levar pelas músicas, pelas memórias que cada atração traz e realmente deixar as preocupações para trás, vai ser uma experiência inesquecível.', 'orlando.jpg', 'Dolar', 'Estados Unidos'),
(10, 'Brasília', 'Florianópolis - SC', 'No alto da lista das cidades mais visitadas por estrangeiros, Florianópolis encanta por sua variedade de praias e pela capacidade de agradar todo tipo de público. É uma capital que cresceu em meio à natureza, que oferece belas paisagens naturais por toda sua extensão, onde se pode curtir tanto o movimento de uma capital efervescente quanto a tranquilidade de uma cidade — quase — do interior.', 'florianopolis.jpg', 'Real', 'Brasil'),
(11, 'Londres', 'Londres', 'Moderna, elegante, movimentada, riquÃ­ssima em cultura e opÃ§Ãµes de entretenimento. CaracterÃ­sticas como essas, entre tantas outras, deixam claro por que Londres Ã© um dos destinos mais procurados do mundo. NÃ£o deixe de conferir nosso guia gratuito de Londres, onde vocÃª vai encontrar muitas informaÃ§Ãµes para planejar e aproveitar melhor a sua viagem.', 'londres.jpg', 'Libra esterlina', 'Reino Unido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `opcoes`
--

CREATE TABLE IF NOT EXISTS `opcoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `viagemFK_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2krti2w2gx7vg6cp82k8tbvwx` (`viagemFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `opcoes`
--

INSERT INTO `opcoes` (`id`, `data`, `viagemFK_id`) VALUES
(1, '2021-04-12', 1),
(2, '2021-05-05', 1),
(3, '2021-06-05', 1),
(4, NULL, 2),
(5, NULL, 2),
(6, NULL, 2),
(7, NULL, 3),
(8, NULL, 3),
(9, NULL, 3),
(10, NULL, 4),
(11, NULL, 4),
(12, NULL, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacotes`
--

CREATE TABLE IF NOT EXISTS `pacotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataFim` date DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `diarias` smallint(6) NOT NULL,
  `valor` decimal(6,2) NOT NULL,
  `lugaresFK_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p7a4kpwsepetvpqh364vxt1ba` (`lugaresFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `pacotes`
--

INSERT INTO `pacotes` (`id`, `dataFim`, `dataInicio`, `diarias`, `valor`, `lugaresFK_id`) VALUES
(1, '2021-11-01', '2021-04-01', 2, '314.00', 1),
(2, '2021-11-01', '2021-04-01', 4, '1861.00', 2),
(3, '2021-11-01', '2021-04-01', 3, '864.00', 3),
(4, '2021-11-01', '2021-04-01', 2, '417.00', 4),
(5, '2021-11-01', '2021-04-01', 4, '496.00', 5),
(6, '2021-11-01', '2021-04-01', 3, '1447.00', 6),
(7, '2021-11-01', '2021-04-01', 3, '1010.00', 7),
(8, '2021-11-01', '2021-04-01', 5, '1810.00', 8),
(9, '2021-11-01', '2021-04-01', 5, '2404.00', 9),
(10, '2021-11-01', '2021-04-01', 4, '343.00', 10),
(11, '2021-11-12', '2021-04-12', 4, '2179.00', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Valor` decimal(7,2) NOT NULL,
  `dataPagamento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `Valor`, `dataPagamento`) VALUES
(1, '9616.00', '2020-06-01'),
(2, '1984.00', '2021-02-27'),
(3, '3030.00', '2021-02-27'),
(4, '2480.00', '2021-02-27'),
(5, '12670.00', '2021-02-27'),
(6, '5430.00', '2021-02-27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `parcelamento`
--

CREATE TABLE IF NOT EXISTS `parcelamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` smallint(6) NOT NULL,
  `valor` decimal(6,2) NOT NULL,
  `pagamento_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ggegdi641jnomi64rb52imrbm` (`pagamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `parcelamento`
--

INSERT INTO `parcelamento` (`id`, `quantidade`, `valor`, `pagamento_id`) VALUES
(1, 10, '961.60', 1),
(2, 10, '198.40', 2),
(3, 12, '252.50', 3),
(4, 12, '206.67', 4),
(5, 8, '1583.75', 5),
(6, 10, '543.00', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `viagem`
--

CREATE TABLE IF NOT EXISTS `viagem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `saida` varchar(35) NOT NULL,
  `clienteFK_id` bigint(20) NOT NULL,
  `pacotesFK_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8j7dbuta4iqw1u14oe1b5kioh` (`clienteFK_id`),
  KEY `FK_fl39sl15j4qc7wsoicp2xi545` (`pacotesFK_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `viagem`
--

INSERT INTO `viagem` (`id`, `data`, `saida`, `clienteFK_id`, `pacotesFK_id`) VALUES
(1, '2020-06-01', 'Recife', 1, 9),
(2, '2021-02-27', 'Manaus', 2, 5),
(3, '2021-02-27', 'Recife', 3, 8),
(4, '2021-02-27', 'Rio de Janeiro', 4, 8);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `acompanhantes`
--
ALTER TABLE `acompanhantes`
  ADD CONSTRAINT `FK_o41ju7qpa421qk51pba51hv41` FOREIGN KEY (`clientesFK_id`) REFERENCES `clientes` (`id`);

--
-- Restrições para a tabela `cartao`
--
ALTER TABLE `cartao`
  ADD CONSTRAINT `FK_fhwp47cwxdwiaocisccr4ir10` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`);

--
-- Restrições para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FK_d6p2lnm6lh438h1upmgy4o3lb` FOREIGN KEY (`pagamentoFK_id`) REFERENCES `pagamento` (`id`),
  ADD CONSTRAINT `FK_j3ku0042h0fiji7pnla9hsf1k` FOREIGN KEY (`acessoFK_id`) REFERENCES `acesso` (`id`),
  ADD CONSTRAINT `FK_jtgq1jov7h69wchou0om6taeo` FOREIGN KEY (`viagemFK_id`) REFERENCES `viagem` (`id`);

--
-- Restrições para a tabela `opcoes`
--
ALTER TABLE `opcoes`
  ADD CONSTRAINT `FK_2krti2w2gx7vg6cp82k8tbvwx` FOREIGN KEY (`viagemFK_id`) REFERENCES `viagem` (`id`);

--
-- Restrições para a tabela `pacotes`
--
ALTER TABLE `pacotes`
  ADD CONSTRAINT `FK_p7a4kpwsepetvpqh364vxt1ba` FOREIGN KEY (`lugaresFK_id`) REFERENCES `lugares` (`id`);

--
-- Restrições para a tabela `parcelamento`
--
ALTER TABLE `parcelamento`
  ADD CONSTRAINT `FK_ggegdi641jnomi64rb52imrbm` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`);

--
-- Restrições para a tabela `viagem`
--
ALTER TABLE `viagem`
  ADD CONSTRAINT `FK_8j7dbuta4iqw1u14oe1b5kioh` FOREIGN KEY (`clienteFK_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `FK_fl39sl15j4qc7wsoicp2xi545` FOREIGN KEY (`pacotesFK_id`) REFERENCES `pacotes` (`id`);
