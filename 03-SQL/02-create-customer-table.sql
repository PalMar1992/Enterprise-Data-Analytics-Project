USE enterprise_sales;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(30),
    Country VARCHAR(100)
);