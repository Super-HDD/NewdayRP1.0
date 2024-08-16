CREATE TABLE `player_cow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `cowid` int(11) NOT NULL, 
  `spawned` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;