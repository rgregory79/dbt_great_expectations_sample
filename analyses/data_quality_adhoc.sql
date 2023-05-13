-- These are additional data quality checks that can be run against the data manually in Postgres
-- Launch a Postgres UI tool like PGADmin or run from the cli to validate the data

-- Sample query for overall view of table
SELECT column_name, data_type, character_maximum_length, count(*) as count
FROM information_schema.columns
WHERE table_name = 'Covid19_test_to_treat'
GROUP BY column_name, data_type, character_maximum_length;

-- Check basic counts
SELECT COUNT(*) AS null_count
FROM 'Covid19_test_to_treat'
WHERE provider_name IS NULL;

-- Check duplicate counts
SELECT COUNT(*) AS duplicate_count
FROM (
  SELECT provider_name, address1, address2, COUNT(*)
  FROM 'Covid19_test_to_treat'
  GROUP BY provider_name, address1, address2
  HAVING COUNT(*) > 1
) AS duplicates;

-- Data freshness check
SELECT COUNT(*) AS stale_count
FROM 'Covid19_test_to_treat'
WHERE last_report_date < DATEADD(day, -7, GETDATE());

-- Check if last_report_date column uses correct format
SELECT *
FROM 'Covid19_test_to_treat'
WHERE TRY_CAST(last_report_date AS DATE) IS NULL;

-- Check if the public_website field uses correct format
SELECT *
FROM 'Covid19_test_to_treat'
WHERE public_website  LIKE 'http://%' OR public_website LIKE 'https://%';

-- Check if the zip code field has valid data and correct length
SELECT zip_code 
FROM 'Covid19_test_to_treat'
WHERE LENGTH(zip_code) <= 5 
  AND REGEXP_LIKE(zip_code, '^[0-9]+$');




