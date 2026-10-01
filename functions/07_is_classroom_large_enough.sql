USE school_calendar;

DELIMITER $$

-- ============================================================
-- 7. is_classroom_large_enough
-- Returns TRUE if the classroom can fit the whole class
-- ============================================================

CREATE FUNCTION is_classroom_large_enough(
    p_classroom_id INT,
    p_class_id INT
)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE free_capacity INT;

    SET free_capacity =
        get_classroom_free_capacity(
            p_classroom_id,
            p_class_id
        );

    RETURN free_capacity >= 0;
END$$

DELIMITER ;

