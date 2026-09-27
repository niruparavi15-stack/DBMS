USE FRESHBASKET;

CREATE TABLE Payment
(
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMode VARCHAR(20),
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);

INSERT INTO Payment VALUES
(801, 601, "UPI", "2026-09-21", 1300, "SUCCESSFUL"),
(802, 602, "CARD", "2026-09-22", 840, "SUCCESSFUL"),
(803, 603, "CASH", "2026-09-23", 360, "FAILED"),
(804, 604, "UPI", "2026-09-24", 280, "SUCCESSFUL"),
(805, 605, "CARD", "2026-09-25", 270, "SUCCESSFUL"),
(806, 606, "CASH", "2026-09-26", 150, "FAILED"),
(807, 607, "UPI", "2026-09-27", 240, "SUCCESSFUL");

SELECT * FROM Payment;

UPDATE Payment
SET PaymentStatus = "SUCCESSFUL"
WHERE PaymentID = 803;

SELECT * FROM Payment
WHERE PaymentStatus = "SUCCESSFUL";

SELECT * FROM Payment
WHERE PaymentStatus = "FAILED";

SELECT * FROM Payment
WHERE PaymentMode = "UPI";

SELECT * FROM Payment
WHERE PaymentMode = "CARD";

SELECT * FROM Payment
WHERE PaymentMode = "CASH";

SELECT PaymentMode, COUNT(*) AS NoOfTransactions
FROM Payment
GROUP BY PaymentMode;

SELECT PaymentMode, SUM(PaymentAmount) AS TotalAmountReceived
FROM Payment
WHERE PaymentStatus = "SUCCESSFUL"
GROUP BY PaymentMode;