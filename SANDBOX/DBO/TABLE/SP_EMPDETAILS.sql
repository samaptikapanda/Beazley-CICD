create or replace TABLE "DBO".SP_EMPDETAILS (
	EMP_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	EMP_NAME VARCHAR(255),
	AGE VARCHAR(50),
	EMP_ADDRESS VARCHAR(255),
	EMAIL VARCHAR(255),
	JOINING_DATE DATE,
	EMPLOYEE_ID NUMBER(38,0),
	primary key (EMP_ID),
	foreign key (EMPLOYEE_ID) references DBO.EMPLOYEE_DATA_SQL(EMPLOYEE_ID)
);