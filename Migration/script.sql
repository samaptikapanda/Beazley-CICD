create or replace TABLE "DBO".CUSTOMERS09 (
	CUSTOMER_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	CUSTOMER_NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	unique (EMAIL),
	primary key (CUSTOMER_ID)
);
-----------------------------------------------------------------------------
