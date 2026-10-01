USE school_calendar;

-- 13. Student_Assessment
-- Implements Student N:M Assessment
CREATE TABLE Student_Assessment (
    student_id INT NOT NULL,
    assessment_id INT NOT NULL,

    PRIMARY KEY (student_id, assessment_id),

    CONSTRAINT fk_sa_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_sa_assessment
        FOREIGN KEY (assessment_id)
        REFERENCES Assessment(assessment_id)
);

