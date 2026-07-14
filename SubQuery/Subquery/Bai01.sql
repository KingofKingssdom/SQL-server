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

/*Luyện tập 1: Subquery thay thế cho một biểu thức (Scalar Subquery): nghĩa là thay thế cho kết quả đúng 1 giá trị*/

/*1. Hiển thị nhân viên có mức lương cao nhất. */
SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

/*2. Hiển thị nhân viên có mức lương thấp nhất*/
SELECT * FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

/*3. Hiển thị nhân viên có lương lớn hơn lương trung bình.*/
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

/*4. Hiển thị nhân viên có lương nhỏ hơn lương trung bình.*/
SELECT * FROM Employees
WHERE Salary < (SELECT AVG(Salary) FROM Employees);

/*5. Hiển thị nhân viên thuộc phòng ban có DepartmentId lớn nhất.*/
SELECT * FROM Employees
WHERE DepartmentId = (SELECT MAX(DepartmentId) FROM Employees)

/*6. Hiển thị phòng ban có DepartmentId nhỏ nhất.*/
SELECT * FROM Employees
WHERE DepartmentId = (SELECT MIN(DepartmentId) FROM Employees)

/*7. Hiển thị nhân viên có lương cao hơn lương của An.*/
SELECT * FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE EmployeeName = N'An')

/*8. Hiển thị nhân viên có lương thấp hơn lương của Dũng.*/
SELECT * FROM Employees
WHERE Salary < (SELECT Salary FROM Employees WHERE EmployeeName = N'Dũng')

/*9. Hiển thị nhân viên thuộc phòng IT.*/
SELECT * FROM Employees
WHERE DepartmentId = (SELECT DepartmentId FROM Departments WHERE DepartmentName = N'IT');
