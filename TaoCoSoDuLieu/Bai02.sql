/*Bài 2: Khóa chính và khóa ngoại
- Cú pháp CONSTRAINT fk_name
          FORGEIN KEY (name_primary_key cần nối)
		  REFERENCES Table nối(name_pimary_key cần nối)
  -> Contrain nó dùng để đặt tên cái nối khóa ngoại này, sau này muốn xóa khóa ngoại thì dùng tên này để xóa
*/
/*1. Tạo database quản lý cửa hàng
Có Bảng Customers
	CustomerId (PK)
	Name
	Phone
   Bảng Orders
    OrderId
	OrderDate
	TotalAmount
	CustomerId (FK)
*/
CREATE DATABASE StoreManagement;
USE StoreManagement;
CREATE TABLE Customers(
CustomerId INT PRIMARY KEY,
Name VARCHAR,
Phone VARCHAR
);
CREATE TABLE Orders (
OrderId INT PRIMARY KEY,
OrderDate DATE,
TotalAmount INT,
CustomerId INT, 
CONSTRAINT fk_Customer
FOREIGN KEY (CustomerId)
REFERENCES Customers(CustomerId)
);

/*2. Từ database CompanyManagement
Tạo bảng Departments 
	DepartmentId (PK)
	DepartmentName
bảng employee đã có rồi nên tạo tiếp khóa khóa nối vào
dùng cú pháp 
	ALTER TABLE bảng cần thêm
	ADD CONSTRAINT fk_tên nối
	FORIEGN KEY (tên cột bảng nối)
	REFERENCES tên bảng nối(tên cột nối)
*/
USE CompanyManagement;
CREATE TABLE Departments (
DepartmentId INT PRIMARY KEY,
DepartmentName VARCHAR
);
ALTER TABLE Employees 
ADD DepartmentId INT,
CONSTRAINT fk_department
FOREIGN KEY (DepartmentId)
REFERENCES Departments(DepartmentId)

/*3. Từ database StoreManagement 
Tạo bảng Categories
	CategoryId
	CategoryName 
Tạo bảng Products
	ProductId
	ProductName
	Price
	CategoryId 
*/
USE StoreManagement
CREATE TABLE Categories(
CategoryId INT PRIMARY KEY,
CategoryName VARCHAR
);
CREATE TABLE Products (
ProductId INT PRIMARY KEY,
ProductName VARCHAR,
Price DECIMAL(10,2),
CategoryId INT,
CONSTRAINT fk_categories
FOREIGN KEY (CategoryId)
REFERENCES Categories(CategoryId)
);
/*4. Tạo database quản lý trường học
Tạo bảng Teachers
	TeacherId
	TeacherName
Tạo bảng Classes
	ClassId
	ClassName
	TeacherId
*/
CREATE DATABASE SchoolManagement;
USE SchoolManagement;
CREATE TABLE Teachers (
TeacherId INT PRIMARY KEY,
TeacherName VARCHAR
)
CREATE TABLE Classes (
ClassId INT PRIMARY KEY,
ClassName VARCHAR,
TeacherId INT
CONSTRAINT fk_teacher
FOREIGN KEY (TeacherId)
REFERENCES Teachers(TeacherId)
);