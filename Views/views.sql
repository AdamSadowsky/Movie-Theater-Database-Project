USE MovieTheater;

DROP VIEW IF EXISTS ShowingAvailability;
DROP VIEW IF EXISTS PaymentReport;

-- ========================
-- VIEW 1: SHOWING AVAILABILITY
-- ========================

CREATE VIEW ShowingAvailability AS
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
    a.Capacity;

SELECT * FROM ShowingAvailability;


-- ========================
-- VIEW 2: PAYMENT REPORT
-- ========================

CREATE VIEW PaymentReport AS
SELECT 
    m.MovieTitle,
    COUNT(p.PaymentID) AS NumberOfPayments,
    SUM(p.Cost) AS TotalRevenue
FROM Payments p
JOIN Showings s ON p.ShowingID = s.ShowingID
JOIN Movies m ON s.MovieID = m.MovieID
GROUP BY m.MovieTitle;

SELECT * FROM PaymentReport;