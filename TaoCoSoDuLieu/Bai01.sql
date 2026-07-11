/*Bài 1: Tạo database và table*/

/*1. Tạo database có tên quản lý sinh viên
 có bảng student với các trường dữ liệu sau:
  StudentId(PK)
  FullName
  BirthDate
  Gender
  Address
  Email
  Phone
*/
CREATE DATABASE StudentManagement;
USE StudentManagement;
CREATE TABLE Students(
 StudentId INT PRIMARY KEY,
 FullName VARCHAR,
 BirthDate DATE,
 Address VARCHAR,
 Email VARCHAR,
 Phone VARCHAR
);

/*2. Tạo database Quản lý sản phẩm
Có bảng Products
	ProductId (PK)
    ProductName
    Price
    Quantity
    Description
*/
CREATE DATABASE ProductManagement;
USE ProductManagement;
CREATE TABLE Products(
  ProductId INT PRIMARY KEY,
  ProductName VARCHAR,
  Price DECIMAL(10,2),
  Quantity INT,
  Description VARCHAR
);
/*3. Tạo database Quản lý công ty
Có bảng Employees 
    EmployeeId
    FullName
    Position
    Salary
    HireDate
    Phone
*/
CREATE DATABASE CompanyManagement;
USE CompanyManagement;
CREATE TABLE Employees(
EmployeeId INT,
FullName VARCHAR,
Position VARCHAR,
Salary DECIMAL(10,2),
HireDay DATE,
Phone VARCHAR
)
