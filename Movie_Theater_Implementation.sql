USE MovieTheater;

CREATE TABLE IF NOT EXISTS Customers (
	CustomerID int primary key,
    CustomerName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Auditoriums (
	AuditoriumID int primary key,
    Capacity int NOT NULL,
    CHECK (Capacity > 0)
);

CREATE TABLE IF NOT EXISTS Movies (
	MovieID int primary key,
    MovieTitle VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees (
	EmployeeID int primary key,
    EmployeeName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    CHECK (Salary > 0)
);

CREATE TABLE IF NOT EXISTS Showings (
	ShowingID int primary key,
    AuditoriumID int NOT NULL,
    MovieID int NOT NULL,
    EmployeeID int NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    FOREIGN KEY (AuditoriumID) REFERENCES Auditoriums(AuditoriumID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Payments (
	PaymentID int primary key,
    ShowingID int NOT NULL,
    CustomerID int NOT NULL,
    Cost DECIMAL(5,2) NOT NULL,
    CHECK (Cost > 0),
    MethodOfPayment VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShowingID) REFERENCES Showings(ShowingID)
);

