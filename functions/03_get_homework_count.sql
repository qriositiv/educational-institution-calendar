USE school_calendar;

DELIMITER $$

-- ============================================================
-- 3. get_homework_count
-- Returns the number of homework assignments for a class
-- ============================================================

CREATE FUNCTION get_homework_count(p_class_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE homework_count INT;

    SELECT COUNT(*)
    INTO homework_count
    FROM Homework h
    JOIN Teaching_Assignment ta
        ON h.assignment_id = ta.assignment_id
    WHERE ta.class_id = p_class_id;

    RETURN homework_count;
END$$

DELIMITER ;

