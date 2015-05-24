-- MySQL dump 10.13  Distrib 5.6.20, for Linux (x86_64)
--
-- Host: localhost    Database: imsdk
-- ------------------------------------------------------
-- Server version	5.6.20-log

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
-- Table structure for table `t_apps`
--

DROP TABLE IF EXISTS `t_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_apps` (
  `app_id` bigint(20) NOT NULL,
  `app_key` varchar(255) DEFAULT NULL,
  `dev_id` bigint(20) DEFAULT NULL,
  `cs_logourl` varchar(255) NOT NULL DEFAULT '',
  `cs_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `ind_applist_key` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_blacklist`
--

DROP TABLE IF EXISTS `t_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_blacklist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `fuid` bigint(20) NOT NULL DEFAULT '0',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0 ï¼šæ­£å¸¸ï¼Œ1ï¼šå·²åˆ é™¤',
  `last_modify_date` int(14) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_fuid` (`uid`,`fuid`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_csmsg_history`
--

DROP TABLE IF EXISTS `t_csmsg_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_csmsg_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fromcid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `tocid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `msg` varchar(512) NOT NULL DEFAULT '',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msgid` bigint(20) NOT NULL DEFAULT '0',
  `appkey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_appkey` (`appkey`),
  KEY `index_fromcid` (`fromcid`),
  KEY `index_tocid` (`tocid`)
) ENGINE=InnoDB AUTO_INCREMENT=945 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_customservice`
--

DROP TABLE IF EXISTS `t_customservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_customservice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(33) NOT NULL DEFAULT '',
  `appkey` varchar(64) NOT NULL DEFAULT '',
  `nick_name` varchar(64) NOT NULL DEFAULT '',
  `image_id` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(33) NOT NULL DEFAULT '',
  `tel` varchar(33) NOT NULL DEFAULT '',
  `enable` int(4) NOT NULL DEFAULT '1',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`),
  UNIQUE KEY `appkey_account` (`account`,`appkey`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_developer`
--

DROP TABLE IF EXISTS `t_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_developer` (
  `did` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `dname` varchar(64) NOT NULL DEFAULT '',
  `dpassword` varchar(64) NOT NULL DEFAULT '',
  `dprofile` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_devicetoken`
--

DROP TABLE IF EXISTS `t_devicetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_devicetoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `token` varchar(128) DEFAULT NULL,
  `open_flag` int(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_index` (`uid`),
  KEY `Iindex_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=279507 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_kkidpool`
--

DROP TABLE IF EXISTS `t_kkidpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_kkidpool` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `kkid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'å¾…æ”¾kkå·',
  `out_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0-æœªæ”¾å‡º 1-å·²ç»æ”¾å‡º',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `kkid` (`kkid`)
) ENGINE=MyISAM AUTO_INCREMENT=1550002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_list`
--

DROP TABLE IF EXISTS `t_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_list` (
  `uid` int(14) unsigned NOT NULL COMMENT 'ç”¨æˆ·UID',
  `list_uuid` varchar(64) NOT NULL DEFAULT '',
  `fuid` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_report`
--

DROP TABLE IF EXISTS `t_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `msg` varchar(255) NOT NULL DEFAULT '',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `porcflag` int(4) NOT NULL DEFAULT '0',
  `retmsg` varchar(255) NOT NULL DEFAULT '',
  `reply` int(4) NOT NULL DEFAULT '0',
  `app_key` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_team_info`
--

DROP TABLE IF EXISTS `t_team_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_team_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `creater` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teamid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `maxnum` int(11) unsigned NOT NULL DEFAULT '50',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `coreinfo` varchar(100) DEFAULT '',
  `exinfo` varchar(255) DEFAULT '',
  `del_flag` int(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teamid_index` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_team_list`
--

DROP TABLE IF EXISTS `t_team_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_team_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `teamid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid_uid` (`teamid`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2383 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user_info`
--

DROP TABLE IF EXISTS `t_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `did` varchar(64) NOT NULL DEFAULT '',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `baseinfo` varchar(255) DEFAULT '',
  `exinfo` varchar(255) NOT NULL DEFAULT '',
  `appkey` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(33) NOT NULL DEFAULT '',
  `platform` varchar(8) NOT NULL DEFAULT '',
  `setupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `v` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bv` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`),
  UNIQUE KEY `cid_appkey` (`cid`,`appkey`)
) ENGINE=InnoDB AUTO_INCREMENT=646553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_whitelist`
--

DROP TABLE IF EXISTS `t_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_whitelist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `fuid` bigint(20) NOT NULL DEFAULT '0',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0 ï¼šæ­£å¸¸ï¼Œ1ï¼šå·²åˆ é™¤',
  `last_modify_date` int(14) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_fuid` (`uid`,`fuid`)
) ENGINE=MyISAM AUTO_INCREMENT=886 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-18 12:05:42
