USE school_calendar;

DELIMITER $$

CREATE PROCEDURE test_expect_invalid_room_rejected(OUT p_rejected BOOLEAN)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;
    INSERT INTO Classroom (room_number, capacity)
    VALUES ('TEST-INVALID-ROOM', 0);
END$$

CREATE PROCEDURE test_expect_duplicate_class_rejected(OUT p_rejected BOOLEAN)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;
    INSERT INTO `Class` (grade, letter, class_teacher_id)
    VALUES (5, 'A', 1);
END$$

CREATE PROCEDURE test_expect_invalid_calendar_rejected(OUT p_rejected BOOLEAN)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;
    INSERT INTO Academic_Calendar (academic_year, start_date, end_date)
    VALUES ('TEST-INVALID-YEAR', '2027-01-02', '2027-01-01');
END$$

CREATE PROCEDURE test_expect_invalid_student_class_rejected(OUT p_rejected BOOLEAN)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET p_rejected = TRUE;
    SET p_rejected = FALSE;
    INSERT INTO Student
        (first_name, last_name, birth_date, email, class_id)
    VALUES
        ('Test', 'ForeignKey', '2015-01-01',
         'test-invalid-fk@student.test', 999);
END$$

DELIMITER ;

START TRANSACTION;

CALL test_expect_invalid_room_rejected(@invalid_room_rejected);
SELECT 'CHECK: positive room capacity' AS test_case,
    IF(@invalid_room_rejected, 'PASS', 'FAIL') AS result;

CALL test_expect_duplicate_class_rejected(@duplicate_class_rejected);
SELECT 'UNIQUE: grade and letter' AS test_case,
    IF(@duplicate_class_rejected, 'PASS', 'FAIL') AS result;

CALL test_expect_invalid_calendar_rejected(@invalid_calendar_rejected);
SELECT 'CHECK: calendar end after start' AS test_case,
    IF(@invalid_calendar_rejected, 'PASS', 'FAIL') AS result;

CALL test_expect_invalid_student_class_rejected(@invalid_student_class_rejected);
SELECT 'FOREIGN KEY: student class exists' AS test_case,
    IF(@invalid_student_class_rejected, 'PASS', 'FAIL') AS result;

ROLLBACK;

SELECT 'INDEX: lesson day and time' AS test_case,
    IF(COUNT(*) = 3, 'PASS', 'FAIL') AS result
FROM information_schema.statistics
WHERE table_schema = DATABASE()
  AND table_name = 'Lesson'
  AND index_name = 'idx_lesson_day_time';

DROP PROCEDURE test_expect_invalid_room_rejected;
DROP PROCEDURE test_expect_duplicate_class_rejected;
DROP PROCEDURE test_expect_invalid_calendar_rejected;
DROP PROCEDURE test_expect_invalid_student_class_rejected;
