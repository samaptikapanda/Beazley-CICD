ALTER TABLE "SANDBOX1"."DBO"."Users" DROP COLUMN NAME;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."Users" DROP COLUMN "Age";
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD "Age" NUMBER(38,0);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD "Age2" NUMBER(38,0);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR3 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR4 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR5 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR6 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR7 VARCHAR(20)
;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".YES (
	PROD_ID NUMBER(38,0),
	PROD_NAME VARCHAR(100),
	CATAGORY VARCHAR(100),
	RATING NUMBER(38,0),
	INDICATER VARCHAR(10),
	ADDR9 DATE,
	ADDR10 VARCHAR(20),
	ADDR11 VARCHAR(20),
	ADDR12 VARCHAR(20),
	ADDR13 VARCHAR(20),
	ADDR14 VARCHAR(20),
	ADDR15 VARCHAR(20),
	ADDR16 VARCHAR(20)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO"."alert" (
	FIRSTNAME VARCHAR(250),
	MIDDLENAME VARCHAR(250),
	LASTNAME VARCHAR(250),
	CUSTOMERNAME VARCHAR(250),
	ADDRESS VARCHAR(250),
	CITY VARCHAR(250),
	PHONE NUMBER(38,0),
	EMAIL VARCHAR(250),
	SSN VARCHAR(250),
	GENDER VARCHAR(250),
	AGE NUMBER(38,0),
	CUSTOMERID VARCHAR(250)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD NAME VARCHAR(50);
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD CITY VARCHAR(50);
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD PHONE_NUMBER VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD OCCUPATION VARCHAR(50);
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD NAME1 VARCHAR(50);
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT".TEST_TABLE ADD NAME2 VARCHAR(50)
;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN EMP_ID;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN EMP_NAME;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN CURRENT_ADDRESS;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN BUSINESS;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN PHONE;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN JOINING_DATE;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."TRANSIENT"."Test_Table" DROP COLUMN SALARY;
-----------------------------------------------------------------------------
ALTER TABLE "TRANSIENT"."Test_Table" DROP primary key;
-----------------------------------------------------------------------------
