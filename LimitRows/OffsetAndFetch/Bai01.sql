/*Truy vấn giới hạn số lượng dòng 
- Sử dụng mệnh đề OFFSET và FETCH để cho phép giới hạn số lượng dòng dùng để truy vấn, 
- Bắt buộc phải kết hợp sử dụng với mệnh đề ORDER BY để lấy số lượng dòng theo yêu cầu
- Cú pháp sử dụng 
	ORDER BY column_list [ASC |DESC]
	OFFSET offset_row_count {ROW | ROWS}
	FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY
 + Mệnh đề này OFFSET chỉ định số lượng hàng cần bỏ qua trước khi bắt đầu trả về các hàng từ truy vấn. 
 Giá trị này offset_row_countcó thể là một hằng số, biến số hoặc tham số lớn hơn hoặc bằng không
 + Mệnh đề này FETCH chỉ định số lượng hàng cần trả về sau khi OFFSET mệnh đề đã được xử lý. 
 Giá trị này offset_row_countcó thể là một hằng số, biến số hoặc một số vô hướng lớn hơn hoặc bằng một
 + Mệnh đề này OFFSET là bắt buộc, trong khi FETCH mệnh đề kia là tùy chọn. 
 Ngoài ra, FIRST và NEXT là từ đồng nghĩa và có thể được sử dụng thay thế cho nhau. 
 Tương tự, có thể sử dụng ROW và ROWS thay thế cho nhau
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

/*1. Hiển thị danh sách tất cả sinh viên nhưng bỏ qua 2 dòng đầu tiên*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 2 ROWS;
/*-> nếu không dùng tiếp FETCH thì nó sẽ lấy hết từ tiếp theo đến cuối danh sách*/

/*2. Hiển thị danh sách sinh viên nhưng bỏ qua 5 dòng đầu tiên*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 5 ROWS;

/*3. Hiển thị danh sách sinh viên được sắp xếp theo điểm tăng dần rồi bỏ qua 3 dòng đầu*/
SELECT * FROM Students
ORDER BY Score 
OFFSET 3 ROWS;

/*4. Hiển thị danh sách sinh viên được sắp xếp theo tuổi giảm dần và bỏ qua 1 dòng*/
SELECT * FROM Students
ORDER BY Age DESC
OFFSET 1 ROW;

/*5. Hiển thị danh sách sinh viên được sắp xếp theo thành phố và bỏ qua 6 dòng*/
SELECT * FROM Students
ORDER BY City 
OFFSET 6 ROWS;

/*6. Hiển thị danh sách 3 sinh viên đầu tiên*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 0 ROW
FETCH FIRST 3 ROWS ONLY;

/*7 Hiên thị danh sách ra 5 sinh viên đầu tiên*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 0 ROW
FETCH FIRST 5 ROWS ONLY;

/*8 Hiển thị danh sách 2 sinh viên có điểm cao nhất*/
SELECT * FROM Students
ORDER BY Score DESC
OFFSET 0 ROW
FETCH FIRST 2 ROWS ONLY;

/*9 Hiển thị danh sách sinh viên bỏ qua 2 dòng đâu và lấy 3 dòng tiếp theo*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;

/*10 Hiển thị danh sách sinh viên bỏ qua 5 dòng đầu và lấy 5 dòng tiếp theo*/
SELECT * FROM Students
ORDER BY StudentId
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

/*11 Hiển thị danh sách sinh viên sắp xếp theo điểm giảm dần, bỏ qua 3 dòng rồi lấy tiếp 4 dòng.*/
SELECT * FROM Students
ORDER BY Score DESC
OFFSET 3 ROWS
FETCH NEXT 4 ROWS ONLY;

/*12. => Áp OFFSET và FETCH để phân trang khi làm API*/

/*13.Hiển thị sinh viên điểm trên 8, sắp xếp theo điểm giảm dần, bỏ qua 1 dòng rồi lấy 3 dòng.*/
SELECT * FROM Students
WHERE Score > 8
ORDER BY Score DESC
OFFSET 1 ROW
FETCH NEXT 3 ROWS ONLY;

/*14. Hiển thị sinh viên không ở Hà Nội, sắp xếp theo tên, bỏ qua 3 dòng rồi lấy 4 dòng.*/
SELECT * FROM Students
WHERE City NOT LIKE N'%Hà Nội%'
ORDER BY FullName 
OFFSET 3 ROWS
FETCH NEXT 4 ROWS ONLY;