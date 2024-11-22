-- -- Data for Role table
INSERT INTO Role (role)
VALUES ('ADMIN'),
       ('SELLER'),
       ('BUYER');
--
-- -- Insert Users
INSERT INTO users (username, email, password, role_id)
VALUES ('admin', 'admin@miu.edu', '$2a$12$IKEQb00u5QpZMx4v5zMweu.3wrq0pS7XLCHO4yHZ.BW/yvWu1feo2', 1),
       ('seller', 'seller@miu.edu', '$2a$12$IKEQb00u5QpZMx4v5zMweu.3wrq0pS7XLCHO4yHZ.BW/yvWu1feo2', 2),
       ('buyer','buyer@miu.edu', '$2a$12$IKEQb00u5QpZMx4v5zMweu.3wrq0pS7XLCHO4yHZ.BW/yvWu1feo2', 3);

-- Insert Sellers
INSERT INTO seller (user_id, is_approved)
VALUES (2, false);

-- Insert Buyers
INSERT INTO buyer (user_id)
VALUES (3);


-- Insert Attributes
INSERT INTO Attribute (name, value) VALUES ('color', 'Black');
INSERT INTO Attribute (name, value) VALUES ('color', 'Red');
INSERT INTO Attribute (name, value) VALUES ('color', 'White');
INSERT INTO Attribute (name, value) VALUES ('color', 'Blue');
INSERT INTO Attribute (name, value) VALUES ('color', 'Green');
INSERT INTO Attribute (name, value) VALUES ('color', 'Gold');
INSERT INTO Attribute (name, value) VALUES ('color', 'Silver');
INSERT INTO Attribute (name, value) VALUES ('color', 'Space Gray');
INSERT INTO Attribute (name, value) VALUES ('color', 'Purple');

INSERT INTO Attribute (name, value) VALUES ('branch', 'Apple');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Samsung');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Huawei');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Xiaomi');
INSERT INTO Attribute (name, value) VALUES ('branch', 'OnePlus');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Sony');
INSERT INTO Attribute (name, value) VALUES ('branch', 'LG');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Google');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Nokia');
INSERT INTO Attribute (name, value) VALUES ('branch', 'AT&T');
INSERT INTO Attribute (name, value) VALUES ('branch', 'Verizon');
INSERT INTO Attribute (name, value) VALUES ('branch', 'T-Mobile');

-- Insert Products
INSERT INTO Product (name, description, price, quantity, image_url, seller_id)
VALUES 
('iPhone 16 Pro Max 256GB Desert Titanium', 'Built for Apple Intelligence with stunning titanium design and A18 Pro chip.', 999.99, 10, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 Pro 128GB Starlight', 'Experience the power of the A18 Pro chip and 4K 120 fps video recording.', 899.99, 15, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 512GB Midnight', 'Built for everyday performance with 5G and A18 Bionic chip.', 849.99, 20, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 Mini 128GB Blue', 'Compact design with the power of A18 Bionic chip and advanced dual cameras.', 699.99, 30, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 Pro Max 1TB Gold', 'The ultimate iPhone experience with up to 1TB storage and premium titanium finish.', 1399.99, 5, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 Pro Max 256GB Graphite', 'Stylish graphite titanium design with A18 Pro chip and ProMotion technology.', 999.99, 8, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 256GB Red', 'Bold Product Red edition with stunning performance and all-day battery life.', 799.99, 12, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1),
('iPhone 16 Pro Max 256GB Silver', 'Silver titanium finish with best-in-class cameras and 120Hz refresh rate.', 999.99, 10, 'https://i5.walmartimages.com/seo/Verizon-iPhone-16-Pro-Max-256GB-Desert-Titanium-Apple-Intelligence_2a3b7743-c254-4ea6-807e-173340f9184b.24f9f58f9c3d33fa07c0d1921bca65a1.jpeg', 1);


-- Product 1 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(1, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(1, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 2 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(2, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(2, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Gold'));

-- Product 3 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(3, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(3, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 4 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(4, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(4, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 5 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(5, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(5, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 6 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(6, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(6, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 7 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(7, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(7, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

-- Product 8 Attributes
INSERT INTO Product_Attributes (products_id, attributes_id)
VALUES 
(8, (SELECT id FROM Attribute WHERE name = 'branch' AND value = 'Apple')),
(8, (SELECT id FROM Attribute WHERE name = 'color' AND value = 'Silver'));

