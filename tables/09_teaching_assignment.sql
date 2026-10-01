USE school_calendar;

-- 9. Teaching Assignment
-- Defines which teacher teaches which subject
-- to which class during which academic year
CREATE TABLE Teaching_Assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    class_id INT NOT NULL,
    subject_id INT NOT NULL,
    calendar_id INT NOT NULL,

    CONSTRAINT uq_teaching_assignment
        UNIQUE (
            teacher_id,
            class_id,
            subject_id,
            calendar_id
        ),

    CONSTRAINT fk_ta_teacher_subject
        FOREIGN KEY (teacher_id, subject_id)
        REFERENCES Teacher_Subject(teacher_id, subject_id),

    CONSTRAINT fk_ta_class_subject
        FOREIGN KEY (class_id, subject_id)
        REFERENCES Class_Subject(class_id, subject_id),

    CONSTRAINT fk_ta_calendar
        FOREIGN KEY (calendar_id)
        REFERENCES Academic_Calendar(calendar_id)
);

