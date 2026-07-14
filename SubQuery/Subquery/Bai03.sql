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

/*Luyện tập 4: Subquery với các lệnh update, insert, delete*/
/*1. Tăng lương 10% cho nhân viên phòng IT.*/
UPDATE Employees
SET Salary = Salary + (Salary * 10 / 100)
WHERE DepartmentId = (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'IT'); 

/*2. Tăng lương 5% cho nhân viên có lương thấp hơn trung bình.*/
UPDATE Employees
SET Salary = Salary + (Salary *5/100)
WHERE Salary < (SELECT AVG(Salary) FROM Employees)

/*3. Xóa nhân viên thuộc phòng nhân sự*/
DELETE Employees
WHERE DepartmentId = (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'Nhân sự')

/*4. Xóa nhân viên thuộc phòng có DepartmentId lớn nhất.*/
DELETE Employees
WHERE DepartmentId = (SELECT MAX(DepartmentId) FROM Departments);  

/*5. Thêm một nhân viên mới vào phòng IT bằng cách dùng subquery lấy DepartmentId*/
INSERT INTO Employees (EmployeeId,EmployeeName, DepartmentId, Salary)
VALUES (8,N'Hải',(SELECT DepartmentId FROM Departments WHERE DepartmentName = N'IT'), 2000);


