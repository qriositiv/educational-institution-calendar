USE school_calendar;

DELIMITER $$

CREATE PROCEDURE sp_get_class_overview(
    IN p_class_id INT,
    OUT p_student_count INT,
    OUT p_lesson_count INT,
    OUT p_homework_count INT,
    OUT p_assessment_count INT,
    OUT p_subject_count INT,
    OUT p_class_teacher_name VARCHAR(201)
)
READS SQL DATA
BEGIN
    SELECT COUNT(*) INTO p_student_count
    FROM Student
    WHERE class_id = p_class_id;

    SELECT COUNT(*) INTO p_lesson_count
    FROM Lesson l
    JOIN Teaching_Assignment ta ON ta.assignment_id = l.assignment_id
    WHERE ta.class_id = p_class_id;

    SELECT COUNT(*) INTO p_homework_count
    FROM Homework h
    JOIN Teaching_Assignment ta ON ta.assignment_id = h.assignment_id
    WHERE ta.class_id = p_class_id;

    SELECT COUNT(*) INTO p_assessment_count
    FROM Assessment a
    JOIN Teaching_Assignment ta ON ta.assignment_id = a.assignment_id
    WHERE ta.class_id = p_class_id;

    SELECT COUNT(*) INTO p_subject_count
    FROM Class_Subject
    WHERE class_id = p_class_id;

    SELECT CONCAT(t.first_name, ' ', t.last_name)
    INTO p_class_teacher_name
    FROM `Class` c
    LEFT JOIN Teacher t ON t.teacher_id = c.class_teacher_id
    WHERE c.class_id = p_class_id;
END$$

DELIMITER ;
