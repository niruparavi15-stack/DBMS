USE FRESHBASKET;

CREATE TABLE Review
(
    ReviewID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductID INT,
    ReviewText VARCHAR(200),
    ReviewDate DATE,
    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);

CREATE TABLE Rating
(
    RatingID INT PRIMARY KEY,
    ReviewID INT,
    Rating INT,
    FOREIGN KEY (ReviewID)
    REFERENCES Review(ReviewID)
);

INSERT INTO Review VALUES
(901, "ANJALI", 201, "Good quality rice", "2026-09-10"),
(902, "VIGNESH", 202, "Flour was fresh", "2026-09-11"),
(903, "KEERTHANA", 203, "Fresh and tasty apples", "2026-09-12"),
(904, "HARISH", 204, "Good bananas", "2026-09-13"),
(905, "POORNIMA", 205, "Carrots were fresh", "2026-09-14"),
(906, "DINESH", 207, "Good quality milk", "2026-09-15"),
(907, "SWATHI", 208, "Cheese tastes good", "2026-09-16");

-- 4. Insert Rating data
INSERT INTO Rating VALUES
(1001, 901, 5),
(1002, 902, 4),
(1003, 903, 5),
(1004, 904, 4),
(1005, 905, 5),
(1006, 906, 4),
(1007, 907, 5);

SELECT * FROM Review;

SELECT * FROM Rating;

SELECT * FROM Review
WHERE ProductID = 201;

SELECT * FROM Rating
WHERE Rating = 5;

SELECT * FROM Rating
WHERE Rating < 5;

UPDATE Review
SET ReviewText = "Excellent quality rice"
WHERE ReviewID = 901;

UPDATE Rating
SET Rating = 4
WHERE RatingID = 1004;

SELECT * FROM Rating
ORDER BY Rating DESC;

SELECT COUNT(*) AS TotalReviews
FROM Review;

SELECT AVG(Rating) AS AverageRating
FROM Rating;

SELECT R.CustomerName, R.ProductID, R.ReviewText, RT.Rating
FROM Review R
JOIN Rating RT
ON R.ReviewID = RT.ReviewID;