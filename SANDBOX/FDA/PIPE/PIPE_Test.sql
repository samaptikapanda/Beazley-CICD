create or replace pipe "FDA"."PIPE_Test"
auto_ingest=false as COPY INTO "SGSSANDBOX"."FDA"."RUNU_DimEmployee"
FROM @"Stage_RUNU"
FILE_FORMAT = (FORMAT_NAME = "my_csv_format")
ON_ERROR = 'CONTINUE';