CREATE TABLE `hunting_wagon` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(64) DEFAULT NULL,
  `contents` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

ALTER TABLE `hunting_wagon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

ALTER TABLE `hunting_wagon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;