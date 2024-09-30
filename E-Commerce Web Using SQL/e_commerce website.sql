USE `e-commerce_db`;

#Create table and Insert the Values in the table

CREATE TABLE Category (
    CAT_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    CAT_NAME VARCHAR(20) NOT NULL);
    
CREATE TABLE Product(
	PRO_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
	PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT(10),
    FOREIGN KEY (CAT_ID) REFERENCES Category (CAT_ID));
    
CREATE TABLE Supplier(
	SUPP_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
	SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL);
    
CREATE TABLE Supplier_Pricing(
	PRICING_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
	PRO_ID INT(10),
    SUPP_ID INT(10),
    SUPPLIER_PRICE INT DEFAULT NULL,
    FOREIGN KEY (PRO_ID) REFERENCES Product (PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES Supplier (SUPP_ID));
    
CREATE TABLE Customer(
	CUS_ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(15) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    GENDER CHAR(1) NOT NULL,
    CHECK (GENDER IN ('M', 'F', 'O', 'U')));
    
CREATE TABLE Orders(
	ORD_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT(10),
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES Customer (CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES Supplier_Pricing (PRICING_ID));
    
CREATE TABLE Rating(
	RAT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORD_ID INT(5),
    RATING_STARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES Orders (ORD_ID));


INSERT INTO Category (CAT_NAME) VALUES
('Books'),
('Games'),
('Groceries'),
('Electronics'),
('Clothes');

INSERT INTO Product (PRO_NAME, PRO_DESC, CAT_ID) VALUES
('GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
('TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
('ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
('OATS', 'Highly Nutritious from Nestle', 3),
('HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
('MILK', '1L Toned MIlk', 3),
('Boat Earphones', '1.5Meter long Dolby Atmos', 4),
('Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
('Project IGI', 'compatible with windows 7 and above', 2),
('Hoodie', 'Black GUCCI for 13 yrs and above', 5),
('Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
('Train Your Brain', 'By Shireen Stephen', 1);

INSERT INTO Supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES
('Rajesh Retails','Delhi','1234567890'),
('Appario Ltd.','Mumbai','2589631470'),
('Knome products','Banglore','9785462315'),
('Bansal Retails','Kochi','8975463285'),
('Mittal Ltd.','Lucknow','7898456532');

INSERT INTO Supplier_Pricing (PRO_ID, SUPP_ID, SUPPLIER_PRICE) VALUES
(1, 2, 1500),
(3, 5, 30000),
(5, 1, 3000),
(2, 3, 2500),
(4, 1, 1000),
(12, 2, 780),
(12, 4, 789),
(3, 1, 31000),
(1, 5, 1450),
(4, 2, 999),
(7, 3, 549),
(7, 4, 529),
(6, 2, 105),
(6, 1, 99),
(2, 5, 2999),
(5, 2, 2999);

ALTER TABLE Customer MODIFY
GENDER CHAR(1);

INSERT INTO Customer (CUS_NAME, CUS_PHONE, CUS_CITY, GENDER) VALUES
('AAKASH','9999999999','DELHI','M'),
('AMAN','9785463215','NOIDA','M'),
('NEHA','9999999999','MUMBAI','F'),
('MEGHA','9994562399','KOLKATA','F'),
('PULKIT','7895999999','LUCKNOW','M');

ALTER TABLE Orders MODIFY COLUMN ORD_ID INT(5);

INSERT INTO Orders (ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES
(1500, '2021-10-06', 2, 1),
(1000, '2021-10-12', 3, 5),
(30000, '2021-09-16', 5, 2),
(1500, '2021-10-05', 1, 1),
(3000, '2021-08-16', 4, 3),
(1450, '2021-08-18', 1, 9),
(789, '2021-09-01', 3, 7),
(780, '2021-09-07', 5, 6),
(3000, '2021-09-10', 5, 3),
(2500, '2021-09-10', 2, 4),
(1000, '2021-09-15', 4, 5),
(789, '2021-09-16', 4, 7),
(31000, '2021-09-16', 1, 8),
(1000, '2021-09-16', 3, 5),
(3000, '2021-09-16', 5, 3),
(99, '2021-09-17', 2, 14);

INSERT INTO Rating (ORD_ID, RATING_STARS) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 4),
(6, 3),
(7, 4),
(8, 4),
(9, 3),
(10, 5),
(11, 3),
(12, 4),
(13, 2),
(14, 1),
(15, 1),
(16, 0);