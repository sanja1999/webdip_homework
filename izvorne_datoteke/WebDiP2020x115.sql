-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2021 at 08:13 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 7.2.25-1+0~20191128.32+debian8~1.gbp108445

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebDiP2020x115`
--

-- --------------------------------------------------------

--
-- Table structure for table `dnevnik`
--

CREATE TABLE `dnevnik` (
  `dnevnik_id` int(11) NOT NULL,
  `radnja` text NOT NULL,
  `upit` text NOT NULL,
  `datum_vrijeme` datetime NOT NULL,
  `korisnik_korisnik_id` int(11) NOT NULL,
  `tip_tip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dnevnik`
--

INSERT INTO `dnevnik` (`dnevnik_id`, `radnja`, `upit`, `datum_vrijeme`, `korisnik_korisnik_id`, `tip_tip_id`) VALUES
(1, 'Prijava.html', 'SELECT * FROM korisnik;', '2021-01-19 07:10:45', 1, 1),
(2, 'Prijava i rad korisnika sa prijava.html', 'SELECT * from prijava;', '2020-12-30 04:36:50', 3, 1),
(3, 'Korisnik u određenom vrijeme radi s tablicom table', 'SELECT * from table;', '2021-01-18 00:00:00', 3, 2),
(4, 'Odjava korisnika', '/', '2020-12-22 00:00:00', 5, 1),
(5, 'Dodavanje moderatora', '/', '2020-11-23 00:00:00', 1, 3),
(6, 'Kreiran zahtjev za natjecanje', '/', '2020-11-25 00:00:00', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `izlozba`
--

CREATE TABLE `izlozba` (
  `izlozba_id` int(11) NOT NULL,
  `broj_korisnika` int(11) NOT NULL,
  `pocetak` datetime NOT NULL,
  `kraj` datetime NOT NULL,
  `status_izlozbe_status_izlozbe_id` int(11) NOT NULL,
  `tematika_izlozbe_tematika_izlozbe_id` int(11) NOT NULL,
  `pobjednik_pobjednik_id` int(11) NOT NULL DEFAULT '0',
  `lokacija_lokacija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `izlozba`
--

