-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 02:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cityguide`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `guests` int(11) NOT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `tour_id`, `booking_date`, `guests`, `status`, `created_at`) VALUES
(1, 1, 1, '2024-11-10', 2, 'confirmed', '2024-11-02 15:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `booking_cart`
--

CREATE TABLE `booking_cart` (
  `booking_id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `per_person_price` decimal(10,2) DEFAULT NULL,
  `total_persons` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_cart`
--

INSERT INTO `booking_cart` (`booking_id`, `destination_id`, `per_person_price`, `total_persons`, `total_price`) VALUES
(1, 1, 100.00, 1, 100.00),
(2, 2, 150.00, 1, 150.00),
(3, 3, 200.00, 1, 200.00),
(4, 4, 180.00, 1, 180.00),
(5, 5, 250.00, 1, 250.00),
(6, 6, 120.00, 1, 120.00),
(7, 7, 80.00, 1, 80.00),
(8, 8, 90.00, 1, 90.00),
(9, 9, 200.00, 1, 200.00),
(14, 10, 150.00, 1, 150.00),
(15, 11, 170.00, 1, 170.00),
(16, 12, 130.00, 1, 130.00),
(17, 13, 180.00, 1, 180.00),
(18, 18, 160.00, 1, 160.00),
(19, 16, 250.00, 1, 250.00),
(20, 17, 300.00, 1, 300.00),
(21, 19, 220.00, 1, 220.00),
(22, 20, 180.00, 1, 180.00),
(23, 21, 140.00, 1, 140.00),
(24, 22, 130.00, 1, 130.00),
(25, 23, 110.00, 1, 110.00),
(26, 2, 100.00, 2, 200.00),
(27, 2, 100.00, 2, 200.00),
(28, 2, 100.00, 2, 200.00),
(29, 2, 100.00, 2, 200.00),
(30, 19, 250.00, 2, 500.00),
(31, 1, 200.00, 2, 400.00),
(32, 1, 200.00, 2, 400.00),
(33, 2, 100.00, 2, 200.00),
(34, 2, 100.00, 2, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `name`, `country`, `description`, `created_at`, `images`) VALUES
(1, 'Karachi', 'Pakistan', '\'Karachi, Pakistan\'s largest metropolis, is a vibrant and diverse city, playing a pivotal role as the country\'s financial and industrial center. The city is an intricate mix of historic heritage and modern developments, reflected in landmarks such as the Mohatta Palace, Frere Hall, and the Port Grand waterfront. Karachi is also known for its expansive coastline, featuring popular beaches like Clifton and French Beach, where locals and tourists enjoy leisure activities. Its culinary landscape is famous for street food delicacies, including biryani and chaat, while upscale restaurants offer international cuisine.\'', '2024-11-02 15:04:20', 'images/Karachi.webp'),
(2, 'Lahore', 'Pakistan', 'Lahore, known as the cultural heart of Pakistan, is a city steeped in history and tradition, boasting magnificent Mughal-era architecture such as the Lahore Fort and the iconic Badshahi Mosque. The city’s vibrant streets are filled with the sounds of bustling markets like Anarkali Bazaar, where local crafts and foods are celebrated. Lahore is also famous for its lush green spaces, including the historic Shalimar Gardens and the expansive Jilani Park. Food lovers from around the world are drawn to its legendary cuisine, from spicy street snacks to gourmet dining in the city\'s many upscale restaurants. The rich tapestry of Lahore\'s art and literature is evident in cultural hubs like Alhamra Arts Council and the annual Lahore Literary Festival.', '2024-11-02 15:12:51', 'images/Lahore.jpg'),
(3, 'Islamabad', 'Pakistan', 'Islamabad, the capital city of Pakistan, is known for its modern architecture and pristine environment, offering a blend of urban development and natural beauty. Dominated by the majestic Faisal Mosque, one of the largest mosques in the world, the city’s skyline reflects elegance and religious importance. The Margalla Hills National Park surrounds the city, providing residents and tourists with lush greenery, hiking trails, and breathtaking views. Islamabad boasts high standards of living, wide boulevards, and well-organized sectors, making it one of the most well-planned cities in South Asia. Cultural attractions like Lok Virsa Museum and the Pakistan Monument celebrate the nation’s diverse heritage. With a focus on safety and cleanliness, Islamabad offers an unparalleled balance of peace and modernity.', '2024-11-02 15:12:51', 'images/Islamabad.jpg'),
(4, 'Quetta', 'Pakistan', 'Quetta, known as the \"Fruit Garden of Pakistan,\" is famous for its diverse orchards producing pomegranates, cherries, and apples. Nestled among the rugged mountains, Quetta’s natural beauty is defined by its scenic landscapes and temperate climate. The city is rich in culture, with traditional Pashtun and Balochi influences evident in its bazaars and local crafts. Historical sites like the Quetta Archaeological Museum and the Hazarganji-Chiltan National Park attract visitors seeking both knowledge and adventure. Despite modern challenges, Quetta remains a vital trade and communication hub in western Pakistan. Its vibrant marketplaces and unique blend of cultures make it an important cultural and economic center.', '2024-11-02 15:12:51', 'images/quetta.jpg'),
(5, 'Peshawar', 'Pakistan', 'Peshawar, one of the oldest cities in South Asia, boasts a rich history dating back thousands of years and serving as a crossroads of diverse civilizations. The city is famous for its historic Qissa Khwani Bazaar, where traders and storytellers have gathered for centuries. Peshawar’s rich Pashtun culture is reflected in its food, music, and hospitality, making it a unique and vibrant place. Landmarks like the Bala Hissar Fort and the Peshawar Museum preserve stories of past empires, including the Mughals and the British. The city is also known for its intricate handicrafts and traditional Chitrali hats. Peshawar remains a blend of ancient heritage and modern growth, contributing to its status as a cultural beacon in Khyber Pakhtunkhwa.', '2024-11-02 15:12:51', 'images/Peshawar.jpg'),
(6, 'Multan', 'Pakistan', 'Multan, often referred to as the \"City of Saints,\" is renowned for its deep spiritual heritage and is home to numerous Sufi shrines and mausoleums. The city’s history dates back thousands of years, making it one of the oldest continuously inhabited cities in the world. Multan is famous for its unique blue pottery, handwoven carpets, and the iconic Multani mangoes. The city’s bazaars are lively, offering a blend of traditional crafts and contemporary products. Architectural marvels like the Tomb of Shah Rukn-e-Alam stand as symbols of Multan’s historical and cultural richness. Despite modern development, Multan maintains its charm with a combination of ancient and new.', '2024-11-02 15:12:51', 'images/Multan.jpg'),
(7, 'Faisalabad', 'Pakistan', 'Faisalabad, known as the \"Manchester of Pakistan,\" is the industrial powerhouse of the country and a major hub for textile production. The city is characterized by its well-planned grid layout and bustling commercial centers. Faisalabad’s Ghanta Ghar (Clock Tower) is a historical landmark that serves as the city’s central point, surrounded by eight converging bazaars. The city is also home to various parks, such as Jinnah Garden, which provides green spaces for leisure. Faisalabad hosts a rich food culture with traditional Punjabi cuisine enjoyed in its vibrant markets. As the third-largest city in Pakistan, Faisalabad continues to thrive economically while preserving its cultural essence.', '2024-11-02 15:12:51', 'images/Faisalabad.jpg'),
(8, 'Hyderabad', 'Pakistan', 'Hyderabad, situated along the banks of the Indus River, is a city rich in history and culture. Known for its strategic significance during various empires, Hyderabad preserves landmarks like the Pakka Qila and the tombs of the Talpur Mirs. The city’s bazaars, such as Shahi Bazaar, are among the oldest and longest in Asia, offering everything from traditional Sindhi crafts to modern goods. Hyderabad’s cuisine, featuring Sindhi biryani and traditional sweets like “laddu,” is famous across the region. The city is also a center for education and industry, contributing to its balanced blend of historical charm and modern growth. Hyderabad stands as a testament to Sindh’s vibrant heritage and evolving economy.', '2024-11-02 15:12:51', 'images/Hyderabad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `contactLastName` varchar(50) DEFAULT NULL,
  `contactFirstName` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `salesRepEmployeeNumber` int(11) DEFAULT NULL,
  `creditLimit` double DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'M'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerNumber`, `customerName`, `contactLastName`, `contactFirstName`, `phone`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`, `country`, `salesRepEmployeeNumber`, `creditLimit`, `email`, `file`, `pwd`, `type`) VALUES
(503, 'Majid2', 'TAHIR', 'TAHIR', 'XCXCX', ' XCX', 'XCX', 'Qandahar', 'XCX', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(504, 'ASAS', 'ASA', 'ASA', 'ASAS', ' ASA', 'ASAS', 'Herat', 'ASAS', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(505, '', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(506, '', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(119, 'La Rochelle Gifts2', 'Labrune2', 'Janine 2', '40.67.85552', '67, rue des Cinquante Otages2', NULL, 'Nantes2', NULL, '440002', 'France', 1370, 118200, '', '', '', 'M'),
(121, 'Baane2 Mini Imports', 'Bergulfsen2', 'Jonas ', '07-98 9555', 'Erling Skakkes gate 78', 'dd', 'Islamabad', 'XCX', '4110', 'Pakistan', 1504, 81700, '', '', '', 'M'),
(502, 'Majid', 'TAHIR', 'TAHIR', 'XCXCX', ' XCX', 'XCX', 'Kabul', 'XCX', 'Afghanistan', 'a', NULL, NULL, '', '', '', 'M'),
(125, 'Havel & Zbyszek Co', 'Piestrzeniewicz', 'Zbyszek ', '(26) 642-7555', 'ul. Filtrowa 68', NULL, 'Warszawa', NULL, '01-012', 'Poland', NULL, 0, '', '', '', 'M'),
(128, 'Blauer2 See Auto, Co.', 'Keitel2', 'Roland', '+49 69 66 90 2555', 'Lyonerstr. 34', 'cxc', 'Jhang', 'xcx', '60528', 'Pakistan', 1504, 59700, '', '', '', 'M'),
(129, 'Mini Wheels Co.', 'Murphy', 'Julie', '6505555787', '5557 North Pendale Street', '', 'San Francisco', 'pakistan', '94217', 'USA', 1165, 64600, '', '', '', 'M'),
(131, 'Land of Toys Inc.', 'Lee', 'Kwai', '2125557818', '897 Long Airport Avenue', '', 'Multan', 'NY', '10022', 'Pakistan', 1323, 114900, '', '', '', 'M'),
(141, 'Euro+ Shopping Channel', 'Freyre', 'Diego ', '(91) 555 94 44', 'C/ Moralzarzal, 86', NULL, 'Madrid', NULL, '28034', 'Spain', 1370, 227600, '', '', '', 'M'),
(144, 'Volvo Model Replicas, Co', 'Berglund', 'Christina ', '0921-12 3555', 'Berguvsvägen  8', NULL, 'Luleå', NULL, 'S-958 22', 'Sweden', 1504, 53100, '', '', '', 'M'),
(145, 'Danish Wholesale Imports', 'Petersen', 'Jytte ', '31 12 3555', 'Vinbæltet 34', NULL, 'Kobenhavn', NULL, '1734', 'Denmark', 1401, 83400, '', '', '', 'M'),
(146, 'Saveley & Henriot, Co.', 'Saveley', 'Mary ', '78.32.5555', '2, rue du Commerce', NULL, 'Lyon', NULL, '69004', 'France', 1337, 123900, '', '', '', 'M'),
(148, 'Dragon Souveniers, Ltd.', 'Natividad', 'Eric', '+65 221 7555', 'Bronz Sok.', 'Bronz Apt. 3/6 Tesvikiye', 'Singapore', NULL, '079903', 'Singapore', 1621, 103800, '', '', '', 'M'),
(151, 'Muscle Machine Inc', 'Young', 'Jeff', '2125557413', '4092 Furth Circle', 'Suite 400', 'NYC', 'NY', '10022', 'USA', 1286, 138500, '', '', '', 'M'),
(157, 'Diecast Classics Inc.', 'Leong', 'Kelvin', '2155551555', '7586 Pompton St.', NULL, 'Allentown', 'PA', '70267', 'USA', 1216, 100600, '', '', '', 'M'),
(161, 'Technics Stores Inc.', 'Hashimoto', 'Juri', '6505556809', '9408 Furth Circle', NULL, 'Burlingame', 'CA', '94217', 'USA', 1165, 84600, '', '', '', 'M'),
(166, 'Handji Gifts& Co', 'Victorino', 'Wendy', '+65 224 1555', '106 Linden Road Sandown', '2nd Floor', 'Singapore', NULL, '069045', 'Singapore', 1612, 97900, '', '', '', 'M'),
(167, 'Herkku Gifts', 'Oeztan', 'Veysel', '+47 2267 3215', 'Brehmen St. 121', 'PR 334 Sentrum', 'Bergen', NULL, 'N 5804', 'Norway  ', 1504, 96800, '', '', '', 'M'),
(168, 'American Souvenirs Inc', 'Franco', 'Keith', '2035557845', '149 Spinnaker Dr.', 'Suite 101', 'New Haven', 'CT', '97823', 'USA', 1286, 0, '', '', '', 'M'),
(169, 'Porto Imports Co.', 'de Castro', 'Isabel ', '(1) 356-5555', 'Estrada da saúde n. 58', NULL, 'Lisboa', NULL, '1756', 'Portugal', NULL, 0, '', '', '', 'M'),
(171, 'Daedalus Designs Imports', 'Rancé', 'Martine ', '20.16.1555', '184, chaussée de Tournai', NULL, 'Lille', NULL, '59000', 'France', 1370, 82900, '', '', '', 'M'),
(172, 'La Corne D\'abondance, Co.', 'Bertrand', 'Marie', '(1) 42.34.2555', '265, boulevard Charonne', NULL, 'Paris', NULL, '75012', 'France', 1337, 84300, '', '', '', 'M'),
(173, 'Cambridge Collectables Co.', 'Tseng', 'Jerry', '6175555555', '4658 Baden Av.', NULL, 'Cambridge', 'MA', '51247', 'USA', 1188, 43400, '', '', '', 'M'),
(175, 'Gift Depot Inc.', 'King', 'Julie', '2035552570', '25593 South Bay Ln.', NULL, 'Bridgewater', 'CT', '97562', 'USA', 1323, 84300, '', '', '', 'M'),
(177, 'Osaka Souveniers Co.', 'Kentary', 'Mory', '+81 06 6342 5555', '1-6-20 Dojima', NULL, 'Kita-ku', 'Osaka', ' 530-0003', 'Japan', 1621, 81200, '', '', '', 'M'),
(181, 'Vitachrome Inc.', 'Frick', 'Michael', '2125551500', '2678 Kingston Rd.', 'Suite 101', 'NYC', 'NY', '10022', 'USA', 1286, 76400, '', '', '', 'M'),
(186, 'Toys of Finland, Co.', 'Karttunen', 'Matti', '90-224 8555', 'Keskuskatu 45', NULL, 'Helsinki', NULL, '21240', 'Finland', 1501, 96500, '', '', '', 'M'),
(187, 'AV Stores, Co.', 'Ashworth', 'Rachel', '(171) 555-1555', 'Fauntleroy Circus', NULL, 'Manchester', NULL, 'EC2 5NT', 'UK', 1501, 136800, '', '', '', 'M'),
(189, 'Clover Collections, Co.', 'Cassidy', 'Dean', '+353 1862 1555', '25 Maiden Lane', 'Floor No. 4', 'Dublin', NULL, '2', 'Ireland', 1504, 69400, '', '', '', 'M'),
(198, 'Auto-Moto Classics Inc.', 'Taylor', 'Leslie', '6175558428', '16780 Pompton St.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1216, 23000, '', '', '', 'M'),
(201, 'UK Collectables, Ltd.', 'Devon', 'Elizabeth', '(171) 555-2282', '12, Berkeley Gardens Blvd', NULL, 'Liverpool', NULL, 'WX1 6LT', 'UK', 1501, 92700, '', '', '', 'M'),
(202, 'Canadian Gift Exchange Network', 'Tamuri', 'Yoshi ', '(604) 555-3392', '1900 Oak St.', NULL, 'Vancouver', 'BC', 'V3F 2K1', 'Canada', 1323, 90300, '', '', '', 'M'),
(204, 'Online Mini Collectables', 'Barajas', 'Miguel', '6175557555', '7635 Spinnaker Dr.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1188, 68700, '', '', '', 'M'),
(205, 'Toys4GrownUps.com', 'Young', 'Julie', '6265557265', '78934 Hillside Dr.', NULL, 'Pasadena', 'CA', '90003', 'USA', 1166, 90700, '', '', '', 'M'),
(206, 'Asian Shopping Network, Co', 'Walker', 'Brydey', '+612 9411 1555', 'Suntec Tower Three', '8 Temasek', 'Singapore', NULL, '038988', 'Singapore', NULL, 0, '', '', '', 'M'),
(209, 'Mini Caravy', 'Citeaux', 'Frédérique ', '88.60.1555', '24, place Kléber', NULL, 'Strasbourg', NULL, '67000', 'France', 1370, 53800, '', '', '', 'M'),
(211, 'King Kong Collectables, Co.', 'Gao', 'Mike', '+852 2251 1555', 'Bank of China Tower', '1 Garden Road', 'Central Hong Kong', NULL, NULL, 'Hong Kong', 1621, 58600, '', '', '', 'M'),
(216, 'Enaco Distributors', 'Saavedra', 'Eduardo ', '(93) 203 4555', 'Rambla de Cataluña, 23', NULL, 'Barcelona', NULL, '08022', 'Spain', 1702, 60300, '', '', '', 'M'),
(219, 'Boards & Toys Co.', 'Young', 'Mary', '3105552373', '4097 Douglas Av.', NULL, 'Glendale', 'CA', '92561', 'USA', 1166, 11000, '', '', '', 'M'),
(223, 'Natürlich Autos', 'Kloss', 'Horst ', '0372-555188', 'Taucherstraße 10', NULL, 'Cunewalde', NULL, '01307', 'Germany', NULL, 0, '', '', '', 'M'),
(227, 'Heintze Collectables', 'Ibsen', 'Palle', '86 21 3555', 'Smagsloget 45', NULL, 'Århus', NULL, '8200', 'Denmark', 1401, 120800, '', '', '', 'M'),
(233, 'Québec Home Shopping Network', 'Fresnière', 'Jean ', '(514) 555-8054', '43 rue St. Laurent', NULL, 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 1286, 48700, '', '', '', 'M'),
(237, 'ANG Resellers', 'Camino', 'Alejandra ', '(91) 745 6555', 'Gran Vía, 1', NULL, 'Madrid', NULL, '28001', 'Spain', NULL, 0, '', '', '', 'M'),
(239, 'Collectable Mini Designs Co.', 'Thompson', 'Valarie', '7605558146', '361 Furth Circle', NULL, 'San Diego', 'CA', '91217', 'USA', 1166, 105000, '', '', '', 'M'),
(240, 'giftsbymail.co.uk', 'Bennett', 'Helen ', '(198) 555-8888', 'Garden House', 'Crowther Way 23', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 1501, 93900, '', '', '', 'M'),
(242, 'Alpha Cognac', 'Roulet', 'Annette ', '61.77.6555', '1 rue Alsace-Lorraine', NULL, 'Toulouse', NULL, '31000', 'France', 1370, 61100, '', '', '', 'M'),
(247, 'Messner Shopping Network', 'Messner', 'Renate ', '069-0555984', 'Magazinweg 7', NULL, 'Frankfurt', NULL, '60528', 'Germany', NULL, 0, '', '', '', 'M'),
(249, 'Amica Models & Co.', 'Accorti', 'Paolo ', '011-4988555', 'Via Monte Bianco 34', NULL, 'Torino', NULL, '10100', 'Italy', 1401, 113000, '', '', '', 'M'),
(250, 'Lyon Souveniers', 'Da Silva', 'Daniel', '+33 1 46 62 7555', '27 rue du Colonel Pierre Avia', NULL, 'Paris', NULL, '75508', 'France', 1337, 68100, '', '', '', 'M'),
(256, 'Auto Associés & Cie.', 'Tonini', 'Daniel ', '30.59.8555', '67, avenue de l\'Europe', NULL, 'Versailles', NULL, '78000', 'France', 1370, 77900, '', '', '', 'M'),
(259, 'Toms Spezialitäten, Ltd', 'Pfalzheim', 'Henriette ', '0221-5554327', 'Mehrheimerstr. 369', NULL, 'Köln', NULL, '50739', 'Germany', 1504, 120400, '', '', '', 'M'),
(260, 'Royal Canadian Collectables, Ltd.', 'Lincoln', 'Elizabeth ', '(604) 555-4555', '23 Tsawassen Blvd.', NULL, 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 1323, 89600, '', '', '', 'M'),
(273, 'Franken Gifts, Co', 'Franken', 'Peter ', '089-0877555', 'Berliner Platz 43', NULL, 'München', NULL, '80805', 'Germany', NULL, 0, '', '', '', 'M'),
(507, '', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(508, '', '', '', '', ' ', '', 'Karachi', '', 'Pakistan', 'Pakistan', NULL, NULL, '', '', '', 'M'),
(278, 'Rovelli Gifts', 'Rovelli', 'Giovanni ', '035-640555', 'Via Ludovico il Moro 22', NULL, 'Bergamo', NULL, '24100', 'Italy', 1401, 119600, '', '', '', 'M'),
(499, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', NULL, NULL, '', '', '', 'M'),
(500, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', NULL, NULL, '', '', '', 'M'),
(286, 'Marta\'s Replicas Co.', 'Hernandez', 'Marta', '6175558555', '39323 Spinnaker Dr.', NULL, 'Cambridge', 'MA', '51247', 'USA', 1216, 123700, '', '', '', 'M'),
(293, 'BG&E Collectables', 'Harrison', 'Ed', '+41 26 425 50 01', 'Rte des Arsenaux 41 ', NULL, 'Fribourg', NULL, '1700', 'Switzerland', NULL, 0, '', '', '', 'M'),
(298, 'Vida Sport, Ltd', 'Holz', 'Mihael', '0897-034555', 'Grenzacherweg 237', NULL, 'Genève', NULL, '1203', 'Switzerland', 1702, 141300, '', '', '', 'M'),
(299, 'Norway Gifts By Mail, Co.', 'Klaeboe', 'Jan', '+47 2212 1555', 'Drammensveien 126A', 'PB 211 Sentrum', 'Oslo', NULL, 'N 0106', 'Norway  ', 1504, 95100, '', '', '', 'M'),
(303, 'Schuyler Imports', 'Schuyler', 'Bradley', '+31 20 491 9555', 'Kingsfordweg 151', NULL, 'Amsterdam', NULL, '1043 GR', 'Netherlands', NULL, 0, '', '', '', 'M'),
(307, 'Der Hund Imports', 'Andersen', 'Mel', '030-0074555', 'Obere Str. 57', NULL, 'Berlin', NULL, '12209', 'Germany', NULL, 0, '', '', '', 'M'),
(311, 'Oulu Toy Supplies, Inc.', 'Koskitalo', 'Pirkko', '981-443655', 'Torikatu 38', NULL, 'Oulu', NULL, '90110', 'Finland', 1501, 90500, '', '', '', 'M'),
(314, 'Petit Auto', 'Dewey', 'Catherine ', '(02) 5554 67', 'Rue Joseph-Bens 532', NULL, 'Bruxelles', NULL, 'B-1180', 'Belgium', 1401, 79900, '', '', '', 'M'),
(319, 'Mini Classics', 'Frick', 'Steve', '9145554562', '3758 North Pendale Street', NULL, 'White Plains', 'NY', '24067', 'USA', 1323, 102700, '', '', '', 'M'),
(320, 'Mini Creations Ltd.', 'Huang', 'Wing', '5085559555', '4575 Hillside Dr.', NULL, 'New Bedford', 'MA', '50553', 'USA', 1188, 94500, '', '', '', 'M'),
(321, 'Corporate Gift Ideas Co.', 'Brown', 'Julie', '6505551386', '7734 Strong St.', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, 105000, '', '', '', 'M'),
(323, 'Down Under Souveniers, Inc', 'Graham', 'Mike', '+64 9 312 5555', '162-164 Grafton Road', 'Level 2', 'Auckland  ', NULL, NULL, 'New Zealand', 1612, 88000, '', '', '', 'M'),
(324, 'Stylish Desk Decors, Co.', 'Brown', 'Ann ', '(171) 555-0297', '35 King George', NULL, 'London', NULL, 'WX3 6FW', 'UK', 1501, 77000, '', '', '', 'M'),
(328, 'Tekni Collectables Inc.', 'Brown', 'William', '2015559350', '7476 Moss Rd.', NULL, 'Newark', 'NJ', '94019', 'USA', 1323, 43000, '', '', '', 'M'),
(333, 'Australian Gift Network, Co', 'Calaghan', 'Ben', '61-7-3844-6555', '31 Duncan St. West End', NULL, 'South Brisbane', 'Queensland', '4101', 'Australia', 1611, 51600, '', '', '', 'M'),
(334, 'Suominen Souveniers', 'Suominen', 'Kalle', '+358 9 8045 555', 'Software Engineering Center', 'SEC Oy', 'Espoo', NULL, 'FIN-02271', 'Finland', 1501, 98800, '', '', '', 'M'),
(335, 'Cramer Spezialitäten, Ltd', 'Cramer', 'Philip ', '0555-09555', 'Maubelstr. 90', NULL, 'Brandenburg', NULL, '14776', 'Germany', NULL, 0, '', '', '', 'M'),
(339, 'Classic Gift Ideas, Inc', 'Cervantes', 'Francisca', '2155554695', '782 First Street', NULL, 'Philadelphia', 'PA', '71270', 'USA', 1188, 81100, '', '', '', 'M'),
(344, 'CAF Imports', 'Fernandez', 'Jesus', '+34 913 728 555', 'Merchants House', '27-30 Merchant\'s Quay', 'Madrid', NULL, '28023', 'Spain', 1702, 59600, '', '', '', 'M'),
(347, 'Men \'R\' US Retailers, Ltd.', 'Chandler', 'Brian', '2155554369', '6047 Douglas Av.', NULL, 'Los Angeles', 'CA', '91003', 'USA', 1166, 57700, '', '', '', 'M'),
(348, 'Asian Treasures, Inc.', 'McKenna', 'Patricia ', '2967 555', '8 Johnstown Road', NULL, 'Cork', 'Co. Cork', NULL, 'Ireland', NULL, 0, '', '', '', 'M'),
(350, 'Marseille Mini Autos', 'Lebihan', 'Laurence ', '91.24.4555', '12, rue des Bouchers', NULL, 'Marseille', NULL, '13008', 'France', 1337, 65000, '', '', '', 'M'),
(353, 'Reims Collectables', 'Henriot', 'Paul ', '26.47.1555', '59 rue de l\'Abbaye', NULL, 'Reims', NULL, '51100', 'France', 1337, 81100, '', '', '', 'M'),
(356, 'SAR Distributors, Co', 'Kuger', 'Armand', '+27 21 550 3555', '1250 Pretorius Street', NULL, 'Hatfield', 'Pretoria', '0028', 'South Africa', NULL, 0, '', '', '', 'M'),
(357, 'GiftsForHim.com', 'MacKinlay', 'Wales', '64-9-3763555', '199 Great North Road', NULL, 'Auckland', NULL, NULL, 'New Zealand', 1612, 77700, '', '', '', 'M'),
(361, 'Kommission Auto', 'Josephs', 'Karin', '0251-555259', 'Luisenstr. 48', NULL, 'Münster', NULL, '44087', 'Germany', NULL, 0, '', '', '', 'M'),
(362, 'Gifts4AllAges.com', 'Yoshido', 'Juri', '6175559555', '8616 Spinnaker Dr.', NULL, 'Boston', 'MA', '51003', 'USA', 1216, 41900, '', '', '', 'M'),
(363, 'Online Diecast Creations Co.', 'Young', 'Dorothy', '6035558647', '2304 Long Airport Avenue', NULL, 'Nashua', 'NH', '62005', 'USA', 1216, 114200, '', '', '', 'M'),
(369, 'Lisboa Souveniers, Inc', 'Rodriguez', 'Lino ', '(1) 354-2555', 'Jardim das rosas n. 32', NULL, 'Lisboa', NULL, '1675', 'Portugal', NULL, 0, '', '', '', 'M'),
(376, 'Precious Collectables', 'Urs', 'Braun', '0452-076555', 'Hauptstr. 29', NULL, 'Bern', NULL, '3012', 'Switzerland', 1702, 0, '', '', '', 'M'),
(379, 'Collectables For Less Inc.', 'Nelson', 'Allen', '6175558555', '7825 Douglas Av.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1188, 70700, '', '', '', 'M'),
(381, 'Royale Belge', 'Cartrain', 'Pascale ', '(071) 23 67 2555', 'Boulevard Tirou, 255', NULL, 'Charleroi', NULL, 'B-6000', 'Belgium', 1401, 23500, '', '', '', 'M'),
(382, 'Salzburg Collectables', 'Pipps', 'Georg ', '6562-9555', 'Geislweg 14', NULL, 'Salzburg', NULL, '5020', 'Austria', 1401, 71700, '', '', '', 'M'),
(385, 'Cruz & Sons Co.', 'Cruz', 'Arnold', '+63 2 555 3587', '15 McCallum Street', 'NatWest Center #13-03', 'Makati City', NULL, '1227 MM', 'Philippines', 1621, 81500, '', '', '', 'M'),
(386, 'L\'ordine Souveniers', 'Moroni', 'Maurizio ', '0522-556555', 'Strada Provinciale 124', NULL, 'Reggio Emilia', NULL, '42100', 'Italy', 1401, 121400, '', '', '', 'M'),
(398, 'Tokyo Collectables, Ltd', 'Shimamura', 'Akiko', '+81 3 3584 0555', '2-2-8 Roppongi', NULL, 'Minato-ku', 'Tokyo', '106-0032', 'Japan', 1621, 94400, '', '', '', 'M'),
(406, 'Auto Canal+ Petit', 'Perrier', 'Dominique', '(1) 47.55.6555', '25, rue Lauriston', NULL, 'Paris', NULL, '75016', 'France', 1337, 95000, '', '', '', 'M'),
(409, 'Stuttgart Collectable Exchange', 'Müller', 'Rita ', '0711-555361', 'Adenauerallee 900', NULL, 'Stuttgart', NULL, '70563', 'Germany', NULL, 0, '', '', '', 'M'),
(412, 'Extreme Desk Decorations, Ltd', 'McRoy', 'Sarah', '04 499 9555', '101 Lambton Quay', 'Level 11', 'Wellington', NULL, NULL, 'New Zealand', 1612, 86800, '', '', '', 'M'),
(415, 'Bavarian Collectables Imports, Co.', 'Donnermeyer', 'Michael', ' +49 89 61 08 9555', 'Hansastr. 15', NULL, 'Munich', NULL, '80686', 'Germany', 1504, 77000, '', '', '', 'M'),
(424, 'Classic Legends Inc.', 'Hernandez', 'Maria', '2125558493', '5905 Pompton St.', 'Suite 750', 'NYC', 'NY', '10022', 'USA', 1286, 67500, '', '', '', 'M'),
(443, 'Feuer Online Stores, Inc', 'Feuer', 'Alexander ', '0342-555176', 'Heerstr. 22', NULL, 'Leipzig', NULL, '04179', 'Germany', NULL, 0, '', '', '', 'M'),
(447, 'Gift Ideas Corp.', 'Lewis', 'Dan', '2035554407', '2440 Pompton St.', NULL, 'Glendale', 'CT', '97561', 'USA', 1323, 49700, '', '', '', 'M'),
(448, 'Scandinavian Gift Ideas', 'Larsson', 'Martha', '0695-34 6555', 'Åkergatan 24', NULL, 'Bräcke', NULL, 'S-844 67', 'Sweden', 1504, 116400, '', '', '', 'M'),
(450, 'The Sharp Gifts Warehouse', 'Frick', 'Sue', '4085553659', '3086 Ingle Ln.', NULL, 'San Jose', 'CA', '94217', 'USA', 1165, 77600, '', '', '', 'M'),
(452, 'Mini Auto Werke', 'Mendel', 'Roland ', '7675-3555', 'Kirchgasse 6', NULL, 'Graz', NULL, '8010', 'Austria', 1401, 45300, '', '', '', 'M'),
(455, 'Super Scale Inc.', 'Murphy', 'Leslie', '2035559545', '567 North Pendale Street', NULL, 'New Haven', 'CT', '97823', 'USA', 1286, 95400, '', '', '', 'M'),
(456, 'Microscale Inc.', 'Choi', 'Yu', '2125551957', '5290 North Pendale Street', 'Suite 200', 'NYC', 'NY', '10022', 'USA', 1286, 39800, '', '', '', 'M'),
(458, 'Corrida Auto Replicas, Ltd', 'Sommer', 'Martín ', '(91) 555 22 82', 'C/ Araquil, 67', NULL, 'Madrid', NULL, '28023', 'Spain', 1702, 104600, '', '', '', 'M'),
(459, 'Warburg Exchange', 'Ottlieb', 'Sven ', '0241-039123', 'Walserweg 21', NULL, 'Aachen', NULL, '52066', 'Germany', NULL, 0, '', '', '', 'M'),
(462, 'FunGiftIdeas.com', 'Benitez', 'Violeta', '5085552555', '1785 First Street', NULL, 'New Bedford', 'MA', '50553', 'USA', 1216, 85800, '', '', '', 'M'),
(465, 'Anton Designs, Ltd.', 'Anton', 'Carmen', '+34 913 728555', 'c/ Gobelas, 19-1 Urb. La Florida', NULL, 'Madrid', NULL, '28023', 'Spain', NULL, 0, '', '', '', 'M'),
(471, 'Australian Collectables, Ltd', 'Clenahan', 'Sean', '61-9-3844-6555', '7 Allen Street', NULL, 'Glen Waverly', 'Victoria', '3150', 'Australia', 1611, 60300, '', '', '', 'M'),
(473, 'Frau da Collezione', 'Ricotti', 'Franco', '+39 022515555', '20093 Cologno Monzese', 'Alessandro Volta 16', 'Milan', NULL, NULL, 'Italy', 1401, 34800, '', '', '', 'M'),
(475, 'West Coast Collectables Co.', 'Thompson', 'Steve', '3105553722', '3675 Furth Circle', NULL, 'Burbank', 'CA', '94019', 'USA', 1166, 55400, '', '', '', 'M'),
(477, 'Mit Vergnügen & Co.', 'Moos', 'Hanna ', '0621-08555', 'Forsterstr. 57', NULL, 'Mannheim', NULL, '68306', 'Germany', NULL, 0, '', '', '', 'M'),
(480, 'Kremlin Collectables, Co.', 'Semenov', 'Alexander ', '+7 812 293 0521', '2 Pobedy Square', NULL, 'Saint Petersburg', NULL, '196143', 'Russia', NULL, 0, '', '', '', 'M'),
(481, 'Raanan Stores, Inc', 'Altagar,G M', 'Raanan', '+ 972 9 959 8555', '3 Hagalim Blv.', NULL, 'Herzlia', NULL, '47625', 'Israel', NULL, 0, '', '', '', 'M'),
(484, 'Iberia Gift Imports, Corp.', 'Roel', 'José Pedro ', '(95) 555 82 82', 'C/ Romero, 33', NULL, 'Sevilla', NULL, '41101', 'Spain', 1702, 65700, '', '', '', 'M'),
(486, 'Motor Mint Distributors Inc.', 'Salazar', 'Rosa', '2155559857', '11328 Douglas Av.', NULL, 'Philadelphia', 'PA', '71270', 'USA', 1323, 72600, '', '', '', 'M'),
(487, 'Signal Collectibles Ltd.', 'Taylor', 'Sue', '4155554312', '2793 Furth Circle', NULL, 'Brisbane', 'CA', '94217', 'USA', 1165, 60300, '', '', '', 'M'),
(489, 'Double Decker Gift Stores, Ltd', 'Smith', 'Thomas ', '(171) 555-7555', '120 Hanover Sq.', NULL, 'London', NULL, 'WA1 1DP', 'UK', 1501, 43300, '', '', '', 'M'),
(495, 'Diecast Collectables', 'Franco', 'Valarie', '6175552555', '6251 Ingle Ln.', NULL, 'Boston', 'MA', '51003', 'USA', 1188, 85100, '', '', '', 'M'),
(496, 'Kelly\'s Gift Shop', 'Snowden', 'Tony', '+64 9 5555500', 'Arenales 1938 3\'A\'', NULL, 'Auckland  ', NULL, NULL, 'New Zealand', 1612, 110000, '', '', '', 'M'),
(497, '', '', '', '0321-4123135', 'House no ABC', NULL, '', NULL, NULL, '', NULL, NULL, '', '', '', 'M'),
(498, 'majid@yahoo.com', 'zxczxc', 'zxczxc', '0321-4123135', 'House no ABC', NULL, '', NULL, NULL, '', NULL, NULL, '', '', '', 'M'),
(509, '', '', '', '', ' ', '', 'Karachi', '', 'Pakistan', 'Pakistan', NULL, NULL, '', '', '', 'M'),
(501, 'Majid', 'TAHIR', 'TAHIR', 'XCXCX', ' XCX', 'XCX', 'Kabul', 'XCX', 'Afghanistan', 'a', NULL, NULL, '', '', '', 'M'),
(510, '', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(511, 'NHURUM', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(512, 'NHURUM', '', '', '', ' ', '', 'Kabul', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(513, 'NHURUM', '', '', '', ' ', '', 'Kabul', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(514, 'NHURUM', '', '', '', ' ', '', 'Kabul', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(515, 'cvc', '', '', '', ' ', '', 'Qandahar', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(516, 'xcx', '', '', '', ' ', '', 'Kabul', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(517, 'zxzx', '', '', '', ' ', '', 'South Hill', '', 'Anguilla', 'Anguilla', NULL, NULL, '', '', '', 'M'),
(518, 'zxzx', 'zxzx', 'zxzx', '', ' ', '', 'South Hill', '', 'Anguilla', 'Anguilla', NULL, NULL, '', '', '', 'M'),
(519, 'zxzx', 'zxzx', 'zxzx', '', ' ', '', 'Kabul', '', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(520, 'FDF', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(521, 'FDF', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(522, 'zxczxc', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(523, 'dsd', '', '', '', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(524, 'asdsdas', '', '', 'adasd', ' ', '', '--Select City--', '', '--Select Countr', '--Select Country--', NULL, NULL, '', '', '', 'M'),
(525, 'AA', 'AA', 'AA', 'A', ' A', 'AA', 'Sydney', 'A', 'Australia', 'Australia', NULL, NULL, '', '', '', 'M'),
(526, 'AA', 'AA', 'AA', 'A', ' A', 'AA', 'Sydney', 'A', 'Australia', 'Australia', NULL, NULL, '', '', '', 'M'),
(527, 'sasa', 'asas', 'asas', 'asas', ' asas', 'asas', 'Kabul', 'asas', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(528, 'sasa', 'asas', 'asas', 'asas', ' asas', 'asas', 'Kabul', 'asas', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(529, 'sasa', 'asas', 'asas', 'asas', ' asas', 'asas', 'Kabul', 'asas', 'Afghanistan', 'Afghanistan', NULL, NULL, '', '', '', 'M'),
(530, 'Majid2', 'Ferguson2', 'Ferguson2', 'A', ' AA', 'AA', 'Karachi', 'AA', 'Pakistan', 'Pakistan', NULL, NULL, '', '', '', 'M'),
(531, 'Majid2', 'sdsd', 'sdsd', 'sdsd', ' sds', 'sdsd', 'Rawalpindi', 'sds', 'Pakistan', 'Pakistan', NULL, NULL, '', '', '', 'M'),
(532, 'Majid2', 'sdsd', 'sdsd', 'sdsd', ' sds', 'sdsd', 'Port-Louis', 'sds', 'Mauritius', 'Mauritius', NULL, NULL, '', '', '', 'M'),
(533, 'asdsa', 'asda', 'asda', 'sadas', ' asdas', 'asdasd', 'Karachi', 'asdasd', 'Pakistan', 'Pakistan', NULL, NULL, 'majid@yahoo.com', '', '', 'M'),
(534, 'Majid2', 'asa', 'asa', 'asas', ' asas', 'asas', 'Karachi', 'asas', 'Pakistan', 'Pakistan', NULL, NULL, 'abdulmajid@yahoo.com', '', '', 'M'),
(535, 'XCXZC', 'ZXZX', 'ZXZX', 'ZXCZX', ' ZCZX', 'ZXCZX', 'Karachi', 'ZXCZX', 'Pakistan', 'Pakistan', NULL, NULL, 'majidtahir79@yahoo.com', '', '', 'M'),
(536, 'ABDUL SAMAD', 'ABDUL MAJID', 'ABDUL MAJID', '03214123135', ' A', 'A', 'Karachi', 'A', 'Pakistan', 'Pakistan', NULL, NULL, 'abc@yahoo.com', '', '', 'M'),
(537, 'anas@yahoo.com', 'anas2', 'anas', '12121', ' 121', '1212', 'Karachi', 'pakistan', 'Pakistan', 'Pakistan', 123, 123, 'anas@yahoo.com', '', '', 'M'),
(538, 'abc', '', '', '+923214123135', 'abc', NULL, 'karachi', '', '1234', 'pakistan', NULL, NULL, 'abc@yahoo.com', 'abc.jpg', 'abc123', 'M'),
(539, 'majid', '', '', '+9212121212', 'abc', NULL, 'Nijmegen', '', '1234', 'United Arab Emirates', NULL, NULL, 'majid@yahoo.com', './data/oliveorchard.jpg', 'abc123', 'M'),
(540, 'anas', '', '', '+9212121212', 'abc', NULL, 'Kabul', '', '1234', 'Aruba', NULL, NULL, 'anas@yahoo.com', './data/employees.txt', 'anas123', 'M'),
(541, 'KASHIF', '', '', '+9212121212', 'abc123', NULL, 'Kabul', '', '1234', 'Aruba', NULL, NULL, 'KA@YAHOO.COM', './data/additional content.txt', '¢6MË«P', 'M'),
(542, 'admin', '', '', '+9212121212', 'abc123', NULL, 'Kabul', '', '1234', 'Azerbaijan', NULL, NULL, 'admin@yahoo.com', './data/home page.txt', '¢6MË«P', 'M'),
(543, 'fgdf', '', '', 'fdgf', 'dfgdf', NULL, 'fdgf', NULL, NULL, 'dfgdf', NULL, NULL, 'dfgd', 'dfgdf', 'fgfd', 'M'),
(544, 'KASHIF', '', '', '+923214123135', 'abc', NULL, 'Groningen', NULL, NULL, 'French Southern territories', NULL, NULL, 'KA@YAHOO.COM', 'Chrysanthemum.jpg', 'e99a18c428cb38d5f260853678922e03', 'M'),
(545, 'abc', '', '', '+923214123135', 'sdfsdf', NULL, 'Nijmegen', NULL, NULL, 'Antarctica', NULL, NULL, 'abc22@yahoo.com', 'Chrysanthemum.jpg', 'e99a18c428cb38d5f260853678922e03', 'M'),
(546, 'ASIF', '', '', '+923214123135', 'dfgdfgdf', NULL, 'Breda', NULL, NULL, 'Pakistan', NULL, NULL, 'asif@yahoo.com', 'Chrysanthemum.jpg', 'e99a18c428cb38d5f260853678922e03', 'M'),
(547, 'orasoft', '', '', '+923214123135', 'fdgdfg', NULL, 'Breda', NULL, NULL, 'Pakistan', NULL, NULL, 'ora2020@yahoo.com', 'Hydrangeas.jpg', 'e99a18c428cb38d5f260853678922e03', 'M'),
(548, 'amjad', '', '', '+923214123135', 'gfhfghg', NULL, 'Breda', NULL, NULL, 'Pakistan', NULL, NULL, 'amjad@yahoo.com', '', 'e99a18c428cb38d5f260853678922e03', 'M'),
(549, 'orasoft new', '', '', '+923214123136', '                        dsfdsf                    ', NULL, 'Karachi', NULL, NULL, 'PAK', NULL, NULL, 'oranew@yahoo.com', '', 'e99a18c428cb38d5f260853678922e03', 'M'),
(550, 'name1', 'name2', 'name3', '+9232323232', 'address1', NULL, 'karachi', NULL, NULL, 'pakistan', NULL, NULL, 'a', 'a', 'abc', 'M'),
(551, 'kashifkhan', '+923213232', '+923213232', '+923213232', '+923213232', NULL, '+923213232', NULL, NULL, '+923213232', NULL, NULL, 'cms@suparco.gov.pk', '+923213232', '$2y$10$35/EArlWpZLdhJqthuUIN.uKsiaKao0xnHEE2dxKuDGapZCf/zqMy', 'M'),
(552, 'adminkhanss', '+923213232', '+923213232', '+923213232', '+923213232', NULL, '+923213232', NULL, NULL, '+923213232', NULL, NULL, 'admin@yahoo.com', '+923213232', '12345678', 'M'),
(553, '$name', NULL, NULL, NULL, '$address', NULL, '$city', NULL, NULL, NULL, NULL, NULL, '$email', NULL, '$pwd', 'M'),
(554, 'abc', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'abc@yahoo.com', NULL, 'abc123', 'M'),
(555, 'abc', NULL, NULL, NULL, '12121', NULL, 'karachi', NULL, NULL, NULL, NULL, NULL, 'abc@yahoo.com', NULL, 'abc123', 'M'),
(556, 'zain', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'zain@yahoo.com', NULL, 'abc123', 'M'),
(557, 'zain2', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'zain@yahoo.com', NULL, 'abc123', 'M'),
(558, 'zain3', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'zain@yahoo.com', NULL, 'abc123', 'M'),
(559, 'HAMMAD', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'hammad@yahoo.com', NULL, 'abc123', 'M'),
(560, 'mohib', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'mohib@yahoo.com', NULL, 'abc123', 'M'),
(561, 'hammad', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'hammad@yahoo.com', NULL, 'abc123', 'M'),
(562, 'fayyaz', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'fayyaz@yahoo.com', NULL, 'abc123', 'M'),
(563, 'idrees', NULL, NULL, NULL, 'sadasd', NULL, 'Karachi', NULL, NULL, NULL, NULL, NULL, 'idrees@yahoo.com', NULL, 'abc123', 'M'),
(564, 'aptech', NULL, NULL, NULL, 'sdsadasd', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'aptech@yahoo.com', NULL, 'abc123', 'M'),
(565, 'afsar', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'afsar@yahoo.com', NULL, 'abc123', 'M'),
(566, 'afsar', NULL, NULL, NULL, 'sdsd', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'afsar@yahoo.com', NULL, 'Abc123', 'M'),
(567, 'faraz', NULL, NULL, NULL, 'sdsad', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'faraz@yahoo.com', NULL, 'Abc123', 'M'),
(568, 'admin', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'admin@yahoo.com', NULL, 'Abc123', 'M'),
(569, 'admin', NULL, NULL, NULL, 'ewew', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'admin@yahoo.com', NULL, 'Abc123', 'M'),
(570, 'member', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'memeber@yahoo.com', NULL, 'Abc123', 'M'),
(571, 'admin', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'admin@yahoo.com', NULL, 'Abc123', 'M'),
(572, 'asif', NULL, NULL, NULL, 'abc', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, 'asif@yahoo.com', NULL, 'Abc@123', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `destination_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) NOT NULL,
  `person_price` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destination_id`, `city_id`, `destination_name`, `description`, `address`, `image`, `city_name`, `person_price`) VALUES
(1, 1, 'Clifton', 'Clifton is one of Karachi’s most vibrant and prestigious areas, renowned for its modern lifestyle and cosmopolitan vibe. It features luxurious residential properties, high-end shopping malls, and a rich collection of restaurants offering global cuisines. Clifton’s beach is another major attraction, where visitors enjoy a serene atmosphere for relaxation, scenic walks, and fun-filled activities such as camel rides and boat rides. The neighborhood is famous for its historical landmarks, such as the Clifton Boat Basin, where seafood lovers indulge in fresh delicacies while enjoying the views. The area has a vibrant nightlife, with cafes, bars, and clubs adding to its lively culture. It’s a top destination for both locals and tourists looking to experience Karachi’s luxury, culture, and coastal beauty, offering something for everyone.', NULL, 'images/Clifton.jpg', '', 100),
(2, 1, 'Karachi Marina Club', 'Karachi Marina is an exclusive waterfront destination located on the shores of the Arabian Sea. It is famous for its tranquil setting, offering visitors an upscale environment to indulge in yachting, boating, and fishing. The marina is a hub for marine activities, with luxury yachts docked along its piers and recreational boat rides available to the public. The view of the sunset over the sea is a breathtaking sight, making it a prime location for evening strolls or romantic dinners at the waterfront restaurants. The area is also home to several luxury villas and resorts, offering a peaceful retreat from the bustling city life. A favorite spot for high-net-worth individuals, Karachi Marina represents the city’s elite coastal culture. Whether you’re an avid sailor or just looking for a serene spot to relax, Karachi Marina provides an idyllic escape with world-class amenities and spectacular sea views.', 'Marina Club, Karachi, Sindh', 'images/Karachi Marina Club.jpg', '', 100),
(3, 1, 'Mazar-e-Quaid', 'Mazar-e-Quaid is the mausoleum of Muhammad Ali Jinnah, the founder of Pakistan, and is considered one of the country’s most revered sites. Located in the heart of Karachi, the mausoleum is an architectural marvel built with white marble, featuring intricate designs and grand domes. The serene and tranquil environment of the surrounding gardens makes it a place of reflection for visitors from all over the world. Every day, thousands of visitors, including dignitaries and tourists, pay homage to Jinnah. The Changing of the Guard ceremony, which takes place every morning, is a popular attraction. The mausoleum serves as a historical monument, not just for the people of Pakistan, but for the entire world, reflecting Jinnah’s legacy and vision for the country. The peaceful atmosphere and magnificent structure make it a must-see destination for history enthusiasts and tourists visiting Karachi.', 'M.A. Jinnah Road, Karachi, Sindh', 'images/Mazar-e-Quaid.jpg', '', 100),
(4, 1, 'Hawksbay Beach', 'Hawksbay Beach is one of Karachi’s most popular and scenic beaches, offering a natural escape from the hustle and bustle of the city. Known for its golden sand and clear turquoise waters, the beach is a perfect spot for families and adventure seekers alike. People come here to relax by the shore, enjoy beach picnics, and take part in water activities such as swimming, kayaking, and jet-skiing. Visitors can also ride camels along the beach, capturing the spirit of traditional coastal life. Hawksbay is an ideal location for watching the sunset, with its picturesque setting offering stunning views. The beach is less crowded than other popular beaches in Karachi, making it a tranquil destination for those who seek peace and relaxation. It also features beachside cafes offering fresh seafood, giving visitors an authentic taste of Karachi’s coastal culture.', 'Hawksbay, Karachi, Sindh', 'images/Hawksbay Beach.jpg', '', 100),
(5, 1, 'Karachi Zoo', 'The Karachi Zoo, founded in 1878, is one of the oldest and most expansive zoos in Pakistan, providing a fantastic family-friendly experience. With over 700 species of animals, including lions, tigers, elephants, and bears, it is a sanctuary for both native and exotic wildlife. The zoo also features a wide range of bird species, reptiles, and marine animals, making it an ideal place for animal lovers and children to explore and learn about biodiversity. The zoo’s well-maintained grounds are ideal for strolling, and it includes educational displays about animal conservation and endangered species. Children can enjoy riding the zoo’s mini-train, while families can spend time at picnic spots around the zoo. With various recreational facilities, the zoo provides an engaging experience that balances fun and learning. It is one of the key attractions for locals and visitors looking to experience Karachi’s wildlife.', 'Garden East, Karachi, Sindh', 'images/Karachi Zoo.jpg', '', 100),
(6, 2, 'Badshahi Mosque', 'The Badshahi Mosque is one of the largest and most impressive mosques in the world, built during the Mughal era by Emperor Aurangzeb in 1673. Located in the heart of Lahore, this architectural gem is known for its grandeur and intricate details, showcasing the brilliance of Mughal architecture. The mosque is built with red sandstone, and its vast prayer hall, enormous courtyards, and exquisite minarets make it an awe-inspiring sight. Visitors can also explore its surrounding gardens, which add to the serene atmosphere. It remains one of the most popular tourist destinations in Lahore, attracting visitors from across the globe. The mosque’s significance is not only religious but also cultural, as it stands as a symbol of Lahore’s rich Mughal heritage. It continues to be a center of worship, drawing pilgrims from all over Pakistan and beyond, making it a place of immense historical and spiritual importance.', 'Fort Road, Lahore, Punjab', 'images/Badshahi Mosque.jpg', '', 100),
(7, 2, 'Shalimar Gardens', 'The Shalimar Gardens in Lahore, constructed in the 17th century during the reign of Mughal Emperor Shah Jahan, is a stunning example of Mughal landscaping and garden architecture. The gardens are known for their symmetrical design, lush green lawns, cascading fountains, and beautifully designed reflecting pools. Spread over an area of 12.8 hectares, the gardens are a peaceful retreat away from the urban hustle, offering a calm and tranquil atmosphere. Visitors can enjoy a leisurely walk through the terraced gardens or take in the beauty of the flora and fauna. The gardens are an architectural masterpiece that highlights the grandeur of the Mughal Empire, with its fountains representing the reign of water as a symbol of prosperity. It remains one of the most iconic landmarks in Lahore, showcasing the rich cultural heritage of the Mughal period.', 'Shalimar Link Road, Lahore, Punjab', 'images/Shalimar Gardens.jpg', '', 100),
(8, 2, 'Lahore Fort', 'The Lahore Fort, also known as Shahi Qila, is a historic fortification that stands as one of the most important symbols of Lahore’s rich history. The fort was originally built in the 11th century but was expanded during the Mughal period into a magnificent structure. Visitors can explore its vast complex, including the Sheesh Mahal (Palace of Mirrors), which is famed for its stunning glasswork and reflective surfaces. The fort also houses the Naulakha Pavilion, the Alamgiri Gate, and several beautiful courtyards. The fort has witnessed many important events in history, and its walls tell the stories of battles, royal ceremonies, and cultural transformations. Today, it is a UNESCO World Heritage site and one of Lahore’s most significant tourist destinations. The fort’s mesmerizing architecture and deep historical significance make it a must-visit for history lovers and tourists exploring the city.', 'Fort Road, Lahore, Punjab', 'images/Lahore Fort.jpg', '', 100),
(9, 2, 'Minar-e-Pakistan', 'Minar-e-Pakistan is an iconic symbol of Pakistan’s independence, located in Iqbal Park, Lahore. It marks the spot where the Lahore Resolution was passed in 1940, demanding the creation of Pakistan. The tower stands tall at 70 meters and is designed in the shape of a blooming flower, with four petals representing the four provinces of Pakistan. The monument is a testament to the struggle for Pakistan’s creation and stands as a national symbol of unity. Visitors can learn about the history of Pakistan’s formation through the museum at the base of the tower, which houses various exhibitions and historical artifacts. The surrounding park is a peaceful place for relaxation, with lush green spaces offering an escape from the city’s hustle. Minar-e-Pakistan is a must-see landmark for anyone interested in the history of Pakistan.', 'Greater Iqbal Park, Lahore, Punjab', 'images/Minar-e-Pakistan.jpg', '', 100),
(10, 3, 'Faisal Mosque', 'Faisal Mosque, located at the foot of the Margalla Hills, is the largest mosque in South Asia and one of the largest in the world. Designed by Turkish architect Vedat Dalokay, the mosque has a modern and unique architectural style that departs from traditional mosque designs. Its large triangular structure and white marble facade make it an architectural marvel. The mosque can accommodate over 100,000 worshippers, making it a central place for prayers and gatherings. Its peaceful location, amidst the natural beauty of the hills, offers panoramic views of Islamabad, making it a favorite for visitors looking to explore the city’s cultural and religious landmarks. Faisal Mosque is also home to a visitor’s center, where people can learn about Islamic history and the mosque’s significance.', 'Shah Faisal Avenue, Islamabad, Federal Capital Territory', 'images/Faisal Mosque.jpg', '', 100),
(11, 3, 'Daman-e-Koh', 'Daman-e-Koh is a scenic viewpoint located in the Margalla Hills National Park, offering stunning views of Islamabad. Situated on top of the hills, it is one of the most popular spots for tourists and locals who wish to enjoy the beauty of Islamabad from a distance. The viewpoint offers panoramic vistas of the city, including views of Faisal Mosque, Rawalpindi, and the surrounding greenery. It’s an ideal spot for nature lovers and hiking enthusiasts, as there are multiple hiking trails leading to Daman-e-Koh. The location is peaceful, with a cool breeze, and is often visited by families and couples for picnics, photography, and evening walks. The site also has a well-maintained café where visitors can relax while enjoying the view. Daman-e-Koh is a serene escape from the busy city life, offering an intimate experience of Islamabad’s natural beauty.', 'Margalla Hills, Islamabad, Federal Capital Territory', 'images/Daman-e-Koh.jpg', '', 100),
(12, 3, 'Pakistan Monument', 'The Pakistan Monument, located on Shakarparian Hills in Islamabad, is a national landmark symbolizing the four provinces of Pakistan. The monument consists of four large petals, each representing one of the country’s provinces, and is an architectural representation of the nation’s unity. The monument’s central structure is made from sandstone, and it also houses a museum that provides an in-depth look into Pakistan’s history, culture, and heritage. Visitors can walk around the monument to admire the sculptures and historical displays. The monument is a popular spot for tourists and locals to learn about Pakistan’s independence and historical milestones. It offers breathtaking views of Islamabad and is a peaceful location for those seeking a combination of cultural exploration and scenic beauty. The surrounding gardens and walking paths make it an ideal spot for an afternoon visit.', 'Shakarparian Hills, Islamabad, Federal Capital Territory', 'images/Pakistan Monument.jpg', '', 100),
(13, 4, 'Hanna Lake', 'Hanna Lake is a serene reservoir located just outside of Quetta, nestled amidst the rugged mountains. The lake’s tranquil waters and picturesque surroundings make it one of the most sought-after destinations in the region. Visitors can enjoy boating, fishing, or simply relax by the shore, taking in the scenic beauty. The area around the lake is perfect for picnics, with shaded areas offering respite from the sun. Hiking trails are also available for those who want to explore the surrounding hills and enjoy the panoramic views of the lake. The cool breeze and natural surroundings provide a peaceful escape from the city. The lake is a perfect location for nature lovers, photographers, and families looking for a calm and refreshing environment. Hanna Lake is a hidden gem that offers a peaceful retreat from the urban hustle of Quetta.', 'Urak Valley Road, Quetta, Balochistan', 'images/Hanna Lake.jpg', '', 14),
(16, 4, 'Ziarat Juniper Forest', 'The Ziarat Juniper Forest, located near Quetta, is one of the largest juniper forests in the world and is a UNESCO World Heritage Site. The forest, situated at an altitude of around 2,500 meters, is home to ancient juniper trees that are centuries old. The tranquil environment, combined with the forest’s natural beauty, makes it an ideal location for nature lovers, trekkers, and photographers. Visitors can explore the forest’s trails, take in the stunning views, and enjoy the cool, fresh air. The forest also holds historical significance as it is closely tied to the region’s culture and heritage. Ziarat Juniper Forest is an eco-tourism destination, offering visitors a chance to connect with nature and appreciate the preservation of this unique forest ecosystem.', 'Ziarat, Balochistan', 'images/Ziarat Juniper Forest.jpg', '', 100),
(17, 6, 'Multan Fort', 'Multan Fort is a significant historical landmark in Multan, known for its ancient walls and structures that reflect the city’s rich history. It was built during the reign of the Ghaznavid Empire and later expanded by various rulers. The fort’s location on a raised platform offers an excellent view of the city and surrounding areas. Visitors can explore its grand gates, massive bastions, and historical structures that have withstood centuries of invasions. Multan Fort has a rich cultural heritage, with many historical artifacts found within its grounds. It serves as a testament to the city’s enduring legacy, having witnessed the rise and fall of many empires. The fort remains an important symbol of Multan’s history and is a popular destination for history buffs and tourists.', 'Qasim Road, Multan, Punjab', 'images/Multan Fort.jpg', '', 100),
(18, 4, 'Quetta Zoo', 'The Quetta Zoo, located on the outskirts of the city, is home to a variety of wildlife species, including leopards, bears, and native animals of Balochistan. The zoo offers visitors a chance to see wildlife in a well-maintained environment with a focus on education and conservation. Families and children enjoy visiting the zoo, where they can learn about different animal species and their natural habitats. The zoo is a peaceful place for families to visit, with picnic areas and shaded spots to relax. The natural beauty of the surrounding area makes it a great spot for a day trip. The Quetta Zoo plays a role in preserving local wildlife and providing awareness about environmental protection.', 'Zarghoon Road, Quetta, Balochistan', 'images/Quetta Zoo.jpg', '', 15),
(19, 6, 'Shrine of Bahauddin Zakariya', 'The Shrine of Bahauddin Zakariya is an important religious and historical site in Multan. The shrine is dedicated to the famous Sufi saint Bahauddin Zakariya, who played a significant role in spreading Islam in the region. The structure is known for its intricate architecture, with beautiful carvings and calligraphy adorning the walls. The shrine’s peaceful surroundings make it a place of spiritual reflection and devotion for visitors. Pilgrims from across Pakistan visit the shrine to pay their respects and seek blessings. The site is also an architectural wonder, reflecting the grandeur of Sufi traditions and the cultural heritage of Multan. Visitors can enjoy the calm atmosphere and learn about the life and teachings of Bahauddin Zakariya. The shrine is a symbol of Multan’s spiritual legacy.', 'Bahauddin Zakariya Road, Multan, Punjab', 'images/Shrine of Bahauddin Zakariya.jpg', '', 100),
(20, 6, 'Multan Clock Tower', 'The Multan Clock Tower is one of the most iconic structures in the city, standing tall as a symbol of Multan’s colonial heritage. Built during the British Raj, the clock tower was designed with a blend of Victorian and local architectural styles. It has become a landmark in the city’s bustling market area, offering a glimpse into the city’s colonial past. The clock tower is a popular meeting point for locals and a key feature of Multan’s skyline. Surrounding the clock tower are vibrant bazaars, where visitors can shop for traditional Multani crafts, textiles, and pottery. The area is lively and vibrant, making it a great spot for tourists to explore the local culture and history. The clock tower remains a central part of Multan’s identity and is a must-see for those interested in its colonial architecture.', 'Ghanta Ghar Chowk, Multan, Punjab', 'images/Multan Clock Tower.jpg', '', 100),
(21, 5, 'Peshawar Museum', 'The Peshawar Museum is an iconic historical site that showcases the rich cultural heritage of the region. Located in the heart of Peshawar, this museum houses an extensive collection of Gandhara art, Islamic artifacts, and ancient coins. The museum’s collection reflects the cultural crossroads of Central Asia, South Asia, and the Middle East. Visitors can explore sculptures, relics, and religious artifacts that date back to ancient civilizations. The museum provides a fascinating insight into the evolution of art and culture in the region. It is a must-visit destination for history enthusiasts, offering educational exhibits about Peshawar’s historical significance and its role in the spread of Buddhism and other cultural movements. The museum’s beautiful architecture and surrounding gardens also make it a peaceful spot for contemplation and reflection.', 'Saddar Road, Peshawar, Khyber Pakhtunkhwa', 'images/Peshawar Museum.jpg', '', 100),
(22, 5, 'Khyber Pass', 'The Khyber Pass is one of the most historically significant routes in the world, connecting Pakistan to Afghanistan. It has been a critical passage for centuries, used by invaders and traders alike. The pass is surrounded by dramatic mountain scenery, adding to its mystique and historical importance. Travelers can explore its many historical sites, including forts and ancient trading posts, while marveling at the rugged beauty of the landscape. The Khyber Pass was the gateway for the spread of cultures, religions, and ideas across Central Asia and the subcontinent. Today, it remains a symbol of the region’s strategic importance. It is a popular destination for those interested in history, military strategy, and the cultural heritage of the region. The area is also known for its local Pashtun culture, with traditional markets and roadside vendors offering local handicrafts.', 'Torkham Border, Khyber Pakhtunkhwa', 'images/Khyber Pass.jpg', '', 100),
(23, 5, 'Bala Hisar Fort', 'Bala Hisar Fort is a historic fort located in Peshawar, offering panoramic views of the city. Originally built in the 16th century, the fort has seen many historical changes and renovations. The fort was strategically placed to defend the city from invaders and served as a military headquarters during various periods in history. Today, visitors can explore the fort’s intricate architecture, including its large gates, watchtowers, and beautiful courtyards. The fort also houses a museum that exhibits military artifacts, weapons, and photographs that highlight the region’s military history. A visit to Bala Hisar Fort provides insight into Peshawar’s military past, and the views from the fort’s ramparts offer an unforgettable perspective of the surrounding area. The fort remains a significant historical site and a must-see for tourists exploring Peshawar’s cultural heritage.', 'Khyber Road, Peshawar, Khyber Pakhtunkhwa', 'images/Bala Hisar Fort.jpg', '', 100),
(24, 7, 'Clock Tower', 'The Clock Tower in Faisalabad is a historical landmark that dates back to the British colonial era. Located in the center of the city, the Clock Tower stands as a reminder of Faisalabad’s history and growth. The tower’s architecture blends colonial styles with local influences, making it a unique monument. The area surrounding the Clock Tower is a busy commercial hub, with markets selling everything from textiles to fresh produce. It’s also a great spot to experience the local culture, with many shops offering traditional handicrafts and food items. The Clock Tower remains a key feature of Faisalabad’s urban landscape and is a popular spot for tourists looking to explore the history and culture of the city.', 'Ghanta Ghar, Faisalabad, Punjab', 'images/Clock Tower.jpg', '', 100),
(25, 7, 'Lyallpur Museum', 'The Lyallpur Museum is an important cultural and historical site located in Faisalabad. Named after the founder of the city, Sir James Lyall, the museum showcases the region’s history, culture, and development. The museum’s exhibits include ancient artifacts, old photographs, and tools that date back to the city’s early days. The museum also highlights the agricultural heritage of Faisalabad, known as the “Manchester of Pakistan,” showcasing the city’s contribution to the country’s agricultural development. Visitors can learn about the diverse history of the region and explore its rich cultural heritage through various interactive displays and exhibits. The museum is a must-visit for anyone interested in the history and culture of Faisalabad.', 'University Road, Faisalabad, Punjab', 'images/Lyallpur Museum.jpg', '', 100),
(26, 7, 'Jinnah Garden', 'Jinnah Garden, located in the heart of Faisalabad, is a beautiful park dedicated to the founder of Pakistan, Muhammad Ali Jinnah. The park is a peaceful green space offering visitors a respite from the urban hustle. It features well-maintained gardens, walking paths, and a large fountain at the center. The park is popular for evening strolls, picnics, and family outings, making it a great spot for relaxation. The surrounding trees provide shade, making it a perfect place for a casual day out. Jinnah Garden is also home to a few historical monuments that commemorate Jinnah’s contribution to Pakistan’s independence. It is a calm and serene place that represents Faisalabad’s cultural and historical significance.', 'Jinnah Park, Faisalabad, Punjab', 'images/Jinnah Garden.jpg', '', 100),
(27, 8, 'Sindh Museum', 'The Sindh Museum in Hyderabad is one of the most important cultural institutions in the region, showcasing the rich heritage of Sindh. The museum features a wide variety of exhibits, including ancient artifacts, traditional Sindhi clothing, handicrafts, and displays about Sindhi culture and history. It offers visitors an opportunity to explore the region’s history, from the Indus Valley Civilization to the present day. The museum is an important destination for those interested in learning about the rich cultural and historical legacy of Sindh. The building itself is an architectural landmark, with traditional Sindhi designs and a serene atmosphere. Visitors can learn about the history, art, and traditions of Sindh, making the Sindh Museum a must-visit for tourists.', 'Qasimabad, Hyderabad, Sindh', 'images/Sindh Museum.jpg', '', 100),
(135, 8, 'Rani Bagh', 'Rani Bagh is one of Hyderabad’s most popular parks, known for its beautiful landscaping, large green spaces, and peaceful environment. The park is an excellent place for families to visit, offering playgrounds, walking paths, and picnic areas. It also houses a zoo with a variety of animals, including birds, reptiles, and mammals, making it a great place for children to learn about wildlife. Rani Bagh is ideal for evening walks, relaxation, and enjoying nature in the city. The park is also a venue for local festivals and events, with its beautiful gardens and open spaces providing a perfect backdrop. It remains a popular spot for locals and visitors looking for a peaceful place to enjoy Hyderabad’s natural beauty.', 'Rani Bagh Road, Hyderabad, Sindh', NULL, '', 100),
(136, 8, 'Miani Forest', 'Miani Forest is a lush and serene natural area located on the outskirts of Hyderabad, offering a perfect retreat for nature lovers. The forest is home to a wide variety of flora and fauna, making it an ideal spot for wildlife enthusiasts and photographers. Visitors can take guided nature walks to explore the rich biodiversity of the forest, including native trees, birds, and small mammals. The area is also known for its tranquil environment, making it a great escape from the city’s hustle and bustle. Miani Forest is perfect for those who appreciate nature and seek to reconnect with the outdoors.', 'Miani Road, Hyderabad, Sindh', NULL, '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `tour_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 1, 4, 'Great experience! Learned a lot about Karachi\'s history and enjoyed the company of the guide.', '2024-11-02 15:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `tour_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `max_guests` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`tour_id`, `city_id`, `name`, `description`, `price`, `duration`, `max_guests`) VALUES
(1, 1, 'Historical Karachi Tour', 'A tour exploring the historical sites of Karachi including Mohatta Palace and Quaid-e-Azam\'s mausoleum.', 1500.00, '5 hours', 20),
(2, 1, 'Karachi Food Tour', 'A culinary journey through Karachi\'s famous street food spots.', 1200.00, '3 hours', 15),
(3, 1, 'Beach Day at Clifton', 'A relaxing day by the famous Clifton beach with options for camel rides and local snacks.', 800.00, '2 hours', 30),
(4, 1, 'Karachi Food Tour', 'A culinary journey through Karachi.', 1200.00, '3 hours', 15),
(5, 2, 'Lahore Fort & Badshahi Mosque Tour', 'Discover the grandeur of Lahore.', 2000.00, '6 hours', 25),
(6, 2, 'Lahore Food Street Night Tour', 'Experience the vibrant food street.', 1000.00, '2 hours', 10),
(7, 3, 'Islamabad City Tour', 'Visit famous landmarks in Islamabad.', 1800.00, '4 hours', 20),
(8, 3, 'Hiking at Margalla Hills', 'Enjoy a scenic hike in the Margalla Hills.', 800.00, '3 hours', 10),
(9, 4, 'Quetta Nature Tour', 'A tour through the natural beauty of Quetta.', 1500.00, '5 hours', 20),
(10, 5, 'Peshawar City Walk', 'Explore Peshawar\'s history and markets.', 1200.00, '4 hours', 15),
(11, 6, 'Multan Shrines Tour', 'Visit famous shrines in Multan.', 1400.00, '5 hours', 20),
(12, 7, 'Textile Industry Tour in Faisalabad', 'Learn about textile production in Faisalabad.', 2000.00, '6 hours', 25);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `pwd`, `created_at`, `type`) VALUES
(1, 'Ali Khan', 'ali.khan@example.com', '1234', '2024-11-02 15:05:16', 'admin'),
(15, 'Sara Malik', 'sara.malik@example.com', 'hashed_password_2', '2024-11-02 15:12:33', 'user'),
(16, 'Usman Ahmed', 'usman.ahmed@example.com', 'hashed_password_3', '2024-11-02 15:12:33', 'user'),
(17, 'Zara Sheikh', 'zara.sheikh@example.com', 'hashed_password_4', '2024-11-02 15:12:33', 'user'),
(18, 'Hassan Iqbal', 'hassan.iqbal@example.com', 'hashed_password_5', '2024-11-02 15:12:33', 'user'),
(19, 'Fatima Anwar', 'fatima.anwar@example.com', 'hashed_password_6', '2024-11-02 15:12:33', 'user'),
(20, 'Omar Khan', 'omar.khan@example.com', 'hashed_password_7', '2024-11-02 15:12:33', 'user'),
(21, 'Nadia Javed', 'nadia.javed@example.com', 'hashed_password_8', '2024-11-02 15:12:33', 'user'),
(22, 'Bilal Shah', 'bilal.shah@example.com', 'hashed_password_9', '2024-11-02 15:12:33', 'user'),
(23, 'Ayesha Tariq', 'ayesha.tariq@example.com', 'hashed_password_10', '2024-11-02 15:12:33', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `booking_cart`
--
ALTER TABLE `booking_cart`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `booking_cart_ibfk_1` (`destination_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerNumber`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`),
  ADD KEY `destinations_ibfk_1` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`tour_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `booking_cart`
--
ALTER TABLE `booking_cart`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_cart`
--
ALTER TABLE `booking_cart`
  ADD CONSTRAINT `booking_cart_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
