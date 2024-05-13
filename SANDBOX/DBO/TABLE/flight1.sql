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