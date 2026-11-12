USE school_calendar;

-- 6. Teacher_Subject
-- Implements Teacher N:M Subject
CREATE TABLE Teacher_Subject (
    teacher_id INT NOT NULL,
    subject_id INT NOT NULL,

    PRIMARY KEY (teacher_id, subject_id),

    CONSTRAINT fk_ts_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES Teacher(teacher_id),

    CONSTRAINT fk_ts_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);

