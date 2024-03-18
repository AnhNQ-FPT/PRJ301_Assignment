USE PRJ301_Assignment
GO

CREATE TABLE City (
    id INT PRIMARY KEY,
    name NVARCHAR(250)
);

INSERT INTO City (id, name) VALUES
(1, 'New York'),
(2, 'Chicago'),
(3, 'Los Angeles'),
(4, 'Paris'),
(5, 'Tokyo'),
(6, 'Mumbai'),
(7, 'Athens'),
(8, 'Austin'),
(9, 'Beijing'),
(10, 'Sydney');
