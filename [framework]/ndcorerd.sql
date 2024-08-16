-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-08-07 16:32:01
-- 服务器版本： 10.4.16-MariaDB
-- PHP 版本： 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ndcorerd`
--

-- --------------------------------------------------------

--
-- 表的结构 `address_book`
--

CREATE TABLE `address_book` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `address_book`
--

INSERT INTO `address_book` (`id`, `citizenid`, `name`, `owner`) VALUES
(1, '36', 'test', 'HZT47456');

-- --------------------------------------------------------

--
-- 表的结构 `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `bank_statements`
--

INSERT INTO `bank_statements` (`record_id`, `citizenid`, `account`, `buisness`, `buisnessid`, `gangid`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES
(1, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 5090, '2023-08-04 23:39:41', '从活期账户取出 1000'),
(2, 'TRX85539', 'Bank', NULL, NULL, NULL, 1000, 0, 5090, '2023-08-04 23:39:43', '将 1000 存入活期账户'),
(3, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 5090, '2023-08-04 23:39:44', '从活期账户取出 1000'),
(4, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 4090, '2023-08-04 23:39:44', '从活期账户取出 1000'),
(5, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 3090, '2023-08-04 23:39:45', '从活期账户取出 1000'),
(6, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 2090, '2023-08-04 23:39:45', '从活期账户取出 1000'),
(7, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 1000, 1090, '2023-08-04 23:39:46', '从活期账户取出 1000'),
(8, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 90, '2023-08-04 23:39:47', '从活期账户取出 10'),
(9, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 80, '2023-08-04 23:39:48', '从活期账户取出 10'),
(10, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 70, '2023-08-04 23:39:48', '从活期账户取出 10'),
(11, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 60, '2023-08-04 23:39:48', '从活期账户取出 10'),
(12, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 50, '2023-08-04 23:39:48', '从活期账户取出 10'),
(13, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 40, '2023-08-04 23:39:48', '从活期账户取出 10'),
(14, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 30, '2023-08-04 23:39:48', '从活期账户取出 10'),
(15, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 20, '2023-08-04 23:39:49', '从活期账户取出 10'),
(16, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 10, '2023-08-04 23:39:49', '从活期账户取出 10'),
(17, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 0, '2023-08-04 23:39:49', '从活期账户取出 10'),
(18, 'TRX85539', 'Bank', NULL, NULL, NULL, 0, 10, 0, '2023-08-04 23:39:49', '从活期账户取出 10'),
(19, 'WZK10388', 'Bank', NULL, NULL, NULL, 1000, 0, 1160, '2023-08-07 22:20:04', '将 1000 存入活期账户'),
(20, 'WZK10388', 'Bank', NULL, NULL, NULL, 1000, 0, 2160, '2023-08-07 22:20:06', '将 1000 存入活期账户'),
(21, 'WZK10388', 'Bank', NULL, NULL, NULL, 1000, 0, 3160, '2023-08-07 22:20:09', '将 1000 存入活期账户'),
(22, 'WZK10388', 'Bank', NULL, NULL, NULL, 1000, 0, 4160, '2023-08-07 22:20:11', '将 1000 存入活期账户');

-- --------------------------------------------------------

--
-- 表的结构 `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `doors`
--

CREATE TABLE `doors` (
  `id` int(11) NOT NULL,
  `doorid` varchar(11) NOT NULL DEFAULT '0',
  `doorstate` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `doors`
--

INSERT INTO `doors` (`id`, `doorid`, `doorstate`) VALUES
(1, '3598523785', 1),
(2, '2031215067', 1),
(3, '1189146288', 1),
(4, '906448125', 1),
(5, '2821676992', 1),
(6, '1510914117', 1),
(7, '3549587335', 1),
(8, '3000692149', 1),
(9, '1928053488', 1),
(10, '772977516', 1),
(11, '527767089', 1),
(12, '3468185317', 1),
(13, '2779142555', 1),
(14, '1239033969', 1),
(15, '1597362984', 1),
(16, '1299456376', 1),
(17, '2933656395', 1),
(18, '3238637478', 1),
(19, '3544613794', 1),
(20, '1485561723', 1),
(21, '1511858696', 1),
(22, '1282705079', 1),
(23, '2238665296', 1),
(24, '2080980868', 1),
(25, '2700347737', 0),
(26, '2544301759', 0),
(27, '3720952508', 1),
(28, '350169319', 1),
(29, '984852093', 1),
(30, '3473362722', 1),
(31, '686097120', 1),
(32, '3107660458', 1),
(33, '3419719645', 1),
(34, '3945582303', 1),
(35, '862008394', 1),
(36, '1661737397', 1),
(37, '1574473390', 1),
(38, '3731688048', 1),
(39, '344028824', 1),
(40, '2652873387', 1),
(41, '2061942857', 1),
(42, '3702071668', 0),
(43, '1934463007', 1),
(44, '2183007198', 1),
(45, '4288310487', 1),
(46, '872775928', 1),
(47, '2385374047', 1),
(48, '2051127971', 1),
(49, '3167436574', 1),
(50, '1195519038', 1),
(51, '2212914984', 1),
(52, '562830153', 1),
(53, '663425326', 1),
(54, '1171581101', 1),
(55, '52014802', 1),
(56, '4164042403', 1),
(57, '2047072501', 1),
(58, '2715667864', 1),
(59, '1263476860', 1),
(60, '1894337720', 1),
(61, '120764251', 1),
(62, '943176298', 1),
(63, '2971757040', 1),
(64, '1973911195', 1),
(65, '784290387', 1),
(66, '843137708', 1),
(67, '4275653891', 1),
(68, '1431398235', 1),
(69, '896012811', 1),
(70, '2813949612', 1),
(71, '868379185', 1),
(72, '640077562', 1),
(73, '3045682143', 1),
(74, '1915887592', 1),
(75, '3324299212', 1),
(76, '1180868565', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `indian_plants`
--

CREATE TABLE `indian_plants` (
  `id` int(11) NOT NULL,
  `properties` text NOT NULL,
  `plantid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `indian_plants`
--

INSERT INTO `indian_plants` (`id`, `properties`, `plantid`) VALUES
(2, '{\"hunger\":0.0,\"y\":2233.718505859375,\"x\":451.7801208496094,\"thirst\":0.0,\"planter\":\"JYZ71725\",\"id\":418321,\"z\":247.53826904296876,\"planttime\":1691226249,\"quality\":25.0,\"growth\":100.0,\"type\":\"indtobacco\",\"beingHarvested\":false,\"grace\":false}', 418321),
(3, '{\"hunger\":0.0,\"y\":2226.461181640625,\"x\":456.2329406738281,\"thirst\":0.0,\"planter\":\"JYZ71725\",\"id\":905707,\"z\":247.0983123779297,\"planttime\":1691226290,\"quality\":25.0,\"growth\":100.0,\"type\":\"indtobacco\",\"beingHarvested\":false,\"grace\":false}', 905707);

-- --------------------------------------------------------

--
-- 表的结构 `job_wagons`
--

CREATE TABLE `job_wagons` (
  `id` int(11) NOT NULL,
  `job` varchar(50) DEFAULT NULL,
  `plate` varchar(255) NOT NULL,
  `active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `management_funds`
--

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
(1, 'police', 0, 'boss'),
(2, 'medic', 0, 'boss'),
(3, 'valweaponsmith', 0, 'boss'),
(4, 'rhoweaponsmith', 0, 'boss'),
(5, 'stdenisweaponsmith', 0, 'boss'),
(6, 'valsaloontender', 0, 'boss'),
(7, 'blasaloontender', 0, 'boss'),
(8, 'rhosaloontender', 0, 'boss'),
(9, 'stdenissaloontender1', 0, 'boss'),
(10, 'stdenissaloontender2', 0, 'boss'),
(11, 'vansaloontender', 0, 'boss'),
(12, 'armsaloontender', 0, 'boss'),
(13, 'tumsaloontender', 0, 'boss'),
(14, 'moonsaloontender1', 0, 'boss'),
(15, 'moonsaloontender2', 0, 'boss'),
(16, 'moonsaloontender3', 0, 'boss'),
(17, 'moonsaloontender4', 0, 'boss'),
(18, 'moonsaloontender5', 0, 'boss'),
(19, 'stdeniswholesale', 0, 'boss'),
(20, 'blkwholesale', 0, 'boss'),
(21, 'railroad', 0, 'boss'),
(22, 'govenor1', 0, 'boss'),
(23, 'govenor2', 0, 'boss'),
(24, 'govenor3', 0, 'boss'),
(25, 'govenor4', 31, 'boss'),
(26, 'govenor5', 83, 'boss');

-- --------------------------------------------------------

--
-- 表的结构 `management_menu`
--

CREATE TABLE `management_menu` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `menu_type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `market_items`
--

CREATE TABLE `market_items` (
  `id` int(11) NOT NULL,
  `marketid` varchar(50) DEFAULT NULL,
  `items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` int(21) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `market_items`
--

INSERT INTO `market_items` (`id`, `marketid`, `items`, `stock`, `price`) VALUES
(1, 'thieveslanding_1', 'canteen0', 0, 100),
(2, 'annesburg_1', 'raw_meat', 0, 10),
(3, 'valentine_1', 'potatoseed', 0, 100),
(4, 'valentine_1', 'bread', 0, 1),
(5, 'valentine_1', 'fertilizer', 1, 1),
(6, 'valentine_1', 'campfire', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `market_owner`
--

CREATE TABLE `market_owner` (
  `marketid` varchar(255) NOT NULL,
  `citizenid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `owned` int(3) NOT NULL DEFAULT 0,
  `money` int(25) NOT NULL DEFAULT 0,
  `robbery` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `market_owner`
--

INSERT INTO `market_owner` (`marketid`, `citizenid`, `displayname`, `owned`, `money`, `robbery`) VALUES
('rhodes_1', 'TRX85539', 'rhodes_1', 1, 0, 0),
('annesburg_1', 'JYZ71725', 'Annisburg shop', 1, 40, 0),
('tumbleweed_1', NULL, 'tumbleweed_1', 0, 0, 0),
('saintdenis_1', NULL, 'saintdenis_1', 0, 0, 0),
('valentine_1', 'TRX85539', 'valentine_1', 1, 0, 0),
('emeraldranch_1', NULL, 'emeraldranch_1', 0, 0, 0),
('blackwater_1', NULL, 'blackwater_1', 0, 0, 0),
('thieveslanding_1', 'HZT47456', 'test', 1, 100, 0),
('strawberry_1', NULL, 'strawberry_1', 0, 0, 0),
('macfarranch_1', NULL, 'macfarranch_1', 0, 0, 0),
('armadillo_1', NULL, 'armadillo_1', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `playerclothe`
--

CREATE TABLE `playerclothe` (
  `citizenid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `clothes` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `playerclothe`
--

INSERT INTO `playerclothe` (`citizenid`, `license`, `clothes`) VALUES
('HZT47456', 'license:5aba446d2d44427c152fd59449fe1874f5ef95b4', '{\"boots\":{\"model\":0,\"texture\":0},\"belt_buckles\":{\"model\":0,\"texture\":0},\"neckties\":{\"model\":0,\"texture\":0},\"coats\":{\"model\":0,\"texture\":0},\"suspenders\":{\"model\":0,\"texture\":0},\"belts\":{\"model\":0,\"texture\":0},\"ponchos\":{\"model\":0,\"texture\":0},\"loadouts\":{\"model\":0,\"texture\":0},\"neckwear\":{\"model\":0,\"texture\":0},\"hats\":{\"model\":0,\"texture\":0},\"badges\":{\"model\":0,\"texture\":0},\"jewelry_rings_left\":{\"model\":0,\"texture\":0},\"satchels\":{\"model\":0,\"texture\":0},\"cloaks\":{\"model\":0,\"texture\":0},\"chaps\":{\"model\":0,\"texture\":0},\"shirts_full\":{\"model\":0,\"texture\":0},\"gauntlets\":{\"model\":0,\"texture\":0},\"gunbelt_accs\":{\"model\":0,\"texture\":0},\"accessories\":{\"model\":0,\"texture\":0},\"coats_closed\":{\"model\":0,\"texture\":0},\"armor\":{\"model\":0,\"texture\":0},\"jewelry_bracelets\":{\"model\":0,\"texture\":0},\"boot_accessories\":{\"model\":0,\"texture\":0},\"jewelry_rings_right\":{\"model\":0,\"texture\":0},\"pants\":{\"model\":0,\"texture\":0},\"gunbelts\":{\"model\":0,\"texture\":0},\"spats\":{\"model\":0,\"texture\":0},\"vests\":{\"model\":0,\"texture\":0},\"eyewear\":{\"model\":0,\"texture\":0},\"dresses\":{\"model\":0,\"texture\":0},\"holsters_left\":{\"model\":0,\"texture\":0},\"masks\":{\"model\":0,\"texture\":0},\"gloves\":{\"model\":0,\"texture\":0}}'),
('JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":8,\"model\":15},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":1},\"gloves\":{\"texture\":10,\"model\":1},\"vests\":{\"texture\":1,\"model\":9},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":38},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":116},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":4,\"model\":34},\"holsters_left\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":15},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('VJZ77787', 'license:0276bdf83da1af4d549e0c97d4244ed0e1874299', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":6,\"model\":27},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":2},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":5},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":3,\"model\":32},\"belts\":{\"texture\":1,\"model\":3},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":116},\"eyewear\":{\"texture\":26,\"model\":10},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":2,\"model\":14},\"holsters_left\":{\"texture\":1,\"model\":13},\"spats\":{\"texture\":1,\"model\":4},\"neckwear\":{\"texture\":1,\"model\":5},\"armor\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":15},\"suspenders\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":7},\"coats_closed\":{\"texture\":1,\"model\":0},\"accessories\":{\"texture\":4,\"model\":1},\"belt_buckles\":{\"texture\":1,\"model\":27}}'),
('TRX85539', 'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad', '{\"gunbelts\":{\"texture\":1,\"model\":18},\"masks\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":11},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":3,\"model\":1},\"suspenders\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"cloaks\":{\"texture\":3,\"model\":2},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":18},\"boots\":{\"texture\":6,\"model\":11},\"hats\":{\"texture\":1,\"model\":3},\"neckties\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":19},\"gauntlets\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":24},\"holsters_left\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":1,\"model\":7},\"satchels\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":12,\"model\":1},\"pants\":{\"texture\":1,\"model\":45}}'),
('IFS18777', 'license:44562c2a70b6cf84446b9ba8f35ca3c50ed315c7', '{\"neckwear\":{\"texture\":1,\"model\":5},\"chaps\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":3},\"suspenders\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":3,\"model\":6},\"eyewear\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":2,\"model\":4},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":27},\"pants\":{\"texture\":2,\"model\":32},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":1,\"model\":1},\"ponchos\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":15},\"coats\":{\"texture\":3,\"model\":12},\"vests\":{\"texture\":1,\"model\":5},\"neckties\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":2,\"model\":27},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":9},\"holsters_left\":{\"texture\":1,\"model\":6},\"badges\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":17},\"masks\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":1,\"model\":1},\"accessories\":{\"texture\":2,\"model\":1},\"armor\":{\"texture\":0,\"model\":0}}'),
('QAX90433', 'license:1b239891313dd75cca01c74f7690fcca3128d602', '{\"neckwear\":{\"texture\":1,\"model\":22},\"chaps\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":4,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":37,\"model\":4},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":42},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":12},\"boots\":{\"texture\":1,\"model\":57},\"gauntlets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":4,\"model\":16},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":5,\"model\":6},\"holsters_left\":{\"texture\":4,\"model\":1},\"coats_closed\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":16},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0}}'),
('STZ39118', 'license:0a8fad39859c6287481916b46f6f28efe8bbf0ee', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":20},\"jewelry_rings_right\":{\"texture\":1,\"model\":1},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":24},\"coats\":{\"texture\":1,\"model\":33},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":1,\"model\":2},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":2,\"model\":19},\"eyewear\":{\"texture\":1,\"model\":2},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":2,\"model\":3},\"gloves\":{\"texture\":2,\"model\":2},\"pants\":{\"texture\":1,\"model\":5},\"holsters_left\":{\"texture\":1,\"model\":1},\"coats_closed\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":2,\"model\":5},\"cloaks\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":2},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":2},\"accessories\":{\"texture\":1,\"model\":1},\"neckwear\":{\"texture\":1,\"model\":2},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('XUW25145', 'license:1fea790d5d637ce341bab005fcce396d50f561e0', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":8},\"jewelry_rings_right\":{\"texture\":2,\"model\":1},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":15},\"vests\":{\"texture\":1,\"model\":17},\"coats\":{\"texture\":1,\"model\":26},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":4},\"boots\":{\"texture\":1,\"model\":24},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":4,\"model\":2},\"chaps\":{\"texture\":1,\"model\":0},\"hats\":{\"texture\":1,\"model\":34},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":7,\"model\":12},\"pants\":{\"texture\":1,\"model\":20},\"holsters_left\":{\"texture\":1,\"model\":6},\"loadouts\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":14},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":17},\"armor\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":3,\"model\":136}}'),
('XDM78973', 'license:2793475af537b20b293f623de8a511d45a3ebfd5', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":12},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":6},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":1,\"model\":2},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":11},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":5},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":5},\"holsters_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('KBS04868', 'license:cecda5612d0aeea53aadd14c837c887ca57514df', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":9,\"model\":32},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":3,\"model\":5},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":5},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":38},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"boot_accessories\":{\"texture\":1,\"model\":3},\"spats\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":4},\"gloves\":{\"texture\":1,\"model\":2},\"gauntlets\":{\"texture\":1,\"model\":4},\"suspenders\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('WZK10388', 'license:d2a676a68afc728e3dbfe67f8e85d287c80458ae', '{\"cloaks\":{\"texture\":1,\"model\":1},\"shirts_full\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":7},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":1},\"loadouts\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":6,\"model\":3},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('RGL07752', 'license:36ef04f272f948bdd6a464f94b81c1022b100fbd', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":26},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":13},\"coats\":{\"texture\":7,\"model\":22},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":4,\"model\":33},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":9},\"eyewear\":{\"texture\":1,\"model\":7},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":4,\"model\":3},\"suspenders\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":1,\"model\":16},\"satchels\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":5,\"model\":18},\"armor\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":4,\"model\":3},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('FIN88567', 'license:90faf4f458f491cf2d409e74d4c85e9ade04c2e5', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":7},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":5},\"boots\":{\"texture\":1,\"model\":7},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":13,\"model\":5},\"holsters_left\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('NQD81922', 'license:d20e0d071be78e1abdc4b0eff7e1b4683901d1ce', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":37},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":2,\"model\":2},\"vests\":{\"texture\":1,\"model\":13},\"coats\":{\"texture\":3,\"model\":26},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":1,\"model\":1},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":2,\"model\":29},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":6},\"holsters_left\":{\"texture\":1,\"model\":10},\"suspenders\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":2,\"model\":2},\"gunbelts\":{\"texture\":1,\"model\":3},\"ponchos\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('QWN36957', 'license:123ec56c060e3039c6cf7e054c70a2aa6299a42b', '{\"ponchos\":{\"texture\":1,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":16},\"suspenders\":{\"texture\":1,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":7,\"model\":37},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":1,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":4,\"model\":2},\"eyewear\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":4},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":2,\"model\":1},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('GNF55729', 'license:a2b8b05e124c8597d2ed4873724e6ec7f5f2a4c0', '{\"ponchos\":{\"texture\":1,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":12},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":1},\"coats\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":32},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"neckties\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":34},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":4,\"model\":1},\"cloaks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":11},\"belt_buckles\":{\"texture\":1,\"model\":0}}'),
('SSA19265', 'license:9bbad5f3d4dcda74bdec72a2756d12f988cdfa3d', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('SGM09003', 'license:f6787ca23f058048efdede1ba13fd77daab19cad', '{\"cloaks\":{\"texture\":1,\"model\":2},\"shirts_full\":{\"texture\":1,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":1},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":2,\"model\":1},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":1,\"model\":1},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":7},\"hats\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":1,\"model\":1},\"ponchos\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":1},\"holsters_left\":{\"texture\":1,\"model\":4},\"boot_accessories\":{\"texture\":1,\"model\":1},\"accessories\":{\"texture\":2,\"model\":1},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":1},\"spats\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":4},\"armor\":{\"texture\":1,\"model\":1},\"coats_closed\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":1},\"neckwear\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":1}}'),
('HZQ37049', 'license:f98e6f8d303f34bdef5cc2961e8327dc76dea55e', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":8,\"model\":10},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":8,\"model\":7},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":9},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":15},\"chaps\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('KJH93028', 'license:57f38f3c276294e4d91e5eefe3f5bc7c926c4b83', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":3},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":3},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":1,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":5,\"model\":5},\"skirts\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('RNO92585', 'license:8552b037c7c92faa45718bd1858eab3f098f298e', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":4,\"model\":1},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":1,\"model\":2},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":1},\"boots\":{\"texture\":1,\"model\":5},\"belts\":{\"texture\":1,\"model\":4},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":1,\"model\":1},\"pants\":{\"texture\":1,\"model\":17},\"holsters_left\":{\"texture\":1,\"model\":2},\"neckwear\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":1,\"model\":2},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":1,\"model\":3},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":5},\"coats_closed\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":3},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('QLL77581', 'license:a58779aa4558b4c014d9dc9e490060c19a59a0ad', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":30},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":29},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":5,\"model\":50},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"skirts\":{\"texture\":1,\"model\":4},\"cloaks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('HUC27619', 'license:44ee7546890a391376877ad085d12ec9ff136e20', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":6},\"coats\":{\"texture\":3,\"model\":32},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":4,\"model\":5},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":2,\"model\":2},\"masks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":3},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":3,\"model\":56},\"cloaks\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":7,\"model\":3},\"boot_accessories\":{\"texture\":1,\"model\":2},\"gunbelts\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('AQE87068', 'license:8bb43737a7e7b765aae64dba56f431d26d8c815c', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":20},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":1},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":6,\"model\":6},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":3},\"neckties\":{\"texture\":1,\"model\":7},\"armor\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":2,\"model\":20},\"holsters_left\":{\"texture\":1,\"model\":3},\"dresses\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":1,\"model\":2},\"gauntlets\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":5},\"accessories\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":24},\"hats\":{\"texture\":1,\"model\":116},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":4}}'),
('LZV92605', 'license:7f7d7d777a6de33682e30f01e56b14954a1c7b61', '{\"cloaks\":{\"texture\":2,\"model\":2},\"shirts_full\":{\"texture\":1,\"model\":30},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":3,\"model\":15},\"vests\":{\"texture\":1,\"model\":12},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":3},\"belts\":{\"texture\":1,\"model\":3},\"jewelry_rings_left\":{\"texture\":1,\"model\":1},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":3,\"model\":41},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":7,\"model\":13},\"holsters_left\":{\"texture\":3,\"model\":4},\"neckwear\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":4},\"spats\":{\"texture\":7,\"model\":2},\"gunbelts\":{\"texture\":1,\"model\":8},\"satchels\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":7,\"model\":4},\"coats_closed\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('HGW24535', 'license:bdb0605af49ab445e510f42ac744a0f7499b9416', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":4},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":6},\"coats\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":3},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":1,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":3},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":1,\"model\":3},\"ponchos\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"skirts\":{\"texture\":1,\"model\":4},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
('QOZ64167', 'license:4183261b3d8b3da4c233331ec867bea7b898ba87', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":2,\"model\":12},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":23},\"coats\":{\"texture\":3,\"model\":12},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":119},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":2},\"masks\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":6},\"gauntlets\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}');

