create or replace TABLE "DBO".CUSTOMERSV1 (
	ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(500) NOT NULL,
	ADDR VARCHAR(20),
	ADDR2 VARCHAR(20),
	constraint PK_CUSTOMERS primary key (ID)
);