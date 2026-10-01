USE school_calendar;

DELIMITER $$

-- ============================================================
-- 4. get_assessment_count
-- Returns the number of assessments for a class
-- ============================================================

CREATE FUNCTION get_assessment_count(p_class_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE assessment_count INT;

    SELECT COUNT(*)
    INTO assessment_count
    FROM Assessment a
    JOIN Teaching_Assignment ta
        ON a.assignment_id = ta.assignment_id
    WHERE ta.class_id = p_class_id;

    RETURN assessment_count;
END$$

DELIMITER ;

