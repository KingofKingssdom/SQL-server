/*Câu lệnh SELECT
- Sử dụng truy vấn dữ liệu theo từng cột 
	=> SELECT ColumnName1, ColumnName2, FROM TableName
- Sử dụng truy vấn tất cả các cột 
	=> SELECT * FROM TableName
- Sử dụng truy vấn với điều kiện
	=> SELECT * FROM WHERE điều kiện
- Sử dụng DISTINCT truy vấn dữ liệu không trung lặp
*/



/*Tạo database SchoolManagement và tạo bảng students với các thông tin sau
	StudentId, FullName, Age, Gender, City, Score,
	Chèn vào các dữ liệu sau
	(1,N'Nguyễn Văn A',20,N'Nam',N'Hà Nội',8.5),
	(2,N'Trần Thị B',19,N'Nữ',N'Hải Phòng',7.2),
	(3,N'Lê Văn C',22,N'Nam',N'Hồ Chí Minh',9.1),
	(4,N'Phạm Thị D',21,N'Nữ',N'Đà Nẵng',6.8),
	(5,N'Hoàng Văn E',20,N'Nam',N'Hà Nội',5.5),
	(6,N'Đỗ Thị F',23,N'Nữ',N'Hà Nội',8.0),
	(7,N'Vũ Văn G',19,N'Nam',N'Hải Phòng',4.9),
	(8,N'Bùi Thị H',22,N'Nữ',N'Cần Thơ',9.5),
	(9,N'Nguyễn Văn I',21,N'Nam',N'Hồ Chí Minh',7.9),
	(10,N'Lý Thị K',20,N'Nữ',N'Đà Nẵng',6.5);

*/
CREATE TABLE Students(
StudentId INT PRIMARY KEY,
FullName NVARCHAR(100),
Age INT,
Gender NVARCHAR(10),
City NVARCHAR(50),
Score FLOAT);
INSERT INTO Students
VALUES
(1,'Nguyễn Văn A',20,'Nam','Hà Nội',8.5),
(2,'Trần Thị B',19,'Nữ','Hải Phòng',7.2),
(3,'Lê Văn C',22,'Nam','Hồ Chí Minh',9.1),
(4,'Phạm Thị D',21,'Nữ','Đà Nẵng',6.8),
(5,'Hoàng Văn E',20,'Nam','Hà Nội',5.5),
(6,'Đỗ Thị F',23,'Nữ','Hà Nội',8.0),
(7,'Vũ Văn G',19,'Nam','Hải Phòng',4.9),
(8,'Bùi Thị H',22,'Nữ','Cần Thơ',9.5),
(9,'Nguyễn Văn I',21,'Nam','Hồ Chí Minh',7.9),
(10,'Lý Thị K',20,'Nữ','Đà Nẵng',6.5);
/*Lưu ý thêm dữ liệu muốn lưu được tiếng việt phải thêm chữ N trước nháy đơn*/ 

/*1. Truy vấn dữ liệu thành phố không trùng*/
SELECT DISTINCT city FROM Students;

/*2. Truy vấn dữ liệu các điểm không trùng*/
SELECT DISTINCT Score FROM Students;

/*3. Truy vấn dữ liệu city và gender không trùng*/
SELECT DISTINCT City, Gender FROM Students;
/*Lưu ý nếu truy vấn theo trùng lặp từ 2 cột trở lên nó sẽ áp dụng và vừa không trùng cột này và không trùng cột kia*/
