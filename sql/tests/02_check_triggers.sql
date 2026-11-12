USE school_calendar;

DELIMITER $$

CREATE PROCEDURE test_expect_lesson_insert_rejected(
    IN p_assignment_id INT,
    IN p_classroom_id INT,
    IN p_day_of_week TINYINT,
    IN p_start_time TIME,
    IN p_end_time TIME,
    OUT p_rejected BOOLEAN
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;

    INSERT INTO Lesson
        (assignment_id, classroom_id, day_of_week, start_time, end_time)
    VALUES
        (p_assignment_id, p_classroom_id, p_day_of_week, p_start_time, p_end_time);
END$$

CREATE PROCEDURE test_expect_lesson_update_rejected(
    IN p_lesson_id INT,
    OUT p_rejected BOOLEAN
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;

    UPDATE Lesson
    SET start_time = '09:15:00', end_time = '09:30:00'
    WHERE lesson_id = p_lesson_id;
END$$

CREATE PROCEDURE test_expect_student_assessment_rejected(
    IN p_student_id INT,
    IN p_assessment_id INT,
    OUT p_rejected BOOLEAN
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;

    INSERT INTO Student_Assessment (student_id, assessment_id)
    VALUES (p_student_id, p_assessment_id);
END$$

DELIMITER ;

START TRANSACTION;

CALL test_expect_lesson_insert_rejected(
    1, 1, 1, '09:15:00', '09:30:00', @insert_rejected);
SELECT 'trg_lesson_before_insert: schedule conflict' AS test_case,
    IF(@insert_rejected, 'PASS', 'FAIL') AS result;

-- Assignment 8 has no teacher/class conflict in this slot, but room 1 is busy.
CALL test_expect_lesson_insert_rejected(
    8, 1, 1, '09:15:00', '09:30:00', @insert_rejected);
SELECT 'trg_lesson_before_insert: room-only conflict' AS test_case,
    IF(@insert_rejected, 'PASS', 'FAIL') AS result;

CALL test_expect_lesson_insert_rejected(
    1, 2, 6, '09:00:00', '09:45:00', @insert_rejected);
SELECT 'trg_lesson_before_insert: insufficient room capacity' AS test_case,
    IF(@insert_rejected, 'PASS', 'FAIL') AS result;

INSERT INTO Lesson
    (assignment_id, classroom_id, day_of_week, start_time, end_time)
VALUES
    (1, 1, 1, '12:00:00', '12:45:00');
SET @new_lesson_id = LAST_INSERT_ID();
CALL test_expect_lesson_update_rejected(@new_lesson_id, @update_rejected);
SELECT 'trg_lesson_before_update: schedule conflict' AS test_case,
    IF(@update_rejected, 'PASS', 'FAIL') AS result;

CALL test_expect_student_assessment_rejected(4, 1, @enrollment_rejected);
SELECT 'trg_student_assessment_before_insert: class mismatch' AS test_case,
    IF(@enrollment_rejected, 'PASS', 'FAIL') AS result;

ROLLBACK;

DROP PROCEDURE test_expect_lesson_insert_rejected;
DROP PROCEDURE test_expect_lesson_update_rejected;
DROP PROCEDURE test_expect_student_assessment_rejected;
