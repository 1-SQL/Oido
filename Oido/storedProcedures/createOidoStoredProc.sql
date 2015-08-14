
DROP PROCEDURE IF EXISTS `splitLastId` ;

DROP PROCEDURE IF EXISTS `createrootcategory` ;
DROP FUNCTION IF EXISTS `createObject`;
DROP PROCEDURE IF EXISTS `createCategory`;
DROP PROCEDURE IF EXISTS `listCategoriesOid`;
DROP PROCEDURE IF EXISTS `listCategoriesId`;
DROP PROCEDURE IF EXISTS `listWords`;
DROP PROCEDURE IF EXISTS `listWordsRec`;
DROP PROCEDURE IF EXISTS `listWordsId`;
DROP PROCEDURE IF EXISTS `listAllWords`;
DROP PROCEDURE IF EXISTS `listObjects`;
DROP PROCEDURE IF EXISTS `listPath`;
DROP PROCEDURE IF EXISTS `listAllObjects`;
DROP PROCEDURE IF EXISTS `listRootCategories`;
DROP PROCEDURE IF EXISTS `listAllCategories`;
DROP PROCEDURE IF EXISTS `listCategoriesRecOid`;
DROP PROCEDURE IF EXISTS `listCategoriesRecId`;
DROP FUNCTION IF EXISTS `getNextOid` ;
DROP PROCEDURE IF EXISTS `storeCategory`;
DROP PROCEDURE IF EXISTS `storeCategoryId`;
DROP PROCEDURE IF EXISTS `storeObject` ;
DROP PROCEDURE IF EXISTS `storeWord` ;
DROP PROCEDURE IF EXISTS `storeWordInt` ;
DROP FUNCTION IF EXISTS `getOid`;
DROP FUNCTION IF EXISTS `getID`;
DROP FUNCTION IF EXISTS `getRootOid` ;
DROP FUNCTION IF EXISTS `getRootOidFromId` ;
DROP FUNCTION IF EXISTS `getRootOidDirect` ;
DROP FUNCTION IF EXISTS `getParentOid` ;
DROP FUNCTION IF EXISTS `getParentId`;

DELIMITER $$
CREATE PROCEDURE `splitLastId`(
            IN oid VARCHAR(100),
            OUT id INT,
            OUT parentOid VARCHAR(100)
          )
BEGIN
  DECLARE var INTEGER;
  DECLARE ext VARCHAR(100);
  SET ext = SUBSTRING_INDEX(oid,'.',-1);
  IF ext = oid THEN 
    SET parentOid = '' ;
  ELSE
    SET parentOid = SUBSTR(oid,1,LENGTH(oid) - LENGTH(ext) - 1);
  END IF;
  SET id = CAST( ext AS UNSIGNED) ;

END$$

CREATE FUNCTION `createObject` (
		objectName VARCHAR(45),
		idParent INT,
		oidLast INT)
		RETURNS INT
BEGIN
	DECLARE ret INT;
	INSERT INTO object SET parent = idParent , object.oidLast = oidLast , object.name = objectName ;
   SET ret = LAST_INSERT_ID();
   INSERT INTO oid_table SET oid = CONCAT(getOid(idParent),'.',oidLast) ,idObject = ret  ;
   
	return ret;
END$$


CREATE PROCEDURE `createCategory` (
		IN category INT,
		IN parent INT)
BEGIN

    INSERT INTO category SET category.category = category, category.parent= parent;
    INSERT INTO next_oid SET category = category , next_oid = 10;
END$$

CREATE PROCEDURE `createRootCategory` (
	IN categoryName VARCHAR(45),
    IN oidParent VARCHAR(100),
    IN oidLast INT,
    OUT id INT)
BEGIN
	START TRANSACTION;
	INSERT INTO object SET object.parent = 0 , object.oidLast = oidLast , object.name = categoryName ;
   SET id = LAST_INSERT_ID();
	INSERT INTO oid_table SET oid = CONCAT(oidParent,'.',oidLast) ,idObject = id ;
	CALL createCategory(id,0);

	INSERT INTO root SET root.category = id, root.oid = oidParent ;
	COMMIT;
END$$

CREATE PROCEDURE `storeCategory` (
	IN categoryName VARCHAR(45),
    IN parent VARCHAR(100),
    OUT oidLast INT,
    OUT id INT)
BEGIN
	DECLARE idParent INT;
	SET idParent = getId(parent);
	StART TRANSACTION;
	SET oidLast = getNextOid(idParent) ;
	SET id = createObject(categoryName,idParent,oidLast) ;
	CALL createCategory(id,idParent);
	COMMIT;
END$$

