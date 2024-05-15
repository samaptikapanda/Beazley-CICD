create or replace TABLE "DBO".SGS1 (
	DETAIL_ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	ORDER_ID NUMBER(38,0),
	PRODUCT_ID NUMBER(38,0),
	QUANTITY NUMBER(38,0),
	PRICE NUMBER(10,2),
	foreign key (ORDER_ID) references DBO.SGS(ORDER_ID),
	constraint PK primary key (ORDER_ID)
);