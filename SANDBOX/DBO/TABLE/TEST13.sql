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
	foreign key (EXCHANGERATE, RATIOFROM) references DBO.PRIMARY_TABLE_2(exCHANGERATETYPe1,EXCHANGERATE)
);