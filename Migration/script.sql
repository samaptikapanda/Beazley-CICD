ALTER TABLE "SANDBOX1"."DBO".CUSTOMERSV1 ALTER "NAME" SET DATA TYPE VARCHAR(400);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT"."Customer_Test" (
	EMP_ID NUMBER(38,0),
	EMP_NAME VARCHAR(50),
	AGE NUMBER(38,0),
	CURRENT_ADDRESS VARCHAR(100),
	EMAIL VARCHAR(100),
	BUSINESS VARCHAR(100),
	PHONE VARCHAR(20),
	JOINING_DATE DATE,
	SALARY FLOAT
);
-----------------------------------------------------------------------------
