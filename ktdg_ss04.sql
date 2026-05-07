CREATE DATABASE ShopManager;
USE ShopManager;

CREATE TABLE Categories(
	category_id int primary key auto_increment,
    category_name varchar(100) not null unique
);

CREATE TABLE Products(
	product_id int primary key auto_increment,
    product_name varchar(100) not null unique,
	price int not null,
    stock int,
    category_id int,
    foreign key (category_id) references Categories(category_id)
);
-- 1. Thêm dữ liệu
INSERT INTO Categories(category_name)
VALUE ('Điện tử'), ('Thời trang');

INSERT INTO Products(product_name, price, stock, category_id)
VALUE ('iPhone 15', '25000000', '10', '1'),
	  ('Samsung S23', '20000000', '5', '1'),
      ('Áo sơ mi nam', '500000', '50', '2'),
      ('Giày thể thao','1200000', '20', '2');
      
-- 2. Cập nhật
-- Cập nhật giá của sản phẩm "iPhone 15" lên thành 26,000,000
UPDATE Products
SET price = '26000000'
WHERE product_id = 1;

-- Tăng số lượng tồn kho (stock) thêm 10 đơn vị cho tất cả các sản phẩm thuộc danh mục "Điện tử"
-- UPDATE Products
-- SET stock 
-- WHERE Categories = 'Điện tử';

-- 3. Xóa
-- Xóa sản phẩm có product_id = 4
DELETE FROM Products
WHERE product_id = 4;

-- Xóa tất cả các sản phẩm có giá nhỏ hơn 1,000,000.
DELETE FROM Products
WHERE price < 1000000;

-- 4. Select
-- Lấy ra tất cả các danh mục sản phẩm trong bảng Categories
SELECT * FROM Categories;
-- Lấy ra tất cả sản phẩm có trong bảng Products.
SELECT * FROM Products;
-- Lấy ra giá trị sản phẩm lớn nhất, nhỏ nhất, trung bình, tổng
SELECT max(p.price) as 'max_price', min(p.price), avg(p.price), sum(p.price)
FROM Products p;
