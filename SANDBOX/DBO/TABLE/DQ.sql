create or replace TABLE "DBO".DQ (
	ORDER_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	CUSTOMER_ID NUMBER(38,0),
	ORDER_DATE DATE,
	TOTAL_AMOUNT NUMBER(10,2),
	primary key (ORDER_ID)
);