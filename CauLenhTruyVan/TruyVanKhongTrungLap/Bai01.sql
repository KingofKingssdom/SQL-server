/*Câu lệnh SELECT
- Sử dụng truy vấn dữ liệu theo từng cột 
	=> SELECT ColumnName1, ColumnName2, FROM TableName
- Sử dụng truy vấn tất cả các cột 
	=> SELECT * FROM TableName
- Sử dụng truy vấn với điều kiện
	=> SELECT * FROM WHERE điều kiện
- Sử dụng DISTINCT truy vấn dữ liệu không trung lặp
- Hay kết hợp với các toán tử WHERE, AND, OR, LIKE, IN, BETWEEN, ORDER BY, TOP để truy vấn sâu hơn
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

/*1. Truy vấn dữ liệu sinh viên có điểm lớn hơn 7 và sống ở Hà Nội*/
SELECT * FROM Students
WHERE Score > 7 AND City = N'Hà Nội';

/*2. Truy vấn dữ liệu sinh viên có điểm từ 7 đến 9 và có giới tính Nam*/
SELECT * FROM Students
WHERE Score BETWEEN 7 AND 9 AND Gender = N'Nam';

/*3. Truy vấn dữ liệu sinh viên có tên chứa Nguyễn và điểm trên 8*/
SELECT * FROM Students
WHERE FullName Like N'%Nguyễn%' AND Score > 8;

/*4. Truy vấn dữ liệu sinh viên là nữ và sống ở Hà Nội hoặc Hải Phòng*/
SELECT * FROM Students
WHERE Gender = N'Nữ' AND (City = N'Hà Nội' OR City = N'Hải Phòng');

/*5. Truy vấn dữ liệu tuổi từ 20 đến 22 và điểm trên 8*/
SELECT * FROM Students
WHERE Age BETWEEN 20 AND 22 AND Score > 8;

/*6. Truy vấn dữ liệu không ở Hà Nội và điểm dưới 7*/
SELECT * FROM Students
WHERE City NOT LIKE N'%Hà Nội%' AND Score < 7;

/*7. Truy vấn dữ liệu có điểm cao nhất không dùng Hàm Max*/
SELECT TOP 1 * FROM Students ORDER BY Score DESC;

/*8. Truy vấn dữ liệu có điểm thấp nhất không dùng hàm Min*/
SELECT TOP 1 * FROM Students ORDER BY Score ASC;

/*9. Truy vấn dữ liệu 5 sinh viên có điểm cao nhất*/
SELECT TOP 5 * FROM Students ORDER BY Score DESC;

/*10. Truy vấn dữ liệu 3 sinh viên trẻ tuổi nhất*/
SELECT TOP 3 * FROM Students ORDER BY Age;

/*11. Truy vấn dữ liệu sinh viên có điểm trên trung bình và sống ở Hà Nội*/
SELECT * FROM Students
WHERE Score > 5 AND City = N'Hà Nội';

/*12. Truy vấn dữ liệu sinh viên nữ có điểm từ 7 đến 9, sắp xếp giảm dần*/
SELECT * FROM Students
WHERE Gender = N'Nữ' AND Score BETWEEN 7 AND 9 
ORDER BY Score DESC;

/*13. Lấy 5 sinh viên có điểm cao nhất và chỉ hiển thị tên và điểm*/
SELECT TOP 5 FullName, Score FROM Students
ORDER BY Score DESC

/*14. Truy vấn các thành phố không trùng lặp và sắp theo thứ tự ABC*/
SELECT DISTINCT City FROM Students
ORDER BY City; 

/*15. Truy vấn dữ liệu sinh viên không ở Hà Nội và điểm trên 8*/
SELECT * FROM Students
WHERE City NOT LIKE N'%Hà Nội%' AND Score > 8;

