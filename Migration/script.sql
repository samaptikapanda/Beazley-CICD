create or replace TRANSIENT TABLE "TRANSIENT"."new" (
	"Name" VARCHAR(50),
	"Emp_ID" NUMBER(20,0) NOT NULL autoincrement start 5 increment 6 noorder,
	"Gender" VARCHAR(49) NOT NULL,
	SALARY NUMBER(10,0),
	DOB DATE
);
-----------------------------------------------------------------------------
