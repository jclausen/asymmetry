-- MySQL dump 10.13  Distrib 5.6.27, for osx10.11 (x86_64)
--
-- Host: localhost    Database: contentbox
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `cb_author`
--

DROP TABLE IF EXISTS `cb_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_author` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `biography` longtext,
  `preferences` longtext,
  `FK_roleID` int(11) NOT NULL,
  PRIMARY KEY (`authorID`),
  UNIQUE KEY `username` (`username`),
  KEY `FK6847396B9724FA40` (`FK_roleID`),
  KEY `idx_login` (`username`,`password`,`isActive`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_activeAuthor` (`isActive`),
  KEY `idx_email` (`email`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FK6847396B9724FA40` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_authorPermissions`
--

DROP TABLE IF EXISTS `cb_authorPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_authorPermissions` (
  `FK_authorID` int(11) NOT NULL,
  `FK_permissionID` int(11) NOT NULL,
  KEY `FKE167E219AA6AC0EA` (`FK_authorID`),
  KEY `FKE167E21937C1A3F2` (`FK_permissionID`),
  CONSTRAINT `FKE167E21937C1A3F2` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`),
  CONSTRAINT `FKE167E219AA6AC0EA` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_category`
--

DROP TABLE IF EXISTS `cb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `category` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_categorySlug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_comment`
--

DROP TABLE IF EXISTS `cb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `content` longtext NOT NULL,
  `author` varchar(100) NOT NULL,
  `authorIP` varchar(100) NOT NULL,
  `authorEmail` varchar(255) NOT NULL,
  `authorURL` varchar(255) DEFAULT NULL,
  `isApproved` bit(1) NOT NULL,
  `FK_contentID` int(11) NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `FKFFCED27F91F58374` (`FK_contentID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_approved` (`isApproved`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_contentComment` (`isApproved`,`FK_contentID`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FKFFCED27F91F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_commentsubscriptions`
--

DROP TABLE IF EXISTS `cb_commentsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_commentsubscriptions` (
  `subscriptionID` int(11) NOT NULL,
  `FK_contentID` int(11) NOT NULL,
  PRIMARY KEY (`subscriptionID`),
  KEY `FK41716EB791F58374` (`FK_contentID`),
  KEY `FK41716EB71D33B614` (`subscriptionID`),
  KEY `idx_contentCommentSubscription` (`FK_contentID`),
  CONSTRAINT `FK41716EB71D33B614` FOREIGN KEY (`subscriptionID`) REFERENCES `cb_subscriptions` (`subscriptionID`),
  CONSTRAINT `FK41716EB791F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_content`
--

DROP TABLE IF EXISTS `cb_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_content` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `publishedDate` datetime DEFAULT NULL,
  `expireDate` datetime DEFAULT NULL,
  `isPublished` bit(1) NOT NULL,
  `allowComments` bit(1) NOT NULL,
  `passwordProtection` varchar(100) DEFAULT NULL,
  `HTMLKeywords` varchar(160) DEFAULT NULL,
  `HTMLDescription` varchar(160) DEFAULT NULL,
  `HTMLTitle` varchar(255) DEFAULT NULL,
  `cache` bit(1) NOT NULL,
  `cacheLayout` bit(1) NOT NULL,
  `cacheTimeout` int(11) DEFAULT NULL,
  `cacheLastAccessTimeout` int(11) DEFAULT NULL,
  `markup` varchar(100) NOT NULL,
  `showInSearch` bit(1) NOT NULL,
  `featuredImage` varchar(255) DEFAULT NULL,
  `featuredImageURL` varchar(255) DEFAULT NULL,
  `FK_authorID` int(11) NOT NULL,
  `FK_parentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  UNIQUE KEY `slug` (`slug`),
  KEY `FKFFE01899AA6AC0EA` (`FK_authorID`),
  KEY `FKFFE018996FDC2C99` (`FK_parentID`),
  KEY `idx_cachelastaccesstimeout` (`cacheLastAccessTimeout`),
  KEY `idx_publishedSlug` (`slug`,`isPublished`),
  KEY `idx_slug` (`slug`),
  KEY `idx_expireDate` (`expireDate`),
  KEY `idx_publishedDate` (`publishedDate`),
  KEY `idx_cache` (`cache`),
  KEY `idx_published` (`contentType`,`isPublished`,`passwordProtection`),
  KEY `idx_cachetimeout` (`cacheTimeout`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_showInSearch` (`showInSearch`),
  KEY `idx_cachelayout` (`cacheLayout`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_search` (`title`,`isPublished`),
  KEY `idx_discriminator` (`contentType`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FKFFE018996FDC2C99` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `FKFFE01899AA6AC0EA` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_contentCategories`
--

DROP TABLE IF EXISTS `cb_contentCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_contentCategories` (
  `FK_contentID` int(11) NOT NULL,
  `FK_categoryID` int(11) NOT NULL,
  KEY `FKD96A0F9591F58374` (`FK_contentID`),
  KEY `FKD96A0F95F10ECD0` (`FK_categoryID`),
  CONSTRAINT `FKD96A0F95F10ECD0` FOREIGN KEY (`FK_categoryID`) REFERENCES `cb_category` (`categoryID`),
  CONSTRAINT `FKD96A0F9591F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_contentStore`
--

DROP TABLE IF EXISTS `cb_contentStore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_contentStore` (
  `contentID` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`contentID`),
  KEY `FKEA4C67C8C960893B` (`contentID`),
  CONSTRAINT `FKEA4C67C8C960893B` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_contentversion`
--

DROP TABLE IF EXISTS `cb_contentversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_contentversion` (
  `contentVersionID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `content` longtext NOT NULL,
  `changelog` longtext,
  `version` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `FK_authorID` int(11) NOT NULL,
  `FK_contentID` int(11) NOT NULL,
  PRIMARY KEY (`contentVersionID`),
  KEY `FKE166DFFAA6AC0EA` (`FK_authorID`),
  KEY `FKE166DFF91F58374` (`FK_contentID`),
  KEY `idx_version` (`version`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_contentVersions` (`isActive`,`FK_contentID`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_activeContentVersion` (`isActive`),
  CONSTRAINT `FKE166DFF91F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `FKE166DFFAA6AC0EA` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_customfield`
--

DROP TABLE IF EXISTS `cb_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_customfield` (
  `customFieldID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `FK_contentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`customFieldID`),
  KEY `FK1844684991F58374` (`FK_contentID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_contentCustomFields` (`FK_contentID`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FK1844684991F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_entry`
--

DROP TABLE IF EXISTS `cb_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_entry` (
  `contentID` int(11) NOT NULL,
  `excerpt` longtext,
  PRIMARY KEY (`contentID`),
  KEY `FK141674927FFF6A7` (`contentID`),
  CONSTRAINT `FK141674927FFF6A7` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_loginattempts`
--

DROP TABLE IF EXISTS `cb_loginattempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_loginattempts` (
  `loginAttemptsID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `value` varchar(255) NOT NULL,
  `attempts` int(11) NOT NULL,
  `lastLoginSuccessIP` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`loginAttemptsID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_values` (`value`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_menu`
--

DROP TABLE IF EXISTS `cb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_menu` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `menuClass` varchar(160) DEFAULT NULL,
  `listClass` varchar(160) DEFAULT NULL,
  `listType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_menuslug` (`slug`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_menutitle` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_menuitem`
--

DROP TABLE IF EXISTS `cb_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_menuitem` (
  `menuItemID` int(11) NOT NULL AUTO_INCREMENT,
  `menuType` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `title` varchar(200) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `itemClass` varchar(200) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `FK_menuID` int(11) NOT NULL,
  `FK_parentID` int(11) DEFAULT NULL,
  `mediaPath` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `urlClass` varchar(255) DEFAULT NULL,
  `menuSlug` varchar(255) DEFAULT NULL,
  `contentSlug` varchar(255) DEFAULT NULL,
  `js` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuItemID`),
  KEY `FKF9F1DCF28E0E8DD2` (`FK_menuID`),
  KEY `FKF9F1DCF2D3B42410` (`FK_parentID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_menuitemtitle` (`title`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FKF9F1DCF2D3B42410` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_menuItem` (`menuItemID`),
  CONSTRAINT `FKF9F1DCF28E0E8DD2` FOREIGN KEY (`FK_menuID`) REFERENCES `cb_menu` (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_module`
--

DROP TABLE IF EXISTS `cb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_module` (
  `moduleID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `entryPoint` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `webURL` longtext,
  `forgeBoxSlug` varchar(255) DEFAULT NULL,
  `description` longtext,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `idx_moduleName` (`name`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_activeModule` (`isActive`),
  KEY `idx_entryPoint` (`entryPoint`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_page`
--

DROP TABLE IF EXISTS `cb_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_page` (
  `contentID` int(11) NOT NULL,
  `layout` varchar(200) DEFAULT NULL,
  `mobileLayout` varchar(200) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `showInMenu` bit(1) NOT NULL,
  `excerpt` longtext,
  `SSLOnly` bit(1) NOT NULL,
  PRIMARY KEY (`contentID`),
  KEY `FK21B2F26F9636A2E2` (`contentID`),
  KEY `idx_ssl` (`SSLOnly`),
  KEY `idx_showInMenu` (`showInMenu`),
  CONSTRAINT `FK21B2F26F9636A2E2` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_permission`
--

DROP TABLE IF EXISTS `cb_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_permission` (
  `permissionID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `permission` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `permission` (`permission`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_relatedContent`
--

DROP TABLE IF EXISTS `cb_relatedContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_relatedContent` (
  `FK_contentID` int(11) NOT NULL,
  `FK_relatedContentID` int(11) NOT NULL,
  KEY `FK9C2F71AE91F58374` (`FK_contentID`),
  KEY `FK9C2F71AEDF61AADD` (`FK_relatedContentID`),
  CONSTRAINT `FK9C2F71AEDF61AADD` FOREIGN KEY (`FK_relatedContentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `FK9C2F71AE91F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_role`
--

DROP TABLE IF EXISTS `cb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `role` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `role` (`role`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_rolePermissions`
--

DROP TABLE IF EXISTS `cb_rolePermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_rolePermissions` (
  `FK_roleID` int(11) NOT NULL,
  `FK_permissionID` int(11) NOT NULL,
  KEY `FKDCCC1A4E9724FA40` (`FK_roleID`),
  KEY `FKDCCC1A4E37C1A3F2` (`FK_permissionID`),
  CONSTRAINT `FKDCCC1A4E37C1A3F2` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`),
  CONSTRAINT `FKDCCC1A4E9724FA40` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_securityrule`
--

DROP TABLE IF EXISTS `cb_securityrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_securityrule` (
  `ruleID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `whitelist` varchar(255) DEFAULT NULL,
  `securelist` varchar(255) NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `permissions` longtext,
  `redirect` longtext NOT NULL,
  `useSSL` bit(1) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `match` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageType` varchar(50) DEFAULT 'info',
  PRIMARY KEY (`ruleID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_setting`
--

DROP TABLE IF EXISTS `cb_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_setting` (
  `settingID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `name` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  `isCore` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`settingID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_core` (`isCore`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_stats`
--

DROP TABLE IF EXISTS `cb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_stats` (
  `statsID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `hits` bigint(20) DEFAULT NULL,
  `FK_contentID` int(11) NOT NULL,
  PRIMARY KEY (`statsID`),
  UNIQUE KEY `FK_contentID` (`FK_contentID`),
  KEY `FK14DE30BF91F58374` (`FK_contentID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `FK14DE30BF91F58374` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_subscribers`
--

DROP TABLE IF EXISTS `cb_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_subscribers` (
  `subscriberID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `subscriberEmail` varchar(255) NOT NULL,
  `subscriberToken` varchar(255) NOT NULL,
  PRIMARY KEY (`subscriberID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_subscriberEmail` (`subscriberEmail`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cb_subscriptions`
--

DROP TABLE IF EXISTS `cb_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_subscriptions` (
  `subscriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `subscriptionToken` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `FK_subscriberID` int(11) NOT NULL,
  PRIMARY KEY (`subscriptionID`),
  KEY `FKE92A1716F2A66EE4` (`FK_subscriberID`),
  KEY `idx_createDate` (`createdDate`),
  KEY `idx_modifiedDate` (`modifiedDate`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_subscriber` (`FK_subscriberID`),
  CONSTRAINT `FKE92A1716F2A66EE4` FOREIGN KEY (`FK_subscriberID`) REFERENCES `cb_subscribers` (`subscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-05 14:38:46
