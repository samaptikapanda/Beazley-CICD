create or replace TABLE "DBO"."UsersV3" (
	ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(100) NOT NULL,
	"Age" NUMBER(38,0),
	"Age2" NUMBER(38,0),
	ADDR3 VARCHAR(20),
	ADDR8 VARCHAR(20)
);