CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    Country VARCHAR(100),
    RegistrationDate DATETIME DEFAULT GETDATE(),
    LastLogin DATETIME,
    IsActive BIT DEFAULT 1
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country, LastLogin)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345', 'USA', '2024-05-24 10:30:00'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St', 'Otherville', 'NY', '54321', 'USA', '2024-05-25 15:45:00'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Oak St', 'Somecity', 'TX', '67890', 'USA', '2024-05-24 18:20:00');

select * from Customers

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country, LastLogin)
VALUES 
    -- India
    (4, 'Ravi', 'Patel', 'ravi.patel@example.com', '91-9876543210', '456 Gandhi Rd', 'Mumbai', 'MH', '400001', 'India', '2024-05-23 09:15:00'),
    (5, 'Priya', 'Sharma', 'priya.sharma@example.com', '91-9998887776', '789 Tagore St', 'Delhi', 'DL', '110001', 'India', '2024-05-24 11:30:00'),
    (6, 'Arun', 'Kumar', 'arun.kumar@example.com', '91-8887776665', '123 Nehru St', 'Chennai', 'TN', '600001', 'India', '2024-05-22 14:45:00'),
    -- Canada
    (7, 'Michael', 'Johnson', 'michael.johnson@example.com', '1-123-456-7890', '123 Maple Ave', 'Toronto', 'ON', 'M1M 1M1', 'Canada', '2024-05-23 16:30:00'),
    (8, 'Emily', 'Clark', 'emily.clark@example.com', '1-987-654-3210', '456 Oak St', 'Vancouver', 'BC', 'V6B 1E8', 'Canada', '2024-05-24 08:45:00'),
    (9, 'Daniel', 'Lavoie', 'daniel.lavoie@example.com', '1-888-777-6666', '789 Pine Rd', 'Montreal', 'QC', 'H1A 1A1', 'Canada', '2024-05-23 12:00:00'),
    -- Uganda
    (10, 'Joseph', 'Kiwere', 'joseph.kiwere@example.com', '+256-777-123456', '123 Kampala St', 'Kampala', 'Kampala', '256', 'Uganda', '2024-05-22 10:15:00'),
    (11, 'Sara', 'Nakato', 'sara.nakato@example.com', '+256-999-888777', '456 Entebbe Rd', 'Entebbe', 'Wakiso', '256', 'Uganda', '2024-05-24 15:30:00'),
    (12, 'Peter', 'Ogwal', 'peter.ogwal@example.com', '+256-888-777666', '789 Jinja Rd', 'Jinja', 'Jinja', '256', 'Uganda', '2024-05-23 09:45:00');

select * from Customers where Country = 'India'
