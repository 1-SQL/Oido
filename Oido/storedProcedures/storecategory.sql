CREATE DEFINER=`Martin`@`%` PROCEDURE `storecategory`(
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
    SET oid = varParentOid + "." + varOid;
    INSERT INTO Category SET Category.categoryName = categoryName, Category.oid = oid;
    SET id = LAST_INSERT_ID();
    INSERT INTO next_oid SET next_oid.category = id , next_oid.next_oid = 10;
    
END