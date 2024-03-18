USE PRJ301_Assignment
GO

CREATE TABLE OrderDetails (
    id INT REFERENCES [Order](id),
    foodID INT REFERENCES Food(id),
    quantity INT,
    subtotal FLOAT
);