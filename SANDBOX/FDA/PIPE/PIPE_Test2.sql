create or replace pipe "FDA"."PIPE_Test2" auto_ingest=false as COPY INTO "FDA"."RUNU_DimEmployee"
FROM @"FDA"."Stage_RUNU"
FILE_FORMAT = (FORMAT_NAME = "FDA"."my_csv_format")
ON_ERROR = 'CONTINUE';