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