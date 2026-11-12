USE school_calendar;

-- 10. Lesson
-- Represents a scheduled lesson
CREATE TABLE Lesson (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    classroom_id INT NOT NULL,
    day_of_week TINYINT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,

    CONSTRAINT chk_lesson_day
        CHECK (day_of_week BETWEEN 1 AND 7),

    CONSTRAINT chk_lesson_time
        CHECK (end_time > start_time),

    CONSTRAINT fk_lesson_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES Teaching_Assignment(assignment_id),

    CONSTRAINT fk_lesson_classroom
        FOREIGN KEY (classroom_id)
        REFERENCES Classroom(classroom_id),

    INDEX idx_lesson_day_time (
        day_of_week,
        start_time,
        end_time
    )
);

