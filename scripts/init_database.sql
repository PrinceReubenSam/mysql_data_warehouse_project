-- Script Purpose: Initializes the 'datawarehouse' database with bronze, silver, and gold schemas.
-- Note: This will recreate the database if it already exists. Backup any important data beforehand.


-- Create a new database named 'datawarehouse'
CREATE DATABASE datawarehouse;

-- Switch to using the 'datawarehouse' database
USE datawarehouse;

-- Create schemas to organize data by processing stage
CREATE SCHEMA bronze;  -- Raw data layer (ingested as-is from source systems)
CREATE SCHEMA silver;  -- Cleaned and transformed data layer
CREATE SCHEMA gold;    -- Final analytics-ready data for reporting and dashboards
