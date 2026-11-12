USE school_calendar;

DELIMITER $$

-- ============================================================
-- 6. get_classroom_free_capacity
-- Returns how many seats remain if a class uses a classroom
-- ============================================================

CREATE FUNCTION get_classroom_free_capacity(
    p_classroom_id INT,
    p_class_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE classroom_capacity INT;
    DECLARE student_count INT;

    SELECT capacity
    INTO classroom_capacity
    FROM Classroom
    WHERE classroom_id = p_classroom_id;

    SELECT COUNT(*)
    INTO student_count
    FROM Student
    WHERE class_id = p_class_id;

    RETURN classroom_capacity - student_count;
END$$

DELIMITER ;