CREATE PROCEDURE `storeCategoryId` (
	IN categoryName VARCHAR(45),
    IN idParent INT,
    OUT oidLast INT,
    OUT id INT)
BEGIN
	StART TRANSACTION;
	SET oidLast = getNextOid(idParent) ;
	SET id = createObject(categoryName,idParent,oidLast) ;
	CALL createCategory(id,idParent);
	COMMIT;
END$$

CREATE PROCEDURE `storeObject` (
	IN objectName VARCHAR(45),
    IN idParent INT,
    OUT oidLast INT,
    OUT id INT)
BEGIN
	START TRANSACTION;
	SET oidLast = getNextOid(idParent) ;
	SET id = createObject(objectName,idParent,oidLast) ;
	COMMIT;
END$$

CREATE PROCEDURE `storeWord` (
	IN objectName VARCHAR(45),
    IN oidParent VARCHAR(100),
    OUT oidLast INT,
    OUT id INT)
BEGIN
	DECLARE idParent INT;
	START TRANSACTION;
	SET idParent = getID(oidParent);
	SET oidLast = getNextOid(idParent) ;
	SET id = createObject(objectName,idParent,oidLast) ;
	COMMIT ;
END$$

CREATE PROCEDURE `storeWordInt` (
	IN objectName VARCHAR(45),
    IN idParent INT,
    OUT oidLast INT,
    OUT id INT)
BEGIN
	START TRANSACTION;
	SET oidLast = getNextOid(idParent) ;
	SET id = createObject(objectName,idParent,oidLast) ;
	COMMIT;
END$$

CREATE FUNCTION `getID` (
		oid VARCHAR(100))
		RETURNS INT
BEGIN	
	DECLARE ret INT;
	SELECT idObject INTO ret FROM oid_table WHERE oid_table.oid = oid;
	RETURN ret;
END$$

CREATE FUNCTION `getNextOid` (
		idParent INT )
		RETURNS INT
BEGIN	
	DECLARE ret INT;
	UPDATE next_oid SET next_oid = next_oid + 1 WHERE idParent = category;
	SELECT next_oid INTO ret FROM next_oid WHERE idParent = category;
	RETURN ret;
END$$

CREATE PROCEDURE `listRootCategories` ()
BEGIN
	SELECT object.idObject,object.name , getOid(object.idObject) from object,category WHERE category.parent = 0 AND object.idObject = category.category;
END$$

CREATE PROCEDURE `listCategoriesOid` (
			IN category VARCHAR(100))
BEGIN
	
	SELECT object.idObject,object.name , getOid(object.idObject) from object,category WHERE getId(category) = object.parent AND object.idObject = category.category;
END$$

CREATE PROCEDURE `listCategoriesId` (
			IN category INT)
BEGIN
	SELECT object.idObject,object.name , getOid(object.idObject) from object,category WHERE category = object.parent AND object.idObject = category.category;
END$$

CREATE PROCEDURE `listCategoriesRecOid` (
			category VARCHAR(100))
		
BEGIN
	DECLARE search VARCHAR(100);
	SET search = CONCAT(category,'.%');
	select object.idObject,object.name,oid_table.oid from object,oid_table , category
		where oid_table.idObject = object.idObject AND category.category = object.idObject AND oid_table.oid like search ;
END$$

CREATE PROCEDURE `listCategoriesRecId` (
			IN category INT)
		
BEGIN
	DECLARE search VARCHAR(100);
	SET search = CONCAT(getOid(category),'.%');
	select object.*,oid_table.oid from object,oid_table , category
		where oid_table.idObject = object.idObject AND category.category = object.idObject AND oid_table.oid like search ;
END$$

CREATE PROCEDURE `listAllCategories` ()
BEGIN
	SELECT object.idObject,object.name , getOid(object.idObject) from object,category WHERE object.idObject = category.category;
END$$

CREATE PROCEDURE `listAllObjects` ()
BEGIN
	SELECT object.idObject,object.name,oid_table.oid FROM object, oid_table WHERE oid_table.idObject = object.idObject ;
END$$

CREATE PROCEDURE `listObjects` (
			IN category INT)
BEGIN
	SELECT object.idObject,name,oid FROM object, oid_table WHERE object.parent = category AND oid_table.idObject = object.idObject ;
END$$

CREATE PROCEDURE `listWordsId` (
			IN category INT)
BEGIN
select object.idObject,name,getOid(object.idObject) from object where object.parent = category AND object.idObject not in 
	(select category.category from category group by category);
	
END$$

CREATE PROCEDURE `listWords` (
			IN category VARCHAR(100))
BEGIN
select object.idObject,object.name,getOid(object.idObject) from object where object.parent = getId(category) AND object.idObject not in 
	(select category.category from category group by category);
	
