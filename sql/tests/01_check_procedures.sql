USE school_calendar;

CALL sp_get_class_overview(
    1,
    @student_count,
    @lesson_count,
    @homework_count,
    @assessment_count,
    @subject_count,
    @class_teacher_name
);

SELECT
    'sp_get_class_overview' AS test_case,
    IF(@student_count = 5
       AND @lesson_count = 3
       AND @homework_count = 2
       AND @assessment_count = 2
       AND @subject_count = 2
       AND @class_teacher_name = 'Anna Kowalska', 'PASS', 'FAIL') AS result;

CALL sp_check_classroom_capacity(1, 1, @free_seats, @class_fits);
SELECT
    'sp_check_classroom_capacity: room 101, class 5A' AS test_case,
    IF(@free_seats = 25 AND @class_fits = TRUE, 'PASS', 'FAIL') AS result;

CALL sp_check_classroom_capacity(2, 1, @free_seats, @class_fits);
SELECT
    'sp_check_classroom_capacity: room 102, class 5A' AS test_case,
    IF(@free_seats = -3 AND @class_fits = FALSE, 'PASS', 'FAIL') AS result;

CALL sp_check_schedule_slot(1, 1, 1, '09:15:00', '09:30:00',
    @teacher_available, @class_available);
SELECT
    'sp_check_schedule_slot: occupied Monday slot' AS test_case,
    IF(@teacher_available = FALSE AND @class_available = FALSE,
       'PASS', 'FAIL') AS result;

CALL sp_check_schedule_slot(1, 1, 1, '12:00:00', '12:45:00',
    @teacher_available, @class_available);
SELECT
    'sp_check_schedule_slot: free Monday slot' AS test_case,
    IF(@teacher_available = TRUE AND @class_available = TRUE,
       'PASS', 'FAIL') AS result;
