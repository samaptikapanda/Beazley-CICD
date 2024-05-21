create or replace sequence "DBO".EMPLOYEEIDSEQ_RANJA1 start with 1 increment by 1 noorder;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".ABCD (
	EMPLOYEE_ID NUMBER(38,0),
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	DEPARTMENT VARCHAR(100),
	STATE VARCHAR(200),
	"Age2" VARCHAR(200),
	"Age5" VARCHAR(200),
	"Age25" VARCHAR(200)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO"."AB_Demo_TEST_trn" (
	"Name" VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(38,0) NOT NULL,
	"Gender" VARCHAR(50),
	SALARY NUMBER(38,0),
	DOB DATE NOT NULL,
	ADDRESS VARCHAR(50)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION "DBO"."EVEN_OR_ODD"("INPUT_NUMBER" NUMBER(38,0))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    -- Check if the input number is even or odd
    CASE WHEN MOD(input_number,10) <> 0 THEN ''Odd'' ELSE ''Even'' END
  ';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace view "DBO".CAL_DATE_VIEW(
	EMP_ID,
	EMP_NAME,
	ADDRESS,
	DATE_OF_BIRTH
) as
SELECT
    EMP_ID,
    EMP_NAME,
	ADDRESS,
    DATE_OF_BIRTH
FROM
    "DBO"."Cal_Date_Range"
    where ADDRESS IN ('Ahmedabad','Nainital','Kolkata');
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace secure materialized view "DBO".PRO(
	UNITS_SOLD,
	SALE_PRICE,
	GROSS_SALES,
	COUNTRY,
	PRODUCT
) as( select
	UNITS_SOLD ,
	SALE_PRICE ,
	GROSS_SALES ,
	COUNTRY ,
	PRODUCT  from "PRODUCT_SMLTRGT"
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "DBO"."CURSOR_DEMO"("EMPNAME" VARCHAR(50))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
begin
 LET res RESULTSET := (select EMPNAME from "SNOWFLAKE_TEST"."DEV"."STGTEST"  where EXPERIANCE >5);
 LET item_cursor CURSOR for res;
 LET all_people VARCHAR := '''';
 For v_item_cursor in item_cursor do
 all_people :=v_item_cursor.EMPNAME;
 INSERT INTO  "SNOWFLAKE_TEST"."DEV"."TEMPR"  (EMPNAME) values(:all_people);

 END FOR;
  INSERT INTO  "SNOWFLAKE_TEST"."DEV"."TEMPR02" 
   (EMPID,
   EMPNAME,
   EMPADDRESS,
   EXPERIANCE,
   SALRY,
   BLOODGROUP
   )
   SELECT 
   a.EMPID,
   a.EMPNAME,
   a.EMPADDRESS,
   a.EXPERIANCE,
   a.SALRY,
   a.BLOODGROUP
   FROM "SNOWFLAKE_TEST"."DEV"."STGTEST" as a,
   "SNOWFLAKE_TEST"."DEV"."TEMPR" as b
   where a.EMPNAME = b.EMPNAME;
end
';
-----------------------------------------------------------------------------
