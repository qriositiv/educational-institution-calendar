USE school_calendar;

-- 2. Class
CREATE TABLE `Class` (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    grade INT NOT NULL,
    letter VARCHAR(5) NOT NULL,
    class_teacher_id INT,

    CONSTRAINT uq_class
        UNIQUE (grade, letter),

    CONSTRAINT chk_class_grade
        CHECK (grade BETWEEN 1 AND 12),

    CONSTRAINT fk_class_teacher
        FOREIGN KEY (class_teacher_id)
        REFERENCES Teacher(teacher_id)
);

