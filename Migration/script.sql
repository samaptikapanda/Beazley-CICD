create or replace TABLE "DBO".CUSTOMERSV3 (
	ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(100) NOT NULL,
	ADDR1 VARCHAR(20),
	ADDR2 NUMBER(38,0),
	ADDR3 DATE,
	ADDR4 VARCHAR(16777216)
);
-----------------------------------------------------------------------------
