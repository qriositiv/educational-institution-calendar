USE school_calendar;

-- 3. Student
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    email VARCHAR(150) UNIQUE,
    class_id INT NOT NULL,

    CONSTRAINT fk_student_class
        FOREIGN KEY (class_id)
        REFERENCES `Class`(class_id)
);

