USE school_calendar;

DELIMITER $$

CREATE PROCEDURE sp_check_classroom_capacity(
    IN p_classroom_id INT,
    IN p_class_id INT,
    OUT p_free_seats INT,
    OUT p_fits BOOLEAN
)
READS SQL DATA
BEGIN
    DECLARE v_capacity INT;
    DECLARE v_student_count INT;

    SELECT capacity INTO v_capacity
    FROM Classroom
    WHERE classroom_id = p_classroom_id;

    IF v_capacity IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Classroom does not exist';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Class` WHERE class_id = p_class_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Class does not exist';
    END IF;

    SELECT COUNT(*) INTO v_student_count
    FROM Student
    WHERE class_id = p_class_id;

    SET p_free_seats = v_capacity - v_student_count;
    SET p_fits = p_free_seats >= 0;
END$$

DELIMITER ;
