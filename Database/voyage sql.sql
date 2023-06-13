-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2022 at 11:38 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login_register_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE tbl_user (
  `CPF` varchar(100) NOT NULL primary key,
  `name` varchar(100) NOT NULL,
  `CEP` varchar (70) NOT NULL,
  `City` varchar(150) NOT NULL,
  `State` varchar (50) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `StreetNumber` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select * from tbl_user;

CREATE TABLE Pacotes(
	id int not null auto_increment primary key,
    Lugar varchar (100) not null,
    Nome varchar (100) not null,
    PrecoBase float not null 
);

select * from Pacotes;

CREATE TABLE hospedagens (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  lugar VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  preco_diaria DECIMAL(8, 2) NOT NULL,
  estrelas INT NOT NULL,
  quartos INT NOT NULL,
  camas INT NOT NULL,
  capacidade INT NOT NULL
);

select * from hospedagens;

CREATE TABLE passeios (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  lugar VARCHAR(50) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(8, 2) NOT NULL,
  duracao INT NOT NULL,
  descricao TEXT NOT NULL
);

select * from passeios;

CREATE TABLE Compra (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CPF VARCHAR(100) NOT NULL,
  pacote INT NOT NULL,
  hospedagem INT,
  passeios INT,
  data_ida DATE NOT NULL,
  data_volta DATE,
  estilo_voo VARCHAR(100) NOT NULL,
  valor_final DECIMAL(8, 2) NOT NULL,
  status_pagamento VARCHAR(100) NOT NULL,
  FOREIGN KEY (CPF) REFERENCES tbl_user(CPF),
  FOREIGN KEY (pacote) REFERENCES Pacotes(id),
  FOREIGN KEY (hospedagem) REFERENCES hospedagens(id),
  FOREIGN KEY (passeios) REFERENCES passeios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select * from Compra;

-- INSERTS

INSERT INTO Pacotes (Lugar, Nome, PrecoBase) VALUES
    ("Califórnia", "Apenas passagem", 1000),
    ("Califórnia", "Passagem e hospedagem", 2000),
    ("Califórnia", "Passagem, hospedagem e passeios", 3000),
    ("Paris", "Apenas passagem", 1200),
    ("Paris", "Passagem e hospedagem", 2200),
    ("Paris", "Passagem, hospedagem e passeios", 3200),
    ("Dublin", "Apenas passagem", 900),
    ("Dublin", "Passagem e hospedagem", 1800),
    ("Dublin", "Passagem, hospedagem e passeios", 2700),
    ("Veneza", "Apenas passagem", 1500),
    ("Veneza", "Passagem e hospedagem", 2500),
    ("Veneza", "Passagem, hospedagem e passeios", 3500),
    ("Grécia", "Apenas passagem", 1800),
    ("Grécia", "Passagem e hospedagem", 2800),
    ("Grécia", "Passagem, hospedagem e passeios", 3800),
    ("Seoul", "Apenas passagem", 2000),
    ("Seoul", "Passagem e hospedagem", 3000),
    ("Seoul", "Passagem, hospedagem e passeios", 4000),
    ("Noruega", "Apenas passagem", 1600),
    ("Noruega", "Passagem e hospedagem", 2600),
    ("Noruega", "Passagem, hospedagem e passeios", 3600);

	-- Inserção de dados "hospedagens"

-- Inserção de dados para Califórnia
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Califórnia', '123 Ocean Drive, Los Angeles, CA', 150.00, 4, 3, 4, 6),
       ('Califórnia', '456 Palm Street, San Francisco, CA', 200.00, 5, 4, 6, 8),
       ('Califórnia', '789 Sunset Boulevard, San Diego, CA', 120.00, 3, 2, 2, 4),
       ('Califórnia', '321 Beach Avenue, Santa Barbara, CA', 180.00, 4, 3, 3, 5),
       ('Califórnia', '654 Mountain Road, Lake Tahoe, CA', 250.00, 5, 5, 8, 10);

-- Inserção de dados para Paris
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Paris', '12 Rue de la Paix, Paris', 250.00, 5, 3, 4, 6),
       ('Paris', '34 Avenue des Champs-Élysées, Paris', 300.00, 5, 4, 5, 8),
       ('Paris', '56 Rue Saint-Honoré, Paris', 200.00, 4, 2, 2, 4),
       ('Paris', '78 Boulevard Saint-Germain, Paris', 180.00, 3, 2, 3, 5),
       ('Paris', '90 Quai de la Tournelle, Paris', 350.00, 5, 6, 8, 10);

-- Inserção de dados para Dublin
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Dublin', '1 Temple Bar, Dublin', 120.00, 3, 2, 2, 4),
       ('Dublin', '23 O Connell Street, Dublin', 150.00, 4, 3, 4, 6),
       ('Dublin', '45 Grafton Street, Dublin', 180.00, 4, 3, 3, 5),
       ('Dublin', '67 Merrion Square, Dublin', 200.00, 5, 4, 6, 8),
       ('Dublin', '89 Guinness Lane, Dublin', 100.00, 2, 1, 1, 2);

-- Inserção de dados para Veneza
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Veneza', '12 Grand Canal, Veneza', 300.00, 5, 4, 5, 8),
       ('Veneza', '34 Piazza San Marco, Veneza', 250.00, 4, 3, 4, 6),
       ('Veneza', '56 Rialto Bridge, Veneza', 200.00, 4, 2, 2, 4),
       ('Veneza', '78 Murano Island, Veneza', 180.00, 3, 2, 3, 5),
       ('Veneza', '90 Giudecca Island, Veneza', 350.00, 5, 6, 8, 10);

-- Inserção de dados para Grécia
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Grécia', '12 Santorini Street, Santorini', 200.00, 4, 3, 4, 6),
       ('Grécia', '34 Mykonos Avenue, Mykonos', 250.00, 5, 4, 5, 8),
       ('Grécia', '56 Athens Square, Atenas', 180.00, 3, 2, 2, 4),
       ('Grécia', '78 Rhodes Road, Rhodes', 150.00, 3, 2, 3, 5),
       ('Grécia', '90 Crete Beach, Creta', 300.00, 5, 6, 8, 10);

-- Inserção de dados para Seoul
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Seoul', '12 Gangnam Street, Seul', 180.00, 3, 2, 2, 4),
       ('Seoul', '34 Myeongdong Avenue, Seul', 220.00, 4, 3, 4, 6),
       ('Seoul', '56 Hongdae Square, Seul', 250.00, 4, 3, 3, 5),
       ('Seoul', '78 Itaewon Road, Seul', 280.00, 5, 4, 6, 8),
       ('Seoul', '90 Insadong Lane, Seul', 200.00, 3, 2, 2, 4);

-- Inserção de dados para Noruega
INSERT INTO hospedagens (lugar, endereco, preco_diaria, estrelas, quartos, camas, capacidade)
VALUES ('Noruega', '12 Fjord Street, Oslo', 150.00, 3, 2, 2, 4),
       ('Noruega', '34 Lofoten Avenue, Lofoten', 200.00, 4, 3, 4, 6),
       ('Noruega', '56 Bergen Square, Bergen', 180.00, 4, 2, 2, 4),
       ('Noruega', '78 Stavanger Road, Stavanger', 220.00, 5, 4, 6, 8),
       ('Noruega', '90 Tromso Island, Tromso', 250.00, 5, 5, 8, 10);

-- insersão de dados "passeios"

-- Inserção de dados para Califórnia
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Califórnia', 'Passeio de bicicleta em Venice Beach', 35.00, 2, 'Explore as ciclovias de Venice Beach em um passeio de bicicleta divertido e relaxante.'),
       ('Califórnia', 'Tour de vinhos no Vale de Napa', 120.00, 6, 'Desfrute de um tour pelos vinhedos do Vale de Napa e deguste vinhos premiados.'),
       ('Califórnia', 'Surfe em Huntington Beach', 50.00, 3, 'Aprenda a surfar com instrutores experientes em uma das praias mais famosas da Califórnia.'),
       ('Califórnia', 'Passeio de helicóptero em Los Angeles', 200.00, 1, 'Desfrute de vistas panorâmicas incríveis da cidade de Los Angeles em um emocionante passeio de helicóptero.'),
       ('Califórnia', 'Caminhada pelo Parque Nacional de Yosemite', 80.00, 4, 'Explore as trilhas deslumbrantes do Parque Nacional de Yosemite e maravilhe-se com suas paisagens naturais.');

-- Inserção de dados para Paris
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Paris', 'Cruzeiro pelo Rio Sena', 30.00, 1, 'Desfrute de um romântico cruzeiro pelo Rio Sena e admire as principais atrações de Paris.'),
       ('Paris', 'Tour guiado pelo Museu do Louvre', 40.00, 3, 'Explore as obras-primas do Museu do Louvre com um guia especializado.'),
       ('Paris', 'Passeio de bicicleta pelo Jardim de Luxemburgo', 25.00, 2, 'Descubra a beleza do Jardim de Luxemburgo em um passeio de bicicleta tranquilo e encantador.'),
       ('Paris', 'Visita à Torre Eiffel com acesso ao topo', 60.00, 2, 'Contemple a vista deslumbrante de Paris do topo da Torre Eiffel.'),
       ('Paris', 'Degustação de queijos e vinhos franceses', 50.00, 2, 'Experimente uma seleção de queijos e vinhos franceses em uma autêntica degustação parisiense.');

-- Inserção de dados para Dublin
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Dublin', 'Tour pelos pubs históricos de Temple Bar', 25.00, 3, 'Descubra a animada cena dos pubs de Temple Bar e prove cervejas artesanais locais.'),
       ('Dublin', 'Visita à fábrica da Guinness', 20.00, 2, 'Explore a famosa fábrica da Guinness e aprenda sobre a história e a produção dessa icônica cerveja.'),
       ('Dublin', 'Passeio a pé pelos principais pontos turísticos', 15.00, 4, 'Conheça os principais pontos turísticos de Dublin em um passeio a pé com um guia local.'),
       ('Dublin', 'Excursão às falésias de Moher', 80.00, 8, 'Contemple as impressionantes falésias de Moher e desfrute de vistas panorâmicas deslumbrantes.'),
       ('Dublin', 'Tour pelos castelos históricos de Dublin', 30.00, 4, 'Explore os castelos históricos de Dublin e mergulhe na rica história da cidade.');

-- Inserção de dados para Veneza
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Veneza', 'Passeio de gôndola pelos canais', 80.00, 1, 'Desfrute de um romântico passeio de gôndola pelos charmosos canais de Veneza.'),
       ('Veneza', 'Visita à Basílica de São Marcos', 20.00, 2, 'Explore a deslumbrante Basílica de São Marcos e admire sua arquitetura e obras de arte.'),
       ('Veneza', 'Passeio pelas ilhas de Murano e Burano', 50.00, 4, 'Descubra as encantadoras ilhas de Murano e Burano e conheça as tradições artesanais locais.'),
       ('Veneza', 'Tour de ciclismo pela Ilha de Lido', 35.00, 3, 'Explore a Ilha de Lido em um divertido tour de bicicleta e desfrute de suas praias e paisagens.'),
       ('Veneza', 'Passeio a pé pelo bairro de Dorsoduro', 25.00, 2, 'Caminhe pelo encantador bairro de Dorsoduro e descubra seus segredos e pontos turísticos.');

-- Inserção de dados para Grécia
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Grécia', 'Tour pelas ruínas de Atenas', 30.00, 3, 'Explore as antigas ruínas de Atenas, incluindo o Partenon e o Teatro de Dionísio.'),
       ('Grécia', 'Passeio de barco pelas ilhas gregas', 150.00, 8, 'Navegue pelas belas ilhas gregas em um luxuoso passeio de barco e desfrute de praias paradisíacas.'),
       ('Grécia', 'Visita ao Palácio de Cnossos em Creta', 40.00, 4, 'Descubra o lendário Palácio de Cnossos e aprenda sobre a civilização minoica.'),
       ('Grécia', 'Trilha até o Mosteiro de Meteora', 60.00, 6, 'Faça uma trilha até os impressionantes Mosteiros de Meteora e aprecie a vista panorâmica.'),
       ('Grécia', 'Passeio de caiaque em Santorini', 45.00, 3, 'Explore as águas cristalinas de Santorini em um emocionante passeio de caiaque.');

-- Inserção de dados para Seoul
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Seoul', 'Visita ao Palácio de Gyeongbokgung', 15.00, 2, 'Explore o magnífico Palácio de Gyeongbokgung e mergulhe na história da dinastia Joseon.'),
       ('Seoul', 'Tour pelo mercado tradicional de Namdaemun', 20.00, 3, 'Descubra o vibrante mercado de Namdaemun e experimente a culinária coreana.'),
       ('Seoul', 'Passeio de teleférico até a Torre N Seoul', 25.00, 1, 'Desfrute de uma vista panorâmica de Seul do topo da Torre N Seoul.'),
       ('Seoul', 'Visita ao Templo de Jogyesa', 10.00, 1, 'Explore o tranquilo Templo de Jogyesa e participe de uma meditação budista.'),
       ('Seoul', 'Tour gastronômico pelos becos de Myeongdong', 30.00, 3, 'Experimente a deliciosa culinária de rua de Seul em um tour pelos becos de Myeongdong.');

-- Inserção de dados para Noruega
INSERT INTO passeios (lugar, nome, preco, duracao, descricao)
VALUES ('Noruega', 'Cruzeiro pelo Fiorde de Geiranger', 80.00, 4, 'Navegue pelo deslumbrante Fiorde de Geiranger e maravilhe-se com suas majestosas cachoeiras.'),
       ('Noruega', 'Trilha até a Pedra do Púlpito', 50.00, 6, 'Faça uma trilha emocionante até a famosa Pedra do Púlpito e desfrute de uma vista panorâmica espetacular.'),
       ('Noruega', 'Passeio de trem pela Ferrovia de Flåm', 70.00, 5, 'Desfrute de uma jornada cênica pela Ferrovia de Flåm e aprecie a beleza dos fiordes noruegueses.'),
       ('Noruega', 'Excursão ao Parque Nacional de Jotunheimen', 90.00, 8, 'Explore as deslumbrantes paisagens do Parque Nacional de Jotunheimen em uma emocionante excursão.'),
       ('Noruega', 'Passeio de barco pelo Glaciar de Briksdal', 60.00, 4, 'Navegue próximo ao imponente Glaciar de Briksdal e admire sua beleza natural.');


select * from Pacotes;
<<<<<<< Updated upstream
=======
<<<<<<< HEAD

=======
>>>>>>> ff6dca633bbbce3c87cc9e4fa17b8722c8bd48ed
>>>>>>> Stashed changes
--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_user`
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--

<<<<<<< Updated upstream

=======
<<<<<<< HEAD
=======

>>>>>>> ff6dca633bbbce3c87cc9e4fa17b8722c8bd48ed
>>>>>>> Stashed changes

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
