-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 jan. 2026 à 15:23
-- Version du serveur : 11.8.3-MariaDB-log
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u482683110_26OUEND_BDD`
--

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `q_id` int(11) NOT NULL,
  `q_date_ajout` varchar(50) DEFAULT NULL,
  `q_titre` varchar(50) DEFAULT NULL,
  `q_contenu` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`q_id`, `q_date_ajout`, `q_titre`, `q_contenu`, `user_id`) VALUES
(1, '2013-03-24 12:54', 'Comment réparer un ordinateur?', 'Bonjour, j\'ai mon ordinateur de cassé, comment puis-je procéder pour le réparer?', 1),
(2, '2013-03-26 19:27', 'Comment changer un pneu?', 'Quel est la meilleur méthode pour changer un pneu facilement ?', 1),
(3, '2013-04-18 20:09', 'Que faire si un appareil est cassé?', 'Est-il préférable de réparer les appareils électriques ou d\'en acheter de nouveaux?', 3),
(4, '2013-04-22 17:14', 'Comment faire nettoyer un clavier d\'ordinateur?', 'Bonjour, sous mon clavier d\'ordinateur il y a beaucoup de poussière, comment faut-il procéder pour le nettoyer? Merci', 3),
(5, '2025-11-24 12:50', 'Est que la Terre est plate?', 'je pense que la Terre est plate', 4),
(6, '2025-11-24 12:51', 'Est que la Terre est plate?', 'je pense que la Terre est plate', 4),
(7, '2025-11-24 13:04', 'nouveau titre', 'test', 5),
(8, '2025-11-24 13:06', 'dsqd <b>te', 'dsqd <b>te', 5);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `r_id` int(11) NOT NULL,
  `r_date_ajout` varchar(50) DEFAULT NULL,
  `r_contenu` varchar(150) DEFAULT NULL,
  `r_fk_question_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`r_id`, `r_date_ajout`, `r_contenu`, `r_fk_question_id`, `user_id`) VALUES
(1, '2013-03-27 07:44', 'Bonjour. Pouvez-vous expliquer ce qui ne fonctionne pas avec votre ordinateur? Merci.', 1, 2),
(2, '2013-03-28 19:27', 'Bonsoir, le plus simple consiste à faire appel à un professionnel pour réparer un ordinateur. Cordialement,', 1, 3),
(3, '2013-05-09 22:10', 'Des conseils son disponible sur internet sur ce sujet.', 2, 2),
(4, '2013-05-24 09:47', 'Bonjour. Ça dépend de vous, de votre budget et de vos préférence vis-à-vis de l\'écologie. Cordialement,', 3, 2),
(7, '2025-11-24 14:33:47', 'c\'est   monsieur gravouil les gars', 7, 4),
(8, '2025-12-15 12:33:48', 'Sur quel type de véhicule ?', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `user_id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`user_id`, `login`, `password`, `date_naissance`) VALUES
(1, 'bob', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1980-01-01'),
(2, 'steeve', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1970-01-01'),
(3, 'walee', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1990-01-01'),
(4, 'jawedouendi@gmail.com', '$2y$10$138sj6cs7IiKTCmTca234eQMd8uoqkYM/VBOrHlSXBiwv62fe.F3O', '2006-08-01'),
(5, 'prof', '$2y$10$/hBagzcIo0d4ljb/Sj02QeKR8K2z41hQHoVxs.ZSN9Er.qh.mX0oG', '2025-11-24');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `question_ibfk_1` (`user_id`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `reponse_ibfk_1` (`r_fk_question_id`),
  ADD KEY `reponse_ibfk_2` (`user_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`r_fk_question_id`) REFERENCES `question` (`q_id`),
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