-- --------------------------------------------------------

--
-- 表的结构 `playeroutfit`
--

CREATE TABLE `playeroutfit` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `playeroutfit`
--

INSERT INTO `playeroutfit` (`id`, `citizenid`, `license`, `name`, `clothes`) VALUES
(10, 'HZT47456', 'license:5aba446d2d44427c152fd59449fe1874f5ef95b4', 'name', '{\"boots\":{\"model\":0,\"texture\":0},\"belt_buckles\":{\"model\":0,\"texture\":0},\"neckties\":{\"model\":0,\"texture\":0},\"coats\":{\"model\":0,\"texture\":0},\"suspenders\":{\"model\":0,\"texture\":0},\"belts\":{\"model\":0,\"texture\":0},\"ponchos\":{\"model\":0,\"texture\":0},\"loadouts\":{\"model\":0,\"texture\":0},\"neckwear\":{\"model\":0,\"texture\":0},\"hats\":{\"model\":0,\"texture\":0},\"badges\":{\"model\":0,\"texture\":0},\"jewelry_rings_left\":{\"model\":0,\"texture\":0},\"satchels\":{\"model\":0,\"texture\":0},\"cloaks\":{\"model\":0,\"texture\":0},\"chaps\":{\"model\":0,\"texture\":0},\"shirts_full\":{\"model\":0,\"texture\":0},\"gauntlets\":{\"model\":0,\"texture\":0},\"gunbelt_accs\":{\"model\":0,\"texture\":0},\"accessories\":{\"model\":0,\"texture\":0},\"coats_closed\":{\"model\":0,\"texture\":0},\"armor\":{\"model\":0,\"texture\":0},\"jewelry_bracelets\":{\"model\":0,\"texture\":0},\"boot_accessories\":{\"model\":0,\"texture\":0},\"jewelry_rings_right\":{\"model\":0,\"texture\":0},\"pants\":{\"model\":0,\"texture\":0},\"gunbelts\":{\"model\":0,\"texture\":0},\"spats\":{\"model\":0,\"texture\":0},\"vests\":{\"model\":0,\"texture\":0},\"eyewear\":{\"model\":0,\"texture\":0},\"dresses\":{\"model\":0,\"texture\":0},\"holsters_left\":{\"model\":0,\"texture\":0},\"masks\":{\"model\":0,\"texture\":0},\"gloves\":{\"model\":0,\"texture\":0}}'),
(12, 'JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', 'Cowpoke', '{\"badges\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":2,\"model\":17},\"pants\":{\"texture\":3,\"model\":13},\"cloaks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":16},\"eyewear\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gloves\":{\"texture\":10,\"model\":1},\"coats\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":8,\"model\":38},\"belt_buckles\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":8},\"loadouts\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"ponchos\":{\"texture\":1,\"model\":8},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":4,\"model\":4}}'),
(14, 'JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', '', '{\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":3,\"model\":13},\"cloaks\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":16},\"eyewear\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gloves\":{\"texture\":10,\"model\":1},\"coats\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":8,\"model\":38},\"badges\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":12},\"gauntlets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":8},\"masks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":1,\"model\":8},\"loadouts\":{\"texture\":1,\"model\":0},\"belts\":{\"texture\":0,\"model\":0}}'),
(15, 'JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', 'Cow', '{\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":4,\"model\":34},\"cloaks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":16},\"eyewear\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gloves\":{\"texture\":10,\"model\":1},\"coats\":{\"texture\":3,\"model\":13},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":38},\"ponchos\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":12},\"holsters_left\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"hats\":{\"texture\":1,\"model\":16},\"masks\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0}}'),
(17, 'TRX85539', 'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad', '1', '{\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":45},\"cloaks\":{\"texture\":3,\"model\":2},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":12,\"model\":1},\"shirts_full\":{\"texture\":1,\"model\":19},\"eyewear\":{\"texture\":1,\"model\":7},\"coats_closed\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":18},\"spats\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":5,\"model\":1},\"vests\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":6,\"model\":11},\"hats\":{\"texture\":1,\"model\":3},\"belt_buckles\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":18},\"dresses\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":11},\"masks\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0}}'),
(18, 'IFS18777', 'license:44562c2a70b6cf84446b9ba8f35ca3c50ed315c7', '输入名称', '{\"neckwear\":{\"texture\":1,\"model\":5},\"chaps\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":3},\"suspenders\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":3,\"model\":6},\"eyewear\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":2,\"model\":4},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":27},\"pants\":{\"texture\":2,\"model\":32},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":1,\"model\":1},\"ponchos\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":15},\"coats\":{\"texture\":3,\"model\":12},\"vests\":{\"texture\":1,\"model\":5},\"neckties\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":2,\"model\":27},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":9},\"holsters_left\":{\"texture\":1,\"model\":6},\"badges\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":17},\"masks\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":1,\"model\":1},\"accessories\":{\"texture\":2,\"model\":1},\"armor\":{\"texture\":0,\"model\":0}}'),
(19, 'VJZ77787', 'license:0276bdf83da1af4d549e0c97d4244ed0e1874299', '11111111', '{\"neckwear\":{\"texture\":1,\"model\":5},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":15},\"eyewear\":{\"texture\":26,\"model\":10},\"belts\":{\"texture\":1,\"model\":3},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":27},\"pants\":{\"texture\":2,\"model\":14},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":7},\"coats\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":5},\"neckties\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":6,\"model\":27},\"satchels\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":116},\"spats\":{\"texture\":1,\"model\":4},\"boot_accessories\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":1,\"model\":13},\"badges\":{\"texture\":1,\"model\":2},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":3,\"model\":3},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":4,\"model\":1},\"armor\":{\"texture\":1,\"model\":0}}'),
(20, 'QAX90433', 'license:1b239891313dd75cca01c74f7690fcca3128d602', '001', '{\"neckwear\":{\"texture\":1,\"model\":22},\"chaps\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":4,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":37,\"model\":4},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":42},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":12},\"boots\":{\"texture\":1,\"model\":57},\"gauntlets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":4,\"model\":16},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":5,\"model\":6},\"holsters_left\":{\"texture\":4,\"model\":1},\"coats_closed\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":16},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0}}'),
(21, 'TRX85539', 'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad', '输入名称2', '{\"gunbelts\":{\"texture\":1,\"model\":18},\"masks\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":11},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":3,\"model\":1},\"suspenders\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"cloaks\":{\"texture\":3,\"model\":2},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":18},\"boots\":{\"texture\":6,\"model\":11},\"hats\":{\"texture\":1,\"model\":3},\"neckties\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":19},\"gauntlets\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":24},\"holsters_left\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":1,\"model\":7},\"satchels\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":12,\"model\":1},\"pants\":{\"texture\":1,\"model\":45}}'),
(22, 'STZ39118', 'license:0a8fad39859c6287481916b46f6f28efe8bbf0ee', '输入名称', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":20},\"jewelry_rings_right\":{\"texture\":1,\"model\":1},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":24},\"coats\":{\"texture\":1,\"model\":33},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":1,\"model\":2},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":2,\"model\":19},\"eyewear\":{\"texture\":1,\"model\":2},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":2,\"model\":3},\"gloves\":{\"texture\":2,\"model\":2},\"pants\":{\"texture\":1,\"model\":5},\"holsters_left\":{\"texture\":1,\"model\":1},\"coats_closed\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":2,\"model\":5},\"cloaks\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":2},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":2},\"accessories\":{\"texture\":1,\"model\":1},\"neckwear\":{\"texture\":1,\"model\":2},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(23, 'XUW25145', 'license:1fea790d5d637ce341bab005fcce396d50f561e0', '输入名称', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":8},\"jewelry_rings_right\":{\"texture\":2,\"model\":1},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":15},\"vests\":{\"texture\":1,\"model\":17},\"coats\":{\"texture\":1,\"model\":26},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":4},\"boots\":{\"texture\":1,\"model\":24},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":4,\"model\":2},\"chaps\":{\"texture\":1,\"model\":0},\"hats\":{\"texture\":1,\"model\":34},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":7,\"model\":12},\"pants\":{\"texture\":1,\"model\":20},\"holsters_left\":{\"texture\":1,\"model\":6},\"loadouts\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":14},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":17},\"armor\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":3,\"model\":136}}'),
(24, 'JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', 'laws', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":8,\"model\":15},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":1},\"gloves\":{\"texture\":10,\"model\":1},\"vests\":{\"texture\":1,\"model\":9},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":38},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":116},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":4,\"model\":34},\"holsters_left\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":15},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(25, 'XDM78973', 'license:2793475af537b20b293f623de8a511d45a3ebfd5', '', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":12},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":6},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":1,\"model\":2},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":11},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":5},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(26, 'KBS04868', 'license:cecda5612d0aeea53aadd14c837c887ca57514df', 'Q', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":7},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":3,\"model\":5},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":5},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":9,\"model\":24},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":4},\"coats_closed\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(27, 'XDM78973', 'license:2793475af537b20b293f623de8a511d45a3ebfd5', '输入名称', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":12},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":6},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":1,\"model\":2},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":11},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":5},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":5},\"holsters_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(28, 'WZK10388', 'license:d2a676a68afc728e3dbfe67f8e85d287c80458ae', '输入名称', '{\"cloaks\":{\"texture\":1,\"model\":1},\"shirts_full\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":7},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":1},\"loadouts\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":6,\"model\":3},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(29, 'NQD81922', 'license:d20e0d071be78e1abdc4b0eff7e1b4683901d1ce', '11', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":37},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":2,\"model\":2},\"vests\":{\"texture\":1,\"model\":15},\"coats\":{\"texture\":3,\"model\":26},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":1,\"model\":1},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":2,\"model\":29},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":6},\"neckties\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":1,\"model\":6},\"holsters_left\":{\"texture\":1,\"model\":10},\"suspenders\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":2,\"model\":2},\"gunbelts\":{\"texture\":1,\"model\":3},\"gauntlets\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"dresses\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(30, 'QWN36957', 'license:123ec56c060e3039c6cf7e054c70a2aa6299a42b', '', '{\"ponchos\":{\"texture\":1,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":16},\"suspenders\":{\"texture\":1,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":7,\"model\":37},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":1,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":4,\"model\":2},\"eyewear\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":1,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":4},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":2,\"model\":1},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(31, 'GNF55729', 'license:a2b8b05e124c8597d2ed4873724e6ec7f5f2a4c0', '1', '{\"ponchos\":{\"texture\":1,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":12},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":1},\"coats\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":32},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"neckties\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":34},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":4,\"model\":1},\"cloaks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":11},\"belt_buckles\":{\"texture\":1,\"model\":0}}'),
(32, 'NQD81922', 'license:d20e0d071be78e1abdc4b0eff7e1b4683901d1ce', '22', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":37},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":2,\"model\":2},\"vests\":{\"texture\":1,\"model\":13},\"coats\":{\"texture\":3,\"model\":26},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":1,\"model\":1},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":2,\"model\":29},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":6},\"holsters_left\":{\"texture\":1,\"model\":10},\"suspenders\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":2,\"model\":2},\"gunbelts\":{\"texture\":1,\"model\":3},\"ponchos\":{\"texture\":1,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":1,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(33, 'SSA19265', 'license:9bbad5f3d4dcda74bdec72a2756d12f988cdfa3d', '输入名称666', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":0,\"model\":0},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(34, 'RGL07752', 'license:36ef04f272f948bdd6a464f94b81c1022b100fbd', '输入名称', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":3,\"model\":26},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":13},\"coats\":{\"texture\":7,\"model\":22},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":4,\"model\":33},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":9},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":1,\"model\":16},\"suspenders\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":5,\"model\":18},\"coats_closed\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":4,\"model\":3},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(35, 'SGM09003', 'license:f6787ca23f058048efdede1ba13fd77daab19cad', 'Eden.Kucher', '{\"cloaks\":{\"texture\":1,\"model\":2},\"shirts_full\":{\"texture\":1,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":1},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":2,\"model\":1},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":1,\"model\":1},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":7},\"hats\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":1,\"model\":1},\"ponchos\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":1},\"holsters_left\":{\"texture\":1,\"model\":4},\"boot_accessories\":{\"texture\":1,\"model\":1},\"accessories\":{\"texture\":2,\"model\":1},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":1},\"spats\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":4},\"armor\":{\"texture\":1,\"model\":1},\"coats_closed\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":1},\"neckwear\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":1}}'),
(36, 'HZQ37049', 'license:f98e6f8d303f34bdef5cc2961e8327dc76dea55e', '输入名称HEI', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":8,\"model\":10},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":8,\"model\":7},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":9},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":15},\"chaps\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(37, 'KBS04868', 'license:cecda5612d0aeea53aadd14c837c887ca57514df', '', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":9,\"model\":32},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":3,\"model\":5},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":5},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":38},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"boot_accessories\":{\"texture\":1,\"model\":3},\"spats\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":4},\"gloves\":{\"texture\":1,\"model\":2},\"gauntlets\":{\"texture\":1,\"model\":4},\"suspenders\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(38, 'KJH93028', 'license:57f38f3c276294e4d91e5eefe3f5bc7c926c4b83', 'kkkk', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":3},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":1,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"skirts\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":3},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(39, 'RNO92585', 'license:8552b037c7c92faa45718bd1858eab3f098f298e', '1', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":4,\"model\":1},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":1,\"model\":2},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":1,\"model\":1},\"boots\":{\"texture\":1,\"model\":5},\"belts\":{\"texture\":1,\"model\":4},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":0,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":1,\"model\":1},\"pants\":{\"texture\":1,\"model\":17},\"holsters_left\":{\"texture\":1,\"model\":2},\"neckwear\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":1,\"model\":2},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":1,\"model\":3},\"boot_accessories\":{\"texture\":1,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":2},\"loadouts\":{\"texture\":1,\"model\":5},\"coats_closed\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":3},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(40, 'QLL77581', 'license:a58779aa4558b4c014d9dc9e490060c19a59a0ad', 'daxiaojie', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":30},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":29},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":5,\"model\":50},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"skirts\":{\"texture\":1,\"model\":4},\"cloaks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(41, 'VJZ77787', 'license:0276bdf83da1af4d549e0c97d4244ed0e1874299', '11111', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":6,\"model\":27},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":2},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":10,\"model\":5},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":1,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":3,\"model\":32},\"belts\":{\"texture\":1,\"model\":3},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":116},\"eyewear\":{\"texture\":26,\"model\":10},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":2,\"model\":14},\"holsters_left\":{\"texture\":1,\"model\":13},\"spats\":{\"texture\":1,\"model\":4},\"neckwear\":{\"texture\":1,\"model\":5},\"armor\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":15},\"suspenders\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":7},\"coats_closed\":{\"texture\":1,\"model\":0},\"accessories\":{\"texture\":4,\"model\":1},\"belt_buckles\":{\"texture\":1,\"model\":27}}'),
(42, 'HUC27619', 'license:44ee7546890a391376877ad085d12ec9ff136e20', '输入名称1', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":6},\"coats\":{\"texture\":3,\"model\":32},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":4,\"model\":5},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":2,\"model\":2},\"masks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":3},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":3,\"model\":56},\"cloaks\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":7,\"model\":3},\"boot_accessories\":{\"texture\":1,\"model\":2},\"gunbelts\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(43, 'AQE87068', 'license:8bb43737a7e7b765aae64dba56f431d26d8c815c', 'Marshal', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":20},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":1,\"model\":1},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":6,\"model\":6},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":1,\"model\":1},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":3},\"neckties\":{\"texture\":1,\"model\":7},\"armor\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":2,\"model\":20},\"holsters_left\":{\"texture\":1,\"model\":3},\"dresses\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":1,\"model\":2},\"gauntlets\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":1},\"gunbelts\":{\"texture\":1,\"model\":5},\"accessories\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":1,\"model\":24},\"hats\":{\"texture\":1,\"model\":116},\"ponchos\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":1,\"model\":4}}'),
(44, 'LZV92605', 'license:7f7d7d777a6de33682e30f01e56b14954a1c7b61', 'll', '{\"cloaks\":{\"texture\":2,\"model\":2},\"shirts_full\":{\"texture\":1,\"model\":30},\"suspenders\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":3,\"model\":15},\"vests\":{\"texture\":1,\"model\":12},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":3},\"belts\":{\"texture\":1,\"model\":3},\"jewelry_rings_left\":{\"texture\":1,\"model\":1},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":3,\"model\":41},\"eyewear\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":7,\"model\":13},\"holsters_left\":{\"texture\":3,\"model\":4},\"neckwear\":{\"texture\":1,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":1,\"model\":4},\"spats\":{\"texture\":7,\"model\":2},\"gunbelts\":{\"texture\":1,\"model\":8},\"satchels\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":7,\"model\":4},\"coats_closed\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(45, 'HGW24535', 'license:bdb0605af49ab445e510f42ac744a0f7499b9416', '2333', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":4},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":6},\"coats\":{\"texture\":1,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":3},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":1,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":3},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":0,\"model\":0},\"holsters_left\":{\"texture\":1,\"model\":3},\"ponchos\":{\"texture\":1,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"skirts\":{\"texture\":1,\"model\":4},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}'),
(46, 'KJH93028', 'license:57f38f3c276294e4d91e5eefe3f5bc7c926c4b83', '000', '{\"cloaks\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":1,\"model\":3},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":1,\"model\":3},\"vests\":{\"texture\":0,\"model\":0},\"coats\":{\"texture\":0,\"model\":0},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":2},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"hair_accessories\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":1,\"model\":1},\"hats\":{\"texture\":1,\"model\":0},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":5,\"model\":5},\"skirts\":{\"texture\":1,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":0,\"model\":0},\"pants\":{\"texture\":1,\"model\":2},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"masks\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"ponchos\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"gauntlets\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}');
INSERT INTO `playeroutfit` (`id`, `citizenid`, `license`, `name`, `clothes`) VALUES
(47, 'QOZ64167', 'license:4183261b3d8b3da4c233331ec867bea7b898ba87', 'CDC', '{\"ponchos\":{\"texture\":0,\"model\":0},\"shirts_full\":{\"texture\":2,\"model\":12},\"jewelry_rings_right\":{\"texture\":0,\"model\":0},\"badges\":{\"texture\":0,\"model\":0},\"coats_closed\":{\"texture\":0,\"model\":0},\"vests\":{\"texture\":1,\"model\":23},\"coats\":{\"texture\":3,\"model\":12},\"jewelry_bracelets\":{\"texture\":0,\"model\":0},\"satchels\":{\"texture\":0,\"model\":0},\"boots\":{\"texture\":1,\"model\":1},\"belts\":{\"texture\":0,\"model\":0},\"jewelry_rings_left\":{\"texture\":0,\"model\":0},\"accessories\":{\"texture\":0,\"model\":0},\"hats\":{\"texture\":1,\"model\":119},\"eyewear\":{\"texture\":0,\"model\":0},\"neckwear\":{\"texture\":1,\"model\":2},\"masks\":{\"texture\":0,\"model\":0},\"gloves\":{\"texture\":0,\"model\":0},\"neckties\":{\"texture\":0,\"model\":0},\"suspenders\":{\"texture\":1,\"model\":0},\"pants\":{\"texture\":1,\"model\":14},\"holsters_left\":{\"texture\":0,\"model\":0},\"armor\":{\"texture\":0,\"model\":0},\"chaps\":{\"texture\":0,\"model\":0},\"gunbelt_accs\":{\"texture\":0,\"model\":0},\"boot_accessories\":{\"texture\":0,\"model\":0},\"spats\":{\"texture\":0,\"model\":0},\"gunbelts\":{\"texture\":1,\"model\":6},\"gauntlets\":{\"texture\":0,\"model\":0},\"loadouts\":{\"texture\":0,\"model\":0},\"cloaks\":{\"texture\":0,\"model\":0},\"dresses\":{\"texture\":0,\"model\":0},\"belt_buckles\":{\"texture\":0,\"model\":0}}');

-- --------------------------------------------------------

