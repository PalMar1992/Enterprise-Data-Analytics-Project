USE enterprise_sales;

CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),

    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (OrderID)
        REFERENCES `Order`(OrderID),

    CONSTRAINT fk_orderitem_product
        FOREIGN KEY (ProductID)
        REFERENCES Product(ProductID)
);