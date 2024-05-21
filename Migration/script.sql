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
