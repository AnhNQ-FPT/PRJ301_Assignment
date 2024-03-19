USE [master]
CREATE DATABASE PRJ301_Assignment
GO

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

CREATE TABLE Food (
    id INT PRIMARY KEY,
    name NVARCHAR(250),
    price FLOAT,
    sale INT,
    sold INT,
	cost FLOAT,
);

INSERT INTO Food (id, name, price, sale, sold, cost) VALUES
(1, 'Pancakes', 12.99, 20, 5,11.19),
(2, 'Chicken Tikka Masala', 14.49, 30, 8, 11.59),
(3, 'Margherita Pizza', 9.99, 15, 6, 7.99),
(4, 'Caesar Salad', 8.99, 25, 10, 7.19),
(5, 'Beef Burger', 11.99, 35, 15, 9.59),
(6, 'Pad Thai', 10.99, 40, 12, 8.79),
(7, 'Sushi Roll', 16.99, 45, 18, 13.59),
(8, 'Chicken Alfredo', 13.49, 5, 3, 10.79),
(9, 'Fish and Chips', 15.99, 10, 7, 12.79),
(10, 'Tacos', 9.49, 20, 9, 7.59),
(11, 'Steak Frites', 19.99, 25, 14, 15.99),
(12, 'Miso Soup', 4.99, 30, 20, 3.99),
(13, 'Pasta Primavera', 12.49, 35, 22, 9.99),
(14, 'Hamburger Steak', 11.49, 40, 11, 9.19),
(15, 'Chicken Caesar Wrap', 7.99, 45, 5, 6.39),
(16, 'Veggie Pizza', 10.99, 0, 2, 8.79),
(17, 'BBQ Ribs', 18.99, 10, 6, 15.19),
(18, 'Shrimp Scampi', 16.49, 15, 9, 13.19),
(19, 'Pho', 11.99, 20, 12, 9.59),
(20, 'Vegetable Risotto', 13.99, 25, 7, 11.19);

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name NVARCHAR(250),
    cityID INT REFERENCES City(id),
    address NVARCHAR(250),
    sale INT,
    rating FLOAT,
    [open] TIME,
    [close] TIME
);

INSERT INTO Restaurant (id, name, cityID, address, sale, rating, [open], [close]) VALUES
(1, 'The Hungry Panda', 1, '123 Main St', 40, 4.2, '09:00:00', '22:00:00'),
(2, 'Mamma Mia Pizzeria', 2, '456 Elm St', 30, 4.5, '10:00:00', '21:30:00'),
(3, 'Sizzling Szechuan', 3, '789 Oak St', 45, 4.0, '11:30:00', '23:00:00'),
(4, 'Cafe Parisien', 4, '456 Rue de la Paix', 35, 4.8, '08:30:00', '20:00:00'),
(5, 'Tokyo Ramen House', 5, '789 Sakura Ave', 25, 4.3, '11:00:00', '22:30:00'),
(6, 'Bollywood Bites', 6, '101 Bollywood Blvd', 50, 4.1, '12:00:00', '23:30:00'),
(7, 'The Greek Taverna', 7, '333 Ouzo Ln', 50, 4.7, '11:30:00', '22:00:00'),
(8, 'Tex Mex Grill', 8, '555 Guadalupe St', 20, 4.6, '10:30:00', '21:00:00'),
(9, 'Sushi Sensation', 10, '222 Sashimi St', 45, 4.4, '12:00:00', '23:00:00'),
(10, 'Peking Palace', 9, '777 Great Wall Ave', 50, 4.0, '11:00:00', '22:30:00'),
(11, 'Big Apple Burgers', 1, '321 Broadway', 40, 4.5, '10:00:00', '23:00:00'),
(12, 'Windy City Wings', 2, '123 Wacker Dr', 30, 4.2, '11:00:00', '22:00:00'),
(13, 'Hollywood Sushi', 3, '456 Sunset Blvd', 25, 4.1, '12:00:00', '23:30:00'),
(14, 'Eiffel Tower Bistro', 4, '777 Champs-Élysées', 20, 4.3, '09:30:00', '21:30:00'),
(15, 'Mount Fuji Ramen', 5, '888 Fujiyama St', 35, 4.7, '11:30:00', '22:30:00'),
(16, 'Bollywood Bites', 6, '101 Bollywood Blvd', 45, 4.0, '12:00:00', '23:00:00'),
(17, 'Olympus Taverna', 7, '111 Zeus Ave', 50, 4.6, '11:00:00', '22:00:00'),
(18, 'Texas BBQ Shack', 8, '999 Lone Star Dr', 30, 4.8, '10:30:00', '21:30:00'),
(19, 'Tokyo Tempura House', 5, '555 Tempura Ave', 40, 4.4, '11:30:00', '22:00:00'),
(20, 'Forbidden City Dumplings', 9, '666 Forbidden City Blvd', 50, 4.5, '12:00:00', '23:30:00');

