/* Gộp nhiều bảng 
	- INNER JOIN: dùng để kết hợp các hàng từ hai (hoặc nhiều) bảng lại với nhau, dựa trên một điều kiện chung 
	(thường là các giá trị trùng nhau ở cột khóa chính và khóa ngoại). Nếu một hàng ở bảng A không tìm thấy hàng nào 
	khớp ở bảng B (và ngược lại), hàng đó sẽ bị loại bỏ và không xuất hiện trong kết quả cuối cùng
	- Cú pháp sử dụng INNER JOIN
		SELECT select_list FROM T1
		INNER JOIN T2 ON join_predicate;
*/

/*Tạo database StoreManagement và tạo bảng Customers với dữ liệu sau
	CustomerId, FullName, City
	Chèn vào các dữ liệu sau
	(1,N'Nguyễn Văn A',N'Hà Nội'),
	(2,N'Trần Thị B',N'Hải Phòng'),
	(3,N'Lê Văn C',N'Hồ Chí Minh'),
	(4,N'Phạm Thị D',N'Đà Nẵng'),
	(5,N'Hoàng Văn E',N'Cần Thơ');
  Tạo tiếp bảng Orders với dữ liệu sau
	OrderId, CustomerId, OrderDate, Total Money
	Chèn vào dữ liệu sau
	(101,1,'2026-01-10',250000),
	(102,1,'2026-02-15',800000),
	(103,2,'2026-03-20',150000),
	(104,3,'2026-04-12',500000),
	(105,5,'2026-05-18',900000);
*/
CREATE DATABASE StoreManagement
USE StoreManagement;
CREATE TABLE Customers (
CustomerId INT PRIMARY KEY,
FullName NVARCHAR(100),
City NVARCHAR(50));

CREATE TABLE Orders(
OrderId INT PRIMARY KEY,
OrderDate DATE,
TotalMoney DECIMAL(10,2),
CustomerId INT,
CONSTRAINT fk_customer
FOREIGN KEY (CustomerId)
REFERENCES Customers(CustomerId)
)

INSERT INTO Customers(CustomerId, FullName, City)
VALUES 
(1,N'Nguyễn Văn A',N'Hà Nội'),
(2,N'Trần Thị B',N'Hải Phòng'),
(3,N'Lê Văn C',N'Hồ Chí Minh'),
(4,N'Phạm Thị D',N'Đà Nẵng'),
(5,N'Hoàng Văn E',N'Cần Thơ');

INSERT INTO Orders
VALUES
(101,'2026-01-10',250000,1),
(102,'2026-02-15',800000,1),
(103,'2026-03-20',150000,2),
(104,'2026-04-12',500000,3),
(105,'2026-05-18',900000,5);

/*1. Hiển thị thông tin của hai bảng bằng inner join*/
SELECT * FROM Customers
INNER JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId

/*2. Hiển thị thông tin cột FullName và OrderDate bằng inner join*/
SELECT FullName, OrderDate FROM Customers
INNER JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId;

/*3. Hiển thị thông tin FullName và TotalMoney bằng inner join*/
SELECT FullName, TotalMoney FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId

/*4. Hiển thị City và OrderDate bằng inner join*/
SELECT City, OrderDate FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId;

/*5. Hiển thị CustomerId, FullName, OrderId*/
SELECT Customers.CustomerId, FullName, OrderId FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId;

/*6. Hiển thị FullName, OrderId, TotalMoney bằng inner join*/
SELECT FullName, OrderId, TotalMoney FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId;

/*7. Lấy các đơn hàng của khách hàng ở Hà Nội*/
SELECT OrderDate, TotalMoney, City FROM Orders
INNER JOIN Customers 
ON Orders.CustomerId = Customers.CustomerId
WHERE City = N'Hà Nội';

/*8. Hiển thị khách hàng có TotalMoney lớn hơn 500000*/
SELECT Customers.CustomerId, FullName, City, TotalMoney FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId
WHERE TotalMoney > 500000;

/*9. Hiển thị khách hàng có đơn trong tháng 2*/
SELECT Customers.CustomerId, FullName, City, OrderDate FROM Customers
INNER JOIN Orders
ON Customers.CustomerId = Orders.CustomerId
WHERE MONTH(OrderDate) = 2;

/*10. Lấy đơn hàng của khách hàng ở Cần Thơ*/
SELECT OrderDate, TotalMoney, City FROM Orders
INNER JOIN Customers 
ON Orders.CustomerId = Customers.CustomerId
WHERE City = N'Cần Thơ';

/*11. Lấy khách hàng có đơn hàng totalMoney theo thứ tự giảm dần*/
SELECT Customers.CustomerId, FullName, City, TotalMoney FROM Customers
INNER JOIN Orders
ON Orders.CustomerId = Customers.CustomerId
ORDER BY TotalMoney DESC;

/*12. Hiển thị khách hàng có đơn hàng theo ngày đặt hàng mới nhất, nghĩa là ngày mới nhất được đưa lên trước giảm dần*/
SELECT Customers.CustomerId, FullName, City, OrderDate FROM Customers
INNER JOIN Orders
ON Orders.CustomerId = Customers.CustomerId
ORDER BY OrderDate DESC;

/*13. Hiển thị 3 khách hàng có đơn hàng lớn nhất*/
SELECT TOP 3 Customers.CustomerId, FullName, City, TotalMoney FROM Customers
INNER JOIN Orders
ON Orders.CustomerId = Customers.CustomerId
ORDER BY TotalMoney DESC;

/*14. Hiển thị Lấy khách hàng ở Hà Nội có đơn hàng trên 500000*/
SELECT TOP 3 Customers.CustomerId, FullName, City, TotalMoney FROM Customers
INNER JOIN Orders
ON Orders.CustomerId = Customers.CustomerId
WHERE City = N'Hà Nội' AND TotalMoney > 500000;

