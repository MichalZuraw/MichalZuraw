-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Sty 2021, 13:05
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `kakao`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stan`
--

CREATE TABLE `stan` (
  `id` int(1) NOT NULL,
  `wolny` int(1) NOT NULL,
  `user` varchar(11) NOT NULL,
  `przycisk` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `stan`
--

INSERT INTO `stan` (`id`, `wolny`, `user`, `przycisk`) VALUES
(1, 1, 'xarutas', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(3) NOT NULL,
  `user` varchar(10) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `user`, `pass`, `email`) VALUES
(1, 'xarutas', '$2y$10$PFsILAf1CJFLHqg/2K3rsOSWIXdtUQF4.BO5Ov8ieuZn0Bz7Vg6IO', 'xarutas@interia.pl'),
(2, 'artur', '$2y$10$waTrWifJGCe0.Ohidv5Cq.AZWOqQmcLuXDjjticz6owQkQAdCz34.', 'artur@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(4) NOT NULL,
  `user` varchar(11) NOT NULL,
  `porcje` int(1) NOT NULL,
  `temperatura` int(2) NOT NULL,
  `stan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `user`, `porcje`, `temperatura`, `stan`) VALUES
(42, 'xarutas', 1, 63, 'gotowe'),
(44, 'xarutas', 2, 63, 'gotowe'),
(45, 'xarutas', 1, 71, 'gotowe'),
(46, 'xarutas', 2, 66, 'gotowe'),
(48, 'xarutas', 1, 67, 'gotowe'),
(50, 'xarutas', 2, 25, 'gotowe'),
(51, 'xarutas', 2, 66, 'gotowe'),
(52, 'xarutas', 2, 33, 'gotowe'),
(53, 'xarutas', 1, 62, 'gotowe'),
(54, 'xarutas', 2, 66, 'gotowe'),
(55, 'xarutas', 2, 65, 'gotowe'),
(56, 'xarutas', 2, 69, 'gotowe'),
(57, 'xarutas', 2, 68, 'gotowe'),
(58, 'xarutas', 2, 70, 'gotowe'),
(59, 'xarutas', 2, 0, 'gotowe'),
(60, 'xarutas', 2, 62, 'gotowe'),
(61, 'xarutas', 2, 65, 'gotowe'),
(62, 'xarutas', 2, 64, 'gotowe'),
(63, 'xarutas', 1, 62, 'gotowe'),
(64, 'xarutas', 2, 63, 'gotowe'),
(65, 'xarutas', 2, 60, 'gotowe'),
(66, 'xarutas', 2, 69, 'gotowe'),
(67, 'artur', 0, 0, 'gotowe'),
(68, 'artur', 2, 67, 'gotowe'),
(69, 'xarutas', 2, 71, 'gotowe'),
(70, 'xarutas', 0, 0, 'gotowe'),
(71, 'xarutas', 2, 63, 'gotowe'),
(72, 'xarutas', 2, 62, 'gotowe'),
(73, 'xarutas', 0, 0, 'gotowe'),
(74, 'xarutas', 0, 0, 'gotowe'),
(75, 'xarutas', 1, 64, 'gotowe'),
(76, 'xarutas', 2, 67, 'gotowe'),
(77, 'artur', 2, 68, 'gotowe'),
(78, 'artur', 1, 32, 'gotowe'),
(79, 'artur', 1, 39, 'gotowe'),
(80, 'artur', 2, 75, 'gotowe'),
(81, 'artur', 1, 37, 'gotowe'),
(82, 'xarutas', 2, 75, 'gotowe'),
(83, 'xarutas', 1, 38, 'gotowe'),
(84, 'xarutas', 2, 70, 'gotowe'),
(85, 'xarutas', 0, 0, 'gotowe'),
(86, 'xarutas', 2, 67, 'gotowe'),
(87, 'xarutas', 2, 71, 'gotowe'),
(88, 'xarutas', 2, 62, 'gotowe'),
(89, 'xarutas', 2, 69, 'gotowe'),
(90, 'xarutas', 2, 58, 'gotowe');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
