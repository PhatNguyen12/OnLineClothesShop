CREATE TABLE Users (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    address NVARCHAR(255),
    email NVARCHAR(100) UNIQUE,
    phone NVARCHAR(20),
    username NVARCHAR(50) UNIQUE,
    password NVARCHAR(255),
    role NVARCHAR(20)
);

CREATE TABLE ProductCategory (
    productCategoryId INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100)
);

CREATE TABLE Product (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    description NVARCHAR(MAX),
    image NVARCHAR(255),
    name NVARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT,
    productCategoryId INT,
    FOREIGN KEY (productCategoryId) REFERENCES ProductCategory(productCategoryId)
);

CREATE TABLE ShoppingCart (
    shoppingCartId INT IDENTITY(1,1) PRIMARY KEY,
    transactionIdUser INT,
    transactionIdMerchant INT,
    shopOrderId INT,
    userId INT,
    FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE ShoppingCartItem (
    shoppingCartItemId INT IDENTITY(1,1) PRIMARY KEY,
    quantity INT,
    productId INT,
    shoppingCartId INT,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (shoppingCartId) REFERENCES ShoppingCart(shoppingCartId)
);

CREATE TABLE Shipping (
    shippingId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE ShopOrder (
    shopOrderId INT IDENTITY(1,1) PRIMARY KEY,
    dateOrder DATETIME DEFAULT GETDATE(),
    totalPrice DECIMAL(10, 2),
    statusOrder NVARCHAR(50),
    addressShipping NVARCHAR(255),
    shippingId INT,
    userId INT,
    FOREIGN KEY (shippingId) REFERENCES Shipping(shippingId),
    FOREIGN KEY (userId) REFERENCES Users(userId)
);


CREATE TABLE Payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    datePayment DATETIME DEFAULT GETDATE(),
    methodPayment NVARCHAR(50),
    shoppingCartId INT,
    userId INT,
    FOREIGN KEY (shoppingCartId) REFERENCES ShoppingCart(shoppingCartId),
    FOREIGN KEY (userId) REFERENCES Users(userId)
);
