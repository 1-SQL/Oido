USE 'oido';

DROP PROCEDURE IF EXISTS `createrootcategory` ;

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
DELIMITER ;