INSERT INTO `izlozba` (`izlozba_id`, `broj_korisnika`, `pocetak`, `kraj`, `status_izlozbe_status_izlozbe_id`, `tematika_izlozbe_tematika_izlozbe_id`, `pobjednik_pobjednik_id`, `lokacija_lokacija_id`) VALUES
(2, 50, '2021-04-11 17:00:00', '2021-04-20 00:00:00', 2, 1, 2, 3),
(3, 30, '2021-01-10 09:15:00', '2021-01-24 13:00:00', 4, 2, 1, 4),
(4, 100, '2021-04-11 00:00:00', '2021-04-15 08:00:00', 2, 4, 8, 1),
(5, 350, '2021-03-21 00:00:00', '2021-04-12 00:00:00', 3, 5, 8, 3),
(6, 340, '2021-04-12 00:00:00', '2021-04-22 00:00:00', 1, 3, 8, 3),
(7, 75, '2021-02-07 00:00:00', '2021-03-21 00:00:00', 4, 2, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `je_glasao`
--

CREATE TABLE `je_glasao` (
  `je_glasao_id` int(11) NOT NULL,
  `glasao` tinyint(4) DEFAULT NULL,
  `korisnik_korisnik_id` int(11) NOT NULL,
  `izlozba_izlozba_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `je_glasao`
--

INSERT INTO `je_glasao` (`je_glasao_id`, `glasao`, `korisnik_korisnik_id`, `izlozba_izlozba_id`) VALUES
(1, 1, 2, 5),
(2, 0, 4, 5),
(3, 0, 3, 3),
(4, 0, 1, 4),
(5, 1, 5, 2),
(6, 0, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `korisnik_id` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `korisnicko_ime` varchar(25) NOT NULL,
  `lozinka` varchar(25) NOT NULL,
  `lozinka_sha1` char(40) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uvjeti` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `uloga_uloga_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnik_id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `lozinka_sha1`, `email`, `uvjeti`, `status`, `uloga_uloga_id`) VALUES
(1, 'Sanja', 'Sajfar', 'ssajfar', 'admin_jr9V', 'f9aae49ff3e949dd80db7ec9a9a14fc1c12e5eeb', 'ssajfar@foi.hr', '2021-04-13 00:00:00', 0, 1),
(2, 'Marko', 'Maric', 'mmaric', 'mmaric9', '2611a6c55af0d5fa52b170e7418e46c2c94d6308', 'mmaric@gmail.com', '2020-01-19 00:00:00', 1, 2),
(3, 'Ana', 'Anić', 'aanic', 'admin_123', 'b47208670e6be587a615a70d33dddbed6ca0cbf0', 'aanic@gmail.com', '2020-12-22 00:00:00', 0, 3),
(4, 'Pero', 'Perić', 'pperic', 'admin7895', '77e5cadb59fbd6c4e0a861e6df3c206a1c5ee4f0', 'pperic@gmail.com', '2020-10-28 00:00:00', 1, 3),
(5, 'Stjepan', 'Stjepić', 'sstjepic99', 'abd1234', 'd9f358966fec3af2c640a11876f4c6ccfe333649', 'sstjepic@gmail.com', '2019-10-28 00:00:00', 1, 4),
(6, 'Ivana', 'Ivković', 'iivkovic89', 'ivkociv_s895', 'c29197cac64103a02bc51daaeef906ce37d9bb8f', 'iivkovic89@gmail.com', '2018-12-29 00:00:00', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lokacija`
--

CREATE TABLE `lokacija` (
  `lokacija_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lokacija`
--

INSERT INTO `lokacija` (`lokacija_id`, `naziv`) VALUES
(1, 'Zagrebačka 109, Zagreb'),
(2, 'Karlovačka 58, Karlovac'),
(3, 'Splitska ulica 12, Split'),
(4, 'Trg kralja Tomislava, Rijeka'),
(5, 'Trg bana Josipa Jelačiča, Osijek '),
(6, 'Ulica Ivana Mažuranića 45, Pula');

-- --------------------------------------------------------

--
-- Table structure for table `materijal`
--

CREATE TABLE `materijal` (
  `materijal_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `prijava_zahtjev_za_prijavu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materijal`
--

INSERT INTO `materijal` (`materijal_id`, `naziv`, `prijava_zahtjev_za_prijavu_id`) VALUES
(1, 'Audio i video materijali', 3),
(2, 'Slike vlakova .png', 4),
(3, 'Audio, video i slike', 6),
(4, 'Video materijal', 4),
(5, 'Slike', 1),
(6, 'Video materijal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pobjednik`
--

CREATE TABLE `pobjednik` (
  `pobjednik_id` int(11) NOT NULL,
  `opis` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pobjednik`
--

INSERT INTO `pobjednik` (`pobjednik_id`, `opis`) VALUES
(1, 'Pero Perić, motorni vlakovi'),
(2, 'Ivo Ivić, pobjednik parnih lokomotiva'),
(4, 'Marko Marić, teretni dizel vlakovi pobjendik'),
(5, 'Ana Anić, putnički vlakovi'),
(6, 'Marko Marić, vlakovi velikih brzina'),
(7, 'Stjepan Stjepić, električni vlakovi'),
(8, '/ (izlozba u tijeku)');

-- --------------------------------------------------------

--
-- Table structure for table `prijava`
--

CREATE TABLE `prijava` (
  `zahtjev_za_prijavu_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(45) NOT NULL,
  `korisnik_korisnik_id` int(11) NOT NULL,
  `izlozba_izlozba_id` int(11) NOT NULL,
  `status_status_id` int(11) NOT NULL,
  `vlak_vlak_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prijava`
--

INSERT INTO `prijava` (`zahtjev_za_prijavu_id`, `naziv`, `opis`, `korisnik_korisnik_id`, `izlozba_izlozba_id`, `status_status_id`, `vlak_vlak_id`) VALUES
(1, 'Prijava056', 'Prijava za izložbu za lokomotive', 2, 5, 1, 1),
(2, 'Prijava065', 'Prijava za izložbu za lokomotive', 4, 3, 2, 1),
(3, 'Prijava42', 'Prijava za električne vlakove', 1, 4, 1, 4),
(4, 'Prijava55', 'Prijava za električne vlakove  ', 2, 3, 1, 2),
(5, 'Prijava88', 'Prijava putničkog vlaka  ', 1, 4, 3, 2),
(6, 'Prijava112', 'Prijava za vlakove na parni pogon', 3, 3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `naziv`) VALUES
(1, 'Prihvaćena prijava'),
(2, 'Odbijena prijava'),
(3, 'Neobrađena');

-- --------------------------------------------------------

--
-- Table structure for table `status_izlozbe`
--

CREATE TABLE `status_izlozbe` (
  `status_izlozbe_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_izlozbe`
--

INSERT INTO `status_izlozbe` (`status_izlozbe_id`, `naziv`) VALUES
(1, 'Otvorene prijave'),
(2, 'Izložba u tijeku'),
(3, 'Otvoreno glasanje'),
(4, 'Zatvoreno glasanje');

-- --------------------------------------------------------

--
-- Table structure for table `tematika_izlozbe`
--

CREATE TABLE `tematika_izlozbe` (
  `tematika_izlozbe_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tematika_izlozbe`
--

INSERT INTO `tematika_izlozbe` (`tematika_izlozbe_id`, `naziv`, `opis`) VALUES
(1, 'Lokomotive', 'Stare lokomotive na parni pogon'),
(2, 'Motorni vlakovi', 'Noviji motorni vlakovi'),
(3, 'Putnički vlakovi', 'Vlakovi za prijevoz putnika'),
(4, 'Vlakovi velikih brzina', 'Vlakovi koji postižu ogromne brzine'),
(5, 'Električni vlakovi', 'Najonoviji oblik vlaka, električni'),
(6, 'Teretni vlakovi', 'Vlakovi za prijevoz tereta');

-- --------------------------------------------------------

--
-- Table structure for table `tip`
--

CREATE TABLE `tip` (
  `tip_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tip`
--

INSERT INTO `tip` (`tip_id`, `name`) VALUES
(1, 'prijava/ odjava'),
(2, 'rad s bazom'),
(3, 'ostale radnje');

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `uloga_id` int(11) NOT NULL,
  `naziv` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`uloga_id`, `naziv`) VALUES
(1, 'Administrator'),
(2, 'Moderator'),
(3, 'Registrirani korisnik'),
(4, 'Neregistrirani korisnik');

-- --------------------------------------------------------

--
-- Table structure for table `upravljati`
--

CREATE TABLE `upravljati` (
  `upravljati_id` int(11) NOT NULL,
  `korisnik_korisnik_id` int(11) NOT NULL,
  `tematika_izlozbe_tematika_izlozbe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upravljati`
--

INSERT INTO `upravljati` (`upravljati_id`, `korisnik_korisnik_id`, `tematika_izlozbe_tematika_izlozbe_id`) VALUES
(1, 1, 2),
(2, 3, 5),
(3, 3, 2),
(4, 5, 3),
(5, 3, 5),
(6, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `vlak`
--

CREATE TABLE `vlak` (
  `vlak_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(45) NOT NULL,
  `vrsta_pogona` varchar(45) NOT NULL,
  `maksimalna_brzina` int(11) NOT NULL,
  `broj_sjedala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vlak`
--

INSERT INTO `vlak` (`vlak_id`, `naziv`, `opis`, `vrsta_pogona`, `maksimalna_brzina`, `broj_sjedala`) VALUES
(1, 'Parna lokomotiva', 'Stara parna lokomotiva', 'Parni', 100, 50),
(2, 'Stari dizel putnički vlak', 'Vlak iz 1950tih godina predivne crvene boje.', 'Dizel', 80, 30),
(3, 'Brzi žuti vlak', 'Najnoviji vlak na električni pogon', 'Električni', 180, 200),
(4, 'Zeleni vlak velikih brzina', 'Najbrži vlak u Hrvatskoj', 'Električni', 250, 300),
(5, 'Stara crna lokomotiva', 'Lokomotiva iz 20tih godina prošlog stoljeća', 'Parni ', 40, 50),
(6, 'Dizelski teretni vlak ', 'Teretni vlak', 'Dizel', 118, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD PRIMARY KEY (`dnevnik_id`),
  ADD KEY `fk_dnevnik_korisnik1_idx` (`korisnik_korisnik_id`),
  ADD KEY `fk_dnevnik_tip1_idx` (`tip_tip_id`);

--
-- Indexes for table `izlozba`
--
ALTER TABLE `izlozba`
  ADD PRIMARY KEY (`izlozba_id`) USING BTREE,
  ADD KEY `fk_izlozba_status_izlozbe1_idx` (`status_izlozbe_status_izlozbe_id`),
  ADD KEY `fk_izlozba_tematika_izlozbe1_idx` (`tematika_izlozbe_tematika_izlozbe_id`),
  ADD KEY `fk_izlozba_pobjednik1_idx` (`pobjednik_pobjednik_id`),
  ADD KEY `fk_izlozba_lokacija1_idx` (`lokacija_lokacija_id`);

--
-- Indexes for table `je_glasao`
--
ALTER TABLE `je_glasao`
  ADD PRIMARY KEY (`je_glasao_id`) USING BTREE,
  ADD KEY `fk_je_glasao_korisnik1_idx` (`korisnik_korisnik_id`),
  ADD KEY `fk_je_glasao_izlozba1_idx` (`izlozba_izlozba_id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`korisnik_id`),
  ADD KEY `fk_korisnik_uloga_idx` (`uloga_uloga_id`);

--
-- Indexes for table `lokacija`
--
ALTER TABLE `lokacija`
  ADD PRIMARY KEY (`lokacija_id`);

--
-- Indexes for table `materijal`
--
ALTER TABLE `materijal`
  ADD PRIMARY KEY (`materijal_id`) USING BTREE,
  ADD KEY `fk_materijal_prijava1_idx` (`prijava_zahtjev_za_prijavu_id`);

--
-- Indexes for table `pobjednik`
--
ALTER TABLE `pobjednik`
  ADD PRIMARY KEY (`pobjednik_id`);

--
-- Indexes for table `prijava`
--
ALTER TABLE `prijava`
  ADD PRIMARY KEY (`zahtjev_za_prijavu_id`) USING BTREE,
  ADD KEY `fk_prijava_korisnik1_idx` (`korisnik_korisnik_id`),
  ADD KEY `fk_prijava_izlozba1_idx` (`izlozba_izlozba_id`),
  ADD KEY `fk_prijava_status1_idx` (`status_status_id`),
  ADD KEY `fk_prijava_vlak1_idx` (`vlak_vlak_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `status_izlozbe`
--
ALTER TABLE `status_izlozbe`
  ADD PRIMARY KEY (`status_izlozbe_id`);

--
-- Indexes for table `tematika_izlozbe`
--
ALTER TABLE `tematika_izlozbe`
  ADD PRIMARY KEY (`tematika_izlozbe_id`);

--
-- Indexes for table `tip`
--
ALTER TABLE `tip`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`uloga_id`);

--
-- Indexes for table `upravljati`
--
ALTER TABLE `upravljati`
  ADD PRIMARY KEY (`upravljati_id`) USING BTREE,
  ADD KEY `fk_upravljati_korisnik1_idx` (`korisnik_korisnik_id`),
  ADD KEY `fk_upravljati_tematika_izlozbe1_idx` (`tematika_izlozbe_tematika_izlozbe_id`);

--
-- Indexes for table `vlak`
--
ALTER TABLE `vlak`
  ADD PRIMARY KEY (`vlak_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dnevnik`
--
ALTER TABLE `dnevnik`
  MODIFY `dnevnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `izlozba`
--
ALTER TABLE `izlozba`
  MODIFY `izlozba_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `je_glasao`
--
ALTER TABLE `je_glasao`
  MODIFY `je_glasao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lokacija`
--
ALTER TABLE `lokacija`
  MODIFY `lokacija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `materijal`
--
ALTER TABLE `materijal`
  MODIFY `materijal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pobjednik`
--
ALTER TABLE `pobjednik`
  MODIFY `pobjednik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `prijava`
--
ALTER TABLE `prijava`
  MODIFY `zahtjev_za_prijavu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `status_izlozbe`
--
ALTER TABLE `status_izlozbe`
  MODIFY `status_izlozbe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tematika_izlozbe`
--
ALTER TABLE `tematika_izlozbe`
  MODIFY `tematika_izlozbe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tip`
--
ALTER TABLE `tip`
  MODIFY `tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `uloga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `upravljati`
--
ALTER TABLE `upravljati`
  MODIFY `upravljati_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vlak`
--
ALTER TABLE `vlak`
  MODIFY `vlak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD CONSTRAINT `fk_dnevnik_korisnik1` FOREIGN KEY (`korisnik_korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dnevnik_tip1` FOREIGN KEY (`tip_tip_id`) REFERENCES `tip` (`tip_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `izlozba`
--
ALTER TABLE `izlozba`
  ADD CONSTRAINT `fk_izlozba_lokacija1` FOREIGN KEY (`lokacija_lokacija_id`) REFERENCES `lokacija` (`lokacija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_izlozba_pobjednik1` FOREIGN KEY (`pobjednik_pobjednik_id`) REFERENCES `pobjednik` (`pobjednik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_izlozba_status_izlozbe1` FOREIGN KEY (`status_izlozbe_status_izlozbe_id`) REFERENCES `status_izlozbe` (`status_izlozbe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_izlozba_tematika_izlozbe1` FOREIGN KEY (`tematika_izlozbe_tematika_izlozbe_id`) REFERENCES `tematika_izlozbe` (`tematika_izlozbe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `je_glasao`
--
ALTER TABLE `je_glasao`
  ADD CONSTRAINT `fk_je_glasao_izlozba1` FOREIGN KEY (`izlozba_izlozba_id`) REFERENCES `izlozba` (`izlozba_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_je_glasao_korisnik1` FOREIGN KEY (`korisnik_korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `fk_korisnik_uloga` FOREIGN KEY (`uloga_uloga_id`) REFERENCES `uloga` (`uloga_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materijal`
--
ALTER TABLE `materijal`
  ADD CONSTRAINT `fk_materijal_prijava1` FOREIGN KEY (`prijava_zahtjev_za_prijavu_id`) REFERENCES `prijava` (`zahtjev_za_prijavu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prijava`
--
ALTER TABLE `prijava`
  ADD CONSTRAINT `fk_prijava_izlozba1` FOREIGN KEY (`izlozba_izlozba_id`) REFERENCES `izlozba` (`izlozba_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prijava_korisnik1` FOREIGN KEY (`korisnik_korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prijava_status1` FOREIGN KEY (`status_status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prijava_vlak1` FOREIGN KEY (`vlak_vlak_id`) REFERENCES `vlak` (`vlak_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `upravljati`
--
ALTER TABLE `upravljati`
  ADD CONSTRAINT `fk_upravljati_korisnik1` FOREIGN KEY (`korisnik_korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_upravljati_tematika_izlozbe1` FOREIGN KEY (`tematika_izlozbe_tematika_izlozbe_id`) REFERENCES `tematika_izlozbe` (`tematika_izlozbe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
