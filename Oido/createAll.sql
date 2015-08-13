SET @db := 'oido_pl';


CREATE DATABASE IF NOT EXISTS `oido_pl` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE 'oido_pl';

source dbCreation/createOidoDB.sql
source storedProcedures/createOidoStoredProc.sql;
source data/createRoots.sql;
