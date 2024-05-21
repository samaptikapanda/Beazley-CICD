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
create or replace TABLE "DBO"."AB_Demo_TEST" (
	"Name" VARCHAR(50),
	"Emp_ID" NUMBER(38,0),
	"Gender" VARCHAR(50),
	SALARY NUMBER(38,0),
	DOB DATE NOT NULL,
	ADDRESS VARCHAR(50) NOT NULL,
	"col1" FLOAT,
	COL2 BINARY(8388608)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".AUTOINC (
	FROMCURRENCY VARCHAR(10) NOT NULL,
	TOCURRENCY VARCHAR(10) NOT NULL,
	VALIDFROM DATE NOT NULL,
	EXCHANGERATE NUMBER(17,7) NOT NULL autoincrement start 1 increment 1 order,
	RATIOTO NUMBER(17,3),
	"exCHANGERATETYPe1" NUMBER(17,3) NOT NULL,
	RATIOFROM NUMBER(17,3) DEFAULT 1010,
	TEST BINARY(8388608),
	TEST2 BINARY(8388608),
	TEST_VIEW VARCHAR(16777216),
	ADDR1 VARCHAR(200)
);
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
create or replace view "DBO".EXAMPLE_VIEW_2(
	ID,
	UNIQUE_COLUMN,
	OTHER_COLUMN,
	NULL_COLUMN
) as
SELECT
    ID,
    UNIQUE_COLUMN,
    OTHER_COLUMN,
    "Test_Column" AS NULL_COLUMN
FROM
     "DBO".EXAMPLE_TABLE
    where ID > 2 ;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace view "DBO".VS(
	ID,
	NAME
) as
SELECT ID,NAME
FROM "DBO"."PERF";
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION "DBO"."FUNCTON1"("INPUT_NUMBER" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    --testingascac
    -- Check if the input number is even or odd
    CASE WHEN MOD(input_number,10) <> 0 THEN ''Odd'' ELSE ''Even'' END
  ';
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

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "DBO"."INSERTEMPLOYEE_RANJAN"("P_FIRSTNAME" VARCHAR(50), "P_LASTNAME" VARCHAR(50), "P_BIRTHDATE" DATE, "P_HIREDATE" DATE, "P_POSITION" VARCHAR(100), "P_SALARY" NUMBER(10,2))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
    v_EmployeeID INT;
BEGIN
    -- Get the next value from the sequence
    v_EmployeeID := NEXTVAL(''EmployeeIDSeq'');
    
    -- Insert the new employee
    INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthDate, HireDate, Position, Salary)
    VALUES (v_EmployeeID, p_FirstName, p_LastName, p_BirthDate, p_HireDate, p_Position, p_Salary);
    
    RETURN ''Employee inserted successfully with EmployeeID: '' || v_EmployeeID;
END;
';
-----------------------------------------------------------------------------
