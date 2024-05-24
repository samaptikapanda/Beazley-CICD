create or replace pipe "FDA"."23_my_pipe1"
auto_ingest=false as COPY INTO sales
FROM @"Stage_RUNU"
FILE_FORMAT = (FORMAT_NAME = "my_csv_format")
ON_ERROR = 'CONTINUE';
-----------------------------------------------------------------------------
