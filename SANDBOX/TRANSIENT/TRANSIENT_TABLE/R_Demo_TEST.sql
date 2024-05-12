create or replace TRANSIENT TABLE "TRANSIENT"."R_Demo_TEST" (
	"Name" VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(20,0) NOT NULL autoincrement start 2 increment 2 noorder,
	SALARY NUMBER(18,0),
	"Col2" NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	"Col3" DATE NOT NULL
);