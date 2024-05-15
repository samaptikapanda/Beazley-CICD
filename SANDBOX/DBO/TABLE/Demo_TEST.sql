create or replace TABLE "DBO"."Demo_TEST" (
	"Name" VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(20,0) NOT NULL autoincrement start 2 increment 2 order,
	"Gender" VARCHAR(50),
	SALARY NUMBER(18,0),
	DOB DATE NOT NULL,
	ADDRESS VARCHAR(50)
);