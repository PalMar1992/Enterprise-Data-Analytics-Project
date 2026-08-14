# Data Model

## Business Purpose
The data model supports an end-to-end enterprise analytics platform for analyzing sales, customers, products and suppliers.

## Entities

### Customer
The Customer entity represents a customer who can place one or more orders.

**Primary Key:** CustomerID

**Attributes:**
- CustomerID
- CustomerName
- Address
- Email
- Phone
- Country

### Order
The Order entity represents a customer order.

**Primary Key:** OrderID

**Foreign Keys:**
- CustomerID → Customer.CustomerID

**Attributes:**
- OrderID
- CustomerID
- OrderDate

### OrderItem
The OrderItem entity represents a specific product included in an order.

**Primary Key:** OrderItemID

**Foreign Keys:**
- OrderID → Order.OrderID
- ProductID → Product.ProductID

**Attributes:**
- OrderItemID
- OrderID
- ProductID
- Quantity
- UnitPrice

### Product
The Product entity represents a product that can be sold to customers.

**Primary Key:** ProductID

**Attributes:**
- ProductID
- ProductPrice
- Brand
- Model
- Supplier

### Campaign

The Campaign entity represents a marketing or sales campaign that can apply to multiple products and customers.

**Primary Key:** CampaignID

**Attributes:**
- CampaignID
- CampaignName
- StartDate
- EndDate

### CampaignProduct

The CampaignProduct entity represents the relationship between a campaign and a product and defines the discount applied to a product within a campaign.

**Primary Key:** (CampaignID, ProductID)

**Foreign Keys:**
- CampaignID → Campaign.CampaignID
- ProductID → Product.ProductID

**Attributes:**
- CampaignID
- ProductID
- DiscountType
- DiscountValue

### CustomerCampaign

The CustomerCampaign entity represents the relationship between a customer and a campaign and defines a customer-specific discount.

**Primary Key:** (CustomerID, CampaignID)

**Foreign Keys:**
- CustomerID → Customer.CustomerID
- CampaignID → Campaign.CampaignID

**Attributes:**
- CustomerID
- CampaignID
- DiscountType
- DiscountValue

## Relationships

### Customer → Order

One customer can place multiple orders, but each order belongs to exactly one customer.

**Relationship:** 1:N

**Foreign Key:** Order.CustomerID → Customer.CustomerID

### Order → OrderItem
One order can contain multiple order items, but each order item belongs to exactly one order.

**Relationship:** 1:N

**Foreign Key:** OrderItem.OrderID → Order.OrderID

### Product → OrderItem
One product can be included in multiple order items, but each order item refers to exactly one product.

**Relationship:** 1:N

**Foreign Key:** OrderItem.ProductID → Product.ProductID

### Campaign → CampaignProduct
One campaign can apply to multiple products, but each campaign product record belongs to exactly one campaign.

**Relationship:** 1:N

**Foreign Key:** CampaignProduct.CampaignID → Campaign.CampaignID

### Product → CampaignProduct
One product can participate in multiple campaigns, but each campaign product record refers to exactly one product.

**Relationship:** 1:N

**Foreign Key:** CampaignProduct.ProductID → Product.ProductID

### Customer → CustomerCampaign
One customer can participate in multiple campaigns, but each customer campaign record belongs to exactly one customer.

**Relationship:** 1:N

**Foreign Key:** CustomerCampaign.CustomerID → Customer.CustomerID

### Campaign → CustomerCampaign
One campaign can apply to multiple customers, but each customer campaign record belongs to exactly one campaign.

**Relationship:** 1:N

**Foreign Key:** CustomerCampaign.CampaignID → Campaign.CampaignID

### OrderItem → OrderItemDiscount
One order item can have multiple discounts applied, but each order item discount belongs to exactly one order item.

**Relationship:** 1:N

**Foreign Key:** OrderItemDiscount.OrderItemID → OrderItem.OrderItemID

### Campaign → OrderItemDiscount
One campaign can be applied to multiple order items, but each order item discount refers to exactly one campaign.

**Relationship:** 1:N

**Foreign Key:** OrderItemDiscount.CampaignID → Campaign.CampaignID

## Business Rules
- One customer can place multiple orders, but each order belongs to exactly one customer.
- One order can contain multiple order items, but each order item belongs to exactly one order.
- One product can be included in multiple order items, but each order item refers to exactly one product.
- Each order item refers to exactly one product.
- Each order item belongs to exactly one order.

## Business Questions
- What was the revenue during a given period?
- Which products are ordered the most and the least?
- During which periods does order volume increase?
- Which countries generate the most orders?
- Which suppliers are associated with the highest sales?

## Future Extensions
The data model may later be extended with campaign and discount management, including campaign-product relationships, customer-specific campaigns and transaction-level discounts.