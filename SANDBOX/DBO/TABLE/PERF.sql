create or replace TABLE "DBO".PERF (
	ID NUMBER(38,0) NOT NULL,
	NAME VARCHAR(50),
	AGE NUMBER(38,0),
	GENDER VARCHAR(10),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(50),
	primary key (ID)
);