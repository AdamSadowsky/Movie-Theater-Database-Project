USE MovieTheater;

-- Customers
INSERT INTO Customers (CustomerID, CustomerName, DOB) VALUES
(1, 'Alice Johnson', '2000-05-14'),
(2, 'Brian Lee', '1998-09-21'),
(3, 'Carlos Smith', '2002-11-30');

-- Employees
INSERT INTO Employees (EmployeeID, EmployeeName, DOB, Salary) VALUES
(101, 'Emma Davis', '1990-03-12', 42000.00),
(102, 'Noah Brown', '1988-07-19', 45000.00);

-- Movies
INSERT INTO Movies (MovieID, MovieTitle) VALUES
(201, 'Avengers: Endgame'),
(202, 'Inception'),
(203, 'Spider-Man: No Way Home'),
(205, 'The Batman');  -- included for your operations.sql

-- Auditoriums
INSERT INTO Auditoriums (AuditoriumID, Capacity) VALUES
(301, 100),
(302, 80);

-- Showings
INSERT INTO Showings (ShowingID, AuditoriumID, MovieID, EmployeeID, Date, Time) VALUES
(401, 301, 201, 101, '2026-04-25', '18:00:00'),
(402, 302, 202, 102, '2026-04-25', '20:00:00');

-- Payments
INSERT INTO Payments (PaymentID, ShowingID, CustomerID, Cost, MethodOfPayment) VALUES
(501, 401, 1, 12.99, 'Credit Card'),
(502, 401, 2, 12.99, 'Cash'),
(503, 402, 3, 10.99, 'Debit Card');