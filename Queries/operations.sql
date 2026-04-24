USE MovieTheater;

-- ========================
-- INSERT OPERATIONS
-- ========================

INSERT INTO Customers (CustomerID, CustomerName, DOB)
VALUES (10, 'Michael Green', '2001-04-18');

SELECT * FROM Customers WHERE CustomerID = 10;

INSERT INTO Movies (MovieID, MovieTitle)
VALUES (210, 'Oppenheimer');

SELECT * FROM Movies WHERE MovieID = 210;

INSERT INTO Showings (ShowingID, AuditoriumID, MovieID, EmployeeID, Date, Time)
VALUES (410, 301, 210, 101, '2026-04-28', '19:00:00');

SELECT * FROM Showings WHERE ShowingID = 410;

INSERT INTO Payments (PaymentID, ShowingID, CustomerID, Cost, MethodOfPayment)
VALUES (510, 410, 10, 12.50, 'Credit Card');

SELECT * FROM Payments WHERE PaymentID = 510;


-- ========================
-- UPDATE OPERATIONS
-- ========================

UPDATE Customers
SET CustomerName = 'Michael Greene'
WHERE CustomerID = 10;

SELECT * FROM Customers WHERE CustomerID = 10;

UPDATE Movies
SET MovieTitle = 'Oppenheimer (IMAX)'
WHERE MovieID = 210;

SELECT * FROM Movies WHERE MovieID = 210;

UPDATE Showings
SET Time = '19:30:00'
WHERE ShowingID = 410;

SELECT * FROM Showings WHERE ShowingID = 410;


-- ========================
-- DELETE OPERATIONS
-- ========================

DELETE FROM Payments
WHERE PaymentID = 510;

SELECT * FROM Payments WHERE PaymentID = 510;

DELETE FROM Showings
WHERE ShowingID = 410;

SELECT * FROM Showings WHERE ShowingID = 410;

DELETE FROM Movies
WHERE MovieID = 210;

SELECT * FROM Movies WHERE MovieID = 210;

DELETE FROM Customers
WHERE CustomerID = 10;

SELECT * FROM Customers WHERE CustomerID = 10;