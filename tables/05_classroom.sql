USE school_calendar;

-- 5. Classroom
CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(20) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    room_type VARCHAR(50),

    CONSTRAINT chk_classroom_capacity
        CHECK (capacity > 0)
);

