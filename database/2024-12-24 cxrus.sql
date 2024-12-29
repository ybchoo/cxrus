/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.40 : Database - cxrus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cxrus` /*!40100 DEFAULT CHARACTER SET utf16 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cxrus`;

/*Table structure for table `cart_product` */

DROP TABLE IF EXISTS `cart_product`;

CREATE TABLE `cart_product` (
  `cart_product_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_product_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `cart_product` */

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `carts` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(25) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`CategoryID`,`CategoryName`,`Description`,`category_id`,`category_name`) values 
(1,'Beverages','Soft drinks, coffees, teas, beers, and ales',0,NULL),
(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings',0,NULL),
(3,'Confections','Desserts, candies, and sweet breads',0,NULL),
(4,'Dairy Products','Cheeses',0,NULL),
(5,'Grains/Cereals','Breads, crackers, pasta, and cereal',0,NULL),
(6,'Meat/Poultry','Prepared meats',0,NULL),
(7,'Produce','Dried fruit and bean curd',0,NULL),
(8,'Seafood','Seaweed and fish',0,NULL);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(15) NOT NULL,
  `description` text,
  `picture` blob,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `category` */

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK6gatmv9dwedve82icy8wrkdmk` (`country_id`),
  CONSTRAINT `FK6gatmv9dwedve82icy8wrkdmk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `cities` */

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `countries` */

/*Table structure for table `custcustdemographics` */

DROP TABLE IF EXISTS `custcustdemographics`;

CREATE TABLE `custcustdemographics` (
  `custId` int NOT NULL,
  `customerTypeId` int NOT NULL,
  PRIMARY KEY (`custId`,`customerTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `custcustdemographics` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `custId` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(40) NOT NULL,
  `contactName` varchar(30) DEFAULT NULL,
  `contactTitle` varchar(30) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `region` varchar(15) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `customer` */

/*Table structure for table `customerdemographics` */

DROP TABLE IF EXISTS `customerdemographics`;

CREATE TABLE `customerdemographics` (
  `customerTypeId` int NOT NULL AUTO_INCREMENT,
  `customerDesc` text,
  PRIMARY KEY (`customerTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `customerdemographics` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(50) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `customer_number` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `cust_id` bigint NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `FKcnjv7us3tih8hj2fonxov8gxw` (`city_id`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `FKcnjv7us3tih8hj2fonxov8gxw` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customers` */

insert  into `customers`(`CustomerID`,`CustomerName`,`ContactName`,`address`,`city`,`PostalCode`,`country`,`contact_name`,`customer_name`,`postal_code`,`customer_number`,`company_name`,`contact_title`,`city_id`,`country_id`,`cust_id`) values 
(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','5021','Mexico',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','5023','Mexico',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','S-958 22','Sweden',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(6,'Blauer See Delikatessen','Hanna Moos','Forsterstr. 57','Mannheim','68306','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(7,'Blondel père et fils','Frédérique Citeaux','24, place Kléber','Strasbourg','67000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(8,'Bólido Comidas preparadas','Martín Sommer','C/ Araquil, 67','Madrid','28023','Spain',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(9,'Bon app\'\'','Laurence Lebihans','12, rue des Bouchers','Marseille','13008','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(10,'Bottom-Dollar Marketse','Elizabeth Lincoln','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(11,'B\'\'s Beverages','Victoria Ashworth','Fauntleroy Circus','London','EC2 5NT','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(12,'Cactus Comidas para llevar','Patricio Simpson','Cerrito 333','Buenos Aires','1010','Argentina',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(13,'Centro comercial Moctezuma','Francisco Chang','Sierras de Granada 9993','México D.F.','5022','Mexico',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(14,'Chop-suey Chinese','Yang Wang','Hauptstr. 29','Bern','3012','Switzerland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(15,'Comércio Mineiro','Pedro Afonso','Av. dos Lusíadas, 23','São Paulo','05432-043','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(16,'Consolidated Holdings','Elizabeth Brown','Berkeley Gardens 12 Brewery','London','WX1 6LT','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(17,'Drachenblut Delikatessend','Sven Ottlieb','Walserweg 21','Aachen','52066','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(18,'Du monde entier','Janine Labrune','67, rue des Cinquante Otages','Nantes','44000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(19,'Eastern Connection','Ann Devon','35 King George','London','WX3 6FW','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(20,'Ernst Handel','Roland Mendel','Kirchgasse 6','Graz','8010','Austria',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(21,'Familia Arquibaldo','Aria Cruz','Rua Orós, 92','São Paulo','05442-030','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(22,'FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','C/ Moralzarzal, 86','Madrid','28034','Spain',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(23,'Folies gourmandes','Martine Rancé','184, chaussée de Tournai','Lille','59000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(24,'Folk och fä HB','Maria Larsson','Åkergatan 24','Bräcke','S-844 67','Sweden',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(25,'Frankenversand','Peter Franken','Berliner Platz 43','München','80805','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(26,'France restauration','Carine Schmitt','54, rue Royale','Nantes','44000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(27,'Franchi S.p.A.','Paolo Accorti','Via Monte Bianco 34','Torino','10100','Italy',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(28,'Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Jardim das rosas n. 32','Lisboa','1675','Portugal',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(29,'Galería del gastrónomo','Eduardo Saavedra','Rambla de Cataluña, 23','Barcelona','8022','Spain',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(30,'Godos Cocina Típica','José Pedro Freyre','C/ Romero, 33','Sevilla','41101','Spain',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(31,'Gourmet Lanchonetes','André Fonseca','Av. Brasil, 442','Campinas','04876-786','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(32,'Great Lakes Food Market','Howard Snyder','2732 Baker Blvd.','Eugene','97403','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(33,'GROSELLA-Restaurante','Manuel Pereira','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(34,'Hanari Carnes','Mario Pontes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(35,'HILARIÓN-Abastos','Carlos Hernández','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(36,'Hungry Coyote Import Store','Yoshi Latimer','City Center Plaza 516 Main St.','Elgin','97827','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(37,'Hungry Owl All-Night Grocers','Patricia McKenna','8 Johnstown Road','Cork','','Ireland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(38,'Island Trading','Helen Bennett','Garden House Crowther Way','Cowes','PO31 7PJ','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(39,'Königlich Essen','Philip Cramer','Maubelstr. 90','Brandenburg','14776','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(40,'La corne d\'\'abondance','Daniel Tonini','67, avenue de l\'\'Europe','Versailles','78000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(41,'La maison d\'\'Asie','Annette Roulet','1 rue Alsace-Lorraine','Toulouse','31000','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(42,'Laughing Bacchus Wine Cellars','Yoshi Tannamuri','1900 Oak St.','Vancouver','V3F 2K1','Canada',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(43,'Lazy K Kountry Store','John Steel','12 Orchestra Terrace','Walla Walla','99362','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(44,'Lehmanns Marktstand','Renate Messner','Magazinweg 7','Frankfurt a.M.','60528','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(45,'Let\'\'s Stop N Shop','Jaime Yorres','87 Polk St. Suite 5','San Francisco','94117','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(46,'LILA-Supermercado','Carlos González','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(47,'LINO-Delicateses','Felipe Izquierdo','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(48,'Lonesome Pine Restaurant','Fran Wilson','89 Chiaroscuro Rd.','Portland','97219','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(49,'Magazzini Alimentari Riuniti','Giovanni Rovelli','Via Ludovico il Moro 22','Bergamo','24100','Italy',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(50,'Maison Dewey','Catherine Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgium',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(51,'Mère Paillarde','Jean Fresnière','43 rue St. Laurent','Montréal','H1J 1C3','Canada',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(52,'Morgenstern Gesundkost','Alexander Feuer','Heerstr. 22','Leipzig','4179','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(53,'North/South','Simon Crowther','South House 300 Queensbridge','London','SW7 1RZ','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(54,'Océano Atlántico Ltda.','Yvonne Moncada','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','1010','Argentina',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(55,'Old World Delicatessen','Rene Phillips','2743 Bering St.','Anchorage','99508','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(56,'Ottilies Käseladen','Henriette Pfalzheim','Mehrheimerstr. 369','Köln','50739','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(57,'Paris spécialités','Marie Bertrand','265, boulevard Charonne','Paris','75012','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(58,'Pericles Comidas clásicas','Guillermo Fernández','Calle Dr. Jorge Cash 321','México D.F.','5033','Mexico',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(59,'Piccolo und mehr','Georg Pipps','Geislweg 14','Salzburg','5020','Austria',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(60,'Princesa Isabel Vinhoss','Isabel de Castro','Estrada da saúde n. 58','Lisboa','1756','Portugal',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(61,'Que Delícia','Bernardo Batista','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(62,'Queen Cozinha','Lúcia Carvalho','Alameda dos Canàrios, 891','São Paulo','05487-020','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(63,'QUICK-Stop','Horst Kloss','Taucherstraße 10','Cunewalde','1307','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(64,'Rancho grande','Sergio Gutiérrez','Av. del Libertador 900','Buenos Aires','1010','Argentina',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(65,'Rattlesnake Canyon Grocery','Paula Wilson','2817 Milton Dr.','Albuquerque','87110','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(66,'Reggiani Caseifici','Maurizio Moroni','Strada Provinciale 124','Reggio Emilia','42100','Italy',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(67,'Ricardo Adocicados','Janete Limeira','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(68,'Richter Supermarkt','Michael Holz','Grenzacherweg 237','Genève','1203','Switzerland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(69,'Romero y tomillo','Alejandra Camino','Gran Vía, 1','Madrid','28001','Spain',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(70,'Santé Gourmet','Jonas Bergulfsen','Erling Skakkes gate 78','Stavern','4110','Norway',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(71,'Save-a-lot Markets','Jose Pavarotti','187 Suffolk Ln.','Boise','83720','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(72,'Seven Seas Imports','Hari Kumar','90 Wadhurst Rd.','London','OX15 4NB','UK',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(73,'Simons bistro','Jytte Petersen','Vinbæltet 34','København','1734','Denmark',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(74,'Spécialités du monde','Dominique Perrier','25, rue Lauriston','Paris','75016','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(75,'Split Rail Beer & Ale','Art Braunschweiger','P.O. Box 555','Lander','82520','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(76,'Suprêmes délices','Pascale Cartrain','Boulevard Tirou, 255','Charleroi','B-6000','Belgium',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(77,'The Big Cheese','Liz Nixon','89 Jefferson Way Suite 2','Portland','97201','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(78,'The Cracker Box','Liu Wong','55 Grizzly Peak Rd.','Butte','59801','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(79,'Toms Spezialitäten','Karin Josephs','Luisenstr. 48','Münster','44087','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(80,'Tortuga Restaurante','Miguel Angel Paolino','Avda. Azteca 123','México D.F.','5033','Mexico',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(81,'Tradição Hipermercados','Anabela Domingues','Av. Inês de Castro, 414','São Paulo','05634-030','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(82,'Trail\'\'s Head Gourmet Provisioners','Helvetius Nagy','722 DaVinci Blvd.','Kirkland','98034','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(83,'Vaffeljernet','Palle Ibsen','Smagsløget 45','Århus','8200','Denmark',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(84,'Victuailles en stock','Mary Saveley','2, rue du Commerce','Lyon','69004','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(85,'Vins et alcools Chevalier','Paul Henriot','59 rue de l\'\'Abbaye','Reims','51100','France',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(86,'Die Wandernde Kuh','Rita Müller','Adenauerallee 900','Stuttgart','70563','Germany',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(87,'Wartian Herkku','Pirkko Koskitalo','Torikatu 38','Oulu','90110','Finland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(88,'Wellington Importadora','Paula Parente','Rua do Mercado, 12','Resende','08737-363','Brazil',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(89,'White Clover Markets','Karl Jablonski','305 - 14th Ave. S. Suite 3B','Seattle','98128','USA',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(90,'Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(91,'Wolski','Zbyszek','ul. Filtrowa 68','Walla','01-012','Poland',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0),
(93,NULL,NULL,'A1 Address','A1 City',NULL,'A1Country','A1 Contact','A1','111000','',NULL,NULL,NULL,NULL,0),
(151,NULL,NULL,'A1 Address','A1 City',NULL,'A1Country','A1 Contact','A1','111000','',NULL,NULL,NULL,NULL,0),
(152,NULL,NULL,'A1 Address','A1 City',NULL,'A1Country','A1 Contact','A1','111000','',NULL,NULL,NULL,NULL,0);

/*Table structure for table `customers_seq` */

DROP TABLE IF EXISTS `customers_seq`;

CREATE TABLE `customers_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `customers_seq` */

insert  into `customers_seq`(`next_val`) values 
(300);

/*Table structure for table `databasechangelog` */

DROP TABLE IF EXISTS `databasechangelog`;

CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `databasechangelog` */

insert  into `databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('init-1','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',1,'EXECUTED','8:f7e695a965744beceae8bd61561c8e3a','createTable tableName=Category','',NULL,'4.9.1',NULL,NULL,'5488846383'),
('init-2','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',2,'EXECUTED','8:159fcb56bb92fbb8b6ae17f51fe49243','createTable tableName=CustCustDemographics','',NULL,'4.9.1',NULL,NULL,'5488846383'),
('init-3','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',3,'EXECUTED','8:3884548fb0c435b8f817f0ce79c04e94','createTable tableName=Customer','',NULL,'4.9.1',NULL,NULL,'5488846383'),
('init-4','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',4,'EXECUTED','8:f5e446a21a9e490c0584d148c25de895','createTable tableName=CustomerDemographics','',NULL,'4.9.1',NULL,NULL,'5488846383'),
('init-5','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',5,'EXECUTED','8:ece8d42b6071fdb92dda157529cd3e27','createTable tableName=Employee','',NULL,'4.9.1',NULL,NULL,'5488846383'),
('init-6','saladlam','db/changelog/db.changelog-start.xml','2024-12-30 00:14:07',6,'EXECUTED','8:d282ef1e2910e0ecd14856d549f26451','createTable tableName=EmployeeTerritory','',NULL,'4.9.1',NULL,NULL,'5488846383');

/*Table structure for table `databasechangeloglock` */

DROP TABLE IF EXISTS `databasechangeloglock`;

CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `databasechangeloglock` */

insert  into `databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(20) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `titleOfCourtesy` varchar(25) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `hireDate` datetime DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `region` varchar(15) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `extension` varchar(4) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `photo` blob,
  `notes` blob,
  `mgrId` int DEFAULT NULL,
  `photoPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `employee` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(15) DEFAULT NULL,
  `FirstName` varchar(15) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Photo` varchar(25) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `employee_id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `reports_to` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `FK1ranu65bx6ropj5u7thr9hpnn` (`city_id`),
  KEY `FK92tibve1v3uf1egh3n3bnslgp` (`country_id`),
  CONSTRAINT `FK1ranu65bx6ropj5u7thr9hpnn` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `FK92tibve1v3uf1egh3n3bnslgp` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `employees` */

insert  into `employees`(`EmployeeID`,`LastName`,`FirstName`,`BirthDate`,`Photo`,`Notes`,`employee_id`,`address`,`birth_date`,`first_name`,`last_name`,`reports_to`,`title`,`city_id`,`country_id`) values 
(1,'Davolio','Nancy','1968-12-08 00:00:00','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of \'Toastmasters International\'.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'Fuller','Andrew','1952-02-19 00:00:00','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'Leverling','Janet','1963-08-30 00:00:00','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'Peacock','Margaret','1958-09-19 00:00:00','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'Buchanan','Steven','1955-03-04 00:00:00','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses \'Successful Telemarketing\' and \'International Sales Management\'. He is fluent in French.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'Suyama','Michael','1963-07-02 00:00:00','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses \'Multi-Cultural Selling\' and \'Time Management for the Sales Professional\'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'King','Robert','1960-05-29 00:00:00','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled \'Selling in Europe\', he was transferred to the London office.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Callahan','Laura','1958-01-09 00:00:00','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Dodsworth','Anne','1969-07-02 00:00:00','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'West','Adam','1928-09-19 00:00:00','EmpID10.pic','An old chum.',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `employeeterritory` */

DROP TABLE IF EXISTS `employeeterritory`;

CREATE TABLE `employeeterritory` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `territoryId` varchar(20) NOT NULL,
  PRIMARY KEY (`employeeId`,`territoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `employeeterritory` */

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `discount` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `order_details` */

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `UnitPrice` float NOT NULL DEFAULT '0',
  `Quantity` float NOT NULL DEFAULT '0',
  `discount` float DEFAULT '0',
  PRIMARY KEY (`OrderID`,`ProductID`,`Quantity`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `orderdetail` */

/*Table structure for table `orderdetails` */

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `Discount` float DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderdetails` */

insert  into `orderdetails`(`OrderID`,`ProductID`,`Quantity`,`Discount`,`UnitPrice`) values 
(10248,11,12,NULL,NULL),
(10248,42,10,NULL,NULL),
(10248,72,5,NULL,NULL),
(10249,14,9,NULL,NULL),
(10249,51,40,NULL,NULL),
(10250,41,10,NULL,NULL),
(10250,51,35,NULL,NULL),
(10250,65,15,NULL,NULL),
(10251,22,6,NULL,NULL),
(10251,57,15,NULL,NULL),
(10251,65,20,NULL,NULL),
(10252,20,40,NULL,NULL),
(10252,33,25,NULL,NULL),
(10252,60,40,NULL,NULL),
(10253,31,20,NULL,NULL),
(10253,39,42,NULL,NULL),
(10253,49,40,NULL,NULL),
(10254,24,15,NULL,NULL),
(10254,55,21,NULL,NULL),
(10254,74,21,NULL,NULL),
(10255,2,20,NULL,NULL),
(10255,16,35,NULL,NULL),
(10255,36,25,NULL,NULL),
(10255,59,30,NULL,NULL),
(10256,53,15,NULL,NULL),
(10256,77,12,NULL,NULL),
(10257,27,25,NULL,NULL),
(10257,39,6,NULL,NULL),
(10257,77,15,NULL,NULL),
(10258,2,50,NULL,NULL),
(10258,5,65,NULL,NULL),
(10258,32,6,NULL,NULL),
(10259,21,10,NULL,NULL),
(10259,37,1,NULL,NULL),
(10260,41,16,NULL,NULL),
(10260,57,50,NULL,NULL),
(10260,62,15,NULL,NULL),
(10260,70,21,NULL,NULL),
(10261,21,20,NULL,NULL),
(10261,35,20,NULL,NULL),
(10262,5,12,NULL,NULL),
(10262,7,15,NULL,NULL),
(10262,56,2,NULL,NULL),
(10263,16,60,NULL,NULL),
(10263,24,28,NULL,NULL),
(10263,30,60,NULL,NULL),
(10263,74,36,NULL,NULL),
(10264,2,35,NULL,NULL),
(10264,41,25,NULL,NULL),
(10265,17,30,NULL,NULL),
(10265,70,20,NULL,NULL),
(10266,12,12,NULL,NULL),
(10267,40,50,NULL,NULL),
(10267,59,70,NULL,NULL),
(10267,76,15,NULL,NULL),
(10268,29,10,NULL,NULL),
(10268,72,4,NULL,NULL),
(10269,33,60,NULL,NULL),
(10269,72,20,NULL,NULL),
(10270,36,30,NULL,NULL),
(10270,43,25,NULL,NULL),
(10271,33,24,NULL,NULL),
(10272,20,6,NULL,NULL),
(10272,31,40,NULL,NULL),
(10272,72,24,NULL,NULL),
(10273,10,24,NULL,NULL),
(10273,31,15,NULL,NULL),
(10273,33,20,NULL,NULL),
(10273,40,60,NULL,NULL),
(10273,76,33,NULL,NULL),
(10274,71,20,NULL,NULL),
(10274,72,7,NULL,NULL),
(10275,24,12,NULL,NULL),
(10275,59,6,NULL,NULL),
(10276,10,15,NULL,NULL),
(10276,13,10,NULL,NULL),
(10277,28,20,NULL,NULL),
(10277,62,12,NULL,NULL),
(10278,44,16,NULL,NULL),
(10278,59,15,NULL,NULL),
(10278,63,8,NULL,NULL),
(10278,73,25,NULL,NULL),
(10279,17,15,NULL,NULL),
(10280,24,12,NULL,NULL),
(10280,55,20,NULL,NULL),
(10280,75,30,NULL,NULL),
(10281,19,1,NULL,NULL),
(10281,24,6,NULL,NULL),
(10281,35,4,NULL,NULL),
(10282,30,6,NULL,NULL),
(10282,57,2,NULL,NULL),
(10283,15,20,NULL,NULL),
(10283,19,18,NULL,NULL),
(10283,60,35,NULL,NULL),
(10283,72,3,NULL,NULL),
(10284,27,15,NULL,NULL),
(10284,44,21,NULL,NULL),
(10284,60,20,NULL,NULL),
(10284,67,5,NULL,NULL),
(10285,1,45,NULL,NULL),
(10285,40,40,NULL,NULL),
(10285,53,36,NULL,NULL),
(10286,35,100,NULL,NULL),
(10286,62,40,NULL,NULL),
(10287,16,40,NULL,NULL),
(10287,34,20,NULL,NULL),
(10287,46,15,NULL,NULL),
(10288,54,10,NULL,NULL),
(10288,68,3,NULL,NULL),
(10289,3,30,NULL,NULL),
(10289,64,9,NULL,NULL),
(10290,5,20,NULL,NULL),
(10290,29,15,NULL,NULL),
(10290,49,15,NULL,NULL),
(10290,77,10,NULL,NULL),
(10291,13,20,NULL,NULL),
(10291,44,24,NULL,NULL),
(10291,51,2,NULL,NULL),
(10292,20,20,NULL,NULL),
(10293,18,12,NULL,NULL),
(10293,24,10,NULL,NULL),
(10293,63,5,NULL,NULL),
(10293,75,6,NULL,NULL),
(10294,1,18,NULL,NULL),
(10294,17,15,NULL,NULL),
(10294,43,15,NULL,NULL),
(10294,60,21,NULL,NULL),
(10294,75,6,NULL,NULL),
(10295,56,4,NULL,NULL),
(10296,11,12,NULL,NULL),
(10296,16,30,NULL,NULL),
(10296,69,15,NULL,NULL),
(10297,39,60,NULL,NULL),
(10297,72,20,NULL,NULL),
(10298,2,40,NULL,NULL),
(10298,36,40,NULL,NULL),
(10298,59,30,NULL,NULL),
(10298,62,15,NULL,NULL),
(10299,19,15,NULL,NULL),
(10299,70,20,NULL,NULL),
(10300,66,30,NULL,NULL),
(10300,68,20,NULL,NULL),
(10301,40,10,NULL,NULL),
(10301,56,20,NULL,NULL),
(10302,17,40,NULL,NULL),
(10302,28,28,NULL,NULL),
(10302,43,12,NULL,NULL),
(10303,40,40,NULL,NULL),
(10303,65,30,NULL,NULL),
(10303,68,15,NULL,NULL),
(10304,49,30,NULL,NULL),
(10304,59,10,NULL,NULL),
(10304,71,2,NULL,NULL),
(10305,18,25,NULL,NULL),
(10305,29,25,NULL,NULL),
(10305,39,30,NULL,NULL),
(10306,30,10,NULL,NULL),
(10306,53,10,NULL,NULL),
(10306,54,5,NULL,NULL),
(10307,62,10,NULL,NULL),
(10307,68,3,NULL,NULL),
(10308,69,1,NULL,NULL),
(10308,70,5,NULL,NULL),
(10309,4,20,NULL,NULL),
(10309,6,30,NULL,NULL),
(10309,42,2,NULL,NULL),
(10309,43,20,NULL,NULL),
(10309,71,3,NULL,NULL),
(10310,16,10,NULL,NULL),
(10310,62,5,NULL,NULL),
(10311,42,6,NULL,NULL),
(10311,69,7,NULL,NULL),
(10312,28,4,NULL,NULL),
(10312,43,24,NULL,NULL),
(10312,53,20,NULL,NULL),
(10312,75,10,NULL,NULL),
(10313,36,12,NULL,NULL),
(10314,32,40,NULL,NULL),
(10314,58,30,NULL,NULL),
(10314,62,25,NULL,NULL),
(10315,34,14,NULL,NULL),
(10315,70,30,NULL,NULL),
(10316,41,10,NULL,NULL),
(10316,62,70,NULL,NULL),
(10317,1,20,NULL,NULL),
(10318,41,20,NULL,NULL),
(10318,76,6,NULL,NULL),
(10319,17,8,NULL,NULL),
(10319,28,14,NULL,NULL),
(10319,76,30,NULL,NULL),
(10320,71,30,NULL,NULL),
(10321,35,10,NULL,NULL),
(10322,52,20,NULL,NULL),
(10323,15,5,NULL,NULL),
(10323,25,4,NULL,NULL),
(10323,39,4,NULL,NULL),
(10324,16,21,NULL,NULL),
(10324,35,70,NULL,NULL),
(10324,46,30,NULL,NULL),
(10324,59,40,NULL,NULL),
(10324,63,80,NULL,NULL),
(10325,6,6,NULL,NULL),
(10325,13,12,NULL,NULL),
(10325,14,9,NULL,NULL),
(10325,31,4,NULL,NULL),
(10325,72,40,NULL,NULL),
(10326,4,24,NULL,NULL),
(10326,57,16,NULL,NULL),
(10326,75,50,NULL,NULL),
(10327,2,25,NULL,NULL),
(10327,11,50,NULL,NULL),
(10327,30,35,NULL,NULL),
(10327,58,30,NULL,NULL),
(10328,59,9,NULL,NULL),
(10328,65,40,NULL,NULL),
(10328,68,10,NULL,NULL),
(10329,19,10,NULL,NULL),
(10329,30,8,NULL,NULL),
(10329,38,20,NULL,NULL),
(10329,56,12,NULL,NULL),
(10330,26,50,NULL,NULL),
(10330,72,25,NULL,NULL),
(10331,54,15,NULL,NULL),
(10332,18,40,NULL,NULL),
(10332,42,10,NULL,NULL),
(10332,47,16,NULL,NULL),
(10333,14,10,NULL,NULL),
(10333,21,10,NULL,NULL),
(10333,71,40,NULL,NULL),
(10334,52,8,NULL,NULL),
(10334,68,10,NULL,NULL),
(10335,2,7,NULL,NULL),
(10335,31,25,NULL,NULL),
(10335,32,6,NULL,NULL),
(10335,51,48,NULL,NULL),
(10336,4,18,NULL,NULL),
(10337,23,40,NULL,NULL),
(10337,26,24,NULL,NULL),
(10337,36,20,NULL,NULL),
(10337,37,28,NULL,NULL),
(10337,72,25,NULL,NULL),
(10338,17,20,NULL,NULL),
(10338,30,15,NULL,NULL),
(10339,4,10,NULL,NULL),
(10339,17,70,NULL,NULL),
(10339,62,28,NULL,NULL),
(10340,18,20,NULL,NULL),
(10340,41,12,NULL,NULL),
(10340,43,40,NULL,NULL),
(10341,33,8,NULL,NULL),
(10341,59,9,NULL,NULL),
(10342,2,24,NULL,NULL),
(10342,31,56,NULL,NULL),
(10342,36,40,NULL,NULL),
(10342,55,40,NULL,NULL),
(10343,64,50,NULL,NULL),
(10343,68,4,NULL,NULL),
(10343,76,15,NULL,NULL),
(10344,4,35,NULL,NULL),
(10344,8,70,NULL,NULL),
(10345,8,70,NULL,NULL),
(10345,19,80,NULL,NULL),
(10345,42,9,NULL,NULL),
(10346,17,36,NULL,NULL),
(10346,56,20,NULL,NULL),
(10347,25,10,NULL,NULL),
(10347,39,50,NULL,NULL),
(10347,40,4,NULL,NULL),
(10347,75,6,NULL,NULL),
(10348,1,15,NULL,NULL),
(10348,23,25,NULL,NULL),
(10349,54,24,NULL,NULL),
(10350,50,15,NULL,NULL),
(10350,69,18,NULL,NULL),
(10351,38,20,NULL,NULL),
(10351,41,13,NULL,NULL),
(10351,44,77,NULL,NULL),
(10351,65,10,NULL,NULL),
(10352,24,10,NULL,NULL),
(10352,54,20,NULL,NULL),
(10353,11,12,NULL,NULL),
(10353,38,50,NULL,NULL),
(10354,1,12,NULL,NULL),
(10354,29,4,NULL,NULL),
(10355,24,25,NULL,NULL),
(10355,57,25,NULL,NULL),
(10356,31,30,NULL,NULL),
(10356,55,12,NULL,NULL),
(10356,69,20,NULL,NULL),
(10357,10,30,NULL,NULL),
(10357,26,16,NULL,NULL),
(10357,60,8,NULL,NULL),
(10358,24,10,NULL,NULL),
(10358,34,10,NULL,NULL),
(10358,36,20,NULL,NULL),
(10359,16,56,NULL,NULL),
(10359,31,70,NULL,NULL),
(10359,60,80,NULL,NULL),
(10360,28,30,NULL,NULL),
(10360,29,35,NULL,NULL),
(10360,38,10,NULL,NULL),
(10360,49,35,NULL,NULL),
(10360,54,28,NULL,NULL),
(10361,39,54,NULL,NULL),
(10361,60,55,NULL,NULL),
(10362,25,50,NULL,NULL),
(10362,51,20,NULL,NULL),
(10362,54,24,NULL,NULL),
(10363,31,20,NULL,NULL),
(10363,75,12,NULL,NULL),
(10363,76,12,NULL,NULL),
(10364,69,30,NULL,NULL),
(10364,71,5,NULL,NULL),
(10365,11,24,NULL,NULL),
(10366,65,5,NULL,NULL),
(10366,77,5,NULL,NULL),
(10367,34,36,NULL,NULL),
(10367,54,18,NULL,NULL),
(10367,65,15,NULL,NULL),
(10367,77,7,NULL,NULL),
(10368,21,5,NULL,NULL),
(10368,28,13,NULL,NULL),
(10368,57,25,NULL,NULL),
(10368,64,35,NULL,NULL),
(10369,29,20,NULL,NULL),
(10369,56,18,NULL,NULL),
(10370,1,15,NULL,NULL),
(10370,64,30,NULL,NULL),
(10370,74,20,NULL,NULL),
(10371,36,6,NULL,NULL),
(10372,20,12,NULL,NULL),
(10372,38,40,NULL,NULL),
(10372,60,70,NULL,NULL),
(10372,72,42,NULL,NULL),
(10373,58,80,NULL,NULL),
(10373,71,50,NULL,NULL),
(10374,31,30,NULL,NULL),
(10374,58,15,NULL,NULL),
(10375,14,15,NULL,NULL),
(10375,54,10,NULL,NULL),
(10376,31,42,NULL,NULL),
(10377,28,20,NULL,NULL),
(10377,39,20,NULL,NULL),
(10378,71,6,NULL,NULL),
(10379,41,8,NULL,NULL),
(10379,63,16,NULL,NULL),
(10379,65,20,NULL,NULL),
(10380,30,18,NULL,NULL),
(10380,53,20,NULL,NULL),
(10380,60,6,NULL,NULL),
(10380,70,30,NULL,NULL),
(10381,74,14,NULL,NULL),
(10382,5,32,NULL,NULL),
(10382,18,9,NULL,NULL),
(10382,29,14,NULL,NULL),
(10382,33,60,NULL,NULL),
(10382,74,50,NULL,NULL),
(10383,13,20,NULL,NULL),
(10383,50,15,NULL,NULL),
(10383,56,20,NULL,NULL),
(10384,20,28,NULL,NULL),
(10384,60,15,NULL,NULL),
(10385,7,10,NULL,NULL),
(10385,60,20,NULL,NULL),
(10385,68,8,NULL,NULL),
(10386,24,15,NULL,NULL),
(10386,34,10,NULL,NULL),
(10387,24,15,NULL,NULL),
(10387,28,6,NULL,NULL),
(10387,59,12,NULL,NULL),
(10387,71,15,NULL,NULL),
(10388,45,15,NULL,NULL),
(10388,52,20,NULL,NULL),
(10388,53,40,NULL,NULL),
(10389,10,16,NULL,NULL),
(10389,55,15,NULL,NULL),
(10389,62,20,NULL,NULL),
(10389,70,30,NULL,NULL),
(10390,31,60,NULL,NULL),
(10390,35,40,NULL,NULL),
(10390,46,45,NULL,NULL),
(10390,72,24,NULL,NULL),
(10391,13,18,NULL,NULL),
(10392,69,50,NULL,NULL),
(10393,2,25,NULL,NULL),
(10393,14,42,NULL,NULL),
(10393,25,7,NULL,NULL),
(10393,26,70,NULL,NULL),
(10393,31,32,NULL,NULL),
(10394,13,10,NULL,NULL),
(10394,62,10,NULL,NULL),
(10395,46,28,NULL,NULL),
(10395,53,70,NULL,NULL),
(10395,69,8,NULL,NULL),
(10396,23,40,NULL,NULL),
(10396,71,60,NULL,NULL),
(10396,72,21,NULL,NULL),
(10397,21,10,NULL,NULL),
(10397,51,18,NULL,NULL),
(10398,35,30,NULL,NULL),
(10398,55,120,NULL,NULL),
(10399,68,60,NULL,NULL),
(10399,71,30,NULL,NULL),
(10399,76,35,NULL,NULL),
(10399,77,14,NULL,NULL),
(10400,29,21,NULL,NULL),
(10400,35,35,NULL,NULL),
(10400,49,30,NULL,NULL),
(10401,30,18,NULL,NULL),
(10401,56,70,NULL,NULL),
(10401,65,20,NULL,NULL),
(10401,71,60,NULL,NULL),
(10402,23,60,NULL,NULL),
(10402,63,65,NULL,NULL),
(10403,16,21,NULL,NULL),
(10403,48,70,NULL,NULL),
(10404,26,30,NULL,NULL),
(10404,42,40,NULL,NULL),
(10404,49,30,NULL,NULL),
(10405,3,50,NULL,NULL),
(10406,1,10,NULL,NULL),
(10406,21,30,NULL,NULL),
(10406,28,42,NULL,NULL),
(10406,36,5,NULL,NULL),
(10406,40,2,NULL,NULL),
(10407,11,30,NULL,NULL),
(10407,69,15,NULL,NULL),
(10407,71,15,NULL,NULL),
(10408,37,10,NULL,NULL),
(10408,54,6,NULL,NULL),
(10408,62,35,NULL,NULL),
(10409,14,12,NULL,NULL),
(10409,21,12,NULL,NULL),
(10410,33,49,NULL,NULL),
(10410,59,16,NULL,NULL),
(10411,41,25,NULL,NULL),
(10411,44,40,NULL,NULL),
(10411,59,9,NULL,NULL),
(10412,14,20,NULL,NULL),
(10413,1,24,NULL,NULL),
(10413,62,40,NULL,NULL),
(10413,76,14,NULL,NULL),
(10414,19,18,NULL,NULL),
(10414,33,50,NULL,NULL),
(10415,17,2,NULL,NULL),
(10415,33,20,NULL,NULL),
(10416,19,20,NULL,NULL),
(10416,53,10,NULL,NULL),
(10416,57,20,NULL,NULL),
(10417,38,50,NULL,NULL),
(10417,46,2,NULL,NULL),
(10417,68,36,NULL,NULL),
(10417,77,35,NULL,NULL),
(10418,2,60,NULL,NULL),
(10418,47,55,NULL,NULL),
(10418,61,16,NULL,NULL),
(10418,74,15,NULL,NULL),
(10419,60,60,NULL,NULL),
(10419,69,20,NULL,NULL),
(10420,9,20,NULL,NULL),
(10420,13,2,NULL,NULL),
(10420,70,8,NULL,NULL),
(10420,73,20,NULL,NULL),
(10421,19,4,NULL,NULL),
(10421,26,30,NULL,NULL),
(10421,53,15,NULL,NULL),
(10421,77,10,NULL,NULL),
(10422,26,2,NULL,NULL),
(10423,31,14,NULL,NULL),
(10423,59,20,NULL,NULL),
(10424,35,60,NULL,NULL),
(10424,38,49,NULL,NULL),
(10424,68,30,NULL,NULL),
(10425,55,10,NULL,NULL),
(10425,76,20,NULL,NULL),
(10426,56,5,NULL,NULL),
(10426,64,7,NULL,NULL),
(10427,14,35,NULL,NULL),
(10428,46,20,NULL,NULL),
(10429,50,40,NULL,NULL),
(10429,63,35,NULL,NULL),
(10430,17,45,NULL,NULL),
(10430,21,50,NULL,NULL),
(10430,56,30,NULL,NULL),
(10430,59,70,NULL,NULL),
(10431,17,50,NULL,NULL),
(10431,40,50,NULL,NULL),
(10431,47,30,NULL,NULL),
(10432,26,10,NULL,NULL),
(10432,54,40,NULL,NULL),
(10433,56,28,NULL,NULL),
(10434,11,6,NULL,NULL),
(10434,76,18,NULL,NULL),
(10435,2,10,NULL,NULL),
(10435,22,12,NULL,NULL),
(10435,72,10,NULL,NULL),
(10436,46,5,NULL,NULL),
(10436,56,40,NULL,NULL),
(10436,64,30,NULL,NULL),
(10436,75,24,NULL,NULL),
(10437,53,15,NULL,NULL),
(10438,19,15,NULL,NULL),
(10438,34,20,NULL,NULL),
(10438,57,15,NULL,NULL),
(10439,12,15,NULL,NULL),
(10439,16,16,NULL,NULL),
(10439,64,6,NULL,NULL),
(10439,74,30,NULL,NULL),
(10440,2,45,NULL,NULL),
(10440,16,49,NULL,NULL),
(10440,29,24,NULL,NULL),
(10440,61,90,NULL,NULL),
(10441,27,50,NULL,NULL),
(10442,11,30,NULL,NULL),
(10442,54,80,NULL,NULL),
(10442,66,60,NULL,NULL),
(10443,11,6,NULL,NULL),
(10443,28,12,NULL,NULL);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ShipperID` int DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `order_date` date DEFAULT NULL,
  `customer_customerid` bigint NOT NULL,
  `required_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `customer_number` varchar(255) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ShipperID` (`ShipperID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

insert  into `orders`(`OrderID`,`CustomerID`,`EmployeeID`,`OrderDate`,`ShipperID`,`order_id`,`order_date`,`customer_customerid`,`required_date`,`shipped_date`,`customer_number`,`employee_id`) values 
(10248,90,5,'1996-07-04 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10249,81,6,'1996-07-05 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10250,34,4,'1996-07-08 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10251,84,3,'1996-07-08 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10252,76,4,'1996-07-09 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10253,34,3,'1996-07-10 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10254,14,5,'1996-07-11 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10255,68,9,'1996-07-12 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10256,88,3,'1996-07-15 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10257,35,4,'1996-07-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10258,20,1,'1996-07-17 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10259,13,4,'1996-07-18 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10260,55,4,'1996-07-19 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10261,61,4,'1996-07-19 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10262,65,8,'1996-07-22 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10263,20,9,'1996-07-23 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10264,24,6,'1996-07-24 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10265,7,2,'1996-07-25 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10266,87,3,'1996-07-26 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10267,25,4,'1996-07-29 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10268,33,8,'1996-07-30 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10269,89,5,'1996-07-31 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10270,87,1,'1996-08-01 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10271,75,6,'1996-08-01 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10272,65,6,'1996-08-02 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10273,63,3,'1996-08-05 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10274,85,6,'1996-08-06 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10275,49,1,'1996-08-07 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10276,80,8,'1996-08-08 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10277,52,2,'1996-08-09 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10278,5,8,'1996-08-12 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10279,44,8,'1996-08-13 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10280,5,2,'1996-08-14 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10281,69,4,'1996-08-14 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10282,69,4,'1996-08-15 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10283,46,3,'1996-08-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10284,44,4,'1996-08-19 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10285,63,1,'1996-08-20 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10286,63,8,'1996-08-21 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10287,67,8,'1996-08-22 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10288,66,4,'1996-08-23 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10289,11,7,'1996-08-26 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10290,15,8,'1996-08-27 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10291,61,6,'1996-08-27 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10292,81,1,'1996-08-28 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10293,80,1,'1996-08-29 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10294,65,4,'1996-08-30 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10295,85,2,'1996-09-02 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10296,46,6,'1996-09-03 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10297,7,5,'1996-09-04 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10298,37,6,'1996-09-05 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10299,67,4,'1996-09-06 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10300,49,2,'1996-09-09 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10301,86,8,'1996-09-09 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10302,76,4,'1996-09-10 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10303,30,7,'1996-09-11 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10304,80,1,'1996-09-12 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10305,55,8,'1996-09-13 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10306,69,1,'1996-09-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10307,48,2,'1996-09-17 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10308,2,7,'1996-09-18 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10309,37,3,'1996-09-19 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10310,77,8,'1996-09-20 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10311,18,1,'1996-09-20 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10312,86,2,'1996-09-23 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10313,63,2,'1996-09-24 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10314,65,1,'1996-09-25 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10315,38,4,'1996-09-26 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10316,65,1,'1996-09-27 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10317,48,6,'1996-09-30 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10318,38,8,'1996-10-01 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10319,80,7,'1996-10-02 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10320,87,5,'1996-10-03 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10321,38,3,'1996-10-03 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10322,58,7,'1996-10-04 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10323,39,4,'1996-10-07 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10324,71,9,'1996-10-08 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10325,39,1,'1996-10-09 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10326,8,4,'1996-10-10 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10327,24,2,'1996-10-11 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10328,28,4,'1996-10-14 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10329,75,4,'1996-10-15 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10330,46,3,'1996-10-16 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10331,9,9,'1996-10-16 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10332,51,3,'1996-10-17 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10333,87,5,'1996-10-18 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10334,84,8,'1996-10-21 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10335,37,7,'1996-10-22 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10336,60,7,'1996-10-23 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10337,25,4,'1996-10-24 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10338,55,4,'1996-10-25 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10339,51,2,'1996-10-28 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10340,9,1,'1996-10-29 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10341,73,7,'1996-10-29 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10342,25,4,'1996-10-30 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10343,44,4,'1996-10-31 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10344,89,4,'1996-11-01 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10345,63,2,'1996-11-04 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10346,65,3,'1996-11-05 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10347,21,4,'1996-11-06 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10348,86,4,'1996-11-07 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10349,75,7,'1996-11-08 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10350,41,6,'1996-11-11 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10351,20,1,'1996-11-11 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10352,28,3,'1996-11-12 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10353,59,7,'1996-11-13 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10354,58,8,'1996-11-14 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10355,4,6,'1996-11-15 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10356,86,6,'1996-11-18 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10357,46,1,'1996-11-19 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10358,41,5,'1996-11-20 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10359,72,5,'1996-11-21 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10360,7,4,'1996-11-22 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10361,63,1,'1996-11-22 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10362,9,3,'1996-11-25 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10363,17,4,'1996-11-26 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10364,19,1,'1996-11-26 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10365,3,3,'1996-11-27 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10366,29,8,'1996-11-28 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10367,83,7,'1996-11-28 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10368,20,2,'1996-11-29 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10369,75,8,'1996-12-02 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10370,14,6,'1996-12-03 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10371,41,1,'1996-12-03 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10372,62,5,'1996-12-04 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10373,37,4,'1996-12-05 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10374,91,1,'1996-12-05 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10375,36,3,'1996-12-06 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10376,51,1,'1996-12-09 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10377,72,1,'1996-12-09 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10378,24,5,'1996-12-10 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10379,61,2,'1996-12-11 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10380,37,8,'1996-12-12 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10381,46,3,'1996-12-12 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10382,20,4,'1996-12-13 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10383,4,8,'1996-12-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10384,5,3,'1996-12-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10385,75,1,'1996-12-17 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10386,21,9,'1996-12-18 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10387,70,1,'1996-12-18 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10388,72,2,'1996-12-19 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10389,10,4,'1996-12-20 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10390,20,6,'1996-12-23 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10391,17,3,'1996-12-23 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10392,59,2,'1996-12-24 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10393,71,1,'1996-12-25 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10394,36,1,'1996-12-25 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10395,35,6,'1996-12-26 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10396,25,1,'1996-12-27 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10397,60,5,'1996-12-27 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10398,71,2,'1996-12-30 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10399,83,8,'1996-12-31 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10400,19,1,'1997-01-01 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10401,65,1,'1997-01-01 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10402,20,8,'1997-01-02 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10403,20,4,'1997-01-03 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10404,49,2,'1997-01-03 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10405,47,1,'1997-01-06 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10406,62,7,'1997-01-07 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10407,56,2,'1997-01-07 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10408,23,8,'1997-01-08 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10409,54,3,'1997-01-09 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10410,10,3,'1997-01-10 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10411,10,9,'1997-01-10 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10412,87,8,'1997-01-13 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10413,41,3,'1997-01-14 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10414,21,2,'1997-01-14 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10415,36,3,'1997-01-15 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10416,87,8,'1997-01-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10417,73,4,'1997-01-16 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10418,63,4,'1997-01-17 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10419,68,4,'1997-01-20 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10420,88,3,'1997-01-21 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10421,61,8,'1997-01-21 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10422,27,2,'1997-01-22 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10423,31,6,'1997-01-23 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10424,51,7,'1997-01-23 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10425,41,6,'1997-01-24 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10426,29,4,'1997-01-27 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10427,59,4,'1997-01-27 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10428,66,7,'1997-01-28 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10429,37,3,'1997-01-29 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10430,20,4,'1997-01-30 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10431,10,4,'1997-01-30 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10432,75,3,'1997-01-31 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10433,60,3,'1997-02-03 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10434,24,3,'1997-02-03 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10435,16,8,'1997-02-04 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10436,7,3,'1997-02-05 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10437,87,8,'1997-02-05 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL),
(10438,79,3,'1997-02-06 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10439,51,6,'1997-02-07 00:00:00',3,0,NULL,0,NULL,NULL,NULL,NULL),
(10440,71,4,'1997-02-10 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10441,55,3,'1997-02-10 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10442,20,3,'1997-02-11 00:00:00',2,0,NULL,0,NULL,NULL,NULL,NULL),
(10443,66,8,'1997-02-12 00:00:00',1,0,NULL,0,NULL,NULL,NULL,NULL);

/*Table structure for table `orders_seq` */

DROP TABLE IF EXISTS `orders_seq`;

CREATE TABLE `orders_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `orders_seq` */

insert  into `orders_seq`(`next_val`) values 
(1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `discontinued` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `reorder_level` int DEFAULT NULL,
  `units_in_stock` int DEFAULT NULL,
  `units_on_order` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SupplierID` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`ProductID`,`ProductName`,`SupplierID`,`CategoryID`,`unit`,`price`,`product_id`,`discontinued`,`product_name`,`reorder_level`,`units_in_stock`,`units_on_order`,`unit_price`,`category_id`,`supplier_id`) values 
(1,'Chais',1,1,'10 boxes x 20 bags',18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'Chang',1,1,'24 - 12 oz bottles',19,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'Chef Anton\'s Cajun Seasoning',2,2,'48 - 6 oz jars',22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'Chef Anton\'s Gumbo Mix',2,2,'36 boxes',21,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'Grandma\'s Boysenberry Spread',3,2,'12 - 8 oz jars',25,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'Uncle Bob\'s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Ikura',4,8,'12 - 200 ml jars',31,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'Queso Cabrales',NULL,NULL,NULL,NULL,0,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'Konbu',6,8,'2 kg box',6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'Tofu',6,7,'40 - 100 g pkgs.',23,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'Genen Shouyu',6,2,'24 - 250 ml bottles',16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'Pavlova',7,3,'32 - 500 g boxes',17,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'Alice Mutton',7,6,'20 - 1 kg tins',39,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'Carnarvon Tigers',7,8,'16 kg pkg.',63,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'Sir Rodney\'s Marmalade',8,3,'30 gift boxes',81,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'Sir Rodney\'s Scones',8,3,'24 pkgs. x 4 pieces',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'Gustaf\'s Knäckebröd',9,5,'24 - 500 g pkgs.',21,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'NuNuCa Nuß-Nougat-Creme',11,3,'20 - 450 g glasses',14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',44,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',46,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',124,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',26,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,'Geitost',15,4,'500 g',3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,'Inlagd Sill',17,8,'24 - 250 g jars',19,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,'Gravad lax',17,8,'12 - 500 g pkgs.',26,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'Côte de Blaye',18,1,'12 - 75 cl bottles',264,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'Chartreuse verte',18,1,'750 cc per bottle',18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'Jack\'s New England Clam Chowder',19,8,'12 - 12 oz cans',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'Ipoh Coffee',20,1,'16 - 500 g tins',46,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'Gula Malacca',20,2,'20 - 2 kg bags',19,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,'Røgede sild',21,8,'1k pkg.',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'Spegesild',21,8,'4 - 450 g glasses',12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'Zaanse koeken',22,3,'10 - 4 oz boxes',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'Chocolade',22,3,'10 pkgs.',13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'Maxilaku',23,3,'24 - 50 g pkgs.',20,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'Filo Mix',24,5,'16 - 2 kg boxes',7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'Perth Pasties',24,6,'48 pieces',33,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(54,'Tourtière',25,6,'16 pies',7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'Pâté chinois',25,6,'24 boxes x 2 pies',24,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',20,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'Escargots de Bourgogne',27,8,'24 pieces',13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'Raclette Courdavault',28,4,'5 kg pkg.',55,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(61,'Sirop d\'érable',29,2,'24 - 500 ml bottles',29,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'Tarte au sucre',29,3,'48 pies',49,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(63,'Vegie-spread',7,2,'15 - 625 g jars',44,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(70,'Outback Lager',7,1,'24 - 355 ml bottles',15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(71,'Fløtemysost',15,4,'10 - 500 g pkgs.',22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',35,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(73,'Röd Kaviar',17,8,'24 - 150 g jars',15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(74,'Longlife Tofu',4,7,'5 kg pkg.',10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(76,'Lakkalikööri',23,1,'500 ml',18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(77,'Original Frankfurter grüne Soße',12,2,'12 boxes',13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(80,NULL,NULL,NULL,NULL,NULL,29,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(81,NULL,NULL,NULL,NULL,NULL,79,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(82,NULL,NULL,NULL,NULL,NULL,80,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(83,NULL,NULL,NULL,NULL,NULL,81,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `products_seq` */

DROP TABLE IF EXISTS `products_seq`;

CREATE TABLE `products_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

/*Data for the table `products_seq` */

insert  into `products_seq`(`next_val`) values 
(228);

/*Table structure for table `shippers` */

DROP TABLE IF EXISTS `shippers`;

CREATE TABLE `shippers` (
  `ShipperID` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(25) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shippers` */

insert  into `shippers`(`ShipperID`,`ShipperName`,`Phone`) values 
(1,'Speedy Express','(503) 555-9831'),
(2,'United Package','(503) 555-3199'),
(3,'Federal Shipping','(503) 555-9931');

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(50) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `supplier_id` int NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `FKl0s1t0c4egr00nxjwyf4mb8ak` (`city_id`),
  KEY `FKjcuohexsi23vnpxi0t25kvwg7` (`country_id`),
  CONSTRAINT `FKjcuohexsi23vnpxi0t25kvwg7` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `FKl0s1t0c4egr00nxjwyf4mb8ak` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `suppliers` */

insert  into `suppliers`(`SupplierID`,`SupplierName`,`ContactName`,`address`,`City`,`PostalCode`,`Country`,`Phone`,`supplier_id`,`company_name`,`contact_name`,`contact_title`,`city_id`,`country_id`) values 
(1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','Londona','EC1 4SD','UK','(171) 555-2222',0,NULL,NULL,NULL,NULL,NULL),
(2,'New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822',0,NULL,NULL,NULL,NULL,NULL),
(3,'Grandma Kelly\'s Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735',0,NULL,NULL,NULL,NULL,NULL),
(4,'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011',0,NULL,NULL,NULL,NULL,NULL),
(5,'Cooperativa de Quesos \'Las Cabras\'','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain','(98) 598 76 54',0,NULL,NULL,NULL,NULL,NULL),
(6,'Mayumi\'s','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan','(06) 431-7877',0,NULL,NULL,NULL,NULL,NULL),
(7,'Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia','(03) 444-2343',0,NULL,NULL,NULL,NULL,NULL),
(8,'Specialty Biscuits, Ltd.','Peter Wilson','29 King\'s Way','Manchester','M14 GSD','UK','(161) 555-4448',0,NULL,NULL,NULL,NULL,NULL),
(9,'PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Göteborg','S-345 67','Sweden','031-987 65 43',0,NULL,NULL,NULL,NULL,NULL),
(10,'Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','São Paulo','5442','Brazil','(11) 555 4640',0,NULL,NULL,NULL,NULL,NULL),
(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany','(010) 9984510',0,NULL,NULL,NULL,NULL,NULL),
(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany','(069) 992755',0,NULL,NULL,NULL,NULL,NULL),
(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany','(04721) 8713',0,NULL,NULL,NULL,NULL,NULL),
(14,'Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy','(0544) 60323',0,NULL,NULL,NULL,NULL,NULL),
(15,'Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway','(0)2-953010',0,NULL,NULL,NULL,NULL,NULL),
(16,'Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA','(503) 555-9931',0,NULL,NULL,NULL,NULL,NULL),
(17,'Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden','08-123 45 67',0,NULL,NULL,NULL,NULL,NULL),
(18,'Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France','(1) 03.83.00.68',0,NULL,NULL,NULL,NULL,NULL),
(19,'New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','2134','USA','(617) 555-3267',0,NULL,NULL,NULL,NULL,NULL),
(20,'Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','512','Singapore','555-8787',0,NULL,NULL,NULL,NULL,NULL),
(21,'Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark','43844108',0,NULL,NULL,NULL,NULL,NULL),
(22,'Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands','(12345) 1212',0,NULL,NULL,NULL,NULL,NULL),
(23,'Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland','(953) 10956',0,NULL,NULL,NULL,NULL,NULL),
(24,'G\'day, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunter\'s Hill','Sydney','2042','Australia','(02) 555-5914',0,NULL,NULL,NULL,NULL,NULL),
(25,'Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-9022',0,NULL,NULL,NULL,NULL,NULL),
(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy','(089) 6547665',0,NULL,NULL,NULL,NULL,NULL),
(27,'Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France','85.57.00.07',0,NULL,NULL,NULL,NULL,NULL),
(28,'Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France','38.76.98.06',0,NULL,NULL,NULL,NULL,NULL),
(29,'Forêts d\'érables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955',0,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
