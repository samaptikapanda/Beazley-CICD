create or replace pipe "FDA"."my_pipe2" auto_ingest=false as COPY INTO sales
FROM @"Stage_RUNU"
FILE_FORMAT = (FORMAT_NAME = "my_csv_format")
ON_ERROR = 'CONTINUE';