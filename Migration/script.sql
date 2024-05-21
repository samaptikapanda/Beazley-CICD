create or replace view "DBO".EXAMPLE_VIEW_2(
	ID,
	UNIQUE_COLUMN,
	OTHER_COLUMN,
	NULL_COLUMN
) as
SELECT
    ID,
    UNIQUE_COLUMN,
    OTHER_COLUMN,
    "Test_Column" AS NULL_COLUMN
FROM
     "DBO".EXAMPLE_TABLE
    where ID > 2 ;
-----------------------------------------------------------------------------
