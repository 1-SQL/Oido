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
END
