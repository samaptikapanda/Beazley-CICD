create or replace TABLE "DBO".TEST_123 (
	AA1 VARCHAR(30) NOT NULL DEFAULT '10avf',
	BB1 BINARY(10),
	CC22 NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 order,
	DD1 DATE,
	primary key (AA1, CC22)
);