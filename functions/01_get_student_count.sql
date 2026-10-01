USE school_calendar;

DELIMITER $$

-- ============================================================
-- 1. get_student_count
-- Returns the number of students in a class
-- ============================================================

CREATE FUNCTION get_student_count(p_class_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE student_count INT;

    SELECT COUNT(*)
    INTO student_count
    FROM Student
    WHERE class_id = p_class_id;

    RETURN student_count;
END$$

DELIMITER ;

