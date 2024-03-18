USE PRJ301_Assignment
GO

CREATE TABLE [User] (
    id INT PRIMARY KEY,
    name NVARCHAR(250),
    [password] VARCHAR(20),
	email NVARCHAR(250)
	[role] bit,
);

INSERT INTO [User] (id, name, [password], email) VALUES
(1, 'Alice', 'abc','user1@gmail.com',1),
(2, 'Bob', '123','user2@gmail.com',1),
(3, 'Charlie', 'xyz','user3@gmail.com',0),
(4, 'David', '456','user4@gmail.com',0),
(5, 'Eve', 'uvw','user5@gmail.com',0),
(6, 'Frank', '789','user6@gmail.com',0),
(7, 'Grace', 'mno','user7@gmail.com',0),
(8, 'Helen', '321','user8@gmail.com',0),
(9, 'Irene', 'def','user9@gmail.com',0),
(10, 'Jack', '456','user10@gmail.com',1),
(11, 'Karen', 'pqr','user11@gmail.com',1),
(12, 'Larry', '890','user12@gmail.com',0),
(13, 'Monica', 'jkl','user13@gmail.com',0),
(14, 'Nancy', '234','user14@gmail.com',0),
(15, 'Oliver', 'stu','user15@gmail.com',0),
(16, 'Paul', 'ghi','user16@gmail.com',1),
(17, 'Quinn', '567','user17@gmail.com',0),
(18, 'Rachel', 'qwe','user18@gmail.com',1),
(19, 'Steve', '890','user19@gmail.com',1),
(20, 'Tina', '456','user20@gmail.com',0);
