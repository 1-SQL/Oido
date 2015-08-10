USE 'oido';

DROP PROCEDURE IF EXISTS `createrootcategory` ;
DROP PROCEDURE IF EXISTS `storeword` ;

DELIMITER $$
CREATE PROCEDURE `createrootcategory` (
	IN categoryName VARCHAR(45),
    IN oid VARCHAR(100),
    OUT id INT)
BEGIN

    INSERT INTO Category SET Category.categoryName = categoryName, Category.oid = oid;
    SET id = LAST_INSERT_ID();
    INSERT INTO next_oid SET next_oid.category = id , next_oid.next_oid = 10;
    
END$$
CREATE PROCEDURE `storeword` (
	IN word VARCHAR(45) ,
    IN category INT,
    OUT oid VARCHAR(100) ,
    OUT id INT)
BEGIN
DECLARE varOid INT;
DECLARE outOid VARCHAR(100);
	SELECT outOid INTO oid FROM oid_table WHERE category = idoid_table;
    SELECT next_oid INTO varOid FROM next_oid WHERE category = next_oid.category;
    UPDATE next_oid SET next_oid = varOid + 1 WHERE category = next_oid.category;
    SET oid = outOid + "." + varOid;
    INSERT INTO oid_table SET oid_table.oid = oid, oid_table.name = word ;
    SET id = LAST_INSERT_ID();
END$$
DROP PROCEDURE IF EXISTS `storecategory` $$
CREATE PROCEDURE `storecategory`(
	IN categoryName VARCHAR(45),
    IN parent INT,
    OUT oid VARCHAR(100),
    OUT id INT)
BEGIN
	DECLARE varParentOid VARCHAR(100);
	DECLARE varOid INT;
	SELECT Category.oid INTO varParentOid FROM Category WHERE Category.idCategory = parent;
    SELECT next_oid INTO varOid FROM next_oid WHERE parent = next_oid.category;
    UPDATE next_oid SET next_oid = varOid + 1 WHERE parent = next_oid.category;
    SET oid = CONCAT(varParentOid,"." ,varOid);
    INSERT INTO Category SET Category.categoryName = categoryName, Category.oid = oid;
    SET id = LAST_INSERT_ID();
    INSERT INTO next_oid SET next_oid.category = id , next_oid.next_oid = 10;
    INSERT INTO hierarchy SET hierarchy.category = parent, hierarchy.subcategory = id;
END$$

DELIMITER ;

