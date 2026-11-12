USE school_calendar;

DELIMITER $$

CREATE PROCEDURE sp_check_schedule_slot(
    IN p_teacher_id INT,
    IN p_class_id INT,
    IN p_day_of_week TINYINT,
    IN p_start_time TIME,
    IN p_end_time TIME,
    OUT p_teacher_available BOOLEAN,
    OUT p_class_available BOOLEAN
)
READS SQL DATA
BEGIN
    IF p_day_of_week NOT BETWEEN 1 AND 7 OR p_end_time <= p_start_time THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A valid day and time interval are required';
    END IF;

    SELECT NOT EXISTS (
        SELECT 1
        FROM Lesson l
        JOIN Teaching_Assignment ta ON ta.assignment_id = l.assignment_id
        WHERE ta.teacher_id = p_teacher_id
          AND l.day_of_week = p_day_of_week
          AND p_start_time < l.end_time
          AND p_end_time > l.start_time
    ) INTO p_teacher_available;

    SELECT NOT EXISTS (
        SELECT 1
        FROM Lesson l
        JOIN Teaching_Assignment ta ON ta.assignment_id = l.assignment_id
        WHERE ta.class_id = p_class_id
          AND l.day_of_week = p_day_of_week
          AND p_start_time < l.end_time
          AND p_end_time > l.start_time
    ) INTO p_class_available;
END$$

DELIMITER ;
