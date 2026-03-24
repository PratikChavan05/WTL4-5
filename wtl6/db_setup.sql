CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

CREATE TABLE IF NOT EXISTS students_info (
    stud_id INT PRIMARY KEY AUTO_INCREMENT,
    stud_name VARCHAR(100) NOT NULL,
    class VARCHAR(50) NOT NULL,
    division VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Insert sample student records
INSERT INTO students_info (stud_name, class, division, city) VALUES
('Pratik Chavan', 'TE', 'A', 'Pune'),
('Amit Sharma', 'SE', 'B', 'Mumbai'),
('Sneha Patil', 'TE', 'A', 'Nagpur'),
('Rahul Deshmukh', 'BE', 'C', 'Nashik'),
('Priya Kulkarni', 'SE', 'B', 'Kolhapur');
