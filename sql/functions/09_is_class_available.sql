USE school_calendar;

DELIMITER $$

-- ============================================================
-- 9. is_class_available
-- Checks whether a class is free during the specified time
-- ============================================================

CREATE FUNCTION is_class_available(
    p_class_id INT,
    p_day_of_week TINYINT,
    p_start_time TIME,
    p_end_time TIME
)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE conflict_count INT;

    SELECT COUNT(*)
    INTO conflict_count
    FROM Lesson l
    JOIN Teaching_Assignment ta
        ON l.assignment_id = ta.assignment_id
    WHERE ta.class_id = p_class_id
      AND l.day_of_week = p_day_of_week
      AND p_start_time < l.end_time
      AND p_end_time > l.start_time;

    RETURN conflict_count = 0;
END$$

DELIMITER ;

