USE school_calendar;

-- 7. Class_Subject
-- Implements Class N:M Subject
CREATE TABLE Class_Subject (
    class_id INT NOT NULL,
    subject_id INT NOT NULL,
    lessons_per_week INT NOT NULL,

    PRIMARY KEY (class_id, subject_id),

    CONSTRAINT chk_lessons_per_week
        CHECK (lessons_per_week > 0),

    CONSTRAINT fk_cs_class
        FOREIGN KEY (class_id)
        REFERENCES `Class`(class_id),

    CONSTRAINT fk_cs_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);