END$$

CREATE PROCEDURE `listWordsRec` (
			IN category VARCHAR(100))
BEGIN
	DECLARE search VARCHAR(100);
	SET search = CONCAT(category,'.%');
	select object.idObject,name,getOid(object.idObject) from object,oid_table where object.idObject = oid_table.idObject
			AND oid_table.oid LIKE search AND object.idObject not in 
		(select category.category from category group by category);
	
END$$

CREATE PROCEDURE `listPath` (
			IN category VARCHAR(100))
BEGIN
	DECLARE search VARCHAR(100);
	DECLARE rest VARCHAR(100);
	DECLARE restrest VARCHAR(100);
	DECLARE oid VARCHAR(100);
	SET search = getRootOid(category) ;
	SET oid = search;
	SET rest = SUBSTR(category,LENGTH(search)+1);
	DROP TABLE IF EXISTS `tmp`  ;
	CREATE TEMPORARY TABLE `tmp` engine=memory SELECT 
		object.idObject,object.name, oid_table.oid FROM object,oid_table WHERE oid = oid_table.oid AND object.idObject = oid_table.idObject ;
	REPEAT
		SET restrest = SUBSTRING_INDEX(rest,'.',2);
		SET oid = CONCAT(search ,rest) ;
		IF restrest IS NOT NULL AND restrest <> '' THEN
			SET rest = LEFT(rest,LENGTH(rest) - LENGTH(restrest));
			INSERT INTO `tmp` SELECT object.idObject,object.name, oid_table.oid  FROM object,oid_table 
					WHERE oid = oid_table.oid AND object.idObject = oid_table.idObject ;
		END IF;
	UNTIL restrest IS NULL OR restrest = '' END REPEAT;
	SELECT idObject,name,`tmp`.oid from `tmp` ORDER BY LENGTH(`tmp`.oid) ASC ;
	DROP TABLE IF EXISTS `tmp`  ;
END$$

CREATE PROCEDURE `listAllWords` ()
BEGIN
select object.idObject,name,getOid(object.idObject) from object where object.idObject not in 
	(select category.category from category group by category);
	
END$$

CREATE FUNCTION `getOid` (
				id INT)
				RETURNS VARCHAR(100)
BEGIN
	DECLARE oid VARCHAR(100);
	DECLARE parent INT;
	DECLARE oidLast INT;
	DECLARE search INT;
	SET oid = '';
	SET search = id;
	REPEAT
	
	SELECT object.parent, object.oidLast INTO parent, oidLast FROM object WHERE search = object.idObject;
	IF  ROW_COUNT() = 0 THEN
		RETURN null;
	END IF;
	
	IF oid = '' THEN
		SET oid = CONCAT(oidLast,'');
	ELSE
		SET oid = CONCAT(oidLast,'.',oid);
	END IF;
	IF parent = 0 THEN
		return CONCAT(getRootOidDirect(search),'.',oid) ;
	END IF;
	SET search = parent;
	UNTIL parent = 0 END REPEAT;
	
END$$

CREATE FUNCTION `getRootOidDirect` (
				id INT)
				RETURNS VARCHAR(100)
BEGIN
	DECLARE oid VARCHAR(100);
	
	SELECT root.oid INTO oid FROM root WHERE root.category = id;
	
	return oid;
END$$

CREATE FUNCTION `getRootOid` (
				id VARCHAR(100))
				RETURNS VARCHAR(100)
BEGIN
	return getRootOidFromId(getId(id));
END$$

CREATE FUNCTION `getParentOid` (
				id VARCHAR(100))
				RETURNS VARCHAR(100)
BEGIN	
	return getOid(getParentId(getId(id)));
END$$

CREATE FUNCTION `getParentId` (
				id INT)
				RETURNS INT
BEGIN	
	DECLARE ret INT;
	SELECT object.parent INTO ret FROM object WHERE idObject = id;
	return ret;
END$$

CREATE FUNCTION `getRootOidFromId` (
				id INT)
				RETURNS VARCHAR(100)
BEGIN
	DECLARE oid VARCHAR(100);
	DECLARE parent INT;
	DECLARE oidLast INT;
	DECLARE search INT;
	SET oid = '';
	SET search = id;
	REPEAT
	
	SELECT object.parent, object.oidLast INTO parent, oidLast FROM object WHERE search = object.idObject;
	IF  ROW_COUNT() = 0 THEN
		RETURN null;
	END IF;
	IF parent = 0 THEN
		return CONCAT(getRootOidDirect(search),'.',oidLast) ;
	END IF;
	SET search = parent;
	UNTIL parent = 0 END REPEAT;
END$$

DELIMITER ;
