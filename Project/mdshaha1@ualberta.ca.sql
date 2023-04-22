-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mdshaha1@ualberta.ca
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(2) DEFAULT NULL,
  `postal_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Aaron Champagne','achampag@ualberta.ca','2317 138 A\nAvenue','Edmonton','AB','T5Y1B9'),(2,'James Grieve','jgrieve@ualberta.ca','1234 123\nStreet','Edmonton','AB','T2B1G4'),(3,'Bo Cen','bcen@ualberta.ca','5672 98 Avenue','Edmonton','AB','T3C4B7'),(4,'Stephanie Smothers','ssmoth@ualberta.ca',NULL,NULL,NULL,NULL),(5,'Emily Nelson',NULL,'1 Winston Churchill Square','Edmonton','AB','T4A1B7'),(6,'Sean Townsend','stown@ualberta.ca',NULL,NULL,NULL,NULL),(7,'Diana Hyland',NULL,NULL,NULL,NULL,NULL),(8,'Dennis Nylon','dnylon@ualberta.ca','1298 76 Street','Edmonton','AB','T5R6F8'),(9,'Chloe Beale',NULL,'7393 78 Ave','Edmonton','AB','T8FW7C');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_header_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_qty` int NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_header_id_idx` (`order_header_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `order_header_id` FOREIGN KEY (`order_header_id`) REFERENCES `order_header` (`order_header_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,5,1,775.99),(2,2,1,2,751.98),(3,2,7,1,425.99),(4,3,6,1,550.00),(5,3,2,2,553.00),(6,4,3,1,23.60),(7,5,4,1,450.25),(8,5,7,1,425.99),(9,6,6,2,1100.00),(10,6,7,2,851.98),(11,7,1,1,375.99),(12,8,4,1,450.25),(13,8,7,1,425.99);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_header` (
  `order_header_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  PRIMARY KEY (`order_header_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES (1,1,'2022-01-01',775.99),(2,2,'2022-01-02',1177.97),(3,3,'2022-01-04',1103.00),(4,1,'2022-01-12',23.60),(5,4,'2022-01-14',876.24),(6,5,'2022-01-20',1951.98),(7,6,'2022-01-22',375.99),(8,9,'2022-02-22',876.24);
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `quantity_in_stock` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Guitar','An acoustic guitar made by Epiphone.',375.99,5),(2,'Microphone','A Shure microphone ideal for stage.',276.50,3),(3,'Tambourine','Mother of pearl handle.',23.60,15),(4,'Bass Guitar','A four-string, fretless bass guitar by\nIbanez.',450.25,0),(5,'Electric Guitar','An electric guitar made by\nEpiphone',775.99,1),(6,'MIDI Keyboard','A two-octave keyboard with USB cable\nfor making digital music.',550.00,4),(7,'50-Watt Amplifier','A medium sized amp by Marshall.',425.99,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Answer 4
-- Ans 4(a)
SELECT c.customer_name as Customer, count(*) as 'Number of Purchases' FROM order_header o inner join customer c on c.customer_id = o.customer_id group by c.customer_id order by c.customer_name;

-- Ans 4(b)
SELECT c.customer_name as Customer, concat("$",FORMAT(sum(o.total_price),4)) as 'Sum of Purchase Totals' FROM order_header o inner join customer c;

-- Ans 4(c)
SELECT sum(o.order_qty) as 'Number of Products Sold', p.product_name as product_name FROM product p inner join order_detail o on p.product_id = o.product_id group by p.product_id order by sum(o.order_qty) desc;

-- Ans 4(d)
SELECT o.order_header_id, p.product_name, od.order_qty, c.customer_name,
o.order_date, o.total_price FROM order_detail od inner join product p on p.product_id = od.product_id 
inner join order_header o on o.order_header_id = od.order_header_id 
inner join customer c on c.customer_id = o.customer_id where o.order_date between '2022-01-01' and
'2022-01-07';

-- Ans 4(e)
SELECT sum(od.order_qty) as 'Number of Guitars Sold' FROM order_detail od inner join product p on od.product_id = p.product_id where p.product_description LIKE '%acoustic%' OR p.product_description LIKE '%electric%';



-- Answer 5
START TRANSACTION;
SELECT @orderNumber:=MAX(order_header_id)+1 FROM order_header;
-- Ans 5(a)
INSERT INTO order_header(customer_id,order_date,total_price) VALUES (9,'2022-02-22',876.24);

-- Ans 5(b)
INSERT INTO order_detail(order_header_id,product_id,order_qty,sub_total) VALUES (@orderNumber,4,1,450.25);
INSERT INTO order_detail(order_header_id,product_id,order_qty,sub_total) VALUES (@orderNumber,7,1,425.99);

-- Ans 5(c)
UPDATE product SET quantity_in_stock=quantity_in_stock-1 where product_id = 4;
UPDATE product SET quantity_in_stock=quantity_in_stock-1 where product_id = 7;
COMMIT;

-- Ans 5(d)
SELECT o.order_header_id, o.order_date, c.customer_name, p.product_name, p.quantity_in_stock,
od.sub_total, o.total_price FROM order_detail od inner join product p on p.product_id = od.product_id 
inner join order_header o on o.order_header_id = od.order_header_id 
inner join customer c on c.customer_id = o.customer_id where o.order_header_id = 8
