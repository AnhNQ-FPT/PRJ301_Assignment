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
