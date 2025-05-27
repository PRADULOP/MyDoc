use Pradul;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (CustomerID, Name, Email)
VALUES
    (4, 'David Williams', 'david@example.com'),
    (5, 'Emma Martinez', 'emma@example.com'),
    (6, 'Frank Thompson', 'frank@example.com'),
    (7, 'Grace Lee', 'grace@example.com'),
    (8, 'Henry Wilson', 'henry@example.com');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (105, 4, '2025-04-27', 150.00),
    (106, 5, '2025-04-28', 220.30),
    (107, 6, '2025-04-29', 350.40),
    (108, 7, '2025-04-30', 85.00),
    (109, 8, '2025-04-30', 400.75);

select * from orders;
select * from Customers;

select o.OrderID, o.OrderDate, c.CustomerID,o.TotalAmount from orders o
join Customers c  on o.CustomerID = c.CustomerID
 where c.Email="emma@example.com";

select * from orders
 where OrderDate >= curdate() - interval 7 day;
 
select * from customers where Email="grace@example.com";

SELECT OrderDate, count(OrderID) as OrderCount from orders group by OrderDate having count(OrderID) >1 order by OrderDate;

select sum(TotalAmount) as Total_Revenue from orders where OrderDate between '2025-04-27' and '2025-04-29';
