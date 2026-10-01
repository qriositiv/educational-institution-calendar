USE school_calendar;

DELIMITER $$

-- ============================================================
-- 2. get_class_weekly_lessons
-- Returns the total number of weekly lessons for a class
-- ============================================================

CREATE FUNCTION get_class_weekly_lessons(p_class_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE lesson_count INT;

    SELECT COUNT(*)
    INTO lesson_count
    FROM Lesson l
    JOIN Teaching_Assignment ta
        ON l.assignment_id = ta.assignment_id
    WHERE ta.class_id = p_class_id;

    RETURN lesson_count;
END$$

DELIMITER ;

