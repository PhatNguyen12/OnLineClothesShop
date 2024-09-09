CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    name VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(20)
);
CREATE TABLE Product_Category (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    category_name VARCHAR(100)
);
CREATE TABLE Product (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    description TEXT,
    image VARCHAR(255),
    name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT,
    product_category_id INT,
    FOREIGN KEY (product_category_id) REFERENCES Product_Category(id)
);
CREATE TABLE Shopping_Cart (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    transaction_id_user INT,
    transaction_id_merchant INT,
    shop_order_id INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
CREATE TABLE Shopping_Cart_Item (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    quantity INT,
    product_id INT,
    shopping_cart_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (shopping_cart_id) REFERENCES Shopping_Cart(id)
);
CREATE TABLE Shipping (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    price DECIMAL(10, 2)
);
CREATE TABLE Shop_Order (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date_order DATETIME DEFAULT GETDATE(),
    total_price DECIMAL(10, 2),
    status_order NVARCHAR(50),
    address_shipping NVARCHAR(255),
    shipping_id INT,
    user_id INT,
    FOREIGN KEY (shipping_id) REFERENCES Shipping(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Payment (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date_payment DATETIME DEFAULT GETDATE(),
    method_payment NVARCHAR(50),
    shopping_cart_id INT,
    user_id INT,
    FOREIGN KEY (shopping_cart_id) REFERENCES Shopping_Cart(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
