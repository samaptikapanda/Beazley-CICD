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