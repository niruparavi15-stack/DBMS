USE FRESHBASKET;

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductID INT,
    Qty INT,
    TotalAmt DECIMAL(10,2),
    OrderStatus VARCHAR(20),
    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);

INSERT INTO Orders VALUES
(601, "ARUN", 201, 2, 1300, "PENDING"),
(602, "PRIYA", 202, 3, 840, "DELIVERED"),
(603, "KARTHIK", 203, 2, 360, "PENDING"),
(604, "MEENA", 204, 4, 280, "SHIPPED"),
(605, "ROHAN", 205, 3, 270, "DELIVERED"),
(606, "DIVYA", 207, 2, 150, "PENDING"),
(607, "NAVEEN", 208, 1, 240, "DELIVERED");

CREATE TABLE Order_Details
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Qty INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);

INSERT INTO Order_Details VALUES
(701, 601, 201, 2, 650),
(702, 602, 202, 3, 280),
(703, 603, 203, 2, 180),
(704, 604, 204, 4, 70),
(705, 605, 205, 3, 90),
(706, 606, 207, 2, 75),
(707, 607, 208, 1, 240);

SELECT * FROM Orders;
SELECT * FROM Order_Details;

UPDATE Orders
SET OrderStatus = "SHIPPED"
WHERE OrderID = 601;

UPDATE Orders
SET OrderStatus = "DELIVERED"
WHERE OrderID = 603;

SELECT * FROM Orders
ORDER BY CustomerName;

SELECT * FROM Orders
WHERE CustomerName = "PRIYA"
ORDER BY OrderID;

SELECT * FROM Orders
WHERE OrderStatus = "PENDING";

SELECT * FROM Orders
WHERE OrderStatus = "SHIPPED";

SELECT * FROM Orders
WHERE OrderStatus = "DELIVERED";

SELECT CustomerName, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerName;

SELECT CustomerName, SUM(TotalAmt) AS TotalAmountSpent
FROM Orders
GROUP BY CustomerName;

SELECT * FROM Orders;
SELECT * FROM Order_Details;