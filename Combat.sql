-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 28 avr. 2022 à 15:02
-- Version du serveur : 10.5.12-MariaDB-0+deb11u1
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Combat`
--

-- --------------------------------------------------------

--
-- Structure de la table `Alliance`
--

CREATE TABLE `Alliance` (
  `id` int(11) NOT NULL,
  `idPersonnage1` int(11) NOT NULL,
  `idPersonnage2` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Alliance`
--

INSERT INTO `Alliance` (`id`, `idPersonnage1`, `idPersonnage2`, `nom`) VALUES
(3, 2, 1, ''),
(5, 1, 3, ''),
(16, 2, 2, ''),
(21, 2, 2, ''),
(23, 4, 5, ''),
(24, 2, 2, ''),
(25, 2, 2, '');

-- --------------------------------------------------------

--
-- Structure de la table `Personnage`
--

CREATE TABLE `Personnage` (
  `id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `vie` int(11) NOT NULL,
  `forceAttaque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Personnage`
--

INSERT INTO `Personnage` (`id`, `image`, `pseudo`, `vie`, `forceAttaque`) VALUES
(1, 'https://i-mom.unimedias.fr/2020/09/16/dragon-ball-vegeta.jpg?auto=format%2Ccompress&crop=faces&cs=tinysrgb&fit=crop&h=453&w=806', 'Vegeta', 100, 200),
(2, 'https://www.manga-news.com/public/images/pix/perso/1124/.son-goku-manga-visual-1_m.jpg', 'Son Goku', 250, 300),
(3, 'https://imgmedia.libero.pe/670x396/libero/original/2021/09/22/614b6e0fe6285c4df169ca27.webp', 'Picolo', 100, 100),
(4, 'https://www.serieously.com/app/uploads/2021/04/freezer-768x432-c-default.webp', 'Freezer', 100, 150),
(5, 'https://www.manga-news.com/public/images/goodies/mirai-trunks-ssj-gigantic-2.jpeg', 'Trunks', 80, 120),
(6, 'https://m.media-amazon.com/images/I/41EdaZ6Mk7S._AC_SX425_.jpg', 'Boo', 200, 170),
(7, 'https://images-eu.ssl-images-amazon.com/images/I/61nTezALLHL.__AC_SX300_SY300_QL70_ML2_.jpg', 'Cell', 120, 145),
(9, 'https://m.media-amazon.com/images/I/616gP+mn2CL._AC_SY300_SX300_.jpg', 'Broly', 20, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Alliance`
--
ALTER TABLE `Alliance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersonnage2` (`idPersonnage2`),
  ADD KEY `nom` (`nom`),
  ADD KEY `idPersonnage1` (`idPersonnage1`);

--
-- Index pour la table `Personnage`
--
ALTER TABLE `Personnage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Alliance`
--
ALTER TABLE `Alliance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `Personnage`
--
ALTER TABLE `Personnage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Alliance`
--
ALTER TABLE `Alliance`
  ADD CONSTRAINT `Alliance_ibfk_1` FOREIGN KEY (`idPersonnage1`) REFERENCES `Personnage` (`id`),
  ADD CONSTRAINT `Alliance_ibfk_2` FOREIGN KEY (`idPersonnage2`) REFERENCES `Personnage` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
