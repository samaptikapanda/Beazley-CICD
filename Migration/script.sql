ALTER TABLE FDA.EMPLOYEES_DEV ADD primary key (EMPLOYEE_ID);
-----------------------------------------------------------------------------
ALTER TABLE FDA.EMPLOYEES_DEV ADD constraint "FK_DEPARTMENT" foreign key (DEPARTMENT_ID) references FDA.DEPARTMENTS("DEPARTMENTID");