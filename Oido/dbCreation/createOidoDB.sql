CREATE DATABASE IF NOT EXISTS `oido_en` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE 'oido_en';

CREATE TABLE `Root` (
  `idRoot` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) unsigned NOT NULL,
  `oid` varchar(100) NOT NULL,
  PRIMARY KEY (`idRoot`),
  UNIQUE KEY `idRoot_UNIQUE` (`idRoot`),
  UNIQUE KEY `category_UNIQUE` (`category`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Category` (
  `idCategory` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned ,
  `id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `isCategory_UNIQUE` (`idCategory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `hierarchy` (
  `idhierarchy` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) unsigned NOT NULL,
  `subcategory` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idhierarchy`),
  UNIQUE KEY `idhierarchy_UNIQUE` (`idhierarchy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `next_oid` (
  `category` int(10) unsigned NOT NULL,
  `next_oid` int(10) unsigned DEFAULT 11,
  PRIMARY KEY (`category`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `oid_table` (
  `oid` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Data` (
  `idData` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `data` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idData`),
  UNIQUE KEY `idData_UNIQUE` (`idData`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `datablobs` (
  `iddatablobs` int(11) NOT NULL AUTO_INCREMENT,
  `dataBlob` longblob,
  PRIMARY KEY (`iddatablobs`),
  UNIQUE KEY `iddatablobs_UNIQUE` (`iddatablobs`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `phrases` (
  `idphrases` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phrase` int(11) NOT NULL,
  `element` int(11) NOT NULL,
  `oid` varchar(100) NOT NULL,
  PRIMARY KEY (`idphrases`,`phrase`,`element`,`oid`),
  UNIQUE KEY `idphrases_UNIQUE` (`idphrases`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


