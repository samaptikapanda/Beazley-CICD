create or replace TRANSIENT TABLE FDA.EMPLOYEES_DEV (
	EMPLOYEE_ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	FIRST_NAME VARCHAR(16777216),
	LAST_NAME VARCHAR(16777216),
	EMAIL VARCHAR(16777216),
	PHONE_NUMBER VARCHAR(16777216),
	HIRE_DATE DATE,
	JOB_ID VARCHAR(16777216),
	SALARY NUMBER(10,2),
	MANAGER_ID NUMBER(38,0),
	DEPARTMENT_ID NUMBER(38,0)
);