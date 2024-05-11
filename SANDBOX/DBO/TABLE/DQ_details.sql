create or replace TABLE "DBO"."DQ_details" (
	DETAIL_ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	ORDER_ID NUMBER(38,0),
	PRODUCT_ID NUMBER(38,0),
	QUANTITY NUMBER(38,0),
	PRICE NUMBER(10,2)
);