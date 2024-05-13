create or replace TABLE "DBO".TEST13 (
	EXCHANGERATETYPE VARCHAR(10) NOT NULL,
	FROMCURRENCY VARCHAR(10) NOT NULL,
	TOCURRENCY VARCHAR(10) NOT NULL,
	VALIDFROM DATE NOT NULL,
	EXCHANGERATE NUMBER(17,3) NOT NULL,
	RATIOFROM NUMBER(17,3),
	RATIOTO NUMBER(17,3),
	EXCHANGERATETYPE1 NUMBER(17,3) NOT NULL,
	primary key (EXCHANGERATETYPE1),
	foreign key (EXCHANGERATE, RATIOFROM) references "DBO"."PRIMARY_TABLE_2"("exCHANGERATETYPe1","EXCHANGERATE")
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".TEST_123 (
	AA1 VARCHAR(30) NOT NULL DEFAULT '10avf',
	BB1 BINARY(10),
	CC22 NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	DD1 DATE,
	primary key (AA1, CC22)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."Users" DROP COLUMN ID;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "DBO"."UsersV3" ADD ADDR8 VARCHAR(20)
;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."UsersV3" DROP COLUMN ADDR5;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."UsersV3" DROP COLUMN ADDR6;
-----------------------------------------------------------------------------
ALTER TABLE "SANDBOX1"."DBO"."UsersV3" DROP COLUMN ADDR7;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
ALTER TABLE "DBO".YES ADD ADDR17 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO".YES ADD ADDR18 VARCHAR(20);
-----------------------------------------------------------------------------
ALTER TABLE "DBO".YES ADD ADDR19 VARCHAR(20)
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
