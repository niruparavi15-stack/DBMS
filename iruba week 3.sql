CREATE DATABASE GroceryEMS;

USE GroceryEMS;

-- Seller Management
CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    SellerName VARCHAR(100),
    ContactNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150)
);

-- Category Management
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Product Management
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Brand VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT,
    SellerID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

-- Inventory Management
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    SellerID INT,
    AvailabilityStatus VARCHAR(20),
    Stock INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

-- Customer Management
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(15)
);

-- Shopping Cart
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CartItem (
    CartItemID INT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    Status VARCHAR(50), -- Ordered, Packed, Shipped, Out for Delivery, Delivered
    DeliveryAddress VARCHAR(200),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Payment
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATETIME,
    Amount DECIMAL(10,2),
    Method VARCHAR(50), -- UPI, Debit Card, Credit Card, Net Banking, COD
    Status VARCHAR(50), -- Success, Failed, Pending
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Delivery
CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    DeliveryStaff VARCHAR(100),
    DeliveryDate DATETIME,
    Status VARCHAR(50), -- Out for Delivery, Delivered
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Reports
CREATE TABLE Report (
    ReportID INT PRIMARY KEY,
    ReportType VARCHAR(50), -- Sales, Inventory, Customer
    GeneratedDate DATETIME,
    FilePath VARCHAR(200)
);
