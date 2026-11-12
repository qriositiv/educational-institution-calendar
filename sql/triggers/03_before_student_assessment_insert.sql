USE school_calendar;

DELIMITER $$

CREATE TRIGGER trg_student_assessment_before_insert
BEFORE INSERT ON Student_Assessment
FOR EACH ROW
BEGIN
    DECLARE v_assessment_class_id INT;
    DECLARE v_student_class_id INT;

    SELECT ta.class_id INTO v_assessment_class_id
    FROM Assessment a
    JOIN Teaching_Assignment ta ON ta.assignment_id = a.assignment_id
    WHERE a.assessment_id = NEW.assessment_id;

    SELECT class_id INTO v_student_class_id
    FROM Student
    WHERE student_id = NEW.student_id;

    IF v_assessment_class_id <> v_student_class_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Student must belong to the assessment class';
    END IF;
END$$

DELIMITER ;
