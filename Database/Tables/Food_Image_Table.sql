USE PRJ301_Assignment
GO

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
