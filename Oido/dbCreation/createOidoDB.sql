

CREATE TABLE `category` (
  `idCategory` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `category` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `idCategory_UNIQUE` (`idCategory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `object` (
  `idObject` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `oidLast` int(11) unsigned NOT NULL,
  `name` VARCHAR(45) NOT NULL,	
  PRIMARY KEY (`idObject`),
  UNIQUE KEY `idObject_UNIQUE` (`idObject`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `next_oid` (
  `category` int(10) unsigned NOT NULL,
  `next_oid` int(10) unsigned DEFAULT '11',
  PRIMARY KEY (`category`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `root` (
  `idRoot` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) unsigned NOT NULL,
  `oid` varchar(100) NOT NULL,
  PRIMARY KEY (`idRoot`),
  UNIQUE KEY `idRoot_UNIQUE` (`idRoot`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `oid_table` (
  `oid` varchar(100) NOT NULL,
  `idObject` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

