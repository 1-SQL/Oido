
USE 'oido_en';
DROP FUNCTION IF EXISTS `getLastId`;
DROP PROCEDURE IF EXISTS `splitLastId`;

DELIMITER $$
CREATE FUNCTION `getLastId` (
            oid VARCHAR(100)
          )
          RETURNS INT(11)
BEGIN
  DECLARE var INTEGER;
  SET var = CAST(SUBSTRING_INDEX(oid,'.',-1) AS UNSIGNED);
  RETURN var;
END$$
DELIMITER $$
CREATE PROCEDURE `splitLastId` (
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
