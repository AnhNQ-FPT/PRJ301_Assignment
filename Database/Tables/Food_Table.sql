USE PRJ301_Assignment
GO

CREATE TABLE Food (
    id INT PRIMARY KEY,
    name NVARCHAR(250),
    price FLOAT,
    sale INT,
    sold INT
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