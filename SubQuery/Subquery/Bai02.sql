/* Truy vấn con (Subquery)   
	- Subquery: là một truy vấn được lồng ghép bên trong một câu lệnh khác
	- SQL server hỗ trợ lồng tối đa 32 truy vấn còn
	- Có thể sử dụng truy vấn con ở nhiều nơi:
		+ Thay thế cho một biểu thức
		+ Với IN hoặc NOT IN
		+ Với ANY hoặc ALL
		+ Với EXISTS hoặc NOT EXISTS
		+ Trong UPDATE, DELETE, hoặc INSERT câu phát biểu
		+ Trong FROM điều khoản
*/
/*
Tạo bảng dư liệu Deparments
	DepartmentId,DepartmentName, 
Chèn vào dữ liệu
	(1,N'IT'),
	(2,N'Kế toán'),
	(3,N'Nhân sự'),
	(4,N'Kinh doanh');
Tạo bảng dữ liệu Employees
	EmployeeId, EmployeeName, DepartmentId, Salary
Chèn vào dữ liệu
	(1,N'An',1,1500),
	(2,N'Bình',1,1800),
	(3,N'Chi',2,1200),
	(4,N'Dũng',2,2500),
	(5,N'Lan',3,1700),
	(6,N'Mai',4,2200),
	(7,N'Nam',4,2700);
*/

CREATE TABLE Departments(
	DepartmentId INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);
INSERT INTO Departments
VALUES
(1,N'IT'),
(2,N'Kế toán'),
(3,N'Nhân sự'),
(4,N'Kinh doanh');

CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    DepartmentId INT,
    Salary MONEY
);
INSERT INTO Employees
VALUES
(1,N'An',1,1500),
(2,N'Bình',1,1800),
(3,N'Chi',2,1200),
(4,N'Dũng',2,2500),
(5,N'Lan',3,1700),
(6,N'Mai',4,2200),
(7,N'Nam',4,2700);

/*Luyện tập 2: Subquery với IN và NOT IN khi nghĩa là khi subquery trả về hơn 1 kết quả*/

/*1. Hiển thị nhân viên thuộc phòng IT hoặc Kế toán.*/
SELECT * FROM Employees
WHERE DepartmentId IN (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'IT' OR DepartmentName = N'Kế toán');

/*2. Hiển thị nhân viên không thuộc phòng IT.*/
SELECT * FROM Employees
WHERE DepartmentId NOT IN (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'IT');

/*3. Hiển thị nhân viên thuộc các phòng có DepartmentId > 2.*/
SELECT * FROM Employees
WHERE DepartmentId > (SELECT DepartmentId FROM Departments WHERE DepartmentId = 2);

/*4. Hiển thị phòng ban có nhân viên.*/
SELECT * FROM Departments
WHERE DepartmentId IN (SELECT DepartmentId FROM Employees WHERE DepartmentId IS NOT NULL);

/*5. Hiển thị phòng ban không có nhân viên.*/
SELECT * FROM Departments
WHERE DepartmentId NOT IN (SELECT DepartmentId FROM Employees WHERE DepartmentId IS NOT NULL);

/*6. Hiển thị nhân viên thuộc các phòng có tên bắt đầu bằng "K".*/
SELECT * FROM Employees
WHERE DepartmentId IN (SELECT DepartmentId FROM Departments WHERE DepartmentName LIKE N'K%'); 

/*7. Hiển thị nhân viên không thuộc các phòng bắt đầu bằng "K".*/
SELECT * FROM Employees
WHERE DepartmentId IN (SELECT DepartmentId FROM Departments WHERE DepartmentName NOT LIKE N'K%'); 

/*8. Hiển thị nhân viên thuộc phòng Nhân sự hoặc Kinh doanh.*/
SELECT * FROM Employees
WHERE DepartmentId IN (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'Nhân sự' OR DepartmentName = N'Kinh doanh'); 

/*9. Hiển thị phòng ban không có nhân viên lương trên 2000*/
SELECT * FROM Departments
WHERE DepartmentId NOT IN (SELECT DepartmentId FROM Employees WHERE Salary > 2000);

