ALTER TABLE "SANDBOX1"."DBO".DEPLOYMENT_TEST ADD NEW_COLUMN VARCHAR(16777216);
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO".DEPLOYMENT_TEST ADD DATE_DELETED VARCHAR(16777216)
;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT"."Employee_ABC" (
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
