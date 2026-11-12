USE school_calendar;

SELECT
    'get_classroom_free_capacity' AS function_name,
    'room 1, class 1' AS test_case,
    IF(get_classroom_free_capacity(1, 1) = 25, 'PASS', 'FAIL') AS result
UNION ALL
SELECT
    'is_classroom_large_enough',
    'room 1, class 1',
    IF(is_classroom_large_enough(1, 1) = TRUE, 'PASS', 'FAIL')
UNION ALL
SELECT
    'is_teacher_available',
    'teacher 1, Monday 09:15-09:30',
    IF(is_teacher_available(1, 1, '09:15:00', '09:30:00') = FALSE,
       'PASS', 'FAIL')
UNION ALL
SELECT
    'is_class_available',
    'class 1, Tuesday 10:15-10:30',
    IF(is_class_available(1, 2, '10:15:00', '10:30:00') = FALSE,
       'PASS', 'FAIL');
