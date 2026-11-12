USE school_calendar;

-- DDL: create an isolated temporary table so production-shaped data is untouched.
CREATE TEMPORARY TABLE Data_Operation_Test (
    test_id INT PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- INSERT
INSERT INTO Data_Operation_Test (test_id, description, status)
VALUES (1, 'CRUD and DDL verification', 'inserted');

-- UPDATE
UPDATE Data_Operation_Test
SET status = 'updated'
WHERE test_id = 1;

-- SELECT: the expected status is "updated".
SELECT
    test_id,
    description,
    status,
    IF(status = 'updated', 'PASS', 'FAIL') AS result
FROM Data_Operation_Test
WHERE test_id = 1;

-- DELETE
DELETE FROM Data_Operation_Test
WHERE test_id = 1;

SELECT
    'row deleted' AS test_case,
    COUNT(*) AS remaining_rows,
    IF(COUNT(*) = 0, 'PASS', 'FAIL') AS result
FROM Data_Operation_Test;

-- DDL cleanup
DROP TEMPORARY TABLE Data_Operation_Test;
