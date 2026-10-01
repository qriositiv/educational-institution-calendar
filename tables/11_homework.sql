USE school_calendar;

-- 11. Homework
CREATE TABLE Homework (
    homework_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    assigned_at DATETIME NOT NULL,
    due_at DATETIME NOT NULL,

    CONSTRAINT chk_homework_dates
        CHECK (due_at >= assigned_at),

    CONSTRAINT fk_homework_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES Teaching_Assignment(assignment_id)
);

