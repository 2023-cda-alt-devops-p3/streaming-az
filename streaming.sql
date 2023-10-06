-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 06 oct. 2023 à 13:12
-- Version du serveur : 8.1.0
-- Version de PHP : 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `streaming`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`%` PROCEDURE `GetMoviesByFilmmaker` (IN `filmmakerName` VARCHAR(100))   BEGIN
    SELECT title_movie
    FROM movie
    WHERE filmmaker_movie = filmmakerName;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `id_actor` int NOT NULL,
  `firstname_actor` varchar(100) DEFAULT NULL,
  `lastname_actor` varchar(100) DEFAULT NULL,
  `BOD_actor` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`id_actor`, `firstname_actor`, `lastname_actor`, `BOD_actor`, `created_at`, `updated_at`) VALUES
(1, 'Brad', 'Pitt', '1963-12-18', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(2, 'Meryl', 'Streep', '1949-06-22', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(3, 'Tom', 'Hanks', '1956-07-09', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(4, 'Natalie', 'Portman', '1981-06-09', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(5, 'Leonardo', 'DiCaprio', '1974-11-11', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(6, 'Jennifer', 'Lawrence', '1990-08-15', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(7, 'Denzel', 'Washington', '1954-12-28', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(8, 'Emma', 'Stone', '1988-11-06', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(9, 'Matthew', 'McConaughey', '1969-11-04', '2023-10-06 11:52:16', '2023-10-06 11:52:16'),
(10, 'Scarlett', 'Johansson', '1984-11-22', '2023-10-06 11:52:16', '2023-10-06 11:52:16');

--
-- Déclencheurs `actor`
--
DELIMITER $$
CREATE TRIGGER `actor_update_trigger` BEFORE UPDATE ON `actor` FOR EACH ROW BEGIN
    SET NEW.updated_at = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `favorite_movies`
--

CREATE TABLE `favorite_movies` (
  `id_user` int NOT NULL,
  `id_movie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `favorite_movies`
--

INSERT INTO `favorite_movies` (`id_user`, `id_movie`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `filmmaker`
--

CREATE TABLE `filmmaker` (
  `id_filmmaker` int NOT NULL,
  `firstname_filmmaker` varchar(100) DEFAULT NULL,
  `lastname_filmmaker` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `filmmaker`
--

INSERT INTO `filmmaker` (`id_filmmaker`, `firstname_filmmaker`, `lastname_filmmaker`, `created_at`, `updated_at`) VALUES
(1, 'Christopher', 'Nolan', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(2, 'Quentin', 'Tarantino', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(3, 'Steven', 'Spielberg', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(4, 'Ava', 'DuVernay', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(5, 'Greta', 'Gerwig', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(6, 'James', 'Cameron', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(7, 'Martin', 'Scorsese', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(8, 'Kathryn', 'Bigelow', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(9, 'Spike', 'Lee', '2023-10-06 11:57:51', '2023-10-06 11:57:51'),
(10, 'David', 'Fincher', '2023-10-06 11:57:51', '2023-10-06 11:57:51');

--
-- Déclencheurs `filmmaker`
--
DELIMITER $$
CREATE TRIGGER `filmmaker_update_trigger` BEFORE UPDATE ON `filmmaker` FOR EACH ROW BEGIN
    SET NEW.updated_at = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id_movie` int NOT NULL,
  `title_movie` varchar(100) DEFAULT NULL,
  `duration_movie` int DEFAULT NULL,
  `publish_date_movie` varchar(100) DEFAULT NULL,
  `filmmaker_movie` varchar(50) DEFAULT NULL,
  `id_filmmaker` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id_movie`, `title_movie`, `duration_movie`, `publish_date_movie`, `filmmaker_movie`, `id_filmmaker`, `created_at`, `updated_at`) VALUES
(1, 'Inception', 148, '2010-07-16', 'Christopher Nolan', 1, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(2, 'Pulp Fiction', 154, '1994-10-14', 'Quentin Tarantino', 2, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(3, 'Jurassic Park', 127, '1993-06-11', 'Steven Spielberg', 3, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(4, 'Selma', 128, '2014-12-25', 'Ava DuVernay', 4, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(5, 'Lady Bird', 94, '2017-11-03', 'Greta Gerwig', 5, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(6, 'Avatar', 162, '2009-12-18', 'James Cameron', 6, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(7, 'The Departed', 151, '2006-10-06', 'Martin Scorsese', 7, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(8, 'The Hurt Locker', 131, '2008-09-04', 'Kathryn Bigelow', 8, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(9, 'Do the Right Thing', 120, '1989-06-30', 'Spike Lee', 9, '2023-10-06 11:54:07', '2023-10-06 11:54:07'),
(10, 'Fight Club', 139, '1999-10-15', 'David Fincher', 10, '2023-10-06 11:54:07', '2023-10-06 11:54:07');

--
-- Déclencheurs `movie`
--
DELIMITER $$
CREATE TRIGGER `movie_update_trigger` BEFORE UPDATE ON `movie` FOR EACH ROW BEGIN
    SET NEW.updated_at = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_actor` int NOT NULL,
  `id_movie` int NOT NULL,
  `name_role` varchar(50) DEFAULT NULL,
  `role_principale` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_actor`, `id_movie`, `name_role`, `role_principale`) VALUES
(1, 1, 'Cobb', 1),
(2, 2, 'Mia Wallace', 1),
(3, 3, 'Dr. Alan Grant', 1),
(4, 4, 'Martin Luther King Jr.', 1),
(5, 5, 'Lady Bird McPherson', 1),
(6, 6, 'Neytiri', 1),
(7, 7, 'Frank Costello', 1),
(8, 8, 'William James', 1),
(9, 9, 'Mookie', 1),
(10, 10, 'Tyler Durden', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `firstname_user` varchar(100) DEFAULT NULL,
  `lastname_user` varchar(100) DEFAULT NULL,
  `role_user` varchar(50) DEFAULT NULL,
  `email_address_user` varchar(100) DEFAULT NULL,
  `password_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `firstname_user`, `lastname_user`, `role_user`, `email_address_user`, `password_user`) VALUES
(1, 'John', 'Doe', 'Admin', 'john.doe@example.com', 'password123'),
(2, 'Alice', 'Smith', 'User', 'alice.smith@example.com', 'securepass'),
(3, 'Bob', 'Johnson', 'User', 'bob.johnson@example.com', 'mypassword'),
(4, 'Eve', 'Anderson', 'User', 'eve.anderson@example.com', 'secretpass'),
(5, 'Michael', 'Wilson', 'User', 'michael.wilson@example.com', 'pass123'),
(6, 'Sarah', 'Miller', 'Admin', 'sarah.miller@example.com', 'admin123'),
(7, 'David', 'Brown', 'User', 'david.brown@example.com', 'userpass'),
(8, 'Linda', 'Garcia', 'User', 'linda.garcia@example.com', 'pass123'),
(9, 'Robert', 'Jones', 'User', 'robert.jones@example.com', 'user1234'),
(10, 'Emily', 'Wilson', 'User', 'emily.wilson@example.com', 'emilypass');

--
-- Déclencheurs `user`
--
DELIMITER $$
CREATE TRIGGER `user_archive_trigger` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    INSERT INTO user_archive (id_user, change_date, old_firstname, old_lastname, old_role, old_email_address, new_firstname, new_lastname, new_role, new_email_address)
    VALUES (
        OLD.id_user,
        NOW(),
        OLD.firstname_user,
        OLD.lastname_user,
        OLD.role_user,
        OLD.email_address_user,
        NEW.firstname_user,
        NEW.lastname_user,
        NEW.role_user,
        NEW.email_address_user
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `user_archive`
--

CREATE TABLE `user_archive` (
  `id_user_archive` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `change_date` timestamp NULL DEFAULT NULL,
  `old_firstname` varchar(100) DEFAULT NULL,
  `old_lastname` varchar(100) DEFAULT NULL,
  `old_role` varchar(50) DEFAULT NULL,
  `old_email_address` varchar(100) DEFAULT NULL,
  `new_firstname` varchar(100) DEFAULT NULL,
  `new_lastname` varchar(100) DEFAULT NULL,
  `new_role` varchar(50) DEFAULT NULL,
  `new_email_address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_archive`
--

INSERT INTO `user_archive` (`id_user_archive`, `id_user`, `change_date`, `old_firstname`, `old_lastname`, `old_role`, `old_email_address`, `new_firstname`, `new_lastname`, `new_role`, `new_email_address`) VALUES
(1, 6, '2023-10-05 08:29:33', 'Sarah', 'Miller', 'Admin', 'sarah.miller@example.com', 'Sarah', 'Millerr', 'Admin', 'sarah.miller@example.com'),
(2, 6, '2023-10-05 08:29:47', 'Sarah', 'Millerr', 'Admin', 'sarah.miller@example.com', 'Sarah', 'Miller', 'Admin', 'sarah.miller@example.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id_actor`);

--
-- Index pour la table `favorite_movies`
--
ALTER TABLE `favorite_movies`
  ADD PRIMARY KEY (`id_user`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `filmmaker`
--
ALTER TABLE `filmmaker`
  ADD PRIMARY KEY (`id_filmmaker`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `id_filmmaker` (`id_filmmaker`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_actor`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `user_archive`
--
ALTER TABLE `user_archive`
  ADD PRIMARY KEY (`id_user_archive`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `id_actor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `favorite_movies`
--
ALTER TABLE `favorite_movies`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `filmmaker`
--
ALTER TABLE `filmmaker`
  MODIFY `id_filmmaker` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_actor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user_archive`
--
ALTER TABLE `user_archive`
  MODIFY `id_user_archive` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favorite_movies`
--
ALTER TABLE `favorite_movies`
  ADD CONSTRAINT `favorite_movies_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `favorite_movies_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);

--
-- Contraintes pour la table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_filmmaker`) REFERENCES `filmmaker` (`id_filmmaker`);

--
-- Contraintes pour la table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
