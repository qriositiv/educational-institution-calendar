USE school_calendar;

DELIMITER $$

CREATE TRIGGER trg_lesson_before_insert
BEFORE INSERT ON Lesson
FOR EACH ROW
BEGIN
    DECLARE v_teacher_id INT;
    DECLARE v_class_id INT;
    DECLARE v_capacity INT;
    DECLARE v_student_count INT;
    DECLARE v_conflict_count INT;
    DECLARE v_teacher_available BOOLEAN;
    DECLARE v_class_available BOOLEAN;

    SELECT teacher_id, class_id
    INTO v_teacher_id, v_class_id
    FROM Teaching_Assignment
    WHERE assignment_id = NEW.assignment_id;

    SELECT capacity INTO v_capacity
    FROM Classroom
    WHERE classroom_id = NEW.classroom_id;

    SELECT COUNT(*) INTO v_student_count
    FROM Student
    WHERE class_id = v_class_id;

    IF v_capacity < v_student_count THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Classroom capacity is too small for this class';
    END IF;

    CALL sp_check_schedule_slot(
        v_teacher_id,
        v_class_id,
        NEW.day_of_week,
        NEW.start_time,
        NEW.end_time,
        v_teacher_available,
        v_class_available
    );

    IF NOT v_teacher_available OR NOT v_class_available THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Teacher or class has a schedule conflict';
    END IF;

    SELECT COUNT(*) INTO v_conflict_count
    FROM Lesson l
    WHERE l.day_of_week = NEW.day_of_week
      AND NEW.start_time < l.end_time
      AND NEW.end_time > l.start_time
      AND l.classroom_id = NEW.classroom_id;

    IF v_conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Classroom has a schedule conflict';
    END IF;
END$$

DELIMITER ;
