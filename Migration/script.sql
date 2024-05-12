ALTER TABLE "SANDBOX1"."DBO".CUSTOMERSV1 ALTER "NAME" SET DATA TYPE VARCHAR(500);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".CUSTOMERSV2 (
	ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(100) NOT NULL
);
-----------------------------------------------------------------------------
