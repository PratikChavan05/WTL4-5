CREATE DATABASE IF NOT EXISTS ebookshop;
USE ebookshop;

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(255) NOT NULL,
    book_author VARCHAR(255) NOT NULL,
    book_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

-- Intert some sample data
INSERT INTO books (book_title, book_author, book_price, quantity) VALUES
('The C Programming Language', 'Brian W. Kernighan, Dennis M. Ritchie', 45.00, 10),
('Java Concurrency in Practice', 'Brian Goetz', 55.00, 5),
('Design Patterns', 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides', 65.00, 8),
('Clean Code', 'Robert C. Martin', 42.50, 15),
('Effective Java', 'Joshua Bloch', 50.00, 12);
