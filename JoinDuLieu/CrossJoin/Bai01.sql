/* Gộp nhiều bảng 
	- SELF JOIN: là việc JOIN một bảng với chính nó.
	- Được dùng khi một bản ghi trong bảng có liên quan đến một bản ghi khác trong chính bảng đó. 
	- Để dễ hình dung thì thực chất 1 bảng đó nó tách ra 2 bảng để có thể join 
	- Khi hình dung ra 2 bảng thì thì cỏ Inner join và left join dùng trong self join này 
	 Ví dụ: 
	 Trong bảng có nhân viên và nhân viên có quản lý từ trong chính bảng đó
	- Cú pháp sử dụng CROSS JOIN
		SELECT select_list FROM T t1
		[INNER | LEFT]  JOIN T t2 
		ON join_predicate; 
		Truy vấn tham chiếu đến bảng T hai lần. Các bí danh của bảng t1 được t2 sử dụng để gán cho bảng T 
		các tên khác nhau trong truy vấn.
*/


/*Sử dụng self join để truy vấn dữ liệu phân cấp*/
/*Tạo bảng Employees
EmployeeId, EmployeeName, ManagerId
Chèn các dữ liệu sau 
(1,N'Giám đốc',NULL),
(2,N'An',1),
(3,N'Bình',1),
(4,N'Chi',2),
(5,N'Dũng',2),
(6,N'Lan',3),
(7,N'Mai',3),
(8,N'Nam',5);

Quan hệ phân cấp
Giám đốc
│
├── An
│   ├── Chi
│   └── Dũng
│       └── Nam
│
└── Bình
    ├── Lan
    └── Mai
*/
USE CompanyManagement;
CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    ManagerId INT NULL
);
INSERT INTO Employees
VALUES
(1,N'Giám đốc',NULL),
(2,N'An',1),
(3,N'Bình',1),
(4,N'Chi',2),
(5,N'Dũng',2),
(6,N'Lan',3),
(7,N'Mai',3),
(8,N'Nam',5);

/*1. Hiển thị tên nhân viên và tên quản lý*/
SELECT e.EmployeeName, m.EmployeeName AS[Người quản lý] FROM Employees e
INNER JOIN Employees m 
ON m.EmployeeId = e.ManagerId;

/*2. Hiển thị mã nhân viên, tên nhân viên và tên ng quản lý*/
SELECT e.EmployeeId, e.EmployeeName, m.EmployeeName AS [Người quản lý] FROM Employees e
INNER JOIN Employees m
ON m.EmployeeId = e.ManagerId;

/*3. Hiển thị tên nhân viên, mã quản lý, tên người quản lý*/
SELECT  e.EmployeeName, m.EmployeeId AS[Mã người quản lý], m.EmployeeName AS [Người quản lý] FROM Employees e
INNER JOIN Employees m
ON m.EmployeeId = e.ManagerId;