-- --------------------------------------------------------
-- Library Management System Database
-- Author: Nebiyu Girma
-- --------------------------------------------------------

-- Books Table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    published_date DATE NOT NULL,
    genre VARCHAR(50),
    CONSTRAINT chk_isbn_length CHECK (LENGTH(isbn) = 13)
);

-- Authors Table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100)
);

-- BookAuthors (M-M Relationship)
CREATE TABLE IF NOT EXISTS BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Members Table
CREATE TABLE IF NOT EXISTS Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Loans Table
CREATE TABLE IF NOT EXISTS Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT chk_due_date CHECK (due_date > loan_date)
);

-- Sample Data
INSERT INTO Books (title, isbn, published_date, genre) VALUES
('To Kill a Mockingbird', '9780446310789', '1960-07-11', 'Fiction'),
('The Catcher in the Rye', '9780316769488', '1951-07-16', 'Literary Fiction');

INSERT INTO Authors (full_name, nationality) VALUES
('Harper Lee', 'American'),
('J.D. Salinger', 'American');

INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),
(2, 2);

INSERT INTO Members (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.j@example.com'),
('Bob', 'Williams', 'bob.w@example.com');

INSERT INTO Loans (book_id, member_id, due_date) VALUES
(1, 1, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)),
(2, 2, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));
