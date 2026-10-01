-- Creates the database, loads mock data, and checks every stored function.
-- Run this file from the repository root.
-- MySQL 9+ requires --commands to process nested source commands in batch mode.
-- Example: mysql --commands -u root -p < sql/run_demo.sql

source sql/run_all.sql;
source sql/data/01_mock_data.sql;
source sql/tests/00_check_row_counts.sql;
source sql/tests/01_check_functions.sql;
source sql/tests/02_check_data_operations.sql;
