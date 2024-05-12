ALTER TABLE "SANDBOX1"."DBO".CUSTOMERSV1 ADD ADDR2 VARCHAR(20)
;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".DEPLOYMENT_TEST (
	ID NUMBER(38,0),
	NAME VARCHAR(16777216),
	DATE_CREATED TIMESTAMP_NTZ(9)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT"."Employee_Summary" (
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
