USE school_calendar;

DELIMITER $$

-- ============================================================
-- 10. get_class_subject_count
-- Returns the number of subjects studied by a class
-- ============================================================

CREATE FUNCTION get_class_subject_count(p_class_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE subject_count INT;

    SELECT COUNT(*)
    INTO subject_count
    FROM Class_Subject
    WHERE class_id = p_class_id;

    RETURN subject_count;
END$$

DELIMITER ;

