select top 4 * from Food order by sale desc
select * from Food order by sold desc
select * from Restaurant
select top 4 * from Restaurant order by rating desc
select * from Food_Restaurant order by foodID desc
select top 5 * from Food order by sold desc
SELECT * FROM (SELECT TOP 10 * FROM Food ORDER BY sold DESC) AS Top10 ORDER BY sold ASC LIMIT 5; 
select * from (SELECT top 4 * FROM (SELECT TOP 8 * FROM Food ORDER BY sold DESC) AS Top8 ORDER BY sold ASC) as top4 order by sold desc
select top 8 * from Food where sold > 10 order by sold desc
select * from City
drop table Food_Restaurant

select top 8 c.id, count(r.id) as restNo from City c join Restaurant r on c.id = r.cityID group by c.id order by count(r.id) desc;
select * from [User]

update Restaurant
set cityID = 10 where name = 'Sushi Sensation'

select * from [User] where name = 'Alice' and password = '123'
select top 1 * from [User] order by id desc


select [path] from Food_Image where id = 1;
select [role] from [User] where id = 1
select * from [Order]
select * from OrderDetails
select * from Food_Image fi join Food f on f.id = fi.id 

update Food_Image
set [path] = '../public/assets/img/gallery/burger.png' where id = 1

insert into Food_Restaurant (foodID,restID) values(1,10)
delete from Food_Image where id = 21
delete from Food_Restaurant where foodID = 21
delete from [Food] where id = 21

update Food
set sold = 0

select count(*) as NumberOfOrders from [Order];

select * from [Order]
select * from OrderDetails

ALTER TABLE [Order] DROP CONSTRAINT FK__Order__restID__4222D4EF;

alter table [Order]
drop column restID

select f.id,f.name,f.price,f.sale,f.sold,f.cost, od.quantity from Food f join [OrderDetails] od on f.id = od.foodID where f.id = 1