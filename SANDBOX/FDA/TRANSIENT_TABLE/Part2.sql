create or replace TRANSIENT TABLE "FDA"."Part2" (
	ORDER_ID NUMBER(38,0) DEFAULT FDA."Part1".NEXTVAL,
	CUSTOMER_ID NUMBER(38,0),
	ORDER_DATE DATE,
	ORDER_AMOUNT NUMBER(10,2),
	TAX_RATE NUMBER(5,4)
);