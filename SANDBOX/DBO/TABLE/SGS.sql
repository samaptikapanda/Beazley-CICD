create or replace TABLE "DBO".SGS (
	ORDER_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	CUSTOMER_ID NUMBER(38,0),
	ORDER_DATE DATE,
	TOTAL_AMOUNT NUMBER(10,2),
	TEST1 VARCHAR(255),
	primary key (ORDER_ID),
	foreign key (CUSTOMER_ID) references DBO.SGS1(ORDER_ID)
);