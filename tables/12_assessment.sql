USE school_calendar;

-- 12. Assessment
CREATE TABLE Assessment (
    assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    assessment_type VARCHAR(50) NOT NULL,
    description TEXT,
    starts_at DATETIME NOT NULL,
    ends_at DATETIME NOT NULL,

    CONSTRAINT chk_assessment_time
        CHECK (ends_at > starts_at),

    CONSTRAINT fk_assessment_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES Teaching_Assignment(assignment_id)
);

