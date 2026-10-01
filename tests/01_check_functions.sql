USE school_calendar;

-- Each row compares a function result with the value implied by the mock data.
SELECT
    'get_student_count' AS function_name,
    'class 1' AS test_case,
    '5' AS expected_value,
    CAST(get_student_count(1) AS CHAR) AS actual_value,
    IF(get_student_count(1) = 5, 'PASS', 'FAIL') AS result
UNION ALL
SELECT 'get_class_weekly_lessons', 'class 1', '3',
    CAST(get_class_weekly_lessons(1) AS CHAR),
    IF(get_class_weekly_lessons(1) = 3, 'PASS', 'FAIL')
UNION ALL
SELECT 'get_homework_count', 'class 1', '2',
    CAST(get_homework_count(1) AS CHAR),
    IF(get_homework_count(1) = 2, 'PASS', 'FAIL')
UNION ALL
SELECT 'get_assessment_count', 'class 1', '2',
    CAST(get_assessment_count(1) AS CHAR),
    IF(get_assessment_count(1) = 2, 'PASS', 'FAIL')
UNION ALL
SELECT 'get_class_teacher_name', 'class 1', 'Anna Kowalska',
    get_class_teacher_name(1),
    IF(get_class_teacher_name(1) = 'Anna Kowalska', 'PASS', 'FAIL')
UNION ALL
SELECT 'get_classroom_free_capacity', 'room 1, class 1', '25',
    CAST(get_classroom_free_capacity(1, 1) AS CHAR),
    IF(get_classroom_free_capacity(1, 1) = 25, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_classroom_large_enough', 'room 1, class 1', '1',
    CAST(is_classroom_large_enough(1, 1) AS CHAR),
    IF(is_classroom_large_enough(1, 1) = 1, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_classroom_large_enough', 'room 2, class 1', '0',
    CAST(is_classroom_large_enough(2, 1) AS CHAR),
    IF(is_classroom_large_enough(2, 1) = 0, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_teacher_available', 'teacher 1, Monday 09:15-09:30', '0',
    CAST(is_teacher_available(1, 1, '09:15:00', '09:30:00') AS CHAR),
    IF(is_teacher_available(1, 1, '09:15:00', '09:30:00') = 0, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_teacher_available', 'teacher 1, Monday 12:00-13:00', '1',
    CAST(is_teacher_available(1, 1, '12:00:00', '13:00:00') AS CHAR),
    IF(is_teacher_available(1, 1, '12:00:00', '13:00:00') = 1, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_class_available', 'class 1, Tuesday 10:15-10:30', '0',
    CAST(is_class_available(1, 2, '10:15:00', '10:30:00') AS CHAR),
    IF(is_class_available(1, 2, '10:15:00', '10:30:00') = 0, 'PASS', 'FAIL')
UNION ALL
SELECT 'is_class_available', 'class 1, Tuesday 12:00-13:00', '1',
    CAST(is_class_available(1, 2, '12:00:00', '13:00:00') AS CHAR),
    IF(is_class_available(1, 2, '12:00:00', '13:00:00') = 1, 'PASS', 'FAIL')
UNION ALL
SELECT 'get_class_subject_count', 'class 1', '2',
    CAST(get_class_subject_count(1) AS CHAR),
    IF(get_class_subject_count(1) = 2, 'PASS', 'FAIL');
