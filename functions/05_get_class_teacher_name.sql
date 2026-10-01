USE school_calendar;

DELIMITER $$

-- ============================================================
-- 5. get_class_teacher_name
-- Returns the full name of the class teacher
-- ============================================================

CREATE FUNCTION get_class_teacher_name(p_class_id INT)
RETURNS VARCHAR(201)
READS SQL DATA
BEGIN
    DECLARE teacher_name VARCHAR(201);

    SELECT CONCAT(t.first_name, ' ', t.last_name)
    INTO teacher_name
    FROM `Class` c
    JOIN Teacher t
        ON c.class_teacher_id = t.teacher_id
    WHERE c.class_id = p_class_id;

    RETURN teacher_name;
END$$

DELIMITER ;

