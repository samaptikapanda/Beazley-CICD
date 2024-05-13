ALTER TABLE "SANDBOX1"."DBO"."Users" DROP COLUMN ID;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR8 VARCHAR(20)
;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."UsersV3" DROP COLUMN ADDR5;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "DBO".YES ADD ADDR17 VARCHAR(20)
;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO"."emp_trans1" (
	NAME VARCHAR(50) NOT NULL,
	"Emp_ID" NUMBER(38,0) NOT NULL,
	primary key ("Emp_ID")
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO"."flight1" (
	FLIGHTID NUMBER(38,0),
	ID NUMBER(38,0),
	FLIGHTNUMBER VARCHAR(80),
	DEPARTUREDATE DATE,
	DEPARTURECITY VARCHAR(50),
	DESTINATIONCITY VARCHAR(50),
	SEATNO NUMBER(38,0),
	constraint PK primary key (ID, FLIGHTID)
);
-----------------------------------------------------------------------------
