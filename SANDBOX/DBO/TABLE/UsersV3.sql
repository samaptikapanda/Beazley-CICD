create or replace TABLE "DBO"."UsersV3" (
	ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	ADDR1 VARCHAR(20),
	constraint PK_USERSV3 primary key (ID)
);