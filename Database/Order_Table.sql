USE PRJ301_Assignment
GO

CREATE TABLE [Order] (
    id INT PRIMARY KEY,
    userID INT REFERENCES [User](id),
    restID INT REFERENCES Restaurant(id),
    address NVARCHAR(250),
    created_on DATETIME,
    total FLOAT
);
