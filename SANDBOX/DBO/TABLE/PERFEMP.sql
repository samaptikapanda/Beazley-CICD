create or replace TABLE "DBO".PERFEMP (
	EMPLOYEE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	DEPARTMENT_ID NUMBER(38,0),
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	primary key (EMPLOYEE_ID),
	foreign key (DEPARTMENT_ID) references DBO.PERFDIP(DEPARTMENT_ID)
);