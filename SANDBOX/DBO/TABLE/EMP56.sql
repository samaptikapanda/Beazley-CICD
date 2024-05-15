create or replace TABLE "DBO".EMP56 (
	EMPLOYEE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	EMAIL VARCHAR(100),
	HIRE_DATE DATE,
	unique (EMAIL),
	primary key (EMPLOYEE_ID)
);