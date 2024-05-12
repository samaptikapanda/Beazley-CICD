create or replace TRANSIENT TABLE "TRANSIENT"."Test_Table" (
	EMP_ID NUMBER(38,0) NOT NULL,
	ID NUMBER(38,0),
	EMP_NAME VARCHAR(50),
	AGE NUMBER(38,0),
	CURRENT_ADDRESS VARCHAR(100),
	EMAIL VARCHAR(100),
	BUSINESS VARCHAR(100),
	PHONE VARCHAR(20),
	JOINING_DATE DATE,
	SALARY FLOAT,
	primary key (EMP_ID),
	foreign key (ID) references "TRANSIENT"."Test_Table"("EMP_ID")
);
-----------------------------------------------------------------------------
