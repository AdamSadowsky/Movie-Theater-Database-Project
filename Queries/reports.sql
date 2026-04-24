USE MovieTheater;

-- ========================
-- SEARCH / FILTER QUERIES
-- ========================

SELECT *
FROM Movies
WHERE MovieTitle LIKE '%Spider%';

SELECT 
    s.ShowingID,
    m.MovieTitle,
    a.AuditoriumID,
    s.Date,
    s.Time
FROM Showings s
JOIN Movies m ON s.MovieID = m.MovieID
JOIN Auditoriums a ON s.AuditoriumID = a.AuditoriumID
WHERE s.Date = '2026-04-25';

SELECT *
FROM Payments
WHERE MethodOfPayment = 'Credit Card';


-- ========================
-- REPORT QUERIES
-- ========================

-- Report 1: Total revenue by movie
SELECT 
    m.MovieTitle,
    COUNT(p.PaymentID) AS TicketsSold,
    SUM(p.Cost) AS TotalRevenue
FROM Payments p
JOIN Showings s ON p.ShowingID = s.ShowingID
JOIN Movies m ON s.MovieID = m.MovieID
GROUP BY m.MovieTitle
ORDER BY TotalRevenue DESC;

-- Report 2: Showing availability
SELECT 
    s.ShowingID,
    m.MovieTitle,
    s.Date,
    s.Time,
    a.AuditoriumID,
    a.Capacity,
    COUNT(p.PaymentID) AS TicketsSold,
    a.Capacity - COUNT(p.PaymentID) AS SeatsAvailable
FROM Showings s
JOIN Movies m ON s.MovieID = m.MovieID
JOIN Auditoriums a ON s.AuditoriumID = a.AuditoriumID
LEFT JOIN Payments p ON s.ShowingID = p.ShowingID
GROUP BY 
    s.ShowingID,
    m.MovieTitle,
    s.Date,
    s.Time,
    a.AuditoriumID,
    a.Capacity
ORDER BY s.Date, s.Time;

-- Report 3: Payment totals by method
SELECT 
    MethodOfPayment,
    COUNT(PaymentID) AS NumberOfPayments,
    SUM(Cost) AS TotalCollected
FROM Payments
GROUP BY MethodOfPayment
ORDER BY TotalCollected DESC;