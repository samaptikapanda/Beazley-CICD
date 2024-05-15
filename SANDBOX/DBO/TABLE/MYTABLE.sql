create or replace TABLE "DBO".MYTABLE (
	ID NUMBER(38,0) NOT NULL,
	NAME VARCHAR(50),
	AGE NUMBER(38,0),
	EMAIL VARCHAR(100),
	constraint PK primary key (ID)
);