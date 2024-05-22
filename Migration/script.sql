create or replace sequence "DBO".EMPLOYEEIDSEQ_RANJAN_7 start with 1 increment by 1 noorder;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".EMPLOYEES_RANJAN_ROUT_7 (
	EMPLOYEEID NUMBER(38,0) NOT NULL,
	FIRSTNAME VARCHAR(50),
	LASTNAME VARCHAR(50),
	BIRTHDATE DATE,
	HIREDATE DATE,
	POSITION VARCHAR(100),
	SALARY NUMBER(10,2),
	primary key (EMPLOYEEID)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION "DBO"."GETPOSITION_RANJAN_7"("P_EMPLOYEEID" NUMBER(38,0))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    SELECT Position
    FROM Employees_RANJAN_ROUT_7
    WHERE EmployeeID = p_EmployeeID
   -- FETCH FIRST ROW ONLY;
';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace view "DBO".VW_EMPLOYEES_RANJAN_7(
	EMPLOYEEID,
	FIRSTNAME,
	LASTNAME,
	POSITION,
	SALARY
) as
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Position, 
    Salary
FROM 
    Employees_RANJAN_ROUT_7;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "DBO"."INSERTEMPLOYEE_RANJAN_7"("P_FIRSTNAME" VARCHAR(50), "P_LASTNAME" VARCHAR(50), "P_BIRTHDATE" DATE, "P_HIREDATE" DATE, "P_POSITION" VARCHAR(100), "P_SALARY" NUMBER(10,2))
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
