create or replace TRANSIENT TABLE FDA.DEPARTMENTS (
	DEPARTMENTID NUMBER(38,0) NOT NULL,
	DEPARTMENTNAME VARCHAR(50) NOT NULL,
	primary key (DEPARTMENTID)
);