ALTER TABLE FDA.EXAMPLE_TABLE ADD primary key (ID);
-----------------------------------------------------------------------------
ALTER TABLE FDA.EXAMPLE_TABLE ADD foreign key (MANAGER_ID) references SGSSANDBOX.FDA.EXAMPLE_TABLE("ID");