--
-- 表的结构 `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(4155, 'AQE87068', 1, 'license:8bb43737a7e7b765aae64dba56f431d26d8c815c', 'R. Warren', '{\"cash\":4945,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"5114597252\",\"birthdate\":\"1866-06-30\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Warren\",\"nationality\":\"US\",\"account\":\"QB89977320437\",\"firstname\":\"Richard\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Recruit\"},\"type\":\"none\",\"payment\":50,\"isboss\":false,\"name\":\"police\",\"label\":\"Law Enforcement\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1361.5252685546876,\"y\":-1305.4285888671876,\"z\":77.807373046875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-93048150\",\"thirst\":98.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"dG369Z39oQQ5803\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"A-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":91.0}', '[{\"type\":\"weapon\",\"created\":1691418657,\"name\":\"weapon_revolver_cattleman\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"92LLW9bu342NNYx\"},\"slot\":1},{\"type\":\"weapon\",\"created\":1691418658,\"name\":\"weapon_repeater_winchester\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"87itf9Hw680BkmQ\"},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418661,\"name\":\"weapon_melee_lantern\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"90IaP7Iu713TWHj\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418662,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"85PaJ5aC664bPXG\"},\"slot\":4},{\"type\":\"item\",\"created\":1691418659,\"name\":\"ammo_revolver\",\"amount\":4,\"info\":{\"quality\":100,\"serie\":\"90SVE6WG457McUI\"},\"slot\":5},{\"type\":\"item\",\"created\":1691418676,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":6},{\"type\":\"item\",\"created\":1691417688,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691418660,\"name\":\"ammo_repeater\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"item\",\"created\":1691418674,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"90SVE6WG457McUI\"},\"slot\":18}]', '2023-08-07 14:31:18'),
(4127, 'CRT19329', 1, 'license:7c692424bdad8bf88653ffc739228aa19178efda', '20985', '{\"cash\":5000,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"1834746724\",\"birthdate\":\"1864-09-02\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"山德斯\",\"firstname\":\"伍德\",\"account\":\"QB39519774358\",\"nationality\":\"意大利\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2570.13623046875,\"y\":-1183.87255859375,\"z\":53.86376953125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-77001820\",\"thirst\":92.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"Eu727W08sBj0839\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"O+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":92.0}', '[{\"type\":\"item\",\"created\":1691417522,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417522,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:25'),
(4164, 'FIN88567', 1, 'license:90faf4f458f491cf2d409e74d4c85e9ade04c2e5', '属实整明白了', '{\"cash\":4986,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"1109344478\",\"birthdate\":\"1876-07-21\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"齐贝林\",\"nationality\":\"德国\",\"account\":\"QB81842227477\",\"firstname\":\"尼奥\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1210.852783203125,\"y\":-190.65493774414063,\"z\":101.3970947265625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-98205116\",\"thirst\":99.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"if835o15GGB0640\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":99.0}', '[{\"type\":\"item\",\"created\":1691417727,\"name\":\"water\",\"amount\":2,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417727,\"name\":\"bread\",\"amount\":3,\"info\":{\"quality\":98},\"slot\":2}]', '2023-08-07 14:31:53'),
(4120, 'GNF55729', 1, 'license:a2b8b05e124c8597d2ed4873724e6ec7f5f2a4c0', 'Josip Carlos', '{\"cash\":3307.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"4999261359\",\"birthdate\":\"1998-09-12\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Josip\",\"nationality\":\"USA\",\"account\":\"QB19236498978\",\"firstname\":\"Carlos\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2669.024169921875,\"y\":-1449.5736083984376,\"z\":46.6014404296875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-53305594\",\"thirst\":82.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"Wf297E92sTd6323\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"A-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":82.0}', '[{\"type\":\"item\",\"created\":1691417458,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417458,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418629,\"name\":\"weapon_revolver_schofield\",\"amount\":1,\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":12,\"serie\":\"89Qly0oW910GREH\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418249,\"name\":\"weapon_shotgun_doublebarrel\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"10SLO7sJ114xHEp\"},\"slot\":4},{\"type\":\"item\",\"created\":1691418273,\"name\":\"ammo_revolver\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418256,\"name\":\"ammo_shotgun\",\"amount\":20,\"info\":{\"quality\":100},\"slot\":7}]', '2023-08-07 14:31:11'),
(4399, 'GRR35086', 1, 'license:abe1ad6f7cd42fe6cf7504beb2cc287f2d209f4f', '芝士锐客', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"6325573860\",\"birthdate\":\"1877-06-23\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"弗雷德里希\",\"nationality\":\"德国\",\"account\":\"QB66271680023\",\"firstname\":\"穆勒\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-562.918701171875,\"y\":-3776.2548828125,\"z\":238.6219482421875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-80201412\",\"thirst\":100,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":600,\"fingerprint\":\"vq943N52cLm6071\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"A-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":100}', '[]', '2023-08-07 14:27:12'),
(4156, 'HGW24535', 1, 'license:bdb0605af49ab445e510f42ac744a0f7499b9416', '喵司教', '{\"cash\":4985,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"8799604178\",\"birthdate\":\"1874-03-01\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"维亚纳\",\"firstname\":\"塞西莉\",\"account\":\"QB94557302877\",\"nationality\":\"法国\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1327.79345703125,\"y\":-1311.5208740234376,\"z\":76.5267333984375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-82412706\",\"thirst\":90.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"YT754N37tBt6798\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":90.0}', '[{\"type\":\"item\",\"created\":1691417693,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417693,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2}]', '2023-08-07 14:31:19'),
(4119, 'HUC27619', 1, 'license:44ee7546890a391376877ad085d12ec9ff136e20', '不良人是摆烂人', '{\"cash\":4970,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"9268591354\",\"birthdate\":\"1874-06-03\",\"lastname\":\"Foch\",\"cid\":\"1\",\"gender\":\"undefined\",\"firstname\":\"Linky\",\"nationality\":\"UK\",\"account\":\"QB87069678223\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":1295.6966552734376,\"y\":-1291.3055419921876,\"z\":76.3751220703125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-61868441\",\"thirst\":91.0,\"status\":[],\"isdead\":true,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":91.0,\"inside\":{\"apartment\":[]},\"health\":1,\"stress\":0,\"inlaststand\":false,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"jailitems\":[],\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"bloodtype\":\"B+\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"phone\":[],\"ishandcuffed\":false,\"fingerprint\":\"tb053r63xiq7861\"}', '[{\"type\":\"item\",\"created\":1691417455,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417455,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:57'),
(4146, 'HZQ37049', 1, 'license:f98e6f8d303f34bdef5cc2961e8327dc76dea55e', 'Vladilena·Milize', '{\"cash\":4704.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"8646672228\",\"birthdate\":\"1811-05-13\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Allen\",\"firstname\":\"Smith\",\"account\":\"QB69119996385\",\"nationality\":\"美国\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-279.8769226074219,\"y\":782.5186767578125,\"z\":119.4937744140625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-67768242\",\"thirst\":84.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"pn347c94SuP7963\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":99.0}', '[{\"type\":\"item\",\"created\":1691417646,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417646,\"name\":\"bread\",\"amount\":4,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418624,\"name\":\"weapon_revolver_navy\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"01hAR4Pm811igfA\"},\"slot\":3},{\"type\":\"item\",\"created\":1691418562,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691418574,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"item\",\"created\":1691418575,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418576,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691418576,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691418576,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9},{\"type\":\"item\",\"created\":1691418576,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"item\",\"created\":1691418577,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":11},{\"type\":\"item\",\"created\":1691418577,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691418577,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"item\",\"created\":1691418578,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":15},{\"type\":\"item\",\"created\":1691418578,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":16},{\"type\":\"item\",\"created\":1691418579,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":17}]', '2023-08-07 14:31:11'),
(1, 'HZT47456', 1, 'license:5aba446d2d44427c152fd59449fe1874f5ef95b4', '1781997847', '{\"bank\":7590,\"bloodmoney\":0,\"cash\":1009992102.2}', '{\"nationality\":\"220\",\"birthdate\":\"2000-02-02\",\"gender\":\"undefined\",\"lastname\":\"michael\",\"phone\":\"3315690314\",\"firstname\":\"oliann\",\"cid\":\"1\",\"account\":\"QB88661382133\",\"backstory\":\"placeholder backstory\"}', '{\"type\":\"none\",\"isboss\":true,\"name\":\"police\",\"payment\":150,\"grade\":{\"level\":4,\"name\":\"Chief\"},\"label\":\"Law Enforcement\",\"onduty\":true}', '{\"label\":\"No Gang Affiliaton\",\"grade\":{\"level\":0,\"name\":\"none\"},\"isboss\":false,\"name\":\"none\"}', '{\"x\":-306.79119873046877,\"y\":791.2747192382813,\"z\":117.876220703125}', '{\"inlaststand\":false,\"jobrep\":{\"taxi\":0,\"tow\":0,\"hotdog\":0,\"trucker\":0},\"fitbit\":[],\"inside\":{\"apartment\":[]},\"levels\":{\"cooking\":0,\"crafting\":0,\"main\":0,\"mining\":0,\"herbalism\":0},\"commandbinds\":[],\"fingerprint\":\"aS140y58gFs7466\",\"stress\":0,\"craftingrep\":0,\"armor\":0,\"status\":[],\"ishandcuffed\":false,\"injail\":0,\"attachmentcraftingrep\":0,\"licences\":{\"weapon\":false},\"tracker\":false,\"health\":550,\"dealerrep\":0,\"isdead\":false,\"xp\":{\"cooking\":0,\"crafting\":0,\"main\":0,\"mining\":0,\"herbalism\":0},\"hunger\":49.0,\"criminalrecord\":{\"hasRecord\":false},\"bloodtype\":\"B-\",\"callsign\":\"NO CALLSIGN\",\"walletid\":\"qb-23557337\",\"jailitems\":[],\"phone\":[],\"house\":\"none\",\"thirst\":49.0}', '[{\"name\":\"horseholster\",\"type\":\"item\",\"created\":1691075819,\"slot\":1,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"horselantern\",\"type\":\"item\",\"created\":1691075815,\"slot\":2,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"weapon_bow_improved\",\"type\":\"weapon\",\"created\":1691244698,\"slot\":3,\"amount\":1,\"info\":{\"ammoclip\":1,\"serie\":\"51dbn5WR072QamA\",\"quality\":100,\"ammo\":9}},{\"name\":\"ammo_arrow\",\"type\":\"item\",\"created\":1691029171,\"slot\":4,\"amount\":44,\"info\":{\"quality\":100}},{\"name\":\"ammo_revolver\",\"type\":\"item\",\"created\":1691138930,\"slot\":5,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"raw_meat\",\"type\":\"item\",\"created\":1691142004,\"slot\":6,\"amount\":50,\"info\":{\"quality\":100}},{\"name\":\"weapon_revolver_cattleman\",\"type\":\"weapon\",\"created\":1691242135,\"slot\":7,\"amount\":1,\"info\":{\"ammoclip\":0,\"serie\":\"06PQs0vE599gFAu\",\"quality\":100,\"ammo\":0}},{\"name\":\"horsebrush\",\"type\":\"item\",\"created\":1691138664,\"slot\":8,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"raw_meat\",\"type\":\"item\",\"created\":1690999846,\"slot\":9,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"boatticket\",\"type\":\"item\",\"created\":1691129014,\"slot\":10,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"ammo_rifle_elephant\",\"type\":\"item\",\"created\":1691140828,\"slot\":12,\"amount\":10,\"info\":{\"quality\":100}},{\"name\":\"weapon_rifle_elephant\",\"type\":\"weapon\",\"created\":1691141454,\"slot\":13,\"amount\":1,\"info\":{\"ammoclip\":0,\"serie\":\"79rgn4QH776vJGC\",\"quality\":100,\"ammo\":0}},{\"name\":\"ammo_rifle\",\"type\":\"item\",\"created\":1691029168,\"slot\":15,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"water\",\"type\":\"item\",\"created\":1691141244,\"slot\":16,\"amount\":4,\"info\":{\"quality\":100}},{\"name\":\"ammo_repeater\",\"type\":\"item\",\"created\":1691141458,\"slot\":19,\"amount\":1,\"info\":{\"quality\":100}},{\"name\":\"ammo_shotgun\",\"type\":\"item\",\"created\":1691029173,\"slot\":20,\"amount\":1,\"info\":{\"quality\":100}}]', '2023-08-07 03:39:53'),
(2851, 'IFS18777', 1, 'license:44562c2a70b6cf84446b9ba8f35ca3c50ed315c7', '大牛子转转酒吧吧主', '{\"bloodmoney\":0,\"cash\":72.5,\"bank\":4721}', '{\"nationality\":\"USA\",\"cid\":\"1\",\"phone\":\"4503880856\",\"birthdate\":\"1844-01-01\",\"lastname\":\"Blair\",\"account\":\"QB27639498765\",\"gender\":\"undefined\",\"firstname\":\"Haran\",\"backstory\":\"placeholder backstory\"}', '{\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"onduty\":true,\"payment\":10,\"label\":\"Civilian\",\"isboss\":false,\"name\":\"unemployed\",\"type\":\"none\"}', '{\"grade\":{\"name\":\"none\",\"level\":0},\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang Affiliaton\"}', '{\"x\":1316.2550048828126,\"y\":-1312.931884765625,\"z\":76.5772705078125}', '{\"health\":1,\"stress\":12,\"house\":\"none\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"tracker\":false,\"dealerrep\":0,\"injail\":0,\"ishandcuffed\":false,\"isdead\":true,\"armor\":0,\"bloodtype\":\"A-\",\"commandbinds\":[],\"callsign\":\"NO CALLSIGN\",\"inside\":{\"apartment\":[]},\"fitbit\":[],\"levels\":{\"cooking\":0,\"main\":0,\"mining\":0,\"crafting\":0,\"herbalism\":0},\"thirst\":45.0,\"hunger\":73.0,\"inlaststand\":false,\"jobrep\":{\"trucker\":0,\"tow\":0,\"taxi\":0,\"hotdog\":0},\"licences\":{\"weapon\":false},\"phone\":[],\"jailitems\":[],\"status\":[],\"xp\":{\"cooking\":0,\"main\":0,\"mining\":0,\"crafting\":0,\"herbalism\":0},\"criminalrecord\":{\"hasRecord\":false},\"walletid\":\"qb-11904740\",\"fingerprint\":\"ke183g88lJQ1126\"}', '[{\"amount\":1,\"type\":\"weapon\",\"name\":\"weapon_revolver_navy\",\"created\":1691250518,\"slot\":1,\"info\":{\"serie\":\"95EzU5rs164kshT\",\"ammoclip\":0,\"ammo\":0,\"quality\":100}},{\"amount\":1,\"type\":\"weapon\",\"name\":\"weapon_revolver_navy_crossover\",\"created\":1691250068,\"slot\":2,\"info\":{\"serie\":\"67onJ7Ui443argb\",\"ammoclip\":0,\"ammo\":0,\"quality\":100}},{\"amount\":1,\"type\":\"weapon\",\"name\":\"weapon_melee_knife\",\"created\":1691247606,\"slot\":3,\"info\":{\"quality\":100,\"serie\":\"56YJK2kJ549cXnI\"}},{\"amount\":1,\"type\":\"weapon\",\"name\":\"weapon_lasso\",\"created\":1691248786,\"slot\":4,\"info\":{\"serie\":\"72nAS5yn968QPOH\",\"ammoclip\":6,\"ammo\":12,\"quality\":100}},{\"amount\":2,\"type\":\"item\",\"name\":\"bread\",\"created\":1691246890,\"slot\":7,\"info\":{\"quality\":96}},{\"amount\":2,\"type\":\"item\",\"name\":\"water\",\"created\":1691246890,\"slot\":8,\"info\":{\"quality\":100}}]', '2023-08-05 15:50:03'),
(4299, 'JIZ94988', 1, 'license:a36acf9b1be74d753d50b257ca7e0b7644bbf6af', '杰克·弗里斯', '{\"cash\":5000,\"bank\":160,\"bloodmoney\":0}', '{\"phone\":\"2403936747\",\"birthdate\":\"1873-11-15\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Fries\",\"nationality\":\"America\",\"account\":\"QB11755583983\",\"firstname\":\"Jack\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-366.6725158691406,\"y\":725.3802490234375,\"z\":116.4271240234375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-94453576\",\"thirst\":99.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":600,\"fingerprint\":\"gd808o96GCV2106\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":99.0}', '[{\"type\":\"item\",\"created\":1691418200,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691418200,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:22'),
(408, 'JYZ71725', 1, 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', '拒绝', '{\"bloodmoney\":0,\"bank\":10805.0,\"cash\":76647.75}', '{\"phone\":\"8775001645\",\"birthdate\":\"1875-04-04\",\"lastname\":\"洛佩兹\",\"cid\":\"1\",\"gender\":\"undefined\",\"backstory\":\"placeholder backstory\",\"firstname\":\"约瑞克\",\"account\":\"QB24196901423\",\"nationality\":\"美利坚合众国\"}', '{\"onduty\":false,\"grade\":{\"level\":4,\"name\":\"Chief\"},\"type\":\"none\",\"payment\":150,\"label\":\"Law Enforcement\",\"isboss\":true,\"name\":\"police\"}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":1368.2373046875,\"y\":-1320.3033447265626,\"z\":77.2850341796875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-87010494\",\"bloodtype\":\"B+\",\"status\":[],\"fingerprint\":\"Go200R38nnt5131\",\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"thirst\":79.0,\"inside\":{\"apartment\":[]},\"injail\":0,\"phone\":[],\"jailitems\":[],\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":2,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0.05,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"hunger\":92.0,\"commandbinds\":[],\"stress\":57,\"attachmentcraftingrep\":0,\"isdead\":false,\"craftingrep\":0,\"health\":550,\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"ishandcuffed\":false,\"inlaststand\":false}', '[{\"type\":\"item\",\"created\":1691417536,\"name\":\"bread\",\"amount\":6,\"info\":{\"quality\":99},\"slot\":1},{\"type\":\"item\",\"created\":1691242545,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":2},{\"type\":\"item\",\"created\":1691417828,\"name\":\"ammo_repeater\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":3},{\"type\":\"item\",\"created\":1691417830,\"name\":\"ammo_shotgun\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691138462,\"name\":\"ammo_revolver\",\"amount\":31,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"weapon\",\"created\":1691378698,\"name\":\"weapon_kit_binoculars\",\"amount\":1,\"info\":{\"ammoclip\":9,\"quality\":100,\"ammo\":11,\"serie\":\"44mHa4Bg260jqRR\"},\"slot\":6},{\"type\":\"weapon\",\"created\":1691418360,\"name\":\"weapon_melee_lantern\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"35oHU9Gz022bzFG\"},\"slot\":7},{\"type\":\"item\",\"created\":1691137823,\"name\":\"campfire\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691219113,\"name\":\"poor_pronghorn_pelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"weapon\",\"created\":1691417848,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"22pcX3Mm080TKkS\"},\"slot\":12},{\"type\":\"item\",\"created\":1691227556,\"name\":\"carrot\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"weapon\",\"created\":1691235323,\"name\":\"weapon_fishingrod\",\"amount\":1,\"info\":{\"ammoclip\":1,\"quality\":100,\"ammo\":1,\"serie\":\"85UxQ2gp552kJob\"},\"slot\":15},{\"type\":\"weapon\",\"created\":1691336386,\"name\":\"weapon_repeater_winchester\",\"amount\":1,\"info\":{\"ammoclip\":3,\"quality\":100,\"ammo\":3,\"serie\":\"50GzN9Ky169bSpZ\"},\"slot\":16},{\"type\":\"item\",\"created\":1691417752,\"name\":\"horsebrush\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":20},{\"type\":\"weapon\",\"created\":1691417817,\"name\":\"weapon_revolver_navy\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"18bgm9rn857JanX\"},\"slot\":21},{\"type\":\"weapon\",\"created\":1691417838,\"name\":\"weapon_shotgun_doublebarrel\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"41Ufa9EC617eBMB\"},\"slot\":22},{\"type\":\"weapon\",\"created\":1691417878,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"08fzP7Eo079AbYv\"},\"slot\":23},{\"type\":\"item\",\"created\":1691210927,\"name\":\"collie\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":40},{\"type\":\"item\",\"created\":1691328884,\"name\":\"horsetrainingcarrot\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":35},{\"type\":\"item\",\"created\":1691236172,\"name\":\"poor_coyote_pelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":34}]', '2023-08-07 14:31:10'),
(4136, 'KBS04868', 1, 'license:cecda5612d0aeea53aadd14c837c887ca57514df', '曲奇', '{\"cash\":4369.75,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"8821806938\",\"birthdate\":\"1875-06-14\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"roland\",\"nationality\":\"美国\",\"account\":\"QB69740571162\",\"firstname\":\"kidd\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-277.5428466796875,\"y\":786.4483642578125,\"z\":119.4937744140625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-92846221\",\"thirst\":82.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"Nk704o08vJk3190\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"O-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":93.0}', '[{\"type\":\"item\",\"created\":1691417564,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417564,\"name\":\"bread\",\"amount\":4,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"item\",\"created\":1691418479,\"name\":\"ammo_revolver\",\"amount\":20,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691418679,\"name\":\"ammo_repeater\",\"amount\":19,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"weapon\",\"created\":1691418434,\"name\":\"weapon_revolver_schofield\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"80nFq7Bh249aTxB\"},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418439,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"00nkw5kU818IAbW\"},\"slot\":9},{\"type\":\"weapon\",\"created\":1691418492,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"73AYK1Aq372gpGy\"},\"slot\":10},{\"type\":\"item\",\"created\":1691418682,\"name\":\"ammo_rifle\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":14},{\"type\":\"weapon\",\"created\":1691418692,\"name\":\"weapon_repeater_evans\",\"amount\":1,\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":11,\"serie\":\"82Xxw5Hr439iZwt\"},\"slot\":11}]', '2023-08-07 14:31:42'),
(4247, 'KJH93028', 1, 'license:57f38f3c276294e4d91e5eefe3f5bc7c926c4b83', 'szh080314', '{\"cash\":3790.75,\"bank\":160,\"bloodmoney\":0}', '{\"phone\":\"8454919391\",\"birthdate\":\"1881-03-14\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Katarina\",\"firstname\":\"Christina\",\"account\":\"QB64449544433\",\"nationality\":\"USA\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1351.9912109375,\"y\":-1316.4527587890626,\"z\":76.7288818359375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-90578902\",\"thirst\":96.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"ON179V35cWm0818\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":91.0}', '[{\"type\":\"weapon\",\"created\":1691418598,\"name\":\"weapon_kit_binoculars\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"02nkf1iU421GaDf\"},\"slot\":1},{\"type\":\"weapon\",\"created\":1691418468,\"name\":\"weapon_shotgun_semiauto\",\"amount\":1,\"info\":{\"ammoclip\":5,\"quality\":100,\"ammo\":12,\"serie\":\"79UlJ8hj421FaPV\"},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418698,\"name\":\"weapon_pistol_semiauto\",\"amount\":1,\"info\":{\"ammoclip\":8,\"quality\":100,\"ammo\":12,\"serie\":\"77dgz2UE051HYpY\"},\"slot\":3},{\"type\":\"item\",\"created\":1691418595,\"name\":\"goldsmelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691418679,\"name\":\"ammo_shotgun\",\"amount\":16,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418647,\"name\":\"ammo_pistol\",\"amount\":52,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691418043,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":99},\"slot\":8},{\"type\":\"item\",\"created\":1691418043,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":9}]', '2023-08-07 14:31:45'),
(4134, 'LZV92605', 1, 'license:7f7d7d777a6de33682e30f01e56b14954a1c7b61', 'Red Candles', '{\"cash\":4951,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"2167096095\",\"birthdate\":\"1871-09-13\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Candles\",\"nationality\":\"Mexico\",\"account\":\"QB73972623571\",\"firstname\":\"Red\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1326.2373046875,\"y\":-1288.5362548828126,\"z\":77.0322265625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-86725149\",\"thirst\":88.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"ZK062l97pBF6168\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":88.0}', '[{\"type\":\"item\",\"created\":1691417555,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417555,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2}]', '2023-08-07 14:31:26'),
(4201, 'MBX23055', 1, 'license:4c41126d513ab3822cb3c4911dc34e10d5e53316', 'qubajinpingguo', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"9194834479\",\"birthdate\":\"1880-11-03\",\"lastname\":\"罗伯茨\",\"cid\":\"1\",\"gender\":\"undefined\",\"nationality\":\"美国\",\"firstname\":\"赫特\",\"account\":\"QB97337493471\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":-558.3296508789063,\"y\":-3781.120849609375,\"z\":238.6051025390625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-35779032\",\"thirst\":98.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":98.0,\"inside\":{\"apartment\":[]},\"health\":164,\"stress\":0,\"inlaststand\":false,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"jailitems\":[],\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"bloodtype\":\"A+\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"phone\":[],\"ishandcuffed\":false,\"fingerprint\":\"NT133B98WCT9355\"}', '[{\"type\":\"item\",\"created\":1691417881,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417881,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:21'),
(4116, 'NQD81922', 1, 'license:d20e0d071be78e1abdc4b0eff7e1b4683901d1ce', 'Mountiandeer_山鹿', '{\"cash\":2397.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"5277828828\",\"birthdate\":\"1878-09-30\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"马托\",\"nationality\":\"美国\",\"account\":\"QB68627166482\",\"firstname\":\"瑞德\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-325.25274658203127,\"y\":775.068115234375,\"z\":117.5054931640625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-86782447\",\"thirst\":84.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"ut532R55oFF7920\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":84.0}', '[{\"type\":\"item\",\"created\":1691417433,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417433,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418327,\"name\":\"weapon_revolver_lemat\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"36rjX8ec450qprb\"},\"slot\":6},{\"type\":\"weapon\",\"created\":1691418387,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":9,\"quality\":100,\"ammo\":12,\"serie\":\"58QRj2XW149iuiU\"},\"slot\":7},{\"type\":\"item\",\"created\":1691418227,\"name\":\"ammo_revolver\",\"amount\":59,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418286,\"name\":\"weapon_shotgun_semiauto\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"08Ovz2MQ717HrWz\"},\"slot\":9},{\"type\":\"weapon\",\"created\":1691418215,\"name\":\"weapon_revolver_cattleman\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"57rHh0zd242ILmy\"},\"slot\":10},{\"type\":\"weapon\",\"created\":1691418537,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"00mLd7No781dOQx\"},\"slot\":11},{\"type\":\"weapon\",\"created\":1691418357,\"name\":\"weapon_repeater_winchester\",\"amount\":1,\"info\":{\"ammoclip\":5,\"quality\":100,\"ammo\":12,\"serie\":\"28vBU9Ta934mbbJ\"},\"slot\":12},{\"type\":\"item\",\"created\":1691418311,\"name\":\"ammo_shotgun\",\"amount\":19,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"item\",\"created\":1691418298,\"name\":\"ammo_repeater\",\"amount\":99,\"info\":{\"quality\":100},\"slot\":14},{\"type\":\"weapon\",\"created\":1691418291,\"name\":\"weapon_bow\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"96IDx8Nh507lpIr\"},\"slot\":15}]', '2023-08-07 14:31:50'),
(3132, 'QAX90433', 1, 'license:1b239891313dd75cca01c74f7690fcca3128d602', 'Kevinnn', '{\"bloodmoney\":0,\"bank\":4790,\"cash\":79.74000000000001}', '{\"phone\":\"1527263629\",\"birthdate\":\"1899-03-17\",\"lastname\":\"BEN\",\"cid\":\"1\",\"gender\":\"undefined\",\"nationality\":\"America\",\"firstname\":\"KEVIN\",\"account\":\"QB72923557727\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-291.74505615234377,\"y\":763.2263793945313,\"z\":119.5611572265625}', '{\"callsign\":\"NO CALLSIGN\",\"inlaststand\":false,\"walletid\":\"qb-13247859\",\"bloodtype\":\"AB-\",\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"thirst\":70.0,\"inside\":{\"apartment\":[]},\"fingerprint\":\"dJ827H89RmD4722\",\"armor\":0,\"injail\":0,\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"hunger\":70.0,\"jailitems\":[],\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"tow\":0,\"trucker\":0},\"attachmentcraftingrep\":0,\"craftingrep\":0,\"stress\":0,\"health\":600,\"ishandcuffed\":false,\"phone\":[]}', '[{\"type\":\"item\",\"created\":1691258601,\"name\":\"collie\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":2},{\"type\":\"item\",\"created\":1691260965,\"name\":\"ammo_shotgun\",\"amount\":99,\"info\":{\"quality\":100},\"slot\":3},{\"type\":\"weapon\",\"created\":1691338867,\"name\":\"weapon_shotgun_semiauto\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"54XFe2vL657fXVF\"},\"slot\":4},{\"type\":\"item\",\"created\":1691259830,\"name\":\"horseholster\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"item\",\"created\":1691260389,\"name\":\"boatticket\",\"amount\":2,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691259827,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691259826,\"name\":\"horsebrush\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9}]', '2023-08-07 14:32:01'),
(4170, 'QLL77581', 1, 'license:a58779aa4558b4c014d9dc9e490060c19a59a0ad', 'Administrator', '{\"cash\":4633.5,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"3029869337\",\"birthdate\":\"1881-08-03\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"雾雨\",\"nationality\":\"日本\",\"account\":\"QB73695971540\",\"firstname\":\"霖\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-281.5252685546875,\"y\":780.6725463867188,\"z\":119.4937744140625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-77176821\",\"thirst\":90.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"pk970F20NPg4030\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":90.0}', '[{\"type\":\"item\",\"created\":1691417767,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":7},{\"type\":\"weapon\",\"created\":1691418665,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"10UHF1pr193UoKE\"},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418687,\"name\":\"weapon_rifle_boltaction\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"55NnF3xB786QaMk\"},\"slot\":9},{\"type\":\"weapon\",\"created\":1691418691,\"name\":\"weapon_revolver_cattleman\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"62hRu5Ny450VQed\"},\"slot\":10},{\"type\":\"weapon\",\"created\":1691418696,\"name\":\"weapon_bow_improved\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"60kIF1ed482JFBv\"},\"slot\":11},{\"type\":\"item\",\"created\":1691418715,\"name\":\"ammo_revolver\",\"amount\":100,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691417767,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418708,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":1}]', '2023-08-07 14:31:55'),
(4196, 'QOZ64167', 1, 'license:4183261b3d8b3da4c233331ec867bea7b898ba87', 'BAI yun shen', '{\"cash\":4474.5,\"bank\":160,\"bloodmoney\":0}', '{\"phone\":\"3373838334\",\"birthdate\":\"1877-03-02\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Johnson\",\"nationality\":\"America\",\"account\":\"QB79788130267\",\"firstname\":\"Jones\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-282.3824157714844,\"y\":780.5670166015625,\"z\":119.5443115234375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-25202629\",\"thirst\":92.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"Lz572Y24MoN1995\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":92.0}', '[{\"type\":\"item\",\"created\":1691417870,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417870,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":99},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418630,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"02aAY7aK455VYti\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418632,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"97Umj9ga949eONS\"},\"slot\":4},{\"type\":\"weapon\",\"created\":1691418637,\"name\":\"weapon_revolver_schofield\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"61KCJ0nW012YXpU\"},\"slot\":5},{\"type\":\"weapon\",\"created\":1691418644,\"name\":\"weapon_rifle_boltaction\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"82ftE3Gn618AUeO\"},\"slot\":6},{\"type\":\"item\",\"created\":1691418658,\"name\":\"ammo_revolver\",\"amount\":27,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691418649,\"name\":\"ammo_revolver\",\"amount\":8,\"info\":{\"quality\":100},\"slot\":11}]', '2023-08-07 14:31:19');
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(4487, 'QPN74968', 1, 'license:2a1d1af7fe4611978da4a681d7ff1309ab59fe63', 'H4.', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"9023038202\",\"birthdate\":\"1875-11-26\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"赫曼\",\"firstname\":\"哈沃德\",\"account\":\"QB93904181780\",\"nationality\":\"英国\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-562.7077026367188,\"y\":-3776.13623046875,\"z\":238.5882568359375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-50701700\",\"thirst\":100,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":600,\"fingerprint\":\"hV621I06oQy3643\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":100}', '[]', '2023-08-07 14:30:26'),
(4111, 'QWN36957', 1, 'license:123ec56c060e3039c6cf7e054c70a2aa6299a42b', '妈妈生的', '{\"cash\":4831.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"4117392324\",\"birthdate\":\"1878-07-29\",\"lastname\":\"威廉\",\"cid\":\"1\",\"gender\":\"undefined\",\"firstname\":\"伊奇\",\"nationality\":\"美国\",\"account\":\"QB99599281184\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":-336.962646484375,\"y\":786.3956298828125,\"z\":116.814697265625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-71014742\",\"thirst\":86.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":86.0,\"inside\":{\"apartment\":[]},\"health\":550,\"stress\":0,\"inlaststand\":false,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"jailitems\":[],\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"bloodtype\":\"O-\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"phone\":[],\"ishandcuffed\":false,\"fingerprint\":\"fA076Z97RoD5899\"}', '[{\"type\":\"item\",\"created\":1691417392,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417392,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418233,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"58QRj2XW149iuiU\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418329,\"name\":\"weapon_kit_binoculars_improved\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"70pre7FM879pzHa\"},\"slot\":4},{\"type\":\"weapon\",\"created\":1691418294,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"00mLd7No781dOQx\"},\"slot\":5},{\"type\":\"item\",\"created\":1691418369,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418338,\"name\":\"fieldbandage\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691418339,\"name\":\"fieldbandage\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691418340,\"name\":\"fieldbandage\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9}]', '2023-08-07 14:31:35'),
(4125, 'RGL07752', 1, 'license:36ef04f272f948bdd6a464f94b81c1022b100fbd', 'Alberta.Aosta', '{\"cash\":4674.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"8293254410\",\"birthdate\":\"1870-05-11\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"DiAfrenzo\",\"firstname\":\"Alberto\",\"account\":\"QB54205688581\",\"nationality\":\"America\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2512.3251953125,\"y\":-1463.063720703125,\"z\":46.3150634765625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-82929144\",\"thirst\":85.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"dR669h83uHt7968\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":97.0}', '[{\"type\":\"item\",\"created\":1691417495,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417495,\"name\":\"bread\",\"amount\":4,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418571,\"name\":\"weapon_revolver_schofield\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"80nFq7Bh249aTxB\"},\"slot\":3},{\"type\":\"item\",\"created\":1691418447,\"name\":\"ammo_revolver\",\"amount\":30,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691418475,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"item\",\"created\":1691418475,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691418476,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691418476,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418539,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"69Myp6Aq043ALLd\"},\"slot\":9}]', '2023-08-07 14:32:02'),
(4145, 'RNO92585', 1, 'license:8552b037c7c92faa45718bd1858eab3f098f298e', '乐氏', '{\"cash\":4935,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"9511420242\",\"birthdate\":\"1881-11-22\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"egger\",\"nationality\":\"America\",\"account\":\"QB18804814426\",\"firstname\":\"Doug\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2600.3076171875,\"y\":-1206.7384033203126,\"z\":53.3245849609375}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-45466962\",\"thirst\":88.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"Py714O90Dus8423\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":86.0}', '[{\"type\":\"item\",\"created\":1691417628,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417628,\"name\":\"bread\",\"amount\":4,\"info\":{\"quality\":98},\"slot\":2}]', '2023-08-07 14:28:52'),
(4142, 'SGM09003', 1, 'license:f6787ca23f058048efdede1ba13fd77daab19cad', '二娃说我大傻呗', '{\"cash\":4102.0,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"6528443520\",\"birthdate\":\"1875-02-18\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"库彻尔\",\"nationality\":\"美国\",\"account\":\"QB94963585413\",\"firstname\":\"伊登\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2731.81982421875,\"y\":-1286.980224609375,\"z\":49.145751953125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-80102412\",\"thirst\":84.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"yC354V45RGe7484\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"O+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":84.0}', '[{\"type\":\"item\",\"created\":1691417610,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417610,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418622,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"80wwo8QC803AhVz\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418611,\"name\":\"weapon_revolver_lemat\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"72NUO6Ko355xyly\"},\"slot\":6},{\"type\":\"weapon\",\"created\":1691418617,\"name\":\"weapon_revolver_lemat\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"72NUO6Ko355xyly\"},\"slot\":7},{\"type\":\"weapon\",\"created\":1691418624,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"91ppt6dv775VneU\"},\"slot\":9},{\"type\":\"item\",\"created\":1691418628,\"name\":\"ammo_revolver\",\"amount\":200,\"info\":{\"quality\":100},\"slot\":10}]', '2023-08-07 14:31:06'),
(4252, 'SSA19265', 1, 'license:9bbad5f3d4dcda74bdec72a2756d12f988cdfa3d', 'boys', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"7069843127\",\"birthdate\":\"1877-05-21\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Martin\",\"nationality\":\"America\",\"account\":\"QB63722997875\",\"firstname\":\"Chris\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":1260.2901611328126,\"y\":-1303.89892578125,\"z\":76.122314453125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-48349017\",\"thirst\":99.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"dq613C45ozW1335\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":99.0}', '[{\"type\":\"item\",\"created\":1691418056,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691418056,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:23:47'),
(3221, 'STZ39118', 1, 'license:0a8fad39859c6287481916b46f6f28efe8bbf0ee', 'cmknty', '{\"bloodmoney\":0,\"bank\":3080,\"cash\":122.67999999999998}', '{\"phone\":\"4236671017\",\"birthdate\":\"1889-01-01\",\"lastname\":\"barry\",\"cid\":\"1\",\"gender\":\"undefined\",\"backstory\":\"placeholder backstory\",\"firstname\":\"steven\",\"account\":\"QB85979590482\",\"nationality\":\"meiguo\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"isboss\":false,\"name\":\"unemployed\"}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":0.0,\"y\":0.0,\"z\":0.989013671875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-11769277\",\"bloodtype\":\"B-\",\"status\":[],\"fingerprint\":\"wi887k78XXQ6882\",\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"thirst\":88.0,\"inside\":{\"apartment\":[]},\"phone\":[],\"jailitems\":[],\"commandbinds\":[],\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"hunger\":53.0,\"isdead\":false,\"stress\":0,\"attachmentcraftingrep\":0,\"injail\":0,\"craftingrep\":0,\"health\":550,\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"ishandcuffed\":false,\"inlaststand\":false}', '[{\"type\":\"weapon\",\"created\":1691418450,\"name\":\"weapon_shotgun_semiauto\",\"amount\":1,\"info\":{\"ammoclip\":5,\"quality\":100,\"ammo\":12,\"serie\":\"61Kgm7CJ954lJTO\"},\"slot\":1},{\"type\":\"weapon\",\"created\":1691418410,\"name\":\"weapon_pistol_mauser\",\"amount\":1,\"info\":{\"ammoclip\":10,\"quality\":100,\"ammo\":12,\"serie\":\"79fXr7DO344Wptq\"},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418430,\"name\":\"weapon_rifle_elephant\",\"amount\":1,\"info\":{\"ammoclip\":2,\"quality\":100,\"ammo\":12,\"serie\":\"04zNv3ku873ERag\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418332,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"04pgZ2GU653zEeb\"},\"slot\":4},{\"type\":\"item\",\"created\":1691418390,\"name\":\"ammo_pistol\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"item\",\"created\":1691417894,\"name\":\"water\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":6},{\"type\":\"item\",\"created\":1691257984,\"name\":\"water\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691417893,\"name\":\"water\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691417894,\"name\":\"water\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9},{\"type\":\"item\",\"created\":1691418391,\"name\":\"ammo_pistol\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"weapon\",\"created\":1691418540,\"name\":\"weapon_repeater_evans\",\"amount\":1,\"info\":{\"ammoclip\":10,\"quality\":100,\"ammo\":12,\"serie\":\"58KOz3qF847trdJ\"},\"slot\":11},{\"type\":\"item\",\"created\":1691257984,\"name\":\"bread\",\"amount\":4,\"info\":{\"quality\":0},\"slot\":12},{\"type\":\"item\",\"created\":1691417901,\"name\":\"bread\",\"amount\":1,\"info\":{\"quality\":99},\"slot\":13},{\"type\":\"item\",\"created\":1691417901,\"name\":\"bread\",\"amount\":1,\"info\":{\"quality\":99},\"slot\":15},{\"type\":\"item\",\"created\":1691417909,\"name\":\"shovel\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":16},{\"type\":\"item\",\"created\":1691417909,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":17},{\"type\":\"item\",\"created\":1691417908,\"name\":\"axe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":18},{\"type\":\"weapon\",\"created\":1691417919,\"name\":\"weapon_kit_metal_detector\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"44vgG5fg525jVLK\"},\"slot\":19},{\"type\":\"weapon\",\"created\":1691417920,\"name\":\"weapon_kit_binoculars\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"17IKR3vY034iKfS\"},\"slot\":20},{\"type\":\"weapon\",\"created\":1691418660,\"name\":\"weapon_kit_binoculars_improved\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"48vNz1ge808jpDL\"},\"slot\":21},{\"type\":\"item\",\"created\":1691417917,\"name\":\"campfire\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":22},{\"type\":\"item\",\"created\":1691417916,\"name\":\"goldsmelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":23},{\"type\":\"item\",\"created\":1691417915,\"name\":\"goldpan\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":24},{\"type\":\"item\",\"created\":1691417915,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":25},{\"type\":\"item\",\"created\":1691417930,\"name\":\"horsebrush\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":26},{\"type\":\"item\",\"created\":1691418401,\"name\":\"ammo_pistol\",\"amount\":50,\"info\":{\"quality\":100},\"slot\":27},{\"type\":\"item\",\"created\":1691418407,\"name\":\"ammo_rifle_elephant\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":28},{\"type\":\"item\",\"created\":1691418410,\"name\":\"ammo_shotgun\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":29},{\"type\":\"item\",\"created\":1691418586,\"name\":\"carrot\",\"amount\":49,\"info\":{\"quality\":100},\"slot\":30}]', '2023-08-07 14:31:19'),
(4529, 'SYG41663', 1, 'license:797c7eb00444d317ab5229e527583588c4731630', '哇酷哇酷', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"1568137014\",\"birthdate\":\"1880-07-07\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"WHITE\",\"nationality\":\"USA\",\"account\":\"QB21481748576\",\"firstname\":\"TORRES\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-562.918701171875,\"y\":-3776.2548828125,\"z\":238.6219482421875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-21251009\",\"thirst\":100,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":600,\"fingerprint\":\"jQ522p71zTo9132\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":100}', '[]', '2023-08-07 14:32:00'),
(4160, 'TBG33921', 1, 'license:444a09b4de186db3a06cc63d4e18c1b1abb7d565', '周子蜂', '{\"cash\":5000,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"2718625680\",\"birthdate\":\"1877-07-30\",\"lastname\":\"FeniersTaylor\",\"cid\":\"1\",\"gender\":\"undefined\",\"firstname\":\"Barnum\",\"nationality\":\"USA\",\"account\":\"QB77820740597\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":1248.3297119140626,\"y\":-1294.4439697265626,\"z\":77.049072265625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-23540187\",\"thirst\":92.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":92.0,\"inside\":{\"apartment\":[]},\"health\":550,\"stress\":0,\"inlaststand\":false,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"jailitems\":[],\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"bloodtype\":\"O+\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"phone\":[],\"ishandcuffed\":false,\"fingerprint\":\"nz083p12nQI2573\"}', '[{\"type\":\"item\",\"created\":1691417712,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417712,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:28'),
(1045, 'TRX85539', 1, 'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad', '家人们谁懂啊', '{\"bloodmoney\":0,\"bank\":1110,\"cash\":198.59000000000044}', '{\"phone\":\"3441647785\",\"birthdate\":\"1875-01-01\",\"lastname\":\"Darren\",\"cid\":\"1\",\"gender\":\"undefined\",\"backstory\":\"placeholder backstory\",\"nationality\":\"美利坚合众国\",\"account\":\"QB52613755152\",\"firstname\":\"Herbot\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"农场手\"},\"type\":\"none\",\"payment\":25,\"label\":\"农民\",\"name\":\"farmer\",\"isboss\":false}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2163.085693359375,\"y\":-1317.83740234375,\"z\":42.3048095703125}', '{\"callsign\":\"NO CALLSIGN\",\"inlaststand\":false,\"walletid\":\"qb-63422843\",\"bloodtype\":\"B-\",\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"thirst\":39.0,\"inside\":{\"apartment\":[]},\"jailitems\":[],\"fingerprint\":\"bI581g94Odf3829\",\"armor\":0,\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"hunger\":39.0,\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"tow\":0,\"trucker\":0},\"stress\":12,\"craftingrep\":0,\"attachmentcraftingrep\":0,\"health\":550,\"ishandcuffed\":false,\"phone\":[]}', '[{\"type\":\"item\",\"created\":1691238339,\"name\":\"water\",\"amount\":11,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"weapon\",\"created\":1691335478,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"79RqH1WP062GTyp\"},\"slot\":2},{\"type\":\"weapon\",\"created\":1691336630,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":1,\"quality\":100,\"ammo\":0,\"serie\":\"81tkM8Ia887okUr\"},\"slot\":3},{\"type\":\"item\",\"created\":1691333139,\"name\":\"sheperd\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":4},{\"type\":\"item\",\"created\":1691247842,\"name\":\"fertilizer\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":5},{\"type\":\"weapon\",\"created\":1691238136,\"name\":\"weapon_bow_improved\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"83ZJO4aC136JKhu\"},\"slot\":6},{\"type\":\"item\",\"created\":1691333054,\"name\":\"poor_coyote_pelt\",\"amount\":2,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691247919,\"name\":\"bucket\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":8},{\"type\":\"item\",\"created\":1691247845,\"name\":\"wood\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":9},{\"type\":\"item\",\"created\":1691247303,\"name\":\"poor_deer_pelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"item\",\"created\":1691247303,\"name\":\"raw_meat\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":11},{\"type\":\"item\",\"created\":1691330046,\"name\":\"broccoliseed\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691335840,\"name\":\"potatoseed\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"weapon\",\"created\":1691330020,\"name\":\"weapon_revolver_doubleaction_gambler\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"87Lzj9mZ632epIf\"},\"slot\":14},{\"type\":\"item\",\"created\":1691330957,\"name\":\"ammo_repeater\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":15},{\"type\":\"weapon\",\"created\":1691330574,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"97oOd4LS570dASR\"},\"slot\":16},{\"type\":\"item\",\"created\":1691244409,\"name\":\"ammo_varmint\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":17},{\"type\":\"item\",\"created\":1691330186,\"name\":\"bread\",\"amount\":1,\"info\":{\"quality\":0},\"slot\":18},{\"type\":\"item\",\"created\":1691333140,\"name\":\"shovel\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":19},{\"type\":\"weapon\",\"created\":1691330644,\"name\":\"weapon_kit_binoculars_improved\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"95mKM4zO645OjaX\"},\"slot\":20},{\"type\":\"item\",\"created\":1691335709,\"name\":\"bread\",\"amount\":1,\"info\":{\"quality\":3},\"slot\":21},{\"type\":\"weapon\",\"created\":1691245589,\"name\":\"weapon_repeater_carbine\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"92BCR4fS111aNIf\"},\"slot\":22},{\"type\":\"item\",\"created\":1691245511,\"name\":\"goldpan\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":23},{\"type\":\"weapon\",\"created\":1691332780,\"name\":\"weapon_kit_metal_detector\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"93UVY0xG814QFCa\"},\"slot\":25},{\"type\":\"item\",\"created\":1691246621,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":26},{\"type\":\"item\",\"created\":1691246621,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":27},{\"type\":\"item\",\"created\":1691246622,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":28},{\"type\":\"item\",\"created\":1691246622,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":29},{\"type\":\"item\",\"created\":1691246622,\"name\":\"pickaxe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":31},{\"type\":\"item\",\"created\":1691246701,\"name\":\"aluminum\",\"amount\":6,\"info\":{\"quality\":100},\"slot\":32},{\"type\":\"item\",\"created\":1691246701,\"name\":\"copper\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":33},{\"type\":\"item\",\"created\":1691333509,\"name\":\"horsebrush\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":34},{\"type\":\"item\",\"created\":1691333511,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":35},{\"type\":\"item\",\"created\":1691333520,\"name\":\"carrot\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":37},{\"type\":\"item\",\"created\":1691333518,\"name\":\"sugarcube\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":38},{\"type\":\"item\",\"created\":1691333516,\"name\":\"horseholster\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":39},{\"type\":\"item\",\"created\":1691333513,\"name\":\"horseholster\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":40}]', '2023-08-07 14:31:10'),
(4133, 'UCO11528', 1, 'license:c1bfff719a1021904b0d612de4907f554b3d8aa5', '克莱·盖恩斯巴勒', '{\"cash\":5000,\"bank\":150,\"bloodmoney\":0}', '{\"phone\":\"5453749254\",\"birthdate\":\"1879-12-30\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"盖恩斯巴勒\",\"nationality\":\"英国\",\"account\":\"QB58578322379\",\"firstname\":\"克莱\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-562.918701171875,\"y\":-3776.2548828125,\"z\":238.6219482421875}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-31798013\",\"thirst\":100,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":600,\"fingerprint\":\"Xh826H77Wrb4828\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"AB+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":100}', '[]', '2023-08-07 14:12:31'),
(421, 'VJZ77787', 1, 'license:0276bdf83da1af4d549e0c97d4244ed0e1874299', '翻斗花园第一自由人', '{\"bloodmoney\":0,\"bank\":8717,\"cash\":89572.69999999974}', '{\"phone\":\"6919620262\",\"birthdate\":\"1889-01-05\",\"lastname\":\"jhson\",\"cid\":\"1\",\"gender\":\"undefined\",\"backstory\":\"placeholder backstory\",\"firstname\":\"howard\",\"account\":\"QB33428968120\",\"nationality\":\"us\"}', '{\"onduty\":true,\"grade\":{\"level\":4,\"name\":\"Chief\"},\"label\":\"Law Enforcement\",\"isboss\":true,\"payment\":150,\"name\":\"police\",\"type\":\"none\"}', '{\"name\":\"none\",\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":1326.2637939453126,\"y\":-1290.4088134765626,\"z\":77.06591796875}', '{\"callsign\":\"NO CALLSIGN\",\"inlaststand\":false,\"walletid\":\"qb-37595955\",\"bloodtype\":\"AB+\",\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"fingerprint\":\"xC301r89qMh7164\",\"inside\":{\"apartment\":[]},\"armor\":0,\"jailitems\":[],\"stress\":0,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"hunger\":68.0,\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"tow\":0,\"trucker\":0},\"commandbinds\":[],\"attachmentcraftingrep\":0,\"phone\":[],\"injail\":0,\"craftingrep\":0,\"health\":550,\"ishandcuffed\":false,\"thirst\":68.0}', '[{\"type\":\"weapon\",\"created\":1691418064,\"name\":\"weapon_rifle_boltaction\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":12,\"serie\":\"26UXu5Zh473LvFB\"},\"slot\":1},{\"type\":\"weapon\",\"created\":1691418044,\"name\":\"weapon_repeater_henry\",\"amount\":1,\"info\":{\"ammoclip\":14,\"quality\":100,\"ammo\":14,\"serie\":\"82Msm7ki078YyIG\"},\"slot\":2},{\"type\":\"weapon\",\"created\":1691417924,\"name\":\"weapon_revolver_navy\",\"amount\":1,\"info\":{\"ammoclip\":10,\"quality\":100,\"ammo\":10,\"serie\":\"57Foq5Qm231LOeK\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691250309,\"name\":\"weapon_revolver_navy_crossover\",\"amount\":1,\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":9,\"serie\":\"92DOZ4MA347zWvM\"},\"slot\":4},{\"type\":\"weapon\",\"created\":1691250910,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"81GWo5Ph425xnqx\"},\"slot\":5},{\"type\":\"weapon\",\"created\":1691249248,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"ammoclip\":13,\"quality\":100,\"ammo\":24,\"serie\":\"11lcC9XY887aGhI\"},\"slot\":6},{\"type\":\"weapon\",\"created\":1691142942,\"name\":\"weapon_bow\",\"amount\":1,\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":12,\"serie\":\"10SBV5GR632QPyn\"},\"slot\":8},{\"type\":\"item\",\"created\":1691140970,\"name\":\"horsebrush\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9},{\"type\":\"item\",\"created\":1691144755,\"name\":\"ammo_revolver\",\"amount\":4,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691138660,\"name\":\"ammo_varmint\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":14},{\"type\":\"item\",\"created\":1691138737,\"name\":\"ammo_pistol\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":15},{\"type\":\"weapon\",\"created\":1691245032,\"name\":\"weapon_sniperrifle_rollingblock\",\"amount\":1,\"info\":{\"ammoclip\":16,\"quality\":100,\"ammo\":30,\"serie\":\"84hwZ7vp142hbJi\"},\"slot\":16},{\"type\":\"item\",\"created\":1691139213,\"name\":\"fieldbandage\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":18},{\"type\":\"weapon\",\"created\":1691141220,\"name\":\"weapon_kit_binoculars_improved\",\"amount\":1,\"info\":{\"ammoclip\":10,\"quality\":100,\"ammo\":12,\"serie\":\"40uFl9Db421izpv\"},\"slot\":19},{\"type\":\"item\",\"created\":1691139218,\"name\":\"campfire\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":20},{\"type\":\"item\",\"created\":1691139221,\"name\":\"shovel\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":21},{\"type\":\"item\",\"created\":1691139222,\"name\":\"axe\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":22},{\"type\":\"item\",\"created\":1691139223,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":23},{\"type\":\"item\",\"created\":1691140988,\"name\":\"horseholster\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":24},{\"type\":\"weapon\",\"created\":1691417788,\"name\":\"weapon_pistol_mauser\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"15KmK7Zl382RtIS\"},\"slot\":25},{\"type\":\"item\",\"created\":1691140467,\"name\":\"sugarcube\",\"amount\":19,\"info\":{\"quality\":100},\"slot\":26},{\"type\":\"item\",\"created\":1691140467,\"name\":\"carrot\",\"amount\":20,\"info\":{\"quality\":100},\"slot\":27},{\"type\":\"item\",\"created\":1691245829,\"name\":\"poor_deer_pelt\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":28},{\"type\":\"item\",\"created\":1691162789,\"name\":\"water\",\"amount\":10,\"info\":{\"quality\":100},\"slot\":29},{\"type\":\"item\",\"created\":1691165813,\"name\":\"bread\",\"amount\":7,\"info\":{\"quality\":0},\"slot\":30},{\"type\":\"weapon\",\"created\":1691248700,\"name\":\"weapon_pistol_semiauto\",\"amount\":1,\"info\":{\"ammoclip\":10,\"quality\":100,\"ammo\":10,\"serie\":\"09knX7lD824FSRC\"},\"slot\":31},{\"type\":\"weapon\",\"created\":1691417474,\"name\":\"weapon_pistol_volcanic\",\"amount\":1,\"info\":{\"ammoclip\":0,\"quality\":100,\"ammo\":0,\"serie\":\"66ysn3Lb033VMch\"},\"slot\":32},{\"type\":\"weapon\",\"created\":1691418045,\"name\":\"weapon_repeater_winchester\",\"amount\":1,\"info\":{\"ammoclip\":14,\"quality\":100,\"ammo\":14,\"serie\":\"04uwX8Uh290UVMl\"},\"slot\":33},{\"type\":\"item\",\"created\":1691417566,\"name\":\"ammo_rifle\",\"amount\":9,\"info\":{\"quality\":100},\"slot\":34},{\"type\":\"item\",\"created\":1691417697,\"name\":\"ammo_repeater\",\"amount\":9,\"info\":{\"quality\":100},\"slot\":35}]', '2023-08-07 14:31:37'),
(4137, 'WZK10388', 1, 'license:d2a676a68afc728e3dbfe67f8e85d287c80458ae', 'Echo', '{\"cash\":875.3999999999999,\"bank\":4170,\"bloodmoney\":0}', '{\"phone\":\"1307802936\",\"birthdate\":\"1977-12-08\",\"lastname\":\"Jack\",\"cid\":\"1\",\"gender\":\"undefined\",\"firstname\":\"Bob\",\"nationality\":\"美国\",\"account\":\"QB11633884470\",\"backstory\":\"placeholder backstory\"}', '{\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\",\"payment\":10,\"label\":\"Civilian\",\"name\":\"unemployed\",\"isboss\":false}', '{\"name\":\"none\",\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliaton\",\"isboss\":false}', '{\"x\":1328.0966796875,\"y\":-1302.923095703125,\"z\":76.3077392578125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-25937215\",\"thirst\":92.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"hunger\":85.0,\"inside\":{\"apartment\":[]},\"health\":550,\"stress\":0,\"inlaststand\":false,\"levels\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"dealerrep\":0,\"licences\":{\"weapon\":false},\"fitbit\":[],\"xp\":{\"cooking\":0,\"main\":0,\"crafting\":0,\"mining\":0,\"herbalism\":0},\"jailitems\":[],\"injail\":0,\"commandbinds\":[],\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"bloodtype\":\"B+\",\"craftingrep\":0,\"attachmentcraftingrep\":0,\"phone\":[],\"ishandcuffed\":false,\"fingerprint\":\"sM935K62Zus6478\"}', '[{\"type\":\"item\",\"created\":1691417566,\"name\":\"water\",\"amount\":3,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417566,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":99},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418167,\"name\":\"weapon_bow_improved\",\"amount\":1,\"info\":{\"ammoclip\":1,\"quality\":100,\"ammo\":12,\"serie\":\"10hqx1TG429pYtR\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691418478,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"ammoclip\":1,\"quality\":100,\"ammo\":11,\"serie\":\"80bHT7XG924oJjj\"},\"slot\":4},{\"type\":\"weapon\",\"created\":1691418095,\"name\":\"weapon_kit_binoculars_improved\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"16Nsj5HS296aVgx\"},\"slot\":6},{\"type\":\"item\",\"created\":1691418107,\"name\":\"horselantern\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":7},{\"type\":\"item\",\"created\":1691418146,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":9},{\"type\":\"item\",\"created\":1691418146,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"item\",\"created\":1691418147,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":11},{\"type\":\"item\",\"created\":1691418145,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":14},{\"type\":\"item\",\"created\":1691418158,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":15}]', '2023-08-07 14:31:55'),
(4123, 'XDM78973', 1, 'license:2793475af537b20b293f623de8a511d45a3ebfd5', 'Alexandersson', '{\"cash\":2638.350000000001,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"2846561759\",\"birthdate\":\"1870-03-21\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"巴林\",\"nationality\":\"英国\",\"account\":\"QB95134714480\",\"firstname\":\"洛克\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2502.896728515625,\"y\":-1470.6329345703126,\"z\":46.18017578125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-33775037\",\"thirst\":84.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"mc295f17mXe3684\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"B-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":84.0}', '[{\"type\":\"item\",\"created\":1691417473,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417473,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691417995,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"30ebm7JF376eWZY\"},\"slot\":3},{\"type\":\"weapon\",\"created\":1691417998,\"name\":\"weapon_bow_improved\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"29rwK6Em095MhkK\"},\"slot\":4},{\"type\":\"weapon\",\"created\":1691418002,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"48VrJ0Zv244RFdh\"},\"slot\":5},{\"type\":\"weapon\",\"created\":1691418006,\"name\":\"weapon_shotgun_semiauto\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"97trT0Xq727xEhZ\"},\"slot\":6},{\"type\":\"weapon\",\"created\":1691418017,\"name\":\"weapon_rifle_elephant\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"39vUn4jL530IbQX\"},\"slot\":7},{\"type\":\"weapon\",\"created\":1691418025,\"name\":\"weapon_pistol_mauser\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"71svz2aW890mZLr\"},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418033,\"name\":\"weapon_sniperrifle_rollingblock\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"16jKn1Hz986feVs\"},\"slot\":9},{\"type\":\"item\",\"created\":1691418068,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":10},{\"type\":\"item\",\"created\":1691418073,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":11},{\"type\":\"item\",\"created\":1691418074,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691418074,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"item\",\"created\":1691418074,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":14},{\"type\":\"item\",\"created\":1691418074,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":15},{\"type\":\"item\",\"created\":1691418074,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":16},{\"type\":\"item\",\"created\":1691418075,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":17},{\"type\":\"item\",\"created\":1691418075,\"name\":\"ammo_arrow\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":18},{\"type\":\"item\",\"created\":1691418129,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":19},{\"type\":\"item\",\"created\":1691418129,\"name\":\"ammo_revolver\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":20},{\"type\":\"item\",\"created\":1691418139,\"name\":\"ammo_rifle_elephant\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":21},{\"type\":\"item\",\"created\":1691418141,\"name\":\"ammo_rifle\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":22},{\"type\":\"item\",\"created\":1691418143,\"name\":\"ammo_pistol\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":23},{\"type\":\"item\",\"created\":1691418145,\"name\":\"ammo_shotgun\",\"amount\":1,\"info\":{\"quality\":100},\"slot\":24}]', '2023-08-07 14:30:00'),
(4130, 'XRV63387', 1, 'license:a4169e414ada4756281bc2d98cd04d9569e6f207', 'Aur0ra', '{\"cash\":5000,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"9927196707\",\"birthdate\":\"1881-05-27\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"Oakley\",\"firstname\":\"Aurora\",\"account\":\"QB56084769132\",\"nationality\":\"英国\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":-366.962646484375,\"y\":725.5911865234375,\"z\":116.3765869140625}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-41685654\",\"thirst\":93.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"hM861Z98hNV9668\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"O-\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":93.0}', '[{\"type\":\"item\",\"created\":1691417534,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417534,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":2}]', '2023-08-07 14:31:55'),
(4110, 'XUW25145', 1, 'license:1fea790d5d637ce341bab005fcce396d50f561e0', '暗月之剑DarkMoonMS', '{\"cash\":3990.5,\"bank\":170,\"bloodmoney\":0}', '{\"phone\":\"4451789255\",\"birthdate\":\"1877-02-13\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":\"undefined\",\"lastname\":\"葛温\",\"nationality\":\"英国\",\"account\":\"QB88573461861\",\"firstname\":\"德林\"}', '{\"onduty\":true,\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"name\":\"unemployed\",\"label\":\"Civilian\"}', '{\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"},\"label\":\"No Gang Affiliaton\",\"name\":\"none\"}', '{\"x\":2716.641845703125,\"y\":-1285.4373779296876,\"z\":49.6680908203125}', '{\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"walletid\":\"qb-86769816\",\"thirst\":80.0,\"status\":[],\"isdead\":false,\"house\":\"none\",\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"inside\":{\"apartment\":[]},\"health\":550,\"fingerprint\":\"AL611I40CqF6328\",\"licences\":{\"weapon\":false},\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"levels\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"dealerrep\":0,\"phone\":[],\"fitbit\":[],\"xp\":{\"mining\":0,\"main\":0,\"crafting\":0,\"cooking\":0,\"herbalism\":0},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"attachmentcraftingrep\":0,\"bloodtype\":\"O+\",\"injail\":0,\"inlaststand\":false,\"stress\":0,\"ishandcuffed\":false,\"hunger\":80.0}', '[{\"type\":\"item\",\"created\":1691417363,\"name\":\"water\",\"amount\":5,\"info\":{\"quality\":100},\"slot\":1},{\"type\":\"item\",\"created\":1691417363,\"name\":\"bread\",\"amount\":5,\"info\":{\"quality\":98},\"slot\":2},{\"type\":\"weapon\",\"created\":1691418267,\"name\":\"weapon_shotgun_sawedoff\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"31kvf1iq873kISD\"},\"slot\":7},{\"type\":\"weapon\",\"created\":1691418386,\"name\":\"weapon_sniperrifle_rollingblock\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"24Mir7fS143Xatp\"},\"slot\":8},{\"type\":\"weapon\",\"created\":1691418450,\"name\":\"weapon_lasso\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"63sfv4OE664zsYJ\"},\"slot\":9},{\"type\":\"weapon\",\"created\":1691418452,\"name\":\"weapon_melee_knife\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"83qbC1KQ470VSsT\"},\"slot\":10},{\"type\":\"item\",\"created\":1691418472,\"name\":\"ammo_revolver\",\"amount\":99,\"info\":{\"quality\":100},\"slot\":11},{\"type\":\"item\",\"created\":1691418504,\"name\":\"ammo_rifle\",\"amount\":100,\"info\":{\"quality\":100},\"slot\":12},{\"type\":\"item\",\"created\":1691418534,\"name\":\"ammo_shotgun\",\"amount\":9,\"info\":{\"quality\":100},\"slot\":13},{\"type\":\"weapon\",\"created\":1691418607,\"name\":\"weapon_revolver_schofield\",\"amount\":1,\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":12,\"serie\":\"89Qly0oW910GREH\"},\"slot\":6}]', '2023-08-07 14:31:21');

-- --------------------------------------------------------

--
-- 表的结构 `playerskins`
--

CREATE TABLE `playerskins` (
  `citizenid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `license` varchar(255) CHARACTER SET utf8 NOT NULL,
  `skin` varchar(8000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `playerskins`
--

INSERT INTO `playerskins` (`citizenid`, `license`, `skin`) VALUES
('HZT47456', 'license:5aba446d2d44427c152fd59449fe1874f5ef95b4', '{\"sex\":1,\"hair\":{\"model\":\"10\",\"texture\":\"2\"},\"face_width\":5,\"beard\":{\"model\":\"3\",\"texture\":\"2\"},\"head\":6}'),
('JYZ71725', 'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c', '{\"nose_width\":-85,\"nose_height\":100,\"nostrils_distance\":95,\"teeth\":1,\"eyes_depth\":0,\"head\":96,\"eyebrows_c1\":0,\"chest_size\":11,\"height\":100,\"sex\":1,\"eyebrows_op\":100,\"eyelid_width\":0,\"body_waist\":11,\"beard\":{\"texture\":1,\"model\":1},\"nose_curvature\":0,\"hair\":{\"texture\":1,\"model\":4},\"face_width\":0,\"skin_tone\":1,\"eyebrow_width\":35,\"mouth_width\":-5,\"body_size\":2,\"eyebrow_height\":100,\"eyebrows_t\":1,\"nose_size\":15,\"eyes_angle\":0,\"eyes_color\":1,\"nose_angle\":80,\"eyebrow_depth\":0,\"lower_lip_depth\":0,\"eyelid_height\":0,\"eyebrows_id\":10}'),
('VJZ77787', 'license:0276bdf83da1af4d549e0c97d4244ed0e1874299', '{\"body_size\":2,\"eyebrows_id\":10,\"eyebrow_depth\":0,\"eyes_distance\":5,\"beard\":{\"model\":13,\"texture\":8},\"face_width\":25,\"chest_size\":6,\"eyebrows_op\":100,\"hair\":{\"model\":6,\"texture\":6},\"sex\":1,\"eyebrow_width\":30,\"jaw_width\":-35,\"height\":105,\"head\":108,\"eyes_color\":5,\"jaw_height\":-40,\"nose_width\":-20,\"nose_height\":0,\"body_waist\":15,\"eyebrow_height\":70,\"eyes_depth\":35,\"jaw_depth\":65,\"nose_size\":0,\"skin_tone\":1,\"eyes_angle\":15,\"eyebrows_t\":6}'),
('TRX85539', 'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad', '{\"eyebrow_width\":0,\"eyebrows_c1\":0,\"chest_size\":3,\"height\":100,\"eyes_distance\":15,\"eyebrows_op\":100,\"body_waist\":4,\"beard\":{\"model\":14,\"texture\":1},\"eyelid_width\":0,\"hair\":{\"model\":20,\"texture\":1},\"eyebrow_height\":25,\"skin_tone\":1,\"body_size\":3,\"head\":96,\"eyebrows_t\":2,\"face_width\":5,\"sex\":1,\"eyes_color\":1,\"eyes_depth\":15,\"eyebrow_depth\":0,\"eyes_angle\":10,\"eyelid_height\":5,\"eyebrows_id\":10}'),
('IFS18777', 'license:44562c2a70b6cf84446b9ba8f35ca3c50ed315c7', '{\"ears_width\":0,\"eyes_distance\":0,\"beard\":{\"texture\":1,\"model\":2},\"teeth\":1,\"face_width\":10,\"chest_size\":3,\"sex\":1,\"ears_angle\":0,\"head\":48,\"eyes_angle\":0,\"hair\":{\"texture\":1,\"model\":4},\"body_waist\":6,\"eyes_depth\":0,\"body_size\":5,\"eyes_color\":2,\"skin_tone\":1,\"height\":100}'),
('QAX90433', 'license:1b239891313dd75cca01c74f7690fcca3128d602', '{\"body_size\":1,\"scars_op\":0,\"eyes_distance\":-40,\"beard\":{\"texture\":3,\"model\":7},\"eyelid_height\":35,\"face_width\":-100,\"chest_size\":1,\"sex\":1,\"nose_width\":0,\"head\":72,\"hair\":{\"texture\":3,\"model\":9},\"eyes_angle\":50,\"scars_t\":1,\"nose_height\":0,\"body_waist\":1,\"height\":95,\"eyes_depth\":0,\"eyes_color\":2,\"nose_angle\":0,\"skin_tone\":1,\"nose_size\":0,\"nose_curvature\":0}'),
('STZ39118', 'license:0a8fad39859c6287481916b46f6f28efe8bbf0ee', '{\"body_size\":3,\"eyes_distance\":0,\"beard\":{\"texture\":1,\"model\":7},\"eyes_angle\":0,\"skin_tone\":1,\"hair\":{\"texture\":6,\"model\":24},\"face_width\":10,\"head\":78,\"eyes_depth\":0,\"body_waist\":4,\"chest_size\":11,\"eyes_color\":3,\"height\":103,\"sex\":1}'),
('XUW25145', 'license:1fea790d5d637ce341bab005fcce396d50f561e0', '{\"head\":48,\"body_waist\":7,\"beard\":{\"texture\":1,\"model\":0},\"eyes_depth\":0,\"body_size\":3,\"nose_width\":-55,\"nose_angle\":0,\"nose_height\":-40,\"skin_tone\":1,\"eyes_color\":4,\"chest_size\":11,\"nose_curvature\":0,\"hair\":{\"texture\":8,\"model\":5},\"face_width\":0,\"height\":105,\"nose_size\":0,\"sex\":1}'),
('XDM78973', 'license:2793475af537b20b293f623de8a511d45a3ebfd5', '{\"ageing_t\":1,\"body_waist\":6,\"scars_t\":1,\"skin_tone\":1,\"spots_op\":0,\"beard\":{\"texture\":1,\"model\":0},\"scars_op\":30,\"head\":48,\"hair\":{\"texture\":1,\"model\":2},\"face_width\":0,\"chest_size\":1,\"body_size\":2,\"sex\":1}'),
('GNF55729', 'license:a2b8b05e124c8597d2ed4873724e6ec7f5f2a4c0', '{\"height\":105,\"body_waist\":7,\"beard\":{\"texture\":13,\"model\":13},\"skin_tone\":2,\"hair\":{\"texture\":13,\"model\":6},\"eyes_color\":14,\"chest_size\":11,\"head\":78,\"eyes_depth\":30,\"sex\":1,\"face_width\":85,\"eyes_distance\":0,\"eyes_angle\":-5,\"body_size\":3}'),
('KBS04868', 'license:cecda5612d0aeea53aadd14c837c887ca57514df', '{\"head\":12,\"eyes_depth\":0,\"sex\":1,\"face_width\":0,\"hair\":{\"texture\":8,\"model\":7},\"beard\":{\"texture\":1,\"model\":0},\"eyes_color\":4}'),
('QWN36957', 'license:123ec56c060e3039c6cf7e054c70a2aa6299a42b', '{\"eyebrow_width\":-55,\"eyeliners_id\":1,\"chin_width\":70,\"eyebrow_depth\":0,\"body_size\":2,\"nose_width\":-65,\"eyebrows_c1\":2,\"nose_height\":-20,\"ageing_op\":0,\"shadows_c1\":0,\"skin_tone\":2,\"eyeliners_op\":0,\"eyes_color\":13,\"chest_size\":1,\"shadows_op\":0,\"hair\":{\"texture\":7,\"model\":4},\"face_width\":0,\"eyebrows_op\":60,\"chin_depth\":-20,\"blush_c1\":0,\"height\":96,\"body_waist\":5,\"eyeliners_t\":1,\"lipsticks_op\":30,\"eyebrows_t\":1,\"beard\":{\"texture\":1,\"model\":0},\"scars_op\":0,\"eyes_depth\":0,\"ears_angle\":0,\"blush_t\":1,\"lipsticks_id\":1,\"eyeliners_c1\":0,\"shadows_id\":1,\"ageing_t\":1,\"blush_op\":0,\"blush_id\":1,\"lipsticks_t\":1,\"freckles_t\":14,\"sex\":1,\"head\":78,\"eyebrow_height\":0,\"shadows_t\":1,\"eyebrows_id\":10,\"nose_size\":45,\"chin_height\":35,\"freckles_op\":25,\"ears_width\":10,\"lipsticks_c1\":0,\"lipsticks_c2\":2}'),
('RNO92585', 'license:8552b037c7c92faa45718bd1858eab3f098f298e', '{\"height\":100,\"body_waist\":7,\"scars_t\":1,\"skin_tone\":2,\"chest_size\":1,\"head\":12,\"hair\":{\"texture\":1,\"model\":2},\"sex\":1,\"face_width\":0,\"scars_op\":40,\"beard\":{\"texture\":1,\"model\":0},\"body_size\":3}'),
('HZQ37049', 'license:f98e6f8d303f34bdef5cc2961e8327dc76dea55e', '{\"height\":100,\"body_waist\":7,\"head\":12,\"body_size\":3,\"skin_tone\":1,\"eyebrow_width\":0,\"eyes_color\":2,\"chest_size\":1,\"sex\":1,\"eyes_depth\":0,\"hair\":{\"texture\":8,\"model\":2},\"face_width\":0,\"eyebrow_depth\":0,\"beard\":{\"texture\":1,\"model\":0},\"eyebrows_t\":1}'),
('SGM09003', 'license:f6787ca23f058048efdede1ba13fd77daab19cad', '{\"head\":6,\"body_waist\":10,\"eyebrow_height\":5,\"eyebrow_depth\":5,\"eyebrows_t\":2,\"beard\":{\"texture\":1,\"model\":4},\"eyes_depth\":10,\"sex\":1,\"body_size\":3,\"face_width\":0,\"skin_tone\":1,\"eyes_distance\":5,\"height\":104,\"chest_size\":2,\"eyebrows_id\":10,\"eyebrow_width\":5,\"hair\":{\"texture\":1,\"model\":1},\"eyelid_height\":10,\"eyebrows_op\":100,\"eyes_angle\":10,\"eyelid_width\":10}'),
('FIN88567', 'license:90faf4f458f491cf2d409e74d4c85e9ade04c2e5', '{\"head\":1,\"body_waist\":7,\"cheekbones_height\":100,\"skin_tone\":1,\"beard\":{\"texture\":1,\"model\":0},\"hair\":{\"texture\":1,\"model\":2},\"sex\":1,\"face_width\":30,\"height\":101,\"chest_size\":1,\"body_size\":3}'),
('NQD81922', 'license:d20e0d071be78e1abdc4b0eff7e1b4683901d1ce', '{\"head\":1,\"chin_width\":25,\"spots_op\":0,\"jaw_width\":-100,\"body_size\":5,\"nose_width\":-65,\"eyebrows_c1\":0,\"nose_height\":0,\"teeth\":1,\"skin_tone\":1,\"chin_height\":0,\"eyes_color\":1,\"chest_size\":6,\"hair\":{\"texture\":3,\"model\":24},\"eyelid_height\":-25,\"eyebrows_op\":100,\"eyelid_width\":-5,\"body_waist\":5,\"eyebrow_height\":70,\"eyebrows_t\":3,\"beard\":{\"texture\":1,\"model\":0},\"eyes_depth\":100,\"sex\":1,\"mouth_depth\":-35,\"eyeliners_c1\":0,\"eyes_angle\":5,\"mouth_y_pos\":0,\"cheekbones_height\":100,\"mouth_x_pos\":0,\"face_width\":-10,\"eyebrow_width\":35,\"height\":105,\"eyes_distance\":0,\"eyebrows_id\":10,\"jaw_depth\":-70,\"mouth_width\":-20,\"scars_t\":1,\"cheekbones_width\":90,\"cheekbones_depth\":30,\"nose_size\":-40}'),
('WZK10388', 'license:d2a676a68afc728e3dbfe67f8e85d287c80458ae', '{\"eyebrow_depth\":0,\"spots_op\":0,\"jaw_width\":100,\"eyes_angle\":100,\"nose_width\":100,\"nose_angle\":0,\"shadows_c1\":0,\"eyes_color\":5,\"scars_op\":0,\"shadows_op\":0,\"hair\":{\"texture\":3,\"model\":22},\"face_width\":100,\"eyes_distance\":100,\"height\":95,\"body_waist\":21,\"eyeliners_t\":1,\"beard\":{\"texture\":3,\"model\":13},\"shadows_id\":1,\"ageing_t\":3,\"nostrils_distance\":55,\"eyebrows_id\":10,\"nose_size\":100,\"moles_op\":0,\"lower_lip_height\":0,\"eyebrow_width\":100,\"lipsticks_id\":1,\"moles_t\":1,\"blush_t\":4,\"jaw_height\":100,\"eyebrows_c1\":0,\"nose_height\":100,\"teeth\":7,\"ageing_op\":0,\"skin_tone\":3,\"eyeliners_op\":0,\"freckles_op\":100,\"upper_lip_depth\":0,\"eyebrows_op\":100,\"blush_c1\":0,\"eyebrow_height\":100,\"lipsticks_op\":40,\"eyebrows_t\":1,\"head\":84,\"lipsticks_t\":4,\"eyes_depth\":100,\"sex\":1,\"eyeliners_c1\":0,\"mouth_width\":50,\"body_size\":5,\"lipsticks_c1\":0,\"spots_t\":1,\"blush_op\":80,\"blush_id\":1,\"scars_t\":1,\"freckles_t\":4,\"upper_lip_width\":0,\"nose_curvature\":0,\"eyelid_height\":95,\"chest_size\":11,\"eyelid_width\":95,\"mouth_y_pos\":0,\"lipsticks_c2\":0,\"mouth_x_pos\":0,\"mouth_depth\":100,\"eyeliners_id\":1,\"upper_lip_height\":100}'),
('RGL07752', 'license:36ef04f272f948bdd6a464f94b81c1022b100fbd', '{\"head\":12,\"eyebrow_depth\":65,\"jaw_width\":-30,\"body_size\":3,\"nose_width\":-30,\"nose_angle\":5,\"nose_height\":65,\"teeth\":4,\"upper_lip_width\":0,\"skin_tone\":2,\"eyes_color\":2,\"chest_size\":2,\"hair\":{\"texture\":3,\"model\":2},\"eyelid_height\":-10,\"mouth_width\":-5,\"eyelid_width\":5,\"body_waist\":7,\"eyebrow_height\":-10,\"eyebrows_t\":2,\"beard\":{\"texture\":3,\"model\":14},\"eyes_depth\":0,\"sex\":1,\"eyes_angle\":20,\"jaw_depth\":10,\"face_width\":0,\"jaw_height\":-15,\"mouth_x_pos\":0,\"eyebrow_width\":15,\"nostrils_distance\":-10,\"mouth_y_pos\":0,\"upper_lip_height\":0,\"upper_lip_depth\":0,\"mouth_depth\":0,\"lower_lip_width\":0,\"cheekbones_height\":5,\"nose_size\":5,\"eyes_distance\":10,\"height\":101,\"cheekbones_width\":0,\"nose_curvature\":0,\"lower_lip_height\":0}'),
('LZV92605', 'license:7f7d7d777a6de33682e30f01e56b14954a1c7b61', '{\"eyebrow_width\":10,\"moles_t\":1,\"eyebrow_depth\":0,\"spots_op\":0,\"jaw_width\":15,\"blush_t\":1,\"jaw_height\":25,\"spots_t\":1,\"eyebrows_c1\":1,\"nose_height\":15,\"teeth\":4,\"ageing_op\":5,\"shadows_c1\":0,\"skin_tone\":4,\"lower_lip_height\":10,\"eyes_color\":3,\"scars_op\":0,\"upper_lip_depth\":0,\"shadows_op\":0,\"hair\":{\"texture\":3,\"model\":8},\"face_width\":0,\"mouth_width\":10,\"eyebrows_op\":100,\"blush_c1\":1,\"height\":103,\"body_waist\":10,\"nose_width\":20,\"eyebrow_height\":25,\"body_size\":5,\"mouth_y_pos\":0,\"mouth_x_pos\":0,\"eyebrows_t\":6,\"beard\":{\"texture\":3,\"model\":4},\"eyelid_height\":30,\"eyes_depth\":10,\"sex\":1,\"upper_lip_width\":0,\"chest_size\":8,\"nostrils_distance\":0,\"shadows_id\":1,\"ageing_t\":1,\"blush_op\":0,\"blush_id\":3,\"scars_t\":1,\"freckles_t\":1,\"jaw_depth\":25,\"head\":96,\"freckles_op\":0,\"nose_curvature\":0,\"eyebrows_id\":10,\"nose_size\":10,\"nose_angle\":15,\"eyes_angle\":0,\"mouth_depth\":5,\"moles_op\":0,\"upper_lip_height\":10}'),
('HGW24535', 'license:bdb0605af49ab445e510f42ac744a0f7499b9416', '{\"eyebrow_width\":0,\"lipsticks_id\":10,\"eyebrow_depth\":0,\"blush_t\":1,\"nose_width\":100,\"nose_angle\":-15,\"eyebrows_c1\":0,\"nose_height\":65,\"teeth\":1,\"shadows_c1\":0,\"skin_tone\":1,\"eyes_color\":8,\"chest_size\":1,\"shadows_op\":20,\"hair\":{\"texture\":7,\"model\":10},\"face_width\":100,\"mouth_width\":-100,\"blush_c1\":0,\"height\":95,\"body_waist\":1,\"shadows_t\":5,\"eyebrows_t\":11,\"eyes_distance\":0,\"head\":120,\"eyes_depth\":100,\"sex\":2,\"eyebrows_op\":100,\"eyes_angle\":20,\"upper_lip_width\":0,\"shadows_id\":3,\"upper_lip_depth\":0,\"blush_op\":0,\"blush_id\":1,\"mouth_x_pos\":0,\"lower_lip_height\":10,\"mouth_y_pos\":0,\"lower_lip_depth\":0,\"lipsticks_op\":0,\"lower_lip_width\":0,\"eyebrows_id\":24,\"nose_size\":-100,\"nose_curvature\":15,\"body_size\":2,\"mouth_depth\":10,\"lipsticks_t\":1,\"upper_lip_height\":-5}'),
('TBG33921', 'license:444a09b4de186db3a06cc63d4e18c1b1abb7d565', '{\"height\":105,\"body_waist\":15,\"shadows_t\":1,\"hair\":{\"texture\":5,\"model\":20},\"skin_tone\":1,\"sex\":1,\"eyes_color\":5,\"chest_size\":11,\"beard\":{\"texture\":2,\"model\":0},\"eyes_depth\":35,\"body_size\":3,\"face_width\":35,\"eyes_distance\":-5,\"eyes_angle\":25,\"head\":1}'),
('QLL77581', 'license:a58779aa4558b4c014d9dc9e490060c19a59a0ad', '{\"body_waist\":7,\"head\":84,\"blush_id\":1,\"sex\":2,\"beard\":{\"texture\":1,\"model\":0},\"nose_size\":0,\"eyebrow_height\":0,\"eyeliners_t\":1,\"eyebrows_t\":11,\"nose_angle\":0,\"eyebrows_c1\":0,\"eyeliners_op\":60,\"eyes_angle\":0,\"eyeliners_id\":1,\"nose_width\":0,\"lipsticks_op\":25,\"blush_t\":1,\"chest_size\":11,\"nostrils_distance\":0,\"lipsticks_c2\":0,\"eyelid_height\":0,\"lipsticks_c1\":0,\"eyebrows_id\":10,\"eyebrows_op\":80,\"shadows_id\":1,\"eyes_depth\":0,\"lipsticks_id\":1,\"shadows_op\":0,\"shadows_c1\":0,\"height\":98,\"nose_curvature\":0,\"eyebrow_depth\":0,\"blush_c1\":0,\"hair\":{\"texture\":\"1\",\"model\":\"22\"},\"skin_tone\":1,\"face_width\":0,\"eyes_color\":3,\"eyes_distance\":0,\"eyebrow_width\":0,\"nose_height\":0,\"blush_op\":0,\"eyeliners_c1\":0,\"body_size\":3,\"lipsticks_t\":1}'),
('SSA19265', 'license:9bbad5f3d4dcda74bdec72a2756d12f988cdfa3d', '{\"head\":96,\"lipsticks_id\":1,\"eyebrow_depth\":0,\"ears_height\":5,\"lower_lip_depth\":0,\"teeth\":1,\"upper_lip_width\":0,\"skin_tone\":1,\"eyes_color\":2,\"chest_size\":4,\"shadows_op\":0,\"hair\":{\"texture\":2,\"model\":1},\"face_width\":0,\"eyes_distance\":5,\"blush_c1\":0,\"height\":100,\"body_waist\":7,\"lipsticks_op\":0,\"blush_t\":3,\"upper_lip_height\":0,\"eyebrows_t\":14,\"beard\":{\"texture\":1,\"model\":0},\"ears_angle\":0,\"eyes_depth\":10,\"sex\":1,\"shadows_c1\":0,\"body_size\":3,\"upper_lip_depth\":0,\"lipsticks_c1\":0,\"eyes_angle\":5,\"blush_op\":0,\"blush_id\":1,\"mouth_x_pos\":0,\"eyebrows_op\":100,\"shadows_id\":1,\"eyebrow_width\":0,\"lipsticks_t\":4,\"lower_lip_width\":0,\"ears_width\":5,\"mouth_y_pos\":0,\"earlobe_size\":10,\"mouth_width\":0,\"mouth_depth\":0,\"lower_lip_height\":0,\"lipsticks_c2\":0}'),
('AQE87068', 'license:8bb43737a7e7b765aae64dba56f431d26d8c815c', '{\"head\":48,\"eyeliners_id\":1,\"eyebrow_depth\":20,\"jaw_width\":20,\"blush_t\":1,\"jaw_height\":0,\"nose_angle\":0,\"eyebrows_c1\":0,\"nose_height\":30,\"teeth\":6,\"shadows_c1\":0,\"skin_tone\":1,\"chin_height\":-100,\"eyes_color\":9,\"chest_size\":1,\"shadows_op\":10,\"hair\":{\"texture\":1,\"model\":20},\"face_width\":0,\"mouth_width\":-20,\"blush_c1\":0,\"eyelid_width\":20,\"body_waist\":12,\"eyeliners_t\":2,\"shadows_t\":2,\"jaw_depth\":-10,\"eyebrows_op\":70,\"eyeliners_op\":15,\"eyebrows_t\":1,\"beard\":{\"texture\":1,\"model\":0},\"body_size\":3,\"eyes_depth\":-10,\"sex\":1,\"mouth_depth\":15,\"height\":105,\"eyebrow_width\":0,\"shadows_id\":1,\"eyeliners_c1\":0,\"blush_op\":0,\"blush_id\":1,\"nostrils_distance\":20,\"mouth_y_pos\":0,\"nose_size\":50,\"nose_width\":-70,\"eyelid_height\":80,\"eyebrow_height\":30,\"eyebrows_id\":10,\"nose_curvature\":-25,\"cheekbones_depth\":30,\"cheekbones_height\":10,\"cheekbones_width\":10,\"mouth_x_pos\":-10,\"upper_lip_height\":0}'),
('HUC27619', 'license:44ee7546890a391376877ad085d12ec9ff136e20', '{\"head\":120,\"moles_t\":1,\"chin_width\":100,\"eyebrow_depth\":20,\"spots_op\":35,\"eyelid_width\":20,\"body_size\":5,\"jaw_width\":-100,\"eyes_angle\":-20,\"jaw_height\":100,\"spots_t\":1,\"nose_width\":15,\"eyebrows_c1\":7,\"nose_height\":30,\"teeth\":3,\"ageing_op\":30,\"upper_lip_width\":30,\"lower_lip_height\":-10,\"skin_tone\":1,\"chin_height\":-100,\"eyes_color\":5,\"scars_op\":100,\"eyebrow_width\":0,\"shadows_op\":15,\"hair\":{\"texture\":1,\"model\":4},\"face_width\":100,\"eyes_distance\":20,\"chin_depth\":-100,\"sex\":1,\"height\":103,\"body_waist\":2,\"eyelid_height\":60,\"eyebrow_height\":60,\"mouth_x_pos\":0,\"mouth_y_pos\":0,\"upper_lip_depth\":0,\"eyebrows_t\":3,\"beard\":{\"texture\":1,\"model\":0},\"chest_size\":5,\"eyes_depth\":100,\"ears_angle\":0,\"scars_t\":2,\"nose_angle\":15,\"nose_size\":15,\"jaw_depth\":-20,\"ageing_t\":6,\"ears_width\":15,\"ears_height\":30,\"nostrils_distance\":0,\"freckles_t\":1,\"shadows_t\":3,\"eyebrows_op\":100,\"freckles_op\":0,\"lower_lip_width\":30,\"eyebrows_id\":1,\"nose_curvature\":55,\"earlobe_size\":100,\"mouth_width\":15,\"mouth_depth\":0,\"moles_op\":0,\"upper_lip_height\":10}'),
('KJH93028', 'license:57f38f3c276294e4d91e5eefe3f5bc7c926c4b83', '{\"head\":42,\"eyebrow_depth\":5,\"eyes_angle\":5,\"nose_width\":-20,\"nose_angle\":0,\"eyebrows_c1\":1,\"nose_height\":25,\"teeth\":1,\"upper_lip_width\":0,\"skin_tone\":1,\"eyes_color\":4,\"chest_size\":11,\"hair\":{\"texture\":1,\"model\":3},\"face_width\":-10,\"mouth_width\":0,\"height\":97,\"body_waist\":1,\"eyebrow_height\":10,\"eyebrows_t\":2,\"eyes_depth\":0,\"sex\":2,\"body_size\":2,\"eyebrow_width\":15,\"nose_size\":-25,\"upper_lip_depth\":0,\"eyes_distance\":-15,\"mouth_x_pos\":0,\"cheekbones_height\":15,\"nostrils_distance\":-5,\"ears_angle\":20,\"ears_height\":-15,\"eyebrows_op\":90,\"eyebrows_id\":10,\"nose_curvature\":20,\"earlobe_size\":15,\"mouth_y_pos\":0,\"mouth_depth\":0,\"ears_width\":-60,\"upper_lip_height\":0}'),
('QOZ64167', 'license:4183261b3d8b3da4c233331ec867bea7b898ba87', '{\"head\":96,\"moles_t\":1,\"chin_width\":-30,\"eyebrow_depth\":0,\"jaw_width\":-100,\"body_size\":2,\"jaw_height\":100,\"nose_angle\":0,\"nose_height\":0,\"teeth\":1,\"ageing_op\":0,\"upper_lip_width\":20,\"skin_tone\":1,\"chin_height\":-10,\"scars_op\":0,\"upper_lip_depth\":0,\"face_width\":100,\"eyebrows_op\":100,\"chin_depth\":-95,\"height\":103,\"body_waist\":10,\"nose_width\":-100,\"cheekbones_depth\":0,\"eyebrows_t\":1,\"beard\":{\"texture\":1,\"model\":0},\"spots_t\":1,\"lower_lip_depth\":-5,\"sex\":1,\"hair\":{\"texture\":2,\"model\":2},\"mouth_depth\":0,\"upper_lip_height\":20,\"mouth_y_pos\":0,\"ageing_t\":1,\"scars_t\":1,\"nose_curvature\":0,\"mouth_x_pos\":65,\"freckles_t\":1,\"nostrils_distance\":0,\"eyebrow_width\":0,\"cheekbones_height\":-70,\"lower_lip_width\":20,\"mouth_width\":15,\"nose_size\":0,\"chest_size\":1,\"freckles_op\":0,\"cheekbones_width\":-100,\"moles_op\":0,\"lower_lip_height\":20}'),
('CRT19329', 'license:7c692424bdad8bf88653ffc739228aa19178efda', '{\"eyebrow_depth\":80,\"spots_op\":0,\"jaw_width\":5,\"ears_height\":5,\"nose_width\":-40,\"spots_t\":1,\"shadows_c1\":0,\"chin_height\":20,\"eyes_color\":4,\"cheekbones_depth\":10,\"shadows_op\":35,\"hair\":{\"texture\":3,\"model\":1},\"face_width\":5,\"mouth_width\":0,\"chin_depth\":30,\"height\":97,\"body_waist\":1,\"eyeliners_t\":1,\"shadows_t\":3,\"beard\":{\"texture\":2,\"model\":14},\"ears_angle\":5,\"shadows_id\":3,\"ageing_t\":14,\"mouth_x_pos\":0,\"lower_lip_width\":0,\"eyebrows_id\":10,\"nose_size\":45,\"ears_width\":5,\"moles_op\":40,\"lower_lip_height\":0,\"eyebrow_width\":-45,\"eyeliners_id\":1,\"moles_t\":12,\"chin_width\":0,\"blush_t\":1,\"lower_lip_depth\":60,\"eyebrows_c1\":3,\"nose_height\":35,\"ageing_op\":25,\"skin_tone\":2,\"eyeliners_op\":0,\"chest_size\":8,\"upper_lip_depth\":0,\"scars_op\":65,\"eyebrows_op\":100,\"cheekbones_width\":25,\"blush_c1\":0,\"upper_lip_height\":0,\"nostrils_distance\":30,\"eyebrow_height\":0,\"lipsticks_op\":0,\"jaw_height\":50,\"upper_lip_width\":0,\"jaw_depth\":100,\"eyebrows_t\":4,\"eyelid_width\":50,\"head\":72,\"eyes_depth\":-75,\"sex\":1,\"lipsticks_t\":1,\"lipsticks_c2\":0,\"eyes_distance\":10,\"lipsticks_c1\":0,\"nose_curvature\":-15,\"blush_op\":0,\"blush_id\":1,\"scars_t\":6,\"freckles_t\":12,\"freckles_op\":20,\"eyes_angle\":20,\"nose_angle\":25,\"cheekbones_height\":-100,\"lipsticks_id\":1,\"mouth_y_pos\":0,\"earlobe_size\":5,\"eyelid_height\":60,\"mouth_depth\":0,\"body_size\":3,\"eyeliners_c1\":0}'),
('XRV63387', 'license:a4169e414ada4756281bc2d98cd04d9569e6f207', '{\"eyebrow_depth\":0,\"spots_op\":0,\"jaw_width\":-100,\"eyes_angle\":-35,\"nose_width\":-100,\"nose_angle\":40,\"upper_lip_width\":0,\"eyes_color\":2,\"scars_op\":20,\"shadows_op\":30,\"hair\":{\"texture\":10,\"model\":6},\"eyelid_height\":0,\"mouth_width\":0,\"eyelid_width\":0,\"body_waist\":1,\"eyeliners_t\":1,\"shadows_t\":1,\"ears_angle\":0,\"shadows_id\":1,\"ageing_t\":1,\"mouth_x_pos\":0,\"lower_lip_width\":0,\"eyebrows_id\":1,\"nose_curvature\":0,\"cheekbones_width\":-100,\"lipsticks_c2\":2,\"eyebrow_width\":0,\"eyeliners_id\":1,\"blush_t\":1,\"lower_lip_depth\":0,\"eyebrows_c1\":0,\"nose_height\":0,\"teeth\":7,\"ageing_op\":0,\"skin_tone\":1,\"eyeliners_op\":0,\"chest_size\":2,\"upper_lip_depth\":0,\"eyebrows_op\":75,\"blush_c1\":4,\"eyes_distance\":0,\"upper_lip_height\":0,\"lipsticks_op\":40,\"mouth_y_pos\":0,\"cheekbones_depth\":30,\"head\":96,\"eyebrows_t\":14,\"lipsticks_id\":1,\"nostrils_distance\":0,\"eyes_depth\":-20,\"sex\":2,\"body_size\":2,\"ears_height\":0,\"eyebrow_height\":0,\"lipsticks_c1\":50,\"jaw_height\":65,\"blush_op\":0,\"blush_id\":14,\"scars_t\":8,\"freckles_t\":1,\"shadows_c1\":0,\"face_width\":0,\"lower_lip_height\":0,\"height\":95,\"lipsticks_t\":2,\"jaw_depth\":-50,\"earlobe_size\":-15,\"eyeliners_c1\":0,\"mouth_depth\":0,\"nose_size\":80,\"cheekbones_height\":30}'),
('JIZ94988', 'license:a36acf9b1be74d753d50b257ca7e0b7644bbf6af', '{\"eyebrow_width\":0,\"eyebrow_depth\":0,\"jaw_width\":15,\"eyes_angle\":5,\"jaw_height\":65,\"nose_angle\":0,\"eyebrows_c1\":2,\"nose_height\":100,\"teeth\":1,\"ageing_op\":50,\"upper_lip_width\":-50,\"skin_tone\":1,\"eyes_color\":10,\"scars_op\":0,\"shadows_op\":15,\"hair\":{\"texture\":2,\"model\":2},\"face_width\":0,\"eyebrows_op\":50,\"eyelid_width\":100,\"body_waist\":7,\"eyebrow_height\":-60,\"nose_curvature\":0,\"eyebrows_t\":4,\"beard\":{\"texture\":2,\"model\":17},\"head\":78,\"eyes_depth\":0,\"sex\":1,\"shadows_t\":3,\"eyelid_height\":0,\"nose_width\":-100,\"cheekbones_width\":0,\"ageing_t\":1,\"upper_lip_depth\":-100,\"chest_size\":1,\"mouth_x_pos\":0,\"nose_size\":30,\"cheekbones_height\":100,\"body_size\":2,\"lower_lip_height\":-50,\"lower_lip_width\":0,\"eyebrows_id\":10,\"mouth_y_pos\":0,\"eyes_distance\":-40,\"nostrils_distance\":0,\"mouth_depth\":0,\"mouth_width\":25,\"upper_lip_height\":-100}');

-- --------------------------------------------------------

--
-- 表的结构 `player_bills`
--

CREATE TABLE `player_bills` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `player_boats`
--

CREATE TABLE `player_boats` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `player_boats`
--

INSERT INTO `player_boats` (`id`, `citizenid`, `name`, `model`, `location`) VALUES
(1, 'HZT47456', 'Pirogue2 Canoe', 'pirogue2', 'manteca'),
(2, 'HZT47456', 'Swamp Rowboat', 'rowboatSwamp', 'manteca'),
(4, 'JYZ71725', '汽船', 'boatsteam02x', 'manteca');

-- --------------------------------------------------------

--
-- 表的结构 `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `player_horses`
--

CREATE TABLE `player_horses` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `horseid` varchar(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) NOT NULL,
  `horsexp` int(11) DEFAULT 0,
  `saddle` varchar(50) DEFAULT '0',
  `blanket` varchar(50) DEFAULT '0',
  `saddlebag` varchar(50) DEFAULT '0',
  `bedroll` varchar(50) DEFAULT '0',
  `horn` varchar(50) DEFAULT '0',
  `stirrup` varchar(50) DEFAULT '0',
  `mane` varchar(50) DEFAULT '0',
  `tail` varchar(50) DEFAULT '0',
  `mask` varchar(50) DEFAULT '0',
  `mustache` varchar(50) DEFAULT '0',
  `gender` varchar(11) NOT NULL,
  `active` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `player_horses`
--

INSERT INTO `player_horses` (`id`, `citizenid`, `horseid`, `name`, `horse`, `horsexp`, `saddle`, `blanket`, `saddlebag`, `bedroll`, `horn`, `stirrup`, `mane`, `tail`, `mask`, `mustache`, `gender`, `active`) VALUES
(1, 'HZT47456', 'LCW424', 'hahah', 'a_c_horse_gypsycob_splashedpiebald', 0, '1430711162', '1741336375', '1467937844', '180482892', '0', '1739551490', '85079931', '107751023', '1639886344', '0', 'male', 1),
(2, 'JYZ71725', 'UDY751', '阿德勒', 'a_c_horse_kladruber_cremello', 0, '254738501', '2748656013', '3849339572', '1773313477', '4174047011', '3635303678', '0', '107751023', '0', '0', 'male', 0),
(3, 'VJZ77787', 'XKC083', 'hhhhh', 'a_c_horse_kladruber_cremello', 0, '2415718507', '1104489688', '3494429826', '659832507', '276665752', '1484641439', '55899831', '811613109', '0', '0', 'male', 1),
(4, 'JYZ71725', 'WON506', 'Berra', 'a_c_horse_turkoman_darkbay', 535, '254738501', '2748656013', '3849339572', '3529043728', '4174047011', '3635303678', '0', '0', '0', '0', 'female', 1),
(6, 'JYZ71725', 'CCJ271', '1', 'a_c_horse_tennesseewalker_flaxenroan', 0, '254738501', '2969025956', '3849339572', '3529043728', '0', '3635303678', '0', '0', '0', '0', 'male', 0),
(7, 'JYZ71725', 'CGC568', '萝卜', 'a_c_horse_americanstandardbred_lightbuckskin', 524, '254738501', '3989519736', '3849339572', '3529043728', '4174047011', '3635303678', '0', '0', '0', '0', 'male', 0),
(8, 'QAX90433', 'KJY179', 'KEVINNN', 'a_c_horse_tennesseewalker_chestnut', 0, '1276795611', '875108083', '3849339572', '2069222518', '1044410653', '2366359514', '1838420661', '943621875', '3607917546', '0', 'male', 1),
(9, 'JYZ71725', 'QMP236', '11', 'a_c_horse_kladruber_cremello', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'male', 0),
(10, 'STZ39118', 'LHU288', '面团', 'a_c_horse_mustang_reddunovero', 0, '3233825431', '1104489688', '2346782611', '2681838973', '3689327675', '1739551490', '502404946', '101181149', '1969454269', '1419241348', 'male', 1),
(11, 'JYZ71725', 'ZSX652', '饿', 'a_c_horse_dutchwarmblood_chocolateroan', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'male', 0),
(13, 'NQD81922', 'ACS968', 'john', 'a_c_horse_turkoman_darkbay', 0, '2415718507', '263080063', '691935155', '2681838973', '0', '3635303678', '0', '0', '3811019816', '0', 'male', 1),
(14, 'GNF55729', 'PZQ199', 'vivi', 'a_c_horse_kladruber_white', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'male', 1),
(15, 'XDM78973', 'JAK531', 'Carrot', 'a_c_horse_tennesseewalker_chestnut', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'male', 0),
(16, 'GNF55729', 'AFW970', 'viviv', 'a_c_horse_tennesseewalker_chestnut', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'male', 0);

-- --------------------------------------------------------

--
-- 表的结构 `player_housekeys`
--

CREATE TABLE `player_housekeys` (
  `id` int(11) NOT NULL,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(11) NOT NULL,
  `agent` varchar(30) NOT NULL,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL DEFAULT '0',
  `owned` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `player_houses`
--

INSERT INTO `player_houses` (`id`, `agent`, `houseid`, `citizenid`, `fullname`, `owned`, `price`, `credit`) VALUES
(1, 'newhanover', 'house1', '0', '0', 0, 3000, 0),
(2, 'westelizabeth', 'house2', '0', '0', 0, 4000, 0),
(3, 'newhanover', 'house3', '0', '0', 0, 2000, 0),
(4, 'lemoyne', 'house4', '0', '0', 0, 4000, 0),
(5, 'lemoyne', 'house5', '0', '0', 0, 3000, 0),
(6, 'lemoyne', 'house6', '0', '0', 0, 2000, 0),
(7, 'newaustin', 'house7', '0', '0', 0, 2000, 0),
(8, 'newhanover', 'house8', '0', '0', 0, 4000, 0),
(9, 'newhanover', 'house9', '0', '0', 0, 1000, 0),
(10, 'newhanover', 'house10', '0', '0', 0, 4000, 0),
(11, 'lemoyne', 'house11', '0', '0', 0, 4000, 0),
(12, 'lemoyne', 'house12', '0', '0', 0, 4000, 0),
(13, 'lemoyne', 'house13', '0', '0', 0, 5000, 0),
(14, 'lemoyne', 'house14', '0', '0', 0, 4000, 0),
(15, 'lemoyne', 'house15', '0', '0', 0, 2000, 0),
(16, 'lemoyne', 'house16', '0', '0', 0, 3000, 0),
(17, 'newhanover', 'house17', '0', '0', 0, 3000, 0),
(18, 'newhanover', 'house18', '0', '0', 0, 4000, 0),
(19, 'newhanover', 'house19', '0', '0', 0, 500, 0),
(20, 'ambarino', 'house20', '0', '0', 0, 3000, 0),
(21, 'newhanover', 'house21', '0', '0', 0, 2500, 0),
(22, 'ambarino', 'house22', '0', '0', 0, 2000, 0),
(23, 'ambarino', 'house23', '0', '0', 0, 2500, 0),
(24, 'ambarino', 'house24', '0', '0', 0, 1000, 0),
(25, 'westelizabeth', 'house25', '0', '0', 0, 2000, 0),
(26, 'westelizabeth', 'house26', '0', '0', 0, 3500, 0),
(27, 'westelizabeth', 'house27', '0', '0', 0, 1250, 0),
(28, 'westelizabeth', 'house28', '0', '0', 0, 1500, 0),
(29, 'newaustin', 'house29', '0', '0', 0, 1000, 0),
(30, 'newaustin', 'house30', '0', '0', 0, 4000, 0),
(31, 'newaustin', 'house31', '0', '0', 0, 1500, 0),
(32, 'newaustin', 'house32', '0', '0', 0, 1500, 0),
(33, 'newaustin', 'house33', '0', '0', 0, 1250, 0),
(34, 'ambarino', 'house34', '0', '0', 0, 1000, 0),
(35, 'ambarino', 'house35', '0', '0', 0, 1000, 0),
(36, 'newhanover', 'house36', '0', '0', 0, 2000, 0),
(37, 'ambarino', 'house37', '0', '0', 0, 3000, 0),
(38, 'newhanover', 'house38', '0', '0', 0, 750, 0),
(39, 'newhanover', 'house39', '0', '0', 0, 2000, 0),
(40, 'lemoyne', 'house40', '0', '0', 0, 1300, 0),
(41, 'lemoyne', 'house41', '0', '0', 0, 0, 0),
(42, 'ambarino', 'house42', '0', '0', 0, 2500, 0),
(43, 'newaustin', 'house43', '0', '0', 0, 2500, 0),
(44, 'newhanover', 'house44', '0', '0', 0, 3000, 0),
(45, 'lemoyne', 'house45', '0', '0', 0, 10000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `player_plants`
--

CREATE TABLE `player_plants` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `plantid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `player_plants`
--

INSERT INTO `player_plants` (`id`, `citizenid`, `properties`, `plantid`) VALUES
(1, 'JYZ71725', '{\"planttime\":1691205478,\"y\":901.1873168945313,\"planttype\":\"carrot\",\"quality\":58.0,\"hunger\":72.0,\"grace\":false,\"x\":-382.8345947265625,\"z\":116.39137268066406,\"beingHarvested\":false,\"thirst\":76.0,\"planter\":\"JYZ71725\",\"hash\":\"CRP_CARROTS_AA_SIM\",\"growth\":100.0,\"id\":403488}', 403488);

-- --------------------------------------------------------

--
-- 表的结构 `player_rooms`
--

CREATE TABLE `player_rooms` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `location` varchar(30) NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  `roomid` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `player_weapons`
--

CREATE TABLE `player_weapons` (
  `id` int(11) NOT NULL,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `player_weapons`
--

INSERT INTO `player_weapons` (`id`, `serial`, `citizenid`, `components`) VALUES
(1, '06PQs0vE599gFAu', 'HZT47456', '{}'),
(2, '55lCv1JE299cjtG', 'HZT47456', '{}'),
(3, '44mHa4Bg260jqRR', 'JYZ71725', '{}'),
(4, '50GzN9Ky169bSpZ', 'JYZ71725', '{}'),
(5, '30wok9Op472RRgA', 'JYZ71725', '{}'),
(6, '15KmK7Zl382RtIS', 'VJZ77787', '{}'),
(7, '81GWo5Ph425xnqx', 'VJZ77787', '{}'),
(8, '10SBV5GR632QPyn', 'VJZ77787', '{}'),
(9, '04uwX8Uh290UVMl', 'VJZ77787', '{}'),
(10, '79rgn4QH776vJGC', 'HZT47456', '{}'),
(11, '11lcC9XY887aGhI', 'VJZ77787', '{}'),
(12, '82Msm7ki078YyIG', 'VJZ77787', '{}'),
(13, '40uFl9Db421izpv', 'VJZ77787', '{}'),
(14, '70tWN2df543aUmb', 'VJZ77787', '{}'),
(15, '23eCN1nI123xssg', 'VJZ77787', '{}'),
(16, '51dbn5WR072QamA', 'HZT47456', '{}'),
(17, '09knX7lD824FSRC', 'VJZ77787', '{}'),
(18, '66ysn3Lb033VMch', 'VJZ77787', '{}'),
(19, '22pcX3Mm080TKkS', 'JYZ71725', '{}'),
(21, '71zBa6vE342ienY', 'JYZ71725', '{}'),
(22, '87Lzj9mZ632epIf', 'TRX85539', '{}'),
(23, '02dfC3FJ288LNQq', 'TRX85539', '{}'),
(24, '42zjZ4PB082LXwi', 'TRX85539', '{}'),
(25, '84hwZ7vp142hbJi', 'VJZ77787', '{}'),
(26, '26UXu5Zh473LvFB', 'VJZ77787', '{}'),
(27, '85UxQ2gp552kJob', 'JYZ71725', '{}'),
(28, '61hTt1NG789sKzN', 'JYZ71725', '{}'),
(29, '47EPA6sO650QxhD', 'JYZ71725', '{}'),
(30, '74wMq2tI329FHGx', 'JYZ71725', '{}'),
(31, '38SvW0Kb433hoMM', 'JYZ71725', '{}'),
(33, '81tkM8Ia887okUr', 'TRX85539', '{}'),
(34, '79RqH1WP062GTyp', 'TRX85539', '{}'),
(35, '97oOd4LS570dASR', 'TRX85539', '{}'),
(36, '83ZJO4aC136JKhu', 'TRX85539', '{}'),
(37, '92BCR4fS111aNIf', 'TRX85539', '{}'),
(38, '95mKM4zO645OjaX', 'TRX85539', '{}'),
(39, '93UVY0xG814QFCa', 'TRX85539', '{}'),
(40, '92DOZ4MA347zWvM', 'VJZ77787', '{}'),
(41, '95EzU5rs164kshT', 'IFS18777', '{}'),
(42, '67onJ7Ui443argb', 'IFS18777', '{}'),
(43, '72nAS5yn968QPOH', 'IFS18777', '{}'),
(44, '56YJK2kJ549cXnI', 'IFS18777', '{}'),
(45, '54XFe2vL657fXVF', 'QAX90433', '{}'),
(46, '57Foq5Qm231LOeK', 'VJZ77787', '{}'),
(47, '18bgm9rn857JanX', 'JYZ71725', '{}'),
(48, '41Ufa9EC617eBMB', 'JYZ71725', '{}'),
(49, '08fzP7Eo079AbYv', 'JYZ71725', '{}'),
(50, '48vNz1ge808jpDL', 'STZ39118', '{}'),
(51, '44vgG5fg525jVLK', 'STZ39118', '{}'),
(52, '17IKR3vY034iKfS', 'STZ39118', '{}'),
(53, '30ebm7JF376eWZY', 'XDM78973', '{}'),
(54, '29rwK6Em095MhkK', 'XDM78973', '{}'),
(55, '48VrJ0Zv244RFdh', 'XDM78973', '{}'),
(56, '97trT0Xq727xEhZ', 'XDM78973', '{}'),
(57, '39vUn4jL530IbQX', 'XDM78973', '{}'),
(58, '71svz2aW890mZLr', 'XDM78973', '{}'),
(59, '16jKn1Hz986feVs', 'XDM78973', '{}'),
(60, '16Nsj5HS296aVgx', 'WZK10388', '{}'),
(61, '80bHT7XG924oJjj', 'WZK10388', '{}'),
(62, '10hqx1TG429pYtR', 'WZK10388', '{}'),
(63, '57rHh0zd242ILmy', 'NQD81922', '{}'),
(64, '58QRj2XW149iuiU', 'NQD81922', '{}'),
(65, '58QRj2XW149iuiU', 'QWN36957', '{}'),
(66, '10SLO7sJ114xHEp', 'GNF55729', '{}'),
(67, '89Qly0oW910GREH', 'XUW25145', '{}'),
(68, '36rjX8ec450qprb', 'NQD81922', '{}'),
(69, '89Qly0oW910GREH', 'GNF55729', '{}'),
(70, '31kvf1iq873kISD', 'XUW25145', '{}'),
(71, '28vBU9Ta934mbbJ', 'NQD81922', '{}'),
(72, '08Ovz2MQ717HrWz', 'NQD81922', '{}'),
(73, '00mLd7No781dOQx', 'NQD81922', '{}'),
(74, '96IDx8Nh507lpIr', 'NQD81922', '{}'),
(75, '00mLd7No781dOQx', 'QWN36957', '{}'),
(76, '61Kgm7CJ954lJTO', 'STZ39118', '{}'),
(77, '79fXr7DO344Wptq', 'STZ39118', '{}'),
(78, '70pre7FM879pzHa', 'QWN36957', '{}'),
(79, '04zNv3ku873ERag', 'STZ39118', '{}'),
(80, '04pgZ2GU653zEeb', 'STZ39118', '{}'),
(81, '35oHU9Gz022bzFG', 'JYZ71725', '{}'),
(82, '24Mir7fS143Xatp', 'XUW25145', '{}'),
(83, '79UlJ8hj421FaPV', 'KJH93028', '{}'),
(84, '77dgz2UE051HYpY', 'KJH93028', '{}'),
(85, '80nFq7Bh249aTxB', 'KBS04868', '{}'),
(86, '00nkw5kU818IAbW', 'KBS04868', '{}'),
(87, '73AYK1Aq372gpGy', 'KBS04868', '{}'),
(88, '80nFq7Bh249aTxB', 'RGL07752', '{}'),
(89, '63sfv4OE664zsYJ', 'XUW25145', '{}'),
(90, '83qbC1KQ470VSsT', 'XUW25145', '{}'),
(91, '82Xxw5Hr439iZwt', 'KBS04868', '{}'),
(92, '58KOz3qF847trdJ', 'STZ39118', '{}'),
(93, '01hAR4Pm811igfA', 'HZQ37049', '{}'),
(94, '69Myp6Aq043ALLd', 'RGL07752', '{}'),
(95, '02nkf1iU421GaDf', 'KJH93028', '{}'),
(96, '72NUO6Ko355xyly', 'SGM09003', '{}'),
(97, '80wwo8QC803AhVz', 'SGM09003', '{}'),
(98, '91ppt6dv775VneU', 'SGM09003', '{}'),
(99, '02aAY7aK455VYti', 'QOZ64167', '{}'),
(100, '97Umj9ga949eONS', 'QOZ64167', '{}'),
(101, '61KCJ0nW012YXpU', 'QOZ64167', '{}'),
(102, '82ftE3Gn618AUeO', 'QOZ64167', '{}'),
(103, '92LLW9bu342NNYx', 'AQE87068', '{}'),
(104, '87itf9Hw680BkmQ', 'AQE87068', '{}'),
(105, '90IaP7Iu713TWHj', 'AQE87068', '{}'),
(106, '85PaJ5aC664bPXG', 'AQE87068', '{}'),
(107, '10UHF1pr193UoKE', 'QLL77581', '{}'),
(108, '55NnF3xB786QaMk', 'QLL77581', '{}'),
(109, '62hRu5Ny450VQed', 'QLL77581', '{}'),
(110, '60kIF1ed482JFBv', 'QLL77581', '{}'),
(111, '84Sen2Ju045xYSt', 'XUW25145', '{}');

-- --------------------------------------------------------

--
-- 表的结构 `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `stashitems`
--

INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
(9, '1 CCJ271', '[]'),
(26, 'denstoreGNF55729', '[]'),
(22, 'hahah LCW424', '[{\"created\":1691225985,\"type\":\"weapon\",\"slot\":1,\"unique\":true,\"label\":\"望远镜\",\"image\":\"weapon_kit_binoculars.png\",\"name\":\"weapon_kit_binoculars\",\"amount\":1,\"useable\":true,\"weight\":100,\"info\":{\"serie\":\"55lCv1JE299cjtG\",\"ammoclip\":0,\"quality\":100,\"ammo\":0}}]'),
(4, 'house13', '[{\"slot\":1,\"type\":\"weapon\",\"useable\":true,\"label\":\"勒马特\",\"image\":\"weapon_revolver_lemat.png\",\"info\":{\"ammo\":11,\"serie\":\"23eCN1nI123xssg\",\"quality\":100,\"ammoclip\":0},\"weight\":1000,\"unique\":true,\"created\":1691143040,\"amount\":1,\"name\":\"weapon_revolver_lemat\"},{\"slot\":2,\"type\":\"weapon\",\"useable\":true,\"label\":\"毛瑟\",\"image\":\"weapon_pistol_mauser.png\",\"info\":{\"ammo\":20,\"serie\":\"15KmK7Zl382RtIS\",\"quality\":100,\"ammoclip\":10},\"weight\":1000,\"unique\":true,\"created\":1691143202,\"amount\":1,\"name\":\"weapon_pistol_mauser\"}]'),
(8, 'house20', '[]'),
(7, 'house24', '[]'),
(23, 'KEVINNN KJY179', '[]'),
(24, 'policestash_JYZ71725', '[{\"type\":\"item\",\"name\":\"goldpan\",\"useable\":true,\"slot\":1,\"weight\":100,\"amount\":1,\"image\":\"goldpan.png\",\"unique\":false,\"label\":\"金锅\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"potatoseed\",\"useable\":true,\"slot\":2,\"weight\":0,\"amount\":1,\"image\":\"seeds.png\",\"unique\":false,\"label\":\"马铃薯种子\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"horseholster\",\"useable\":true,\"slot\":3,\"weight\":500,\"amount\":1,\"image\":\"horseholster.png\",\"unique\":true,\"label\":\"马皮套\",\"info\":{\"quality\":100}},{\"type\":\"weapon\",\"name\":\"weapon_revolver_lemat\",\"useable\":true,\"slot\":4,\"weight\":1000,\"amount\":1,\"image\":\"weapon_revolver_lemat.png\",\"unique\":true,\"label\":\"勒马特\",\"info\":{\"ammoclip\":9,\"quality\":100,\"ammo\":12,\"serie\":\"71zBa6vE342ienY\"}},{\"type\":\"weapon\",\"name\":\"weapon_revolver_cattleman_mexican\",\"useable\":true,\"slot\":5,\"weight\":1000,\"amount\":1,\"image\":\"weapon_revolver_cattleman_mexican.png\",\"unique\":true,\"label\":\"墨西哥牧牛人\",\"info\":{\"ammoclip\":6,\"quality\":100,\"ammo\":7,\"serie\":\"30wok9Op472RRgA\"}},{\"type\":\"item\",\"name\":\"indtobaccoseed\",\"useable\":true,\"slot\":6,\"weight\":0,\"amount\":8,\"image\":\"indtobaccoseed.png\",\"unique\":false,\"label\":\"Indian Seed\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_crawdad01x\",\"useable\":true,\"slot\":7,\"weight\":10,\"amount\":10,\"image\":\"upgrade_fsh_bait_crayfish.png\",\"unique\":false,\"label\":\"Crawfish Bait\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_baitbread01x\",\"useable\":true,\"slot\":8,\"weight\":10,\"amount\":10,\"image\":\"upgrade_fsh_bait_bread.png\",\"unique\":false,\"label\":\"面包诱饵\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"canteen0\",\"useable\":true,\"slot\":9,\"weight\":100,\"amount\":1,\"image\":\"canteenempty.png\",\"unique\":true,\"label\":\"空荡荡的食堂\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"axe\",\"useable\":true,\"slot\":10,\"weight\":100,\"amount\":1,\"image\":\"axe.png\",\"unique\":false,\"label\":\"Axe\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"shovel\",\"useable\":true,\"slot\":11,\"weight\":100,\"amount\":1,\"image\":\"shovel.png\",\"unique\":false,\"label\":\"Shovel\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_baitcheese01x\",\"useable\":true,\"slot\":12,\"weight\":10,\"amount\":10,\"image\":\"upgrade_fsh_bait_cheese.png\",\"unique\":false,\"label\":\"Cheese Bait\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"aluminum\",\"useable\":true,\"slot\":13,\"weight\":100,\"amount\":4,\"image\":\"aluminum.png\",\"unique\":false,\"label\":\"Aluminum\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"pickaxe\",\"useable\":true,\"slot\":14,\"weight\":100,\"amount\":1,\"image\":\"pickaxe.png\",\"unique\":false,\"label\":\"PickAxe\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_baitworm01x\",\"useable\":true,\"slot\":15,\"weight\":10,\"amount\":9,\"image\":\"upgrade_fsh_bait_worm.png\",\"unique\":false,\"label\":\"Worm Bait\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_baitcorn01x\",\"useable\":true,\"slot\":16,\"weight\":10,\"amount\":10,\"image\":\"upgrade_fsh_bait_corn.png\",\"unique\":false,\"label\":\"玉米饵\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"p_baitcricket01x\",\"useable\":true,\"slot\":17,\"weight\":10,\"amount\":10,\"image\":\"upgrade_fsh_bait_cricket.png\",\"unique\":false,\"label\":\"Cricket Bait\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"fertilizer\",\"useable\":true,\"slot\":18,\"weight\":100,\"amount\":3,\"image\":\"fertilizer.png\",\"unique\":false,\"label\":\"Fertilizer\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"bpcaxe\",\"useable\":true,\"slot\":19,\"weight\":0,\"amount\":1,\"image\":\"bpcaxe.png\",\"unique\":true,\"label\":\"BPC Axe\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"bucket\",\"useable\":true,\"slot\":20,\"weight\":500,\"amount\":10,\"image\":\"bucket.png\",\"unique\":false,\"label\":\"农用桶\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"bpoaxe\",\"useable\":true,\"slot\":21,\"weight\":0,\"amount\":1,\"image\":\"bpoaxe.png\",\"unique\":true,\"label\":\"BPO Axe\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"horsetrainingbrush\",\"useable\":true,\"slot\":22,\"weight\":300,\"amount\":1,\"image\":\"horsebrush.png\",\"unique\":false,\"label\":\"训练刷\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"horsereviver\",\"useable\":true,\"slot\":23,\"weight\":100,\"amount\":1,\"image\":\"consumable_horse_reviver.png\",\"unique\":false,\"label\":\"马治疗包\",\"info\":{\"quality\":100}},{\"type\":\"item\",\"name\":\"indtobacco\",\"useable\":true,\"slot\":24,\"weight\":10,\"amount\":2,\"image\":\"indtobacco.png\",\"unique\":false,\"label\":\"Indian Tobacco\",\"info\":{\"quality\":100}}]'),
(10, 'rhosaloontender', '[]'),
(3, 'rhostoreHZT47456', '[]'),
(6, 'rhostoreJYZ71725', '[]'),
(19, 'rhostoreXFX09270', '[]'),
(1, 'room_2459_blackwater', '[]'),
(12, 'valstoreJYZ71725', '[]'),
(14, 'valstoreTRX85539', '[{\"type\":\"weapon\",\"slot\":1,\"unique\":true,\"label\":\"金属探测器\",\"info\":{\"serie\":\"42zjZ4PB082LXwi\",\"ammoclip\":0,\"quality\":100,\"ammo\":0},\"name\":\"weapon_kit_metal_detector\",\"useable\":true,\"amount\":1,\"weight\":100,\"image\":\"weapon_kit_metal_detector.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":2,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691229972,\"type\":\"item\",\"slot\":3,\"unique\":false,\"label\":\"Rifle (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_rifle\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691230027,\"type\":\"item\",\"slot\":4,\"unique\":false,\"label\":\"Repeater (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_repeater\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":5,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691229973,\"type\":\"item\",\"slot\":6,\"unique\":false,\"label\":\"Varmint (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_varmint\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":7,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":8,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691158094,\"type\":\"item\",\"slot\":9,\"unique\":false,\"label\":\"Elephant Rifle (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_rifle_elephant\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691229973,\"type\":\"item\",\"slot\":10,\"unique\":false,\"label\":\"Varmint (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_varmint\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":11,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691158094,\"type\":\"item\",\"slot\":12,\"unique\":false,\"label\":\"Elephant Rifle (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_rifle_elephant\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"created\":1691229972,\"type\":\"item\",\"slot\":13,\"unique\":false,\"label\":\"Rifle (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_rifle\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"type\":\"item\",\"slot\":14,\"unique\":false,\"label\":\"野战绷带\",\"info\":{\"quality\":100},\"name\":\"fieldbandage\",\"useable\":true,\"amount\":1,\"weight\":50,\"image\":\"fieldbandage.png\"},{\"created\":1691230013,\"type\":\"item\",\"slot\":15,\"unique\":false,\"label\":\"Pistol (N)\",\"info\":{\"quality\":100},\"name\":\"ammo_pistol\",\"useable\":true,\"amount\":1,\"weight\":200,\"image\":\"ammo_bullet_normal.png\"},{\"type\":\"item\",\"slot\":16,\"unique\":false,\"label\":\"马提灯\",\"info\":{\"quality\":100},\"name\":\"horselantern\",\"useable\":true,\"amount\":1,\"weight\":500,\"image\":\"horselantern.png\"}]'),
(11, 'valstoreXFX09270', '[]');

-- --------------------------------------------------------

--
-- 表的结构 `telegrams`
--

CREATE TABLE `telegrams` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendername` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sentDate` varchar(25) NOT NULL,
  `message` varchar(455) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `birdstatus` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `telegrams`
--

INSERT INTO `telegrams` (`id`, `citizenid`, `recipient`, `sender`, `sendername`, `subject`, `sentDate`, `message`, `status`, `birdstatus`) VALUES
(1, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/03/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(2, 'HZT47456', 'oliann michael', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/04/23', 'Your credit for room 2459 in blackwater is due to run out!', '0', 0),
(3, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/04/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(4, 'HZT47456', 'oliann michael', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/04/23', 'Your credit for room 2459 in blackwater is due to run out!', '0', 0),
(5, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/04/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(6, 'HZT47456', 'oliann michael', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/04/23', 'Your credit for room 2459 in blackwater is due to run out!', '0', 0),
(7, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/04/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(8, 'HZT47456', 'oliann michael', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/04/23', 'Your credit for room 2459 in blackwater is due to run out!', '0', 0),
(9, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Ran Out!', '08/04/23', 'Due to lack of tax credit, your house has been repossessed!', '0', 0),
(10, 'HZT47456', 'oliann michael', 'NO-REPLY', 'Hotel Reception', 'Credit Ran Out!', '08/04/23', 'Due to lack of credit, you have been checked out of room 2459 in blackwater. Thanks for choosing our hotel.', '0', 0),
(11, 'VJZ77787', 'howard jhson', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/05/23', 'Your credit for room 9954 in rhodes is due to run out!', '0', 0),
(12, 'VJZ77787', 'howard jhson', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/05/23', 'Your credit for room 9954 in rhodes is due to run out!', '0', 0),
(13, 'VJZ77787', 'howard jhson', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/05/23', 'Your credit for room 9954 in rhodes is due to run out!', '0', 0),
(14, 'VJZ77787', 'howard jhson', 'NO-REPLY', 'Hotel Reception', 'Credit Due to Run Out!', '08/05/23', 'Your credit for room 9954 in rhodes is due to run out!', '0', 0),
(15, 'VJZ77787', 'howard jhson', 'NO-REPLY', 'Hotel Reception', 'Credit Ran Out!', '08/05/23', 'Due to lack of credit, you have been checked out of room 9954 in rhodes. Thanks for choosing our hotel.', '0', 0),
(16, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/05/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(17, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/05/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(18, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/05/23', 'Your land tax credit for your house is due to run out!', '0', 0),
(19, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/05/23', '您的房屋土地税抵免即将到期!', '0', 0),
(20, 'HZT47456', 'oliann michael', '22222222', 'Land Tax Office', 'Land Tax Credit Ran Out!', '08/05/23', '由于缺乏税收抵免，您的房屋已被收回!', '0', 0),
(21, 'TRX85539', 'Herbot Darren', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(22, 'TRX85539', 'Herbot Darren', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(23, 'TRX85539', 'Herbot Darren', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(24, 'TRX85539', 'Herbot Darren', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(25, 'TRX85539', 'Herbot Darren', '22222222', 'Land Tax Office', 'Land Tax Credit Ran Out!', '08/06/23', '由于缺乏税收抵免，您的房屋已被收回!', '0', 0),
(26, 'JYZ71725', '约瑞克 洛佩兹', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(27, 'JYZ71725', '约瑞克 洛佩兹', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(28, 'JYZ71725', '约瑞克 洛佩兹', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(29, 'JYZ71725', '约瑞克 洛佩兹', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/06/23', '您的房屋土地税抵免即将到期!', '0', 0),
(30, 'JYZ71725', '约瑞克 洛佩兹', '22222222', 'Land Tax Office', 'Land Tax Credit Ran Out!', '08/06/23', '由于缺乏税收抵免，您的房屋已被收回!', '0', 0),
(31, 'VJZ77787', 'howard jhson', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/07/23', '您的房屋土地税抵免即将到期!', '0', 0),
(32, 'VJZ77787', 'howard jhson', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/07/23', '您的房屋土地税抵免即将到期!', '0', 0),
(33, 'VJZ77787', 'howard jhson', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/07/23', '您的房屋土地税抵免即将到期!', '0', 0),
(34, 'VJZ77787', 'howard jhson', '22222222', 'Land Tax Office', 'Land Tax Credit Due to Run Out!', '08/07/23', '您的房屋土地税抵免即将到期!', '0', 0),
(35, 'VJZ77787', 'howard jhson', '22222222', 'Land Tax Office', 'Land Tax Credit Ran Out!', '08/07/23', '由于缺乏税收抵免，您的房屋已被收回!', '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `address_book`
--
ALTER TABLE `address_book`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `buisness` (`buisness`),
  ADD KEY `buisnessid` (`buisnessid`),
  ADD KEY `gangid` (`gangid`);

--
-- 表的索引 `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- 表的索引 `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `buisness` (`buisness`),
  ADD KEY `buisnessid` (`buisnessid`),
  ADD KEY `gangid` (`gangid`);

--
-- 表的索引 `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- 表的索引 `indian_plants`
--
ALTER TABLE `indian_plants`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `job_wagons`
--
ALTER TABLE `job_wagons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- 表的索引 `management_menu`
--
ALTER TABLE `management_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `menu_type` (`menu_type`);

--
-- 表的索引 `market_items`
--
ALTER TABLE `market_items`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `market_owner`
--
ALTER TABLE `market_owner`
  ADD PRIMARY KEY (`marketid`);

--
-- 表的索引 `playeroutfit`
--
ALTER TABLE `playeroutfit`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- 表的索引 `playerskins`
--
ALTER TABLE `playerskins`
  ADD KEY `citizenid` (`citizenid`);

--
-- 表的索引 `player_bills`
--
ALTER TABLE `player_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- 表的索引 `player_boats`
--
ALTER TABLE `player_boats`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- 表的索引 `player_horses`
--
ALTER TABLE `player_horses`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_housekeys`
--
ALTER TABLE `player_housekeys`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_plants`
--
ALTER TABLE `player_plants`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_rooms`
--
ALTER TABLE `player_rooms`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- 表的索引 `player_weapons`
--
ALTER TABLE `player_weapons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- 表的索引 `telegrams`
--
ALTER TABLE `telegrams`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `address_book`
--
ALTER TABLE `address_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `doors`
--
ALTER TABLE `doors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用表AUTO_INCREMENT `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `indian_plants`
--
ALTER TABLE `indian_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `job_wagons`
--
ALTER TABLE `job_wagons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- 使用表AUTO_INCREMENT `management_menu`
--
ALTER TABLE `management_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `market_items`
--
ALTER TABLE `market_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `playeroutfit`
--
ALTER TABLE `playeroutfit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4532;

--
-- 使用表AUTO_INCREMENT `player_bills`
--
ALTER TABLE `player_bills`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `player_boats`
--
ALTER TABLE `player_boats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `player_horses`
--
ALTER TABLE `player_horses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `player_housekeys`
--
ALTER TABLE `player_housekeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- 使用表AUTO_INCREMENT `player_plants`
--
ALTER TABLE `player_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `player_rooms`
--
ALTER TABLE `player_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `player_weapons`
--
ALTER TABLE `player_weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- 使用表AUTO_INCREMENT `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用表AUTO_INCREMENT `telegrams`
--
ALTER TABLE `telegrams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 使用表AUTO_INCREMENT `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
