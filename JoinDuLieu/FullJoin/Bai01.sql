/* Gộp nhiều bảng 
	- FULL JOIN: dùng để kết hợp các hàng từ hai (hoặc nhiều) bảng lại với nhau, trả về một tập hợp kết quả bao gồm 
	các hàng từ cả bảng bên trái và bảng bên phải
	- Khi không có hàng nào khớp với hàng trong bảng bên trái, các cột của bảng bên phải sẽ chứa giá trị rỗng NULL
	- Tương tự, khi không có hàng nào khớp với hàng trong bảng bên phải, cột của bảng bên trái sẽ chứa giá trị rỗng NULL
	- Cú pháp sử dụng FULL JOIN
		SELECT select_list FROM T1
		FULL JOIN T2 ON join_predicate;

*/

/*Tạo database StoreManagement và tạo bảng Customers với dữ liệu sau
	CustomerId, FullName, City
	Chèn vào các dữ liệu sau
	(1,N'Nguyễn Văn A',N'Hà Nội'),
	(2,N'Trần Thị B',N'Hải Phòng'),
	(3,N'Lê Văn C',N'Hồ Chí Minh'),
	(4,N'Phạm Thị D',N'Đà Nẵng'),
	(5,N'Hoàng Văn E',N'Cần Thơ');
	(6, N'Đặng Văn F', N'Huế'),
	(7, N'Lâm Thị G', N'Nha Trang');
  Tạo tiếp bảng Orders với dữ liệu sau
	OrderId, CustomerId, OrderDate, Total Money
	Chèn vào dữ liệu sau
	(101,1,'2026-01-10',250000),
	(102,1,'2026-02-15',800000),
	(103,2,'2026-03-20',150000),
	(104,3,'2026-04-12',500000),
	(105,5,'2026-05-18',900000);
	(106, 10, '2026-06-01', 450000),
	(107, 11, '2026-06-10', 300000);
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
(6, N'Đặng Văn F', N'Huế'),
(7, N'Lâm Thị G', N'Nha Trang');

INSERT INTO Orders
VALUES
(101,'2026-01-10',250000,1),
(102,'2026-02-15',800000,1),
(103,'2026-03-20',150000,2),
(104,'2026-04-12',500000,3),
(105,'2026-05-18',900000,5);
(106,'2026-06-01', 450000,NULL),
(107,'2026-06-10', 300000,NULL);




