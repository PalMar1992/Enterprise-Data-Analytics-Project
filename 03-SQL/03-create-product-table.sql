USE enterprise_sales;

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductPrice DECIMAL(10,2) CHECK (ProductPrice >= 0),
    Brand VARCHAR(100),
    Model VARCHAR(100),
    Supplier VARCHAR(100)
);