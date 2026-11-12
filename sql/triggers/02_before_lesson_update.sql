USE school_calendar;

DELIMITER $$

CREATE TRIGGER trg_lesson_before_update
BEFORE UPDATE ON Lesson
FOR EACH ROW
BEGIN
    DECLARE v_teacher_id INT;
    DECLARE v_class_id INT;
    DECLARE v_capacity INT;
    DECLARE v_student_count INT;
    DECLARE v_conflict_count INT;

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

    SELECT COUNT(*) INTO v_conflict_count
    FROM Lesson l
    JOIN Teaching_Assignment ta ON ta.assignment_id = l.assignment_id
    WHERE l.lesson_id <> OLD.lesson_id
      AND l.day_of_week = NEW.day_of_week
      AND NEW.start_time < l.end_time
      AND NEW.end_time > l.start_time
      AND (ta.teacher_id = v_teacher_id
           OR ta.class_id = v_class_id
           OR l.classroom_id = NEW.classroom_id);

    IF v_conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Teacher, class, or classroom has a schedule conflict';
    END IF;
END$$

DELIMITER ;
