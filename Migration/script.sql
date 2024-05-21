create or replace TABLE "DBO".EMPLOYEES_RANJAN (
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
