CREATE DATABASE  IF NOT EXISTS `domo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `domo`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: domo
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exam_user`
--

DROP TABLE IF EXISTS `exam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_user` (
  `exam_userid` varchar(255) NOT NULL,
  `set_exam_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user`
--

LOCK TABLES `exam_user` WRITE;
/*!40000 ALTER TABLE `exam_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'high'),(2,'medium'),(3,'low');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'Predictive Analytics'),(2,'Scheduled Reports'),(3,'Beast Mode'),(4,'WETL');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` int(11) DEFAULT NULL,
  `op1` varchar(255) DEFAULT NULL,
  `op2` varchar(255) DEFAULT NULL,
  `op3` varchar(255) DEFAULT NULL,
  `op4` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `level_level_id` int(11) DEFAULT NULL,
  `module_module_id` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FKBA823BE64E4813F` (`level_level_id`),
  KEY `FKBA823BE6BFD25BD` (`module_module_id`),
  CONSTRAINT `FKBA823BE64E4813F` FOREIGN KEY (`level_level_id`) REFERENCES `level` (`level_id`),
  CONSTRAINT `FKBA823BE6BFD25BD` FOREIGN KEY (`module_module_id`) REFERENCES `module` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'1','3','2','4','How many different sections of alerts are there in alert center page?',1,1,'Debashree Goswami'),(2,0,'4','2','3','1','How many different switchers that are available related to alert?',1,1,'Debashree Goswami'),(3,1,'alert-details-modal,alert-inline,alerts-pa,enable-alerts-v3-only','alert-details-modal,alert-inline,alert,enable-alerts-v2-only','alert-details-modal,alert-inline,alerts-pa','alert-details-modal,alert','What are the different types of switchers that are available related to alerts?',1,1,'Debashree Goswami'),(4,3,'not displayed regardless of nc on/off','off','displayed regardless of nc on/off','on',' Alert footer section of alerts is displayed  in alert center page when nc switcher is?',1,1,'Debashree Goswami'),(5,2,'View Notification Settings','View Alert History','View Nottification Settings,View Alert History','View Notification Settings,View Triggered Alerts','What is/are the  links available in the alert center page ?',1,1,'Debashree Goswami'),(6,3,'5','1','2','3','An alert in the alert center page has how many different sections or tab?',1,1,'Debashree Goswami'),(7,2,'open alert history page','open black band when alert-details modal is off','redirect to kpi details page','open alert -details modal popup when modal is on','Clicking on the alert header section of the alert in alert center page will cause?',1,1,'Debashree Goswami'),(8,2,'alert-header,alert-history,alert-description,alert-footer','alert-description','alert-header,alert-description,alert-footer','alert-header,alert-description','What are the different sections or tabs of the alert in alert center page?',1,1,'Debashree Goswami'),(9,1,'redirect to kpi details page','open black-band or alert-details modal popup depending upon alert-details-modal switcher is on or off','open black band','open alert-details modal popup','Clicking on alert-description section of the alert in alert center page will cause?',2,1,'Debashree Goswami'),(10,0,'Triggered,Followed,Suggested','Triggered,Followed,Unfollowed','Followed','Triggered,Followed','What are the different types of alerts in the alert center page?',2,1,'Debashree Goswami'),(11,3,'no View Notification Settings link available in alert center page','On regardless of nc on or off','nc switcher is Off','nc switcher is On','View Notification Settings link is available in alert center page when?',2,1,'Debashree Goswami'),(12,3,'highlighted for every alerts','not highlighted in any alerts','in  followed alerts','in  triggered alerts','The alert-description section of the alert in alert center page is highlighted ?',2,1,'Debashree Goswami'),(13,0,'yes','available when nc off','available when nc on','no','is a dm-badge available in the alert-details modal popup?',2,1,'Debashree Goswami'),(14,1,'call','sms,mail and call','mail and call','sms and call','What are the different ways to receive a notification?',2,1,'Debashree Goswami'),(15,1,'daily alerts,wekly alerts,monthly alerts','notification,instant alerts,weekly alerts,daily alerts','instant alerts,weekly alerts,daily alerts','notification,instant alerts,daily alerts','What are the different links in notification center page?',2,1,'Debashree Goswami'),(16,0,'when alert-details modal is on','when alert-details modal off','yes','no','Can we delete an alert from notification center page?',2,1,'Debashree Goswami'),(17,2,'regardless of alert-details modal switcher','cards are not clickable in notification center page','alert-details modal off','alert-details-modal is on','Clicking on any sections of an alert in the notification center page will cause redirection to kpi details if?',3,1,'Debashree Goswami'),(18,0,'yes','no','based on user privileges',NULL,'Can we change the timings of the daily alerts when to be notified in notification center page?',3,1,'Debashree Goswami'),(19,2,'None of these','Manage Notification ilink on hover of logged in user avatar','View Notification Settings link in alert center page and Manage Notification link on hover of logged in user avatar','View Notification Settings link is alert center page','How can we go to the notification center page?',3,1,'Debashree Goswami'),(20,3,'only triggered alerts which are subscribed to be notified','alerts which are subscribed to be notified monthly','alerts which are subscribed to be notified instantly','all alerts that are subscribed to be notified','What is displayed in notification center page?',3,1,'Debashree Goswami'),(21,2,'When to be notified','subscribers and when to be notified','creator of alert,subscribers and when to be notified','creator of alert and subscribers ','What are displayed in the alert footer section of the alert?',3,1,'Debashree Goswami'),(22,0,'no','always','when alert details modal on','when alert details modal off','Is alert footer section of alerts in alert center page clickable?',3,1,'Debashree Goswami'),(23,1,NULL,'always','no','based on user privileges','Can we change the mode of notification of the alerts when on the notification center page?',3,1,'Debashree Goswami'),(24,0,'yes','no','when alert details modal off','when alert details modal on','Is alert footer section of alerts in notification center page clickable?',3,1,'Debashree Goswami'),(25,2,'switching on the alert switcher ,Alert-Center tab displayed in navigation bar','switching on the alert switcher ,Alerts tab displayed in navigation bar','Alerts tab in the navigation bar available by default','Alert-Center tab in the navigation bar available by default','How can all the alerts be viewd?',1,1,'Debashree Goswami'),(26,0,'Daily,Weekly,Monthly','Weekly,Monthly,Yearly','Daily,Weekly,Monthly,Yearly','none of the above','How many different way I can sechedule Report ?',2,2,'Ravikumar'),(27,0,'on report page tab','on history page tab','on both tab','none of the above','New report button is in which tab on history page ?',2,2,'Ravikumar'),(28,1,'3','4','2','1','How many options are there to filter out history page data?',2,2,'Ravikumar'),(29,2,'1','0','2','3','How many options are their to filterout histry page data based on Type ?',3,2,'Ravikumar'),(30,3,'1','3','4','2','How many options are their to filterout histry page data based on Status ?',2,2,'Ravikumar'),(31,2,'10','5','Any','1','How many maximum recipents can be added while Scheduled/send reports',3,2,'Ravikumar'),(33,1,'no ','yes',NULL,NULL,'Is it possible to filterout historypage data based on report name ?',2,2,'Ravikumar'),(34,1,'3','4','2','none of the above','How many options do we have to schedule monthly report ?',3,2,'Ravikumar'),(35,3,'first day','last day','specific day ','none of the above','Which option is by default selected for monthly report ?',2,2,'Ravikumar'),(36,2,'from Page settings','from admin settings','company page setting inside admin setting','none of the above','How to add Valid domain list ?',3,2,'Ravikumar'),(37,1,';',',','|','&','Valid domian are seperated by which sign ? ',3,2,'Ravikumar'),(38,1,'yes','no',NULL,'none of the above','Does we load entire history page data at once ?',2,2,'Ravikumar'),(39,1,'no ','yes',NULL,'none of the above','Does we display DeliveryTime on history page?',2,2,'Ravikumar'),(40,2,'4','5','7','2','How many maximum no. of recipents are display inside recipent list on history page ?',1,2,'Ravikumar'),(41,0,'yes','no',NULL,NULL,'Is their any message get display if there is no data avialable on history tab ?',1,2,'Ravikumar'),(42,2,'no',NULL,'yes','none of the above','Is it possible to add multiple card while creating new report ?',2,2,'Ravikumar'),(43,0,'no',NULL,'yes','none of the above','Can we filterout historypage data based on DeliveryTime ?',2,2,'Ravikumar'),(44,2,'Success','Success,Details','Success,Detils,Genarating report','none of the above','How alltype of Status available on history page?',3,2,'Ravikumar'),(45,0,'on click of Details icon','on hover of Details icon','not display','none of the above','when error message get display?',2,2,'Ravikumar'),(46,0,'daily','Monthly','Weekly','none of the above','Include weekend checkbox display when we schedule report as ?',2,2,'Ravikumar'),(47,0,'yes','no',NULL,NULL,'Is their any functionality to display \'unsubscribe\' if user unsubscribed that report ?',2,2,'Ravikumar'),(48,1,'no ','yes',NULL,NULL,'Is it possible to add card to report , in edit mode ?',2,2,'Ravikumar'),(49,2,'yes',NULL,'no','none of the above','Is it possible to sort history page data based on \'ReportName\' or \'DeliveryTime\' ?',2,2,'Ravikumar'),(50,3,'4','3','1','2','How many tabs on report page ? ',2,2,'Ravikumar'),(51,0,'Monday','Today\'s Day','Sunday','none of the above','Which day is selected  by default  for weekly report ?',3,2,'Ravikumar'),(52,1,'no','yes',NULL,NULL,'Is their any way to restrict a scheduled report to be send , after specific date ?',2,2,'Ravikumar'),(53,1,'yes','no',NULL,NULL,'Is their any way to delete history log on history page',2,2,'Ravikumar'),(54,0,'yes','no',NULL,NULL,'Does reportpage\'s tabs work on browser\'s back button?',3,2,'Ravikumar'),(55,1,'no','yes',NULL,NULL,'is it possible to send schedule rerport on specific date ?',2,2,'Ravikumar'),(56,4,'100','50','20','No limit','What is the limit of alerts a user can create on any card?',1,1,'Rahul Handay'),(57,3,'Only statement A.','Only Statement B.','None','Both A and B.','Choose the correct statement(s) :- a) User cannot delete triggered alert. b) User cannot delete untriggered alert. ',1,1,'Rahul Handay'),(58,2,'Only statement A.','Only Statement B.','None','Both A and B.','Choose the correct statement(s) :- a) User cannot edit triggered alert. b) User can edit untriggered alert. ',1,1,'Rahul Handay'),(59,1,'Create an alert','Share an alert','Both op1 and op2','None','Which of the following is related to alerts :-',1,1,'Rahul Handay'),(60,1,'1, 4 and 5','2, 4 and 5','1, 3 and 5','1, 2 and 3','Subscription allowed for alerts :- 1. Instantly 2. Yearly 3. Monthly 4. Daily 5. Weekly',1,1,'Rahul Handay'),(61,4,'60 Days','20 Days','50 Days','180 Days','Number of days of history avaiable to the user?',2,1,'Rahul Handay'),(62,2,'Only statement A.','Only Statement B.','Both op1 and op2','None','Choose the correct statement(s) :- a) If the user removes the cardform the page then its alerts gets deleted from alert center b) If the user deleted the card from the page then its alerts gets deleted from the alert center  ',2,1,'Rahul Handay'),(63,1,'1 and 3','2 and 1','4 and 2','1, 3 and 4','Which of the following switcher are related to alerts:- 1. alert-details-modal 2. alerts-on 3. alert-inline 4. cb-alert-v3',2,1,'Rahul Handay'),(64,3,'No','Depends on user privilages','Yes','None','User can create multiple alerts with same rule.',2,1,'Rahul Handay'),(65,3,'No','Depends on user privilages','Yes','None','User can create multiple alerts with same name.',2,1,'Rahul Handay'),(66,1,'No','Depends on user privilages','Yes','None','User is allowed to share an alert with any other user.',3,1,'Rahul Handay'),(67,2,'Only a','Only a and b','Only a and c','All of these','Choose the correct statement(s) :- a) User can follow an alert from the card b) User can follow an from alert center c) User can follow an alert from notification center',3,1,'Rahul Handay'),(68,4,'Turn off alert-details-modal','Turn on alert-details-modal','Turn on alert-inline switcher','Trun off alert-inline switcher','How to display alerts as list?',3,1,'Rahul Handay'),(69,4,'Turn off alert-details-modal','Turn on alert-details-modal','Trun off alert-inline switcher','Turn on alert-inline switcher','How to display alerts as cards?',3,1,'Rahul Handay'),(70,2,'Total number of alerts','Number of triggered alerts','Number of suscribers','None','What does the number above the bell icon represents?',3,1,'Rahul Handay'),(71,1,'Suscribers ','Owner of the cards','Both op1 and op2','None','What does the user avatars on an alert indicated?',1,1,'Rahul Handay'),(72,3,'No','Depends on user privilages','Yes','None','Is it possible to give custom name to an alert?',1,1,'Rahul Handay'),(73,2,'Turn off alert-details-modal','Turn on alert-details-modal','Turn on alerts-details-modal','Turn off alerts-details-modal','How to show alert detail modal on click of an alert?',1,1,'Rahul Handay'),(74,4,'Only statement A.','Only Statement B.','Only statement C','All of these','Choose the correct statement(s) regarding alert details modal :- a) User can delete and alert from its modal b) User can edit an alert from its modal c) User can change the subscription from its modal ',1,1,'Rahul Handay'),(75,1,'Number of times the alert is triggered on the particular day','Number times the alert is edited in that day','Number of users who suscribed that alert on that day','None','What does heat map on alert details modal represents?',1,1,'Rahul Handay'),(76,3,'Red','Blue','Yellow','Green','What is the color of triggered alerts?',2,1,'Rahul Handay'),(77,1,'Yes','No','Depends on user privilages','Both A and C','If a user delets an  alert will it affect other suscribers also?',2,1,'Rahul Handay'),(78,1,'Yes','No','Depends on user privilages','Both A and C','Can the user have numtiple subscriptions for a single alert?',2,1,'Rahul Handay'),(79,2,'The name of the user who creats that alert','The rule of an alert','Name of the card with the user who creats that alert','None','What is the default name of an alert if custom name is not given?',3,1,'Rahul Handay'),(80,3,'Yes, 50 is the limit','Yes, 100 is the limit','No limit','Both A and B, depends on the user who creates the alert','Is there any limit on the suscribers for an alert?',3,1,'Rahul Handay'),(81,3,'Numerical ','String','Both 1 and 2','None of the above','What is beast mode used for?',1,3,'Sanket'),(82,1,'Yes','No','.',NULL,'Does Beast Mode has auto fill property?',1,3,'Sanket'),(83,4,'RAND','SYSDATE','FROM_UNIXTIME','LOG','Which of the following is not a beast Mode function?',2,3,'Sanket'),(84,1,'Delete','Not delete','Undetermined','None of the above','What will happen if you try to delete a beast mode shared on dataset and also other card is created from same dataset?',3,3,'Sanket'),(85,3,'Firepad','Ymacs','Code Mirror','Helene','Which text editor is used for Beast Mode implemetation?',3,3,'Sanket'),(86,1,'No','Yes',NULL,NULL,'Can  beast mode be implemented in drill paths?',1,3,'Sanket'),(87,2,'no','Yes',NULL,NULL,'Is this a valid beast mode formula? ( CASE WHEN((\'X\') =100) THEN \'2\' ELSE \'0\' )',3,3,'Sanket'),(88,1,'Yes','No',NULL,NULL,'Can one delete exisiting beast mode in edit drill view?',2,3,'Sanket'),(89,1,'NO','YES',NULL,NULL,'Will deleted beast mode from edit drill be reflected in edit card page?',2,3,'Sanket'),(90,1,'Yes','No',NULL,NULL,'Can beast mode be applied to the axis?',1,3,'Sanket'),(91,2,'No','Yes',NULL,NULL,'Does table chart render beast mode value?',1,3,'Sanket'),(92,3,'dev.dev.domo.com/help','dev.dev.domo.com/auth/communityhelp','Wiki.domo.com','None of the above','Where does beast mode help link direct to?',2,3,'Sanket'),(93,4,'When beast mode is valid','when best mode uses CASE function','When Beast Mode is not valid','when beast mode is aggregated','When does apply Summary Number checkbox gets enabled?',2,3,'Sanket'),(94,1,'Yes','No',NULL,NULL,'Does Save&Close also validates the formula?',1,3,'Sanket'),(95,2,'No','Yes',NULL,NULL,'Can best mode with same name be created?',1,3,'Sanket'),(96,1,'Yes','No',NULL,NULL,'Can Beast Mode with same name as any column name be created?',2,3,'Sanket'),(97,4,'!','^','$','=','What is the prefix attached to Beast Mode?',2,3,'Sanket'),(98,1,'Yes','No',NULL,NULL,'Does Beast Mode gets searched by typing \'=\' in search box?',1,3,'Sanket'),(99,1,'No','Yes',NULL,NULL,'Can Beast mode be created in SUMO Card creation?',3,3,'Sanket'),(100,2,'No','Yes',NULL,NULL,'Can Beast mode be created in POLL,IMAGE Card creation?',3,3,'Sanket'),(101,1,'yes','No',NULL,NULL,'Can SUMO Card contain beast mode?',2,3,'Sanket'),(102,2,'Bold','Italics','Underlined','Not discriminated','How is Beast Mode discriminated in SUMO Card?',2,3,'Sanket'),(103,2,'By adding while creating the Card','Only if present in datasource','Cannot add.','None of the above','How can we add Beast mode to SUMO Card?',2,3,'Sanket'),(104,1,'Yes','No',NULL,NULL,'Can we add beast mode to reports?',1,3,'Sanket'),(105,3,'@','#','`','%','By which symbol we can see the list of all the columns present in dataset?',1,3,'Sanket'),(106,1,'2','5','1','6','How many versions of Beast mode have been release?',1,3,'Sanket'),(107,2,'No','Yes',NULL,NULL,'Can we apply Beast Mode to Summary Number?',2,3,'Sanket'),(108,4,'Data Set Fields','Functions','FunctionDescription','Chart Type','Which of the following parameter are not present on Beast Mode pop up?',2,3,'Sanket'),(109,1,'Yes ','No',NULL,NULL,'Can we use  Beast mode as a parameter while creating new Beast Mode?',3,3,'Sanket'),(110,3,'Scarlet','Blue','Green','Brown','Which color does Numerical column hold in Dataset Fields?',3,3,'Sanket'),(111,2,'Scarlet','Blue','Green','Brown','Which color does Date column hold  in Dataset Fields?',2,3,'Sanket'),(112,2,'Scarlet','Blue','Green','Brown','Which color does String column hold in Dataset Fields?',2,3,'Sanket'),(113,1,'Yes','No',NULL,NULL,'Can Beast mode be overwritten?',1,3,'Sanket'),(114,2,'No','Yes',NULL,NULL,'Does Beast Mode allow to delete it?',1,3,'Sanket'),(115,3,'By drag and Drop','By back tick','Both 1 & 2','None of the above','How can you eneter any column in Beast Mode pop-up?',1,3,'Sanket'),(116,1,'Yes','No',NULL,NULL,'If column \'a\' is not present in d1, will 100*a be a valid Beast Mode?',3,3,'Sanket'),(117,1,'Yes','No',NULL,NULL,'If column \'a\' is present in Beast Mode and a*100 is a beast mode calculation, will it be a valid Beast Mode? ',3,3,'Sanket'),(118,3,'100','a*100','No data exists','None of the above','What will be data present in Beast Mode test? If test= a*100; where a is a string column in datasource.',3,3,'Sanket'),(119,2,'No','Yes',NULL,NULL,'Does Beast mode allow you to move from one dataset to other dataset?',2,3,'Sanket'),(120,1,'yes','No',NULL,NULL,'Can Beast Mode with same Name be used in different Datasets?',1,3,'Sanket'),(121,3,'Aggregated','Numeric','Validated','None of the above','When will the \'Apply to Summary Number\' checkbox be enabled? When Beast Mode is:',2,3,'Sanket'),(122,3,'dm-column-list.js','dm-scheduled-reports.js','dm-advanced-beast-mode','None of the above','Which directive is used for Beast Mode implication?',3,3,'Sanket'),(123,2,'No','Yes',NULL,NULL,'Can we use current date and time in  beast mode?',2,3,'Sanket'),(124,1,'Extract Transmit Load','Extract Transform Load','Extract Transfer Load','none of the above','What does ETL stands for?',1,4,'Nilesh'),(125,1,'Datasets','Dataflows','Accounts','All of the above','Where does  Magic ETL  appear in DOMO application',1,4,'Nilesh'),(126,1,'datacenter-wetl','dataflows-wetl','Both 1 & 2','none of the above','What is the switcher for ETL?',1,4,'Nilesh'),(127,3,'1','2','3','4','How many different categories of actions are present in ETL?',1,4,'Nilesh'),(128,2,'Input Dataset','Output Dataset','Both 1 and 2','None of the above','Which of the following actions comes under Datasets category? ',2,4,'Nilesh'),(129,2,'Append Rows','Join Data','Both 1 and 2','None of the above','Which of the following actions comes under Combine Data category? ',2,4,'Nilesh'),(130,1,'Yes','No','Depends on user privilages',NULL,'Can user preview ETL dataflow without saving the dataflow?',2,4,'Nilesh'),(131,2,'0','1','2','3','How many input datasets can be connected to Join data action?',2,4,'Nilesh'),(132,1,'String and numeric','Numeric','Date','Date and Date Time','What type of column is supported by calculator Action',2,4,'Nilesh'),(133,3,'String and numeric','Numeric','Date','Date ,Date Time and Numeric ','What types of column are supported by Date Operations Action',2,4,'Nilesh'),(134,0,'String ','Numeric','Date','Date ,Date Time and Numeric ','What type of column are supported by replace Text Action',2,4,'Nilesh'),(135,1,'No','Yes',NULL,NULL,'Can we connect output of one aciton as input to another action? ',2,4,'Nilesh'),(136,1,'Join columns','Combine columns','Append Columns','None f the above','Which action lets you combine values from multiple columns into one column',3,4,'Nilesh'),(137,0,'Add constants','Group By','Calculator','Collpase columns','Which action lets you add a column with constant values',3,4,'Nilesh'),(138,0,'Calculator','Date Operations','Appen dcolumns','Select columns','Which action  lets you add a column with values from a simple calculation',3,4,'Nilesh'),(139,2,'Join columns','Combine columns','Collpase columns','Join Data','Which action  lets lets you \"unpivot\" or \"normalize\" data in tables, transforming multiple columns in a single row into a single column with multiple rows',3,4,'Nilesh'),(140,3,'Value Mapper','Text formatting','Calculator','Date operations','Which action lets you add a column with values from a date-based calculation',3,4,'Nilesh'),(141,1,'Value Mapper','Group By','Collpase columns','Append Columns','Which action lets you aggregate values from multiple columns into one column',3,4,'Nilesh'),(142,3,'Set column Value','Set column Type','Choose columns','Select columns','Which action lets you choose columns to include, reorder columns, and rename column headings',3,4,'Nilesh'),(143,1,'Set column Value','Set column Type','Set Type','Set Data Type','Which action lets you change the data type of a column',3,4,'Nilesh'),(144,3,'Collapse columns','Row normalizer','Row denormlizer','Uncollapse columns','Which action lets you \"pivot\" or de-normalize data in tables using key-value pairs, transforming a single column with multiple rows into multiple columns in a single row',3,4,'Nilesh'),(145,2,'Row Normalizer','Row denormalizer','Filter rows','Filter columns','Which action lets you include or exclude rows based on specified rules.',3,4,'Nilesh'),(146,3,'Value Mapper','Group By','Unique rows','Remove duplicates','Which action lets you get unique rows, based on specific columns',3,4,'Nilesh'),(147,3,'Set column Value','Remove duplicates','Text Fromatting','Replace Text','Which action lets you replace all occurrences of a text value with another text value ',3,4,'Nilesh'),(148,0,'Set column Value','Remove duplicates','Text Fromatting','Replace Text','Which action lets you replace the value of a column with the values in another column',3,4,'Nilesh'),(149,1,'Set column Value','Value Mapper','Text Fromatting','Replace Text','Which action lets you search and replace string values in a specific column, according to pairs of string values you enter',3,4,'Nilesh'),(150,2,'Set column Value','Value Mapper','Text Fromatting','Replace Text','Which action lets you format text (lower case, upper case, capitalization), remove numbers, or remove everything except numbers',3,4,'Nilesh'),(151,1,'Join Rows','Append Rows','Append Columns','Join Data','Which action lets you append rows from multiple DataSets (with similar columns and data structure) into one DataSet, returning occurrences of all matches, including duplicate rows',3,4,'Nilesh'),(152,2,'Combine Columns','Append rows','Join Data','Join Columns','Which action ets you combine columns from two DataSets or data \"streams\" into one DataSet using common values in a specific column (or set of columns)',3,4,'Nilesh'),(153,0,'Input Dataset','Output Dataset','Both 1 & 2','None','Which action is used to add a DataSet to the transformation flow',3,4,'Nilesh'),(154,0,'Output Dataset','Input Dataset','Both 1 & 2','None','Which action is used to output the transformed data as a DataSet.',3,4,'Nilesh'),(155,0,'String ','Numeric','Date','Date ,Date Time and Numeric ','What type of column are supported by  Text Fromatting Action',2,4,'Nilesh'),(156,1,'Yes','No',NULL,NULL,'Can we connect more than one action to output dataset',2,4,'Nilesh'),(157,0,'Input Dataset','Output Dataset','Row Normalizer','Text Fromatting','Which action contains all the three Configuration, Details and Data tabs',2,4,'Nilesh'),(158,0,'Yes','No',NULL,NULL,'Can We save a dataflow with unconfigured actions',2,4,'Nilesh'),(159,0,'Saved but incomplete.Cannot be run untill all actions are configured correctly','Partially Saved..Cannot be run untill all actions are configured correctly','Half saved.Cannot be run untill all actions are configured correctly','None of the above','What message we get on partially saving a dataflow ',2,4,'Nilesh'),(160,1,'Datasets','Dataflows','Accounts','None of the above','Where does the created ETL dataflow accur in Domo application',1,4,'Nilesh'),(161,3,'2','4','1','5','How many steps are required to create an ETL dataflow',3,4,'Nilesh');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `exam_userid` varchar(255) NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set_exam`
--

DROP TABLE IF EXISTS `set_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `set_exam` (
  `set_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `actual_start_time` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `is_conducted` tinyint(1) NOT NULL,
  `marks` int(11) NOT NULL,
  `questions` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `templatesetexam_template_id` int(11) NOT NULL,
  `user_userid` int(11) NOT NULL,
  PRIMARY KEY (`set_exam_id`),
  KEY `FK545921DCA2BBA118` (`templatesetexam_template_id`),
  KEY `FK545921DC1972A3FB` (`user_userid`),
  CONSTRAINT `FK545921DC1972A3FB` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK545921DCA2BBA118` FOREIGN KEY (`templatesetexam_template_id`) REFERENCES `template` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_exam`
--

LOCK TABLES `set_exam` WRITE;
/*!40000 ALTER TABLE `set_exam` DISABLE KEYS */;
INSERT INTO `set_exam` VALUES (1,'13:00:00','01:10',1,30,'1,2','08/18/2015','13:00:08',1,14248),(2,'14:00:00','20:00',0,0,'1','08/30/2015','07:00:00',1,14248),(10,'13:00:00','20:00',1,40,'1,6,7','10/08/2015','09:09:00',2,14275),(11,NULL,'06:00',0,0,NULL,'09/14/2015','00:06:00',1,14275),(12,'13:00:00','20:00',1,40,'1,6,7','10/08/2015','09:09:00',2,14248),(13,NULL,'05:00',0,0,NULL,'09/30/2015','04:04:00',2,14248);
/*!40000 ALTER TABLE `set_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_count` int(11) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,30,'t1'),(2,20,'t2'),(3,50,'t3'),(4,50,'t4'),(5,70,'t5');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_module_level`
--

DROP TABLE IF EXISTS `template_module_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_module_level` (
  `template_module_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `template_module_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`template_module_level_id`),
  KEY `FKDFD85796432436E4` (`level_id`),
  KEY `FKDFD85796CB9F8720` (`template_module_id`),
  KEY `FKDFD85796C63307D7` (`template_id`),
  KEY `FKDFD857966F0B2B90` (`template_id`),
  KEY `FKDFD857963590A5` (`module_id`),
  CONSTRAINT `FKDFD857963590A5` FOREIGN KEY (`module_id`) REFERENCES `template_modules` (`template_module_id`),
  CONSTRAINT `FKDFD85796432436E4` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`),
  CONSTRAINT `FKDFD857966F0B2B90` FOREIGN KEY (`template_id`) REFERENCES `template` (`template_id`),
  CONSTRAINT `FKDFD85796C63307D7` FOREIGN KEY (`template_id`) REFERENCES `template_modules` (`template_module_id`),
  CONSTRAINT `FKDFD85796CB9F8720` FOREIGN KEY (`template_module_id`) REFERENCES `template_modules` (`template_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_module_level`
--

LOCK TABLES `template_module_level` WRITE;
/*!40000 ALTER TABLE `template_module_level` DISABLE KEYS */;
INSERT INTO `template_module_level` VALUES (1,10,1,1,1,1),(2,20,2,2,1,2),(3,10,1,3,2,1),(4,5,2,4,2,3),(5,5,3,4,2,3),(6,10,1,5,3,4),(7,15,2,5,3,4),(8,25,3,5,3,4),(9,10,2,6,4,2),(10,10,3,6,4,2),(11,10,1,7,4,3),(12,10,2,7,4,3),(13,5,3,7,4,3),(14,30,1,8,5,2),(15,20,2,8,5,2),(16,20,3,8,5,2);
/*!40000 ALTER TABLE `template_module_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_modules`
--

DROP TABLE IF EXISTS `template_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_modules` (
  `template_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`template_module_id`),
  KEY `FKDE0480C229CC9BD0` (`module_id`),
  KEY `FKDE0480C26F0B2B90` (`template_id`),
  CONSTRAINT `FKDE0480C229CC9BD0` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  CONSTRAINT `FKDE0480C26F0B2B90` FOREIGN KEY (`template_id`) REFERENCES `template` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_modules`
--

LOCK TABLES `template_modules` WRITE;
/*!40000 ALTER TABLE `template_modules` DISABLE KEYS */;
INSERT INTO `template_modules` VALUES (1,1,1),(2,2,1),(3,1,2),(4,3,2),(5,4,3),(6,2,4),(7,3,4),(8,2,5);
/*!40000 ALTER TABLE `template_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_question`
--

DROP TABLE IF EXISTS `template_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_question` (
  `template_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_number` int(11) NOT NULL,
  `user_answer` varchar(255) DEFAULT NULL,
  `templatequestionsetexam_set_exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`template_question_id`),
  KEY `FKC1120A0BB473490B` (`templatequestionsetexam_set_exam_id`),
  CONSTRAINT `FKC1120A0BB473490B` FOREIGN KEY (`templatequestionsetexam_set_exam_id`) REFERENCES `set_exam` (`set_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_question`
--

LOCK TABLES `template_question` WRITE;
/*!40000 ALTER TABLE `template_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11111,'Admin123','admin','admin'),(14248,'Debashree123','candidate','debashreeg'),(14262,'Poonam123','candidate','poonamga'),(14275,'Sakshi123','candidate','sakshij');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answer`
--

DROP TABLE IF EXISTS `user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_answer` (
  `binary_result` int(11) DEFAULT NULL,
  `user_answer` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `set_exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exam_userid` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`,`set_exam_id`,`question_id`),
  KEY `FKD80386B2ED395D07` (`userid`),
  KEY `FKD80386B2212CFB29` (`set_exam_id`),
  KEY `FKD80386B24851E410` (`question_id`),
  KEY `FKD80386B2E0D79AE6` (`exam_userid`),
  CONSTRAINT `FKD80386B2212CFB29` FOREIGN KEY (`set_exam_id`) REFERENCES `set_exam` (`set_exam_id`),
  CONSTRAINT `FKD80386B24851E410` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `FKD80386B2E0D79AE6` FOREIGN KEY (`exam_userid`) REFERENCES `exam_user` (`exam_userid`),
  CONSTRAINT `FKD80386B2ED395D07` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answer`
--

LOCK TABLES `user_answer` WRITE;
/*!40000 ALTER TABLE `user_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-13 14:15:31
