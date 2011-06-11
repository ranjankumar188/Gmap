-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema church_finder_development
--

CREATE DATABASE IF NOT EXISTS church_finder_development;
USE church_finder_development;

--
-- Definition of table `churches`
--

DROP TABLE IF EXISTS `churches`;
CREATE TABLE `churches` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `zip` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `denomination_id` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `lat` varchar(255) default NULL,
  `lng` varchar(255) default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `deleted` tinyint(1) default '0',
  `state_id` int(11) default NULL,
  `std_code` varchar(45) NOT NULL,
  `area_code` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `churches`
--

/*!40000 ALTER TABLE `churches` DISABLE KEYS */;
INSERT INTO `churches` (`id`,`name`,`street`,`city`,`zip`,`phone`,`denomination_id`,`url`,`lat`,`lng`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted`,`state_id`,`std_code`,`area_code`) VALUES 
 (7,'Christ Episcopal Church','120 East Edenton Street','Raleigh','27601','919-834-6259','1','',NULL,NULL,49,49,'2008-07-16 06:26:55','2008-07-31 12:23:34',1,1,'',''),
 (9,'Hayes Barton Baptist Church','1800 Glenwood Ave','Raleigh','27608','919-833-8617','5','','35.809188','-78.845188',49,NULL,'2008-07-16 06:26:55','2008-07-16 07:01:45',0,2,'',''),
 (11,'Hope Community Church','821 Buck Jones Road','Raleigh','27606','919-532-0620','2','www.gethope.net','35.737593','-78.721192',49,NULL,'2008-07-16 06:26:55','2008-07-16 07:01:53',0,3,'',''),
 (12,'First Presbyterian Church','120 West Hargett Street','Raleigh','27601','919-821-5750','6','fpcraleigh.org','35.775277','-78.734324',49,NULL,'2008-07-16 06:26:55','2008-07-16 07:02:00',0,4,'',''),
 (13,'Upper Room Church of God Church','3300 Idlewood Village Drive','Raleigh','27610','919-829-6160','2','plwooden.org','35.743602','-78.536408',49,NULL,'2008-07-16 06:26:55','2008-07-16 07:02:07',0,5,'',''),
 (17,'church2','201 Dixie Trail','bangalore','27608','555555','1','www.gethope.net','35.809159','-78.645188',68,NULL,'2008-07-22 13:01:46','2008-07-22 13:01:46',0,6,'',''),
 (21,'church5','201 Dixie Trail','test','27655','98089809-0','1','www.jdfkjdfkj.com','42.939956','-6.960376',49,NULL,'2008-07-30 10:19:42','2008-07-30 11:23:09',1,8,'',''),
 (22,'church3','bangalore','bangalore','560096','','1','',NULL,NULL,76,76,'2008-07-30 12:38:45','2008-07-31 06:06:59',0,9,'',''),
 (23,'Test Church','Norison Street','Raleigh','27602','','7','','35.7719','-78.6388',78,78,'2008-07-31 05:18:07','2008-07-31 05:19:15',0,10,'',''),
 (24,'Test Church2','New Street','Raleigh','27603','','3','','35.683682','-78.664144',78,NULL,'2008-07-31 05:32:14','2008-07-31 05:32:14',0,11,'',''),
 (25,'Christ Episcopal Churchmn','hhjh','hjhj','27900','919-828-61614544545','1','','41.383787','-87.694011',78,NULL,'2008-07-31 11:19:22','2008-07-31 11:19:22',0,12,'',''),
 (31,'church5','kumar','rna','560019','8798798798','9','',NULL,NULL,49,NULL,'2008-08-02 08:44:50','2008-08-02 08:44:50',0,14,'',''),
 (32,'adsfasdf','asdfasdf','asdfasfd','34567','1234','1','sdafd',NULL,NULL,49,NULL,'2008-08-04 09:00:09','2008-08-04 09:00:09',0,1,'123',''),
 (33,'church1','jaynagar','bangalore','560012','2345','12','www.jdfkjdfkj.com',NULL,NULL,49,NULL,'2008-08-04 09:20:19','2008-08-04 09:20:19',0,1,'123','');
/*!40000 ALTER TABLE `churches` ENABLE KEYS */;


--
-- Definition of table `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors` (
  `id` int(3) unsigned zerofill default '000',
  `name` varchar(45) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` (`id`,`name`) VALUES 
 (000,'red'),
 (001,'green'),
 (002,'blue');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;


--
-- Definition of table `denominations`
--

DROP TABLE IF EXISTS `denominations`;
CREATE TABLE `denominations` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `color_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `denominations`
--

/*!40000 ALTER TABLE `denominations` DISABLE KEYS */;
INSERT INTO `denominations` (`id`,`name`,`created_at`,`updated_at`,`color_id`) VALUES 
 (1,'baptist',NULL,NULL,1),
 (2,'catholic',NULL,NULL,2),
 (3,'episcopal',NULL,NULL,0),
 (4,'methodist',NULL,NULL,0),
 (5,'interdenominational',NULL,NULL,0),
 (6,'presbyterian',NULL,NULL,0),
 (7,'raleigh',NULL,NULL,0),
 (8,'sdfasdfasf','2008-08-02 08:42:57','2008-08-02 08:42:57',0),
 (9,'test','2008-08-02 08:44:50','2008-08-02 08:44:50',0),
 (10,'','2008-08-04 09:19:43','2008-08-04 09:19:43',NULL),
 (11,'sdfdfsdf','2008-08-04 09:20:06','2008-08-04 09:20:06',NULL),
 (12,'11','2008-08-04 09:20:18','2008-08-04 09:20:18',NULL);
/*!40000 ALTER TABLE `denominations` ENABLE KEYS */;


--
-- Definition of table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `church_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `start_at` time default NULL,
  `end_at` time default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `recurring` tinyint(1) default '1',
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `start_day` varchar(255) default NULL,
  `end_day` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`,`church_id`,`title`,`description`,`start_at`,`end_at`,`start_date`,`end_date`,`recurring`,`created_by`,`updated_by`,`created_at`,`updated_at`,`start_day`,`end_day`) VALUES 
 (15,5,'events non recurring','non recurring events','16:53:00','19:53:00','2008-08-30','2008-08-31',1,49,NULL,'2008-07-28 11:24:16','2008-07-28 11:24:16','',''),
 (16,5,'recurring events','recurring events','11:24:00','11:42:00',NULL,NULL,0,49,NULL,'2008-07-28 11:24:42','2008-07-28 11:24:42','Sun','Sun'),
 (17,5,'new one','','11:23:00','11:23:00',NULL,NULL,1,49,NULL,'2008-07-30 11:23:51','2008-07-30 11:23:51','',''),
 (18,4,'service time','','11:24:00','11:24:00',NULL,NULL,1,49,NULL,'2008-07-30 11:25:00','2008-07-30 11:25:00','',''),
 (19,4,'test event','dsdaasdffdadafsdafs','16:55:00','16:55:00','2008-07-30','2008-07-31',0,49,NULL,'2008-07-30 11:25:54','2008-07-31 06:55:02','',''),
 (20,4,'dfdf','','11:27:00','11:27:00',NULL,NULL,1,49,NULL,'2008-07-30 11:27:57','2008-07-30 11:27:57','',''),
 (21,7,'ddfdfd','','11:28:00','11:28:00',NULL,NULL,1,49,NULL,'2008-07-30 11:28:22','2008-07-30 11:28:22','',''),
 (22,7,'dsdsd','','11:28:00','11:28:00',NULL,NULL,1,49,NULL,'2008-07-30 11:28:45','2008-07-30 11:28:45','',''),
 (23,7,'ghgh','rtrtrt','11:28:00','11:28:00',NULL,NULL,1,49,NULL,'2008-07-30 11:29:05','2008-07-30 11:30:31','',''),
 (24,4,'ranjan kumar','d','11:44:00','11:44:00',NULL,NULL,0,49,NULL,'2008-07-30 11:44:40','2008-07-30 11:44:40','Mon','Mon'),
 (25,23,'events non recurring','jkjkj','05:24:00','05:24:00',NULL,NULL,1,78,NULL,'2008-07-31 05:25:07','2008-07-31 05:25:07','',''),
 (26,23,'events non recurring','','10:55:00','05:25:00','2008-07-31',NULL,1,78,NULL,'2008-07-31 05:25:22','2008-07-31 05:25:22','',''),
 (27,24,'hai','','05:32:00','05:32:00',NULL,NULL,1,78,NULL,'2008-07-31 05:32:26','2008-07-31 05:32:26','',''),
 (28,22,'event1','dfdsfsdfsdf\r\nfsdfdsfsdf','05:43:00','05:43:00',NULL,NULL,0,76,NULL,'2008-07-31 05:44:04','2008-07-31 05:44:04','Sun','Mon'),
 (29,24,'events non recurring','njhjh juhjhjhhhhjh hjh hjh hjkkjkjjjjjjjjj jkjk jkjk jkj j jkj jkj kjkj jkkj ','16:15:00','16:15:00','2008-07-31','2008-07-31',1,78,NULL,'2008-07-31 10:46:02','2008-07-31 10:46:02','',''),
 (30,24,'rtrtr','rtrtr','17:41:00','17:41:00','2008-07-31','2008-07-31',1,78,NULL,'2008-07-31 12:11:47','2008-07-31 12:11:47','',''),
 (31,4,'ranjan','hi','11:55:00','11:55:00','2008-08-12','2008-08-30',1,49,NULL,'2008-08-01 06:25:30','2008-08-01 06:25:30','',''),
 (32,23,'ranjan','fgg','11:57:00','11:57:00','2008-08-07','2008-08-30',1,49,NULL,'2008-08-01 06:27:51','2008-08-01 06:27:51','','');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;


--
-- Definition of table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES 
 ('20080709114622'),
 ('20080709114721'),
 ('20080709114736'),
 ('20080709114755'),
 ('20080709114812');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;


--
-- Definition of table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int(11) NOT NULL auto_increment,
  `church_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `start_at` time default NULL,
  `end_at` time default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `recurring` tinyint(1) default '1',
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `start_day` varchar(255) default NULL,
  `end_day` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`,`church_id`,`title`,`start_at`,`end_at`,`start_date`,`end_date`,`recurring`,`created_by`,`updated_by`,`created_at`,`updated_at`,`start_day`,`end_day`) VALUES 
 (126,4,'july  non recurring','16:28:00','16:28:00','2008-07-01','2008-07-02',1,49,NULL,'2008-07-28 10:58:50','2008-07-28 10:58:50','',''),
 (127,4,'july  recurring','11:10:00','11:19:00',NULL,NULL,1,49,NULL,'2008-07-28 11:10:23','2008-07-30 11:09:15','Sun','Sun'),
 (128,17,'dfgdf','09:40:00','09:40:00',NULL,NULL,1,68,NULL,'2008-07-30 09:42:33','2008-07-30 09:42:33','',''),
 (129,4,'rtetrwert','10:32:00','10:32:00',NULL,NULL,1,49,NULL,'2008-07-30 10:33:12','2008-07-30 10:33:12','',''),
 (130,4,'dfgdf','11:00:00','13:00:00','2008-12-23','2008-10-30',0,49,NULL,'2008-07-30 10:37:01','2008-07-31 05:23:39','Mon','Mon'),
 (131,4,'nbmn','10:37:00','10:37:00',NULL,NULL,0,49,NULL,'2008-07-30 10:37:18','2008-07-30 10:37:18','Sun','Sun'),
 (132,4,'test service','11:36:00','11:36:00',NULL,NULL,1,49,NULL,'2008-07-30 11:36:38','2008-07-30 11:36:38','',''),
 (133,4,'test service','17:06:00','17:25:00','2008-07-30','2008-07-30',1,49,NULL,'2008-07-30 11:37:08','2008-07-30 11:37:08','',''),
 (134,4,'rrrr','11:55:00','11:59:00',NULL,NULL,0,49,NULL,'2008-07-30 11:42:01','2008-07-30 11:42:01','Tues','Wed'),
 (135,4,'sdfdsfdsf','11:42:00','11:48:00',NULL,NULL,0,49,NULL,'2008-07-30 11:42:41','2008-07-30 11:42:41','Tues','Wed'),
 (136,4,'sdfdsfdsf','11:43:00','11:43:00',NULL,NULL,0,49,NULL,'2008-07-30 11:43:17','2008-07-30 11:43:17','Sun','Sun'),
 (137,23,'test service','05:19:00','05:19:00',NULL,NULL,1,78,NULL,'2008-07-31 05:19:39','2008-07-31 05:19:39','',''),
 (138,23,'test service1','10:52:00','10:52:00','2008-07-31','2008-07-31',1,78,NULL,'2008-07-31 05:22:42','2008-07-31 05:24:23','',''),
 (139,22,'sevice1','10:55:00','10:55:00','2008-08-01','2008-08-05',1,76,NULL,'2008-07-31 05:26:10','2008-07-31 05:26:10','',''),
 (140,11,'reerert','12:27:00','12:27:00','2008-07-04','2008-07-12',1,49,NULL,'2008-07-31 06:57:59','2008-07-31 06:57:59','',''),
 (141,24,'service1','12:47:00','12:48:00','2008-07-16','2008-07-18',1,78,NULL,'2008-07-31 07:18:26','2008-07-31 07:18:26','',''),
 (142,23,'service2','12:48:00','12:48:00','2008-07-18','2008-07-25',1,78,NULL,'2008-07-31 07:18:49','2008-07-31 07:18:49','',''),
 (143,23,'service2','12:49:00','12:49:00','2008-07-31','2008-07-31',1,78,NULL,'2008-07-31 07:19:16','2008-07-31 07:19:16','',''),
 (144,23,'service3','12:49:00','12:49:00','2008-07-30','2008-07-31',1,78,NULL,'2008-07-31 07:19:53','2008-07-31 07:19:53','',''),
 (145,23,'service3','12:50:00','12:50:00','2008-07-31','2008-07-31',1,78,NULL,'2008-07-31 07:20:21','2008-07-31 07:20:21','',''),
 (146,23,'service4','12:50:00','12:50:00','2008-07-17','2008-07-17',1,78,NULL,'2008-07-31 07:20:45','2008-07-31 07:20:45','',''),
 (147,23,'service4','12:50:00','12:50:00','2008-07-17','2008-07-17',1,78,NULL,'2008-07-31 07:21:02','2008-07-31 07:21:02','',''),
 (148,23,'service4','12:51:00','12:51:00','2008-08-01','2008-08-02',1,78,NULL,'2008-07-31 07:21:30','2008-07-31 07:21:30','',''),
 (149,23,'service5','12:52:00','12:52:00','2008-08-02','2008-08-02',1,78,NULL,'2008-07-31 07:22:10','2008-07-31 07:22:10','',''),
 (150,23,'service','12:53:00','12:54:00','2008-07-30','2008-07-31',1,78,NULL,'2008-07-31 07:24:20','2008-07-31 07:24:20','',''),
 (151,23,'service','12:54:00','12:54:00','2008-07-30','2008-07-31',1,78,NULL,'2008-07-31 07:24:49','2008-07-31 07:24:49','',''),
 (152,23,'Hai','12:57:00','12:57:00','2008-07-18','2008-07-19',1,78,NULL,'2008-07-31 07:27:18','2008-07-31 07:27:18','',''),
 (153,24,'tesdt','13:00:00','13:00:00','2008-07-25','2008-07-25',1,78,NULL,'2008-07-31 07:30:42','2008-07-31 07:30:42','',''),
 (154,24,'ghgh','13:03:00','13:03:00','2008-08-02','2008-08-02',1,78,NULL,'2008-07-31 07:33:13','2008-07-31 07:33:13','',''),
 (155,24,'jkjk','13:03:00','13:03:00','2008-08-15','2008-07-17',1,78,NULL,'2008-07-31 07:33:44','2008-07-31 07:33:44','',''),
 (156,24,'ghgh','13:05:00','13:05:00','2008-08-14','2008-08-29',1,78,NULL,'2008-07-31 07:35:45','2008-07-31 07:35:45','',''),
 (157,4,'test','13:50:00','13:50:00','2008-07-10','2008-07-26',1,49,NULL,'2008-07-31 08:21:12','2008-07-31 08:21:12','',''),
 (158,23,'july  recurring','19:37:00','19:37:00',NULL,NULL,0,78,NULL,'2008-07-31 10:37:32','2008-07-31 10:37:32','Mon','Mon'),
 (159,23,'dfgdf','16:10:00','16:10:00','2008-07-03','2008-07-03',1,78,NULL,'2008-07-31 10:40:23','2008-07-31 10:40:23','',''),
 (160,23,'test service','16:10:00','16:10:00','2008-07-03','2008-07-03',1,78,NULL,'2008-07-31 10:40:40','2008-07-31 10:40:40','',''),
 (161,4,'nbmn','11:51:00','11:51:00','2008-08-13','2008-08-27',1,49,NULL,'2008-08-01 06:21:22','2008-08-01 06:21:22','','');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;


--
-- Definition of table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `name` varchar(255) default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`name`,`id`) VALUES 
 ('Alabama ',1),
 ('Alaska ',2),
 ('Arizona ',3),
 ('Arkansas ',4),
 ('California ',5),
 ('Colorado ',6),
 ('Connecticut ',7),
 ('Delaware ',8),
 ('Florida ',9),
 ('Georgia ',10),
 ('Hawaii ',11),
 ('Idaho ',12),
 ('Illinois ',13),
 ('Indiana ',14),
 ('Iowa ',15),
 ('Kansas ',16),
 ('Kentucky ',17),
 ('Louisiana ',18),
 ('Maine ',19),
 ('Maryland ',20),
 ('Massachusetts ',21),
 ('Michigan ',22),
 ('Minnesota ',23),
 ('Mississippi ',24),
 ('Missouri ',25),
 ('Montana ',26),
 ('Nebraska ',27),
 ('Nevada ',28),
 ('New Hampshire ',29),
 ('New Jersey ',30),
 ('New Mexico ',31),
 ('New York ',32),
 ('North Carolina ',33),
 ('North Dakota ',34),
 ('Ohio ',35),
 ('Oklahoma ',36),
 ('Oregon ',37),
 ('Pennsylvania ',38),
 ('Rhode Island ',39),
 ('South Carolina ',40),
 ('South Dakota ',41),
 ('Tennessee ',42),
 ('Texas ',43),
 ('Utah ',44),
 ('Vermont ',45),
 ('Virginia ',46),
 ('Washington ',47),
 ('West Virginia ',48),
 ('Wisconsin ',49),
 ('Wyoming ',50);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `question` varchar(255) default NULL,
  `answer` varchar(255) default NULL,
  `password_hash` varchar(255) default NULL,
  `login_count` int(11) default NULL,
  `last_login` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('registered','active','expired') default NULL,
  `email_activation` text,
  `admin` tinyint(1) default '0',
  `password_salt` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`email`,`question`,`answer`,`password_hash`,`login_count`,`last_login`,`created_at`,`updated_at`,`name`,`status`,`email_activation`,`admin`,`password_salt`) VALUES 
 (49,'ranjan','ran_foru@yahoo.co.in','ranjan','ranjan','81358e50f8ecee60c807a544b4839cde3e932e645aacd72e5bcedcb350c425fc',34,'2008-08-06 12:10:52','2008-07-29 12:26:26','2008-08-06 12:10:52','ranjan','active','1-8eb831cc8d9d69ca427f999632421d77d56ea15f390470657a3919332173dba8',1,'g8TKZvbr'),
 (68,'ranjank','ranjan.kumar@sumerusolutions.com','ranjank','ranjank','05907d930383d63993be4908ab8846cc373c37733f36efe56909f65d80ffd8db',3,'2008-07-30 09:30:44','2008-07-29 12:27:46','2008-07-30 09:30:44','ranjank','active','2-1a6cf654659181e9be80fcc8ac9950b98e05029c9942a981f00fcfb0bb3b7285',0,'KHfACvUt'),
 (69,'123','ranjank@sdfs.com','ranjan','ranjan','5c354b1e198ec7ce807c993b69f42cbc3d879adfcd95c7c09ba0d00351e52879',NULL,NULL,'2008-07-29 13:41:41','2008-07-30 11:50:03','456','expired','69-66cee42a99b5dbc0a8ce60d38d8bc03b368f2f1031b32c63f782e1f093030433',0,'jPkRkAPo'),
 (70,'sdf','sdfasdf@sdfas.com','sdf','sdf','f4ccd64582f39d5d5bc6d560907d1a0ecabc78ab2c78d052f3baeacb1128b5e5',NULL,NULL,'2008-07-30 08:40:33','2008-07-30 11:50:14','123df','expired','70-1f6876c4813b21237c1e16cdc30970c1fcccf1d9e3226e41e521085e60ad60ee',0,'v3zH2T33'),
 (71,'Nisha','nishajjj@ffff.kk','how r u','fine','b72923ae0ea80ad016762a641f2237ed391d671e6f5a9805e96ef569406114ef',NULL,NULL,'2008-07-30 10:10:13','2008-07-30 10:10:13','Nisha','registered','71-3f5cd1c935aff480d5f74ed4dea35d8f5129f93b8412fbfc6a6369bf020fea0e',0,'iBCarSYx'),
 (72,'123f','123@abc.com','456','ranjan','800ded21ecbd12aab01de622b1caefcc15586ba82cd42a2ba623c893503f5ef5',NULL,NULL,'2008-07-30 10:14:34','2008-07-30 10:14:34','123f','registered','72-69bf8ca2fb5924a69cea7fb4133f494071132dbb7e72016def128c6291a1bdad',0,'td+p99WU'),
 (73,'Asha','hghg@hghg.hhg','hjhj','hjhj','dbb77e03a04208321a550feb4172dbb3ae8936c52902a1a9f0b8c3555f575d3a',NULL,NULL,'2008-07-30 10:13:42','2008-07-30 10:13:42','Nisha','registered','73-b8c9b528d3f9fbba29342b356326e43f0ae7b1f9fc6b49b3065ad983033346b2',0,'Xpw5Gswk'),
 (74,'TestNisha','nisha.viswanath@sumerusolutions.com','pet name','guruji','6b308f16055cec8c621897b333f497c929d216d7bb0c572023ea2cf620cd5423',NULL,NULL,'2008-07-30 10:16:23','2008-07-30 11:49:24','Nisha','expired','74-a7bd151db17e7a11bdf5e4e6aeea0993df2b222b1026b4c102ccac76b27d7222',0,'UHcyeD55'),
 (75,'nilesh1','nilesh@gmail.com','why','ok','1478fa5284d92466f9733c68adc8f9ebcf5143000b1b6420813a2c6545573158',NULL,NULL,'2008-07-30 12:19:49','2008-07-30 12:19:49','nilesh','registered','75-7251fb79b35b699d2a3a2884d127f6e9ccc14a41409657b042409c059e7fb4cc',0,'F0Gt9Iw0'),
 (76,'nilesh','nilesh.kumar@sumerusolutions.com','why','ok','5911164d2fd4acb04a0311eac75d46a2d6ce19b05d01075b1eb7987935fd2abb',5,'2008-07-31 07:04:58','2008-07-30 12:24:10','2008-07-31 07:04:58','nilesh','active','76-7251fb79b35b699d2a3a2884d127f6e9ccc14a41409657b042409c059e7fb4cc',0,'1QHz8Rjv'),
 (77,'church_user','nishajgd@rediffmail.com','hw r u','fine','d3ce1b3c0e3e62a6e27f07bae8a37ae6d0c8bfbbcb36ea8d24f3a9593f04c2b0',NULL,NULL,'2008-07-30 12:24:19','2008-07-30 12:24:19','church_user','registered','77-2d9b0745f8c755ab683361ffa44b25e9cf40c6547844f3cdef7f868967579bff',0,'qBEeRfrC'),
 (78,'church','nishajgd@yahoo.com','hw r u ','fine','66d79124b5d6e34d3b56d2aa523bb41e734bbec311658722deae28997a14de65',6,'2008-07-31 12:29:04','2008-07-31 04:49:07','2008-07-31 12:30:36','church','expired','78-bba9d01a8f2ef338b92cbc782cfabde29c319c10f5210abacdf68affd8acbe70',0,'wbB85Uhg'),
 (79,'6781','678@ksfdj.com','678','678','a810d987fcba7ec504b0da55bd7037ac9f5883a2ee5cecb5b6d536c569e44bee',NULL,NULL,'2008-07-31 04:57:06','2008-07-31 06:09:01','678','active','79-e7404c4bafe1fdd88fe7b963864ce2afd474d07a1b16ae4c6cb3fb636281e9ad',0,'kEtfOtvz'),
 (80,'church_finder','nishajgd@hotmail.com','how r u','fine','d8930e0f246e891096378a09bbf37a869ccc3a722ea76dbfe2e85c27cb523fe5',NULL,NULL,'2008-07-31 07:11:22','2008-07-31 12:26:39','church_finder','expired','80-6812c677f32b26cd6919ea556ec03b452849c2a81583f295ff23143763c14490',0,'jYdiMXN1'),
 (81,'test','kfdlks@sdkfls.com','test','test','75d84ef2d86c00de4c0beabcc5c1144a02c3a14fd6a69b0b57a178c66f1bba9d',NULL,NULL,'2008-08-06 11:59:40','2008-08-06 11:59:40','test','registered','81-c0f9461541d48b23ac98c7460baf08edf384f37c167801a2995cbda739aa1fe2',0,'UwVXMPt8');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
