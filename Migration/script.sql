create or replace TABLE "DBO".FLIGHT (
	FLIGHTID NUMBER(38,0),
	FLIGHTNUMBER VARCHAR(10),
	DEPARTUREDATE DATE,
	DEPARTURECITY VARCHAR(50),
	DESTINATIONCITY VARCHAR(50),
	SEATNO NUMBER(38,0),
	constraint PK primary key (FLIGHTID)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO"."Users" (
	ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(100) NOT NULL,
	PREFERENCES VARIANT,
	CREATED_AT TIMESTAMP_NTZ(9),
	"Age" NUMBER(38,0)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO".S_EMPLOYEEDETAILS_TRANSIENT (
	EMP_ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	EMP_NAME VARCHAR(255),
	AGE NUMBER(38,0),
	CURRENT_ADDRESS VARCHAR(255),
	EMAIL VARCHAR(255),
	BUSINESS VARCHAR(255),
	PHONE VARCHAR(20),
	JOINING_DATE DATE,
	SALARY FLOAT
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO".T_PRODUCTS (
	PRODUCT_ID NUMBER(38,0) NOT NULL,
	PRODUCT_NAME VARCHAR(50),
	primary key (PRODUCT_ID)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT".DEMO (
	"Name" VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(20,0) NOT NULL autoincrement start 2 increment 2 noorder,
	"Gender" VARCHAR(50),
	SALARY NUMBER(18,0),
	DOB DATE NOT NULL,
	ADDRESS VARCHAR(50),
	COL1 VARCHAR(50)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT"."R_Demo_TEST" (
	"Name" VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(20,0) NOT NULL autoincrement start 2 increment 2 noorder,
	"Gender" VARCHAR(50),
	SALARY NUMBER(18,0),
	DOB DATE NOT NULL,
	ADDRESS VARCHAR(50),
	"Col1" VARCHAR(30) NOT NULL
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "TRANSIENT".TRANSIENT_1 (
	NAME VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(38,0) NOT NULL,
	primary key ("Emp_ID")
);
-----------------------------------------------------------------------------
