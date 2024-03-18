USE PRJ301_Assignment
GO

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
