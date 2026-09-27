USE FRESHBASKET;

CREATE TABLE Seller
(
    SellerID INT PRIMARY KEY,
    SellerName VARCHAR(100),
    ContactNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150)
);

INSERT INTO Seller VALUES
(401, "GREEN VALLEY FOODS", "9123401001", "greenvalley@gmail.com", "Chennai"),
(402, "FRESH HARVEST", "9123401002", "freshharvest@gmail.com", "Madurai"),
(403, "DAILY NEEDS MART", "9123401003", "dailyneeds@gmail.com", "Coimbatore"),
(404, "NATURE BASKET", "9123401004", "naturebasket@gmail.com", "Salem"),
(405, "FARM FRESH STORE", "9123401005", "farmfresh@gmail.com", "Trichy"),
(406, "PURE HARVEST", "9123401006", "pureharvest@gmail.com", "Chennai"),
(407, "FRESH CHOICE", "9123401007", "freshchoice@gmail.com", "Madurai");

SELECT * FROM Seller;

CREATE TABLE Inventory
(
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    SellerID INT,
    AvailabilityStatus VARCHAR(20),
    Stock INT,

    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID),

    FOREIGN KEY (SellerID)
    REFERENCES Seller(SellerID)
);

INSERT INTO Inventory VALUES
(501, 201, 401, "AVAILABLE", 42),
(502, 202, 402, "AVAILABLE", 28),
(503, 203, 403, "AVAILABLE", 32),
(504, 204, 404, "UNAVAILABLE", 0),
(505, 205, 405, "AVAILABLE", 37),
(506, 207, 406, "AVAILABLE", 24),
(507, 208, 407, "AVAILABLE", 18);

SELECT * FROM Inventory;
SELECT * FROM Seller;
SELECT * FROM Product;

UPDATE Inventory
SET Stock = 20,
    AvailabilityStatus = "AVAILABLE"
WHERE InventoryID = 504;

SELECT * FROM Inventory
WHERE InventoryID = 504;

UPDATE Inventory
SET Stock = 0,
    AvailabilityStatus = "UNAVAILABLE"
WHERE InventoryID = 506;

SELECT * FROM Inventory
WHERE InventoryID = 506;

UPDATE Inventory
SET Stock = 30,
    AvailabilityStatus = "AVAILABLE"
WHERE InventoryID = 507;

SELECT * FROM Inventory
WHERE InventoryID = 507;

UPDATE Seller
SET ContactNo = "9123456780"
WHERE SellerID = 405;

SELECT * FROM Seller
WHERE SellerID = 405;

DELETE FROM Inventory
WHERE InventoryID = 508;

SELECT * FROM Inventory;

SELECT * FROM Inventory
WHERE AvailabilityStatus = "AVAILABLE";

SELECT * FROM Inventory
WHERE AvailabilityStatus = "UNAVAILABLE";

SELECT COUNT(*) FROM Inventory
WHERE AvailabilityStatus = "AVAILABLE";

SELECT COUNT(*) FROM Inventory
WHERE AvailabilityStatus = "UNAVAILABLE";

SELECT * FROM Inventory
ORDER BY Stock DESC;

SELECT * FROM Inventory;
SELECT * FROM Seller;