CREATE TABLE Food_Image (
    id INT PRIMARY KEY REFERENCES Food(id),
    [path] NVARCHAR(250)
);

DECLARE @counter INT = 1;
WHILE @counter <= 20
BEGIN
    INSERT INTO Food_Image (id, [path])
    VALUES (@counter, '../public/assets/img/gallery/cheese-burger.png');
    SET @counter = @counter + 1;
END;

CREATE TABLE Food_Restaurant (
    foodID INT REFERENCES Food(id),
    restID INT REFERENCES Restaurant(id),
    CONSTRAINT PK_Food_Restaurant PRIMARY KEY (foodID, restID)
);

WITH RandomFoods AS (
    SELECT id AS foodID, ROW_NUMBER() OVER (ORDER BY NEWID()) AS RowNum
    FROM Food
), RandomRestaurants AS (
    SELECT id AS restID, ROW_NUMBER() OVER (ORDER BY NEWID()) AS RowNum
    FROM Restaurant
), FoodCount AS (
    SELECT COUNT(*) AS FoodCount FROM Food
), RestaurantCount AS (
    SELECT COUNT(*) AS RestaurantCount FROM Restaurant
)
INSERT INTO Food_Restaurant (foodID, restID)
SELECT RF.foodID, RR.restID
FROM RandomFoods RF
CROSS JOIN RandomRestaurants RR
CROSS JOIN FoodCount
CROSS JOIN RestaurantCount
WHERE RF.RowNum <= FoodCount.FoodCount
  AND RR.RowNum <= RestaurantCount.RestaurantCount
ORDER BY NEWID()
OFFSET 0 ROWS
FETCH NEXT 50 ROWS ONLY;

CREATE TABLE [User] (
    id INT PRIMARY KEY,
    name NVARCHAR(250),
    [password] VARCHAR(20),
	email NVARCHAR(250),
	[role] bit,
	balance float,
);

INSERT INTO [User] (id, name, [password], email, role, balance) VALUES
(1, 'Alice', 'abc', 'user1@gmail.com', 1, ROUND(RAND() * 100, 2)),
(2, 'Bob', '123', 'user2@gmail.com', 1, ROUND(RAND() * 100, 2)),
(3, 'Charlie', 'xyz', 'user3@gmail.com', 0, ROUND(RAND() * 100, 2)),
(4, 'David', '456', 'user4@gmail.com', 0, ROUND(RAND() * 100, 2)),
(5, 'Eve', 'uvw', 'user5@gmail.com', 0, ROUND(RAND() * 100, 2)),
(6, 'Frank', '789', 'user6@gmail.com', 0, ROUND(RAND() * 100, 2)),
(7, 'Grace', 'mno', 'user7@gmail.com', 0, ROUND(RAND() * 100, 2)),
(8, 'Helen', '321', 'user8@gmail.com', 0, ROUND(RAND() * 100, 2)),
(9, 'Irene', 'def', 'user9@gmail.com', 0, ROUND(RAND() * 100, 2)),
(10, 'Jack', '456', 'user10@gmail.com', 1, ROUND(RAND() * 100, 2)),
(11, 'Karen', 'pqr', 'user11@gmail.com', 1, ROUND(RAND() * 100, 2)),
(12, 'Larry', '890', 'user12@gmail.com', 0, ROUND(RAND() * 100, 2)),
(13, 'Monica', 'jkl', 'user13@gmail.com', 0, ROUND(RAND() * 100, 2)),
(14, 'Nancy', '234', 'user14@gmail.com', 0, ROUND(RAND() * 100, 2)),
(15, 'Oliver', 'stu', 'user15@gmail.com', 0, ROUND(RAND() * 100, 2)),
(16, 'Paul', 'ghi', 'user16@gmail.com', 1, ROUND(RAND() * 100, 2)),
(17, 'Quinn', '567', 'user17@gmail.com', 0, ROUND(RAND() * 100, 2)),
(18, 'Rachel', 'qwe', 'user18@gmail.com', 1, ROUND(RAND() * 100, 2)),
(19, 'Steve', '890', 'user19@gmail.com', 1, ROUND(RAND() * 100, 2)),
(20, 'Tina', '456', 'user20@gmail.com', 0, ROUND(RAND() * 100, 2));

CREATE TABLE [Order] (
    id INT PRIMARY KEY,
    userID INT REFERENCES [User](id),
    address NVARCHAR(250),
    created_on DATETIME,
    total FLOAT,
--	[status] NVARCHAR(20)
);

CREATE TABLE OrderDetails (
    id INT REFERENCES [Order](id),
    foodID INT REFERENCES Food(id),
    quantity INT,
    subtotal FLOAT
);