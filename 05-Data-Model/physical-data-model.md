# Physical Data Model

## Database
**Database Name:** enterprise_sales

**Purpose:** Store and manage enterprise sales transaction data.

## Tables

### Customer
**Primary Key:** CustomerID

| Column | Data Type | Constraints |
|---|---|---|
| CustomerID | INT | PRIMARY KEY |
| CustomerName | VARCHAR(100) | NOT NULL |
| Address | VARCHAR(255) | |
| Email | VARCHAR(255) | |
| Phone | VARCHAR(30) | |
| Country | VARCHAR(100) | |

### Order
**Primary Key:** OrderID

**Foreign Key:** CustomerID → Customer.CustomerID

| Column | Data Type | Constraints |
|---|---|---|
| OrderID | INT | PRIMARY KEY |
| CustomerID | INT | NOT NULL, FOREIGN KEY |
| OrderDate | DATE | NOT NULL |

### OrderItem
**Primary Key:** OrderItemID

**Foreign Keys:**
- OrderID → Order.OrderID
- ProductID → Product.ProductID

| Column | Data Type | Constraints |
|---|---|---|
| OrderItemID | INT | PRIMARY KEY |
| OrderID | INT | NOT NULL, FOREIGN KEY |
| ProductID | INT | NOT NULL, FOREIGN KEY |
| Quantity | INT | NOT NULL, CHECK (Quantity > 0) |
| UnitPrice | DECIMAL(10,2) | NOT NULL, CHECK (UnitPrice >= 0) |

### Product
**Primary Key:** ProductID

| Column | Data Type | Constraints |
|---|---|---|
| ProductID | INT | PRIMARY KEY |
| ProductPrice | DECIMAL(10,2) | CHECK (ProductPrice >= 0) |
| Brand | VARCHAR(100) | |
| Model | VARCHAR(100) | |
| Supplier | VARCHAR(100) | |

## Data Types
| Data Type | Purpose |
|---|---|
| INT | Whole numbers and identifiers |
| VARCHAR(n) | Variable-length text |
| DATE | Calendar dates |
| DECIMAL(10,2) | Precise decimal values, used for monetary amounts |

## Constraints
| Constraint | Purpose |
|---|---|
| PRIMARY KEY | Uniquely identifies each record |
| FOREIGN KEY | Enforces relationships between tables |
| NOT NULL | Prevents missing values |
| CHECK | Ensures that column values satisfy a defined condition |

## Relationships
### Customer → Order

**Relationship:** 1:N

**Foreign Key:** Order.CustomerID → Customer.CustomerID

### Order → OrderItem

**Relationship:** 1:N

**Foreign Key:** OrderItem.OrderID → Order.OrderID

### Product → OrderItem

**Relationship:** 1:N

**Foreign Key:** OrderItem.ProductID → Product.ProductID