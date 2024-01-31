ALTER SESSION SET "_oracle_script"=TRUE;

CREATE USER NOAH IDENTIFIED BY 1234;

GRANT DBA TO NOAH;


--------------------------------------------------------------------------------------
-- Name	       : OT (Oracle Tutorial) Sample Database
-- Link	       : http://www.oracletutorial.com/oracle-sample-database/
-- Version     : 1.0
-- Last Updated: July-28-2017
-- Copyright   : Copyright � 2017 by www.oracletutorial.com. All Rights Reserved.
-- Notice      : Use this sample database for the educational purpose only.
--               Credit the site oracletutorial.com explitly in your materials that
--               use this sample database.
--------------------------------------------------------------------------------------
--------------------------------------------------------------------
-- execute the following statements to create a user name OT and
-- grant priviledges
--------------------------------------------------------------------

ALTER SESSION SET "_oracle_script"=TRUE;

-- create new user
CREATE USER OT IDENTIFIED BY 1234;

-- grant priviledges
GRANT CONNECT, RESOURCE, DBA TO OT;