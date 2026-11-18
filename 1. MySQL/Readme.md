# I. Các kiểu dữ liệu trong MySQL
## 1. Numeric Data Types – Kiểu dữ liệu số

|Kiểu|Mô tả|Ví dụ|
|---|---|---|
|TINYINT|Số nguyên nhỏ|1100|
|SMALLINT|Số nguyên nhỏ hơn INT|1000|
|MEDIUMINT|Số nguyên trung bình|100000|
|INT / INTEGER|Số nguyên|1000000|
|BIGINT|Số nguyên lớn|999999999|
|FLOAT|Số thực gần đúng|10.5|
|DOUBLE|Số thực độ chính xác cao hơn FLOAT|10.12345|
|DECIMAL(M,D)|Số thập phân chính xác|100.50|

- Lưu ý:
    - Đối với tiền tệ, nên sử dụng DECIMAL thay vì FLOAT hoặc DOUBLE
    - Lý do: FLOAT và DOUBLE biểu diễn số thực theo dạng dấu phẩy động, có thể gây sai số.
## 2. String Data Types – Kiểu dữ liệu chuỗi

|Kiểu|Mô tả|
|---|---|
|CHAR(n)|Chuỗi có độ dài cố định|
|VARCHAR(n)|Chuỗi có độ dài thay đổi|
|TINYTEXT|Văn bản ngắn|
|TEXT|Văn bản|
|MEDIUMTEXT|Văn bản lớn|
|LONGTEXT|Văn bản rất lớn|
|BINARY(n)|Dữ liệu nhị phân cố định|
|VARBINARY(n)|Dữ liệu nhị phân thay đổi|
|BLOB|Dữ liệu nhị phân|

### Phân biệt CHAR và VARCHAR
|CHAR|VARCHAR|
|---|---|
|Độ dài cố định|Độ dài thay đổi|
|Có thể phù hợp với dữ liệu độ dài ổn định|Phù hợp với chuỗi có độ dài khác nhau|
|Ví dụ mã quốc gia|Ví dụ họ tên|

## 3. Date and Time Data Types

|Kiểu|Ý nghĩa|
|---|---|
|DATE|Ngày tháng|
|TIME|Giờ phút giây|
|DATETIME|Ngày và giờ|
|TIMESTAMP|Thời điểm có xử lý múi giờ|
|YEAR|Năm|

## 4. Kiểu dữ liệu Boolean
- MySQL có kiểu BOOLEAN và BOOL, nhưng thực chất chúng là alias của TINYINT(1).
- TRUE đại diện là 1
- FALSE đại diện là 

=> Kiểu dữ liệu sẽ đặt sau tên biến

# II. CÁC NHÓM LỆNH SQL
## 1. DDL – Data Definition Language
- DDL dùng để định nghĩa cấu trúc database.
- Các câu lệnh:
    - CREATE.
    - ALTER.
    - DROP.
    - TRUNCATE.
    - RENAME.

### CREATE DATABASE
```SQL
CREATE DATABASE Ecommerce; // tạo database
USE Ecommerce; // Chọn database
```
### CREATE TABLE
```SQL
CREATE TABLE Users (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Age INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
### Thêm cột 
```SQL
ALTER TABLE Users
ADD Phone VARCHAR(20);
```
###  Sửa kiểu dữ liệu
```SQL
ALTER TABLE Users
MODIFY Phone VARCHAR(30);
```
### Đổi tên cột 
```SQL
ALTER TABLE Users
RENAME COLUMN FullName TO Name;
```
### Xóa cột 
```SQL
ALTER TABLE Users
DROP COLUMN Phone;
```
### Xóa bảng
```SQL
TRUNCATE TABLE Users;
// Hoặc 
DELETE TABLE Users;
// Hoặc
DROP TABLE Users;
```
### Phân biệt DELETE, TRUNCATE và DROP

|Tiêu chí|DELETE|TRUNCATE|DROP|
|----|----|----|----|
|Xóa|Có|Có|Có|
|Giữ cấu trúc bảng|Có|Có|Không|
|WHERE|Có|Không|Không|
|Reset AUTO_INCREMENT|Không tự động|Có|Không còn bảng|
|Có thể ROLLBACK|Có, với InnoDB trong transaction|Không trong MySQL|Không trong MySQL|

- Lưu ý: TRUNCATE và DROP là DDL, có hành vi implicit commit trong MySQL. Không thể dùng ROLLBACK để hoàn tác chúng.

## 2. DML – Data Manipulation Language
- DML dùng để thao tác dữ liệu.
- Các lệnh chính:
    - INSERT.
    - UPDATE.
    - DELETE.
### Thêm dữ liệu
```SQL
INSERT INTO Users (FullName, Email, Age)
VALUES ('Nguyen Van A', 'a@gmail.com', 22);

// Thêm nhiều bản ghi
INSERT INTO Users (FullName, Email, Age)
VALUES
('Nguyen Van A', 'a@gmail.com', 22),
('Tran Van B', 'b@gmail.com', 25),
('Le Van C', 'c@gmail.com', 23);
```
### Cập nhập dữ liệu
```SQL
UPDATE Users
SET Age = 23
WHERE Id = 1;
```
- Lưu ý nếu thiếu cấu điều kiện WHERE cả bảng sẽ có thể bị cập nhập dữ liệu

## 3. DQL – Data Query Language
- DQL dùng để truy vấn dữ liệu.
- Câu lệnh chính: SELECT.

## 4. DCL – Data Control Language
- DCL dùng để quản lý quyền truy cập.
- Hai câu lệnh chính:
    - GRANT.
    - REVOKE.
### cấp quyên truy cập
```SQL
GRANT SELECT, INSERT, UPDATE
ON Ecommerce.*
TO 'app_user'@'localhost';
```
- Để dấu ```*``` nghĩa là ảnh hưởng toàn bộ bảng trong database còn nếu muốn một bảng cụ thể có thể chọc đến tên bảng đó
- ```app_user``` là tên user để phép cấp quyền, 
- ```@localhost``` là cho phép truy cập chỉ vào máy chủ nội bộ. Sau dấu ```@``` là cho phép truy cập vào máy chủ (tên server)

### Thu hồi quyền
```SQL
REVOKE INSERT
ON Ecommerce.*
FROM 'app_user'@'localhost';
```
## 5. TCL – Transaction Control Language
- TCL – Transaction Control Language
- Các câu lệnh:
    - START TRANSACTION.
    - COMMIT.
    - ROLLBACK.
    - SAVEPOINT.

```SQL
START TRANSACTION;

UPDATE Products
SET Quantity = Quantity - 1
WHERE Id = 1;

INSERT INTO Orders (UserId)
VALUES (1);

COMMIT;
```
- Nếu xảy ra lỗi
```SQL
ROLLBACK
```
# III. KEYS – CÁC LOẠI KHÓA TRONG MYSQL
## 1. Primary Key – Khóa chính
- Primary Key là khóa dùng để định danh duy nhất mỗi bản ghi trong bảng.
- Đặc điểm:
    - Không được trùng lặp.
    - Không được NULL.
    - Mỗi bảng chỉ có một Primary Key constraint.
    - Có thể gồm một hoặc nhiều cột.
- Câu lệnh SQL ví dụ
```SQL
CREATE TABLE Users (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255)
);
```
## 2. Foreign Key – Khóa ngoại
- Foreign Key dùng để tạo mối quan hệ giữa hai bảng, đảm bảo tính toàn vẹn tham chiếu (Referential Integrity).
- Câu lệnh SQL ví dụ
```SQL
CREATE TABLE Orders (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT,

    CONSTRAINT FK_Orders_Users
    FOREIGN KEY (UserId)
    REFERENCES Users(Id)
);
```
### ON DELETE và ON UPDATE
- MySQL hỗ trợ các hành vi khi bản ghi cha bị xóa hoặc cập nhật.
|Hành vi|Ý nghĩa|
|---|---|
|CASCADE|Tự động xóa/cập nhập bản ghi con|
|SET NULL|Đặt khóa ngoại thành Null|
|RESTRICT|Ngăn thao tác nếu có bản ghi con|
|NO ACTION|Với InnoDB, tương đương RESTRICT|

- Câu lệnh SQL ví dụ
```SQL
FOREIGN KEY (UserId)
REFERENCES Users(Id)
ON DELETE CASCADE
ON UPDATE CASCADE
```
## 3. Candidate Key – Khóa ứng viên
- Candidate Key là tập hợp một hoặc nhiều thuộc tính có thể định danh duy nhất mỗi bản ghi và không có thuộc tính dư thừa.
- Ví dụ bảng Users:
    - Id.
    - Email.
    - Username.
- Nếu cả ba đều duy nhất thì có thể là Candidate Key. Một Candidate Key được chọn làm Primary Key, những khóa còn lại có thể là Alternate Key.
## 4. Alternate Key – Khóa thay thế
- Là Candidate Key không được chọn làm Primary Key.
## 5. Composite Key – Khóa ghép
- Là khóa được tạo thành từ nhiều cột.
- Câu lệnh SQL ví dụ 
```SQL
CREATE TABLE UserRoles (
    UserId INT,
    RoleId INT,

    PRIMARY KEY (UserId, RoleId)
);
```
=> Cặp (UserId, RoleId) mới là khóa chính, không phải từng cột riêng biệt.
## 6. Unique Key – Khóa duy nhất
- Đảm bảo các giá trị trong cột hoặc nhóm cột không trùng lặp.
- Câu lệnh SQL ví dụ
```SQL
CREATE TABLE Users (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255) UNIQUE
);
```
### phân biệt Primary key và unique key

|Primary key|Unique key|
|---|---|
|Mỗi bảng có một Primary key duy nhất|Có thể có nhiều Unique key|
|Không cho phép Null|Cho phép nhiều giá trị NULL|
|Dùng định danh bảng ghi|Đảm bảo tính duy nhất|

## 7. Super Key
- Super Key là tập hợp một hoặc nhiều thuộc tính có thể xác định duy nhất một bản ghi.
- Ví dụ nếu Id là duy nhất thì:
    - {Id} là Super Key.
    - {Id, Email} cũng là Super Key.
- Nhưng {Id, Email} không phải Candidate Key vì có thuộc tính dư thừa.

# IV. CONSTRAINTS – CÁC RÀNG BUỘC DỮ LIỆU
- CONSTRAINTS – CÁC RÀNG BUỘC DỮ LIỆU
## 1. NOT NULL
- Không cho phép giá trị null
```SQL
FullName VARCHAR(255) NOT NULL
```
## 2. UNIQUE
- Không cho phép 1 cột có giá trị bị trùng
```SQL
Email VARCHAR(255) UNIQUE
```
## 3. CHECK 
- Kiểm tra điều kiện của dữ liệu
```SQL
CREATE TABLE Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Price DECIMAL(15,2) CHECK (Price >= 0),
    Quantity INT CHECK (Quantity >= 0)
);
```
## 4. DEFAULT
- Thiết lập giá trị mặc định
```SQL
CREATE TABLE Users (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
## 5. AUTO_INCREMENT
- Tự động tăng khi thêm bản ghi
```SQL
Id INT PRIMARY KEY AUTO_INCREMENT
```
# V. CÁC TOÁN TỬ LỌC VỚI ĐIỀU KIỆN
## 1. BETWEEN
- Lấy dữ liệu trong khoảng, bao gồm cả giá trị 2 biên luôn
```SQL
SELECT *
FROM Products
WHERE Price BETWEEN 1000000 AND 5000000;
```
## 2. IN
- Lấy dữ liệu trong bảng với giá trị chính xác
```SQL
SELECT *
FROM Products
WHERE CategoryId IN (1, 2, 3);
// Tưởng đương 
WHERE CategoryId = 1
OR CategoryId = 2
OR CategoryId = 3;
```

## 3. LIKE
- Tìm kiếm chuỗi theo mẫu.
- Hai ký tự đặc biệt:
    - %: Đại diện cho 0 hoặc nhiều ký tự.
    - _: Đại diện cho đúng một ký tự.
```SQL
SELECT *
FROM Products
WHERE Name LIKE '%Laptop%';
```
## 4. IS NULL và IS NOT NULL
- Vì NULL biểu thị giá trị không xác định, nên không thể so sánh bằng dấu =
```SQL
SELECT *
FROM Users
WHERE Phone IS NULL;
```
## 5. ORDER BY – Sắp xếp
- Sắp xếp các dòng theo thứ tự
```SQL
//  Tăng dần
SELECT *
FROM Products
ORDER BY Price ASC;
// Giảm dần
SELECT *
FROM Products
ORDER BY Price DESC;
// Sắp xếp nhiều cột 
SELECT *
FROM Products
ORDER BY CategoryId ASC, Price DESC;
```
## 6. LIMIT – Giới hạn dữ liệu
```SQL
// Lấy 10 dòng dữ liệu từ đầu đến 10
SELECT *
FROM Products
LIMIT 10;
// Bỏ qua 10 dòng dữ liệu đầu lấy từ sau 10 dòng dữ liệu đầu đến chỉ định
SELECT *
FROM Products
LIMIT 10 OFFSET 10;
```
## 7. Loại bỏ trùng lặp
- Bỏ những dữ liệu bị trùng lặp theo cột 
```SQL
SELECT DISTINCT CategoryId
FROM Products;
```
## 8. Bí danh
- Đặt tên cho các cột hoặc bảng 
```SQL
SELECT
    FullName AS UserName,
    Email AS UserEmail
FROM Users;
// Đặt tên cho bảng 
SELECT p.Name, p.Price
FROM Products AS p;
```
## 9. Gom nhóm dữ liệu
- GROUP BY dùng để gom các bản ghi có cùng giá trị thành từng nhóm.
```SQL
SELECT
    CategoryId,
    COUNT(*) AS TotalProducts
FROM Products
GROUP BY CategoryId;
```
## 10. Lọc nhóm dữ liệu
- HAVING dùng để lọc kết quả sau khi GROUP BY
```SQL
SELECT
    CategoryId,
    COUNT(*) AS TotalProducts
FROM Products
GROUP BY CategoryId
HAVING COUNT(*) > 10;
```
## 11. Các hàm Aggregate Function

|Hàm|Ý nghĩa|
|---|---|
|COUNT()|Đếm|
|SUM()|Tính tổng|
|AVG()|Trung bình|
|MIN()|Giá trị nhỏ nhất|
|MAX()|Giá trị lớn nhất|

```SQL
SELECT COUNT(*) FROM Products;

SELECT SUM(Price) FROM Products;

SELECT AVG(Price) FROM Products;

SELECT MIN(Price) FROM Products;

SELECT MAX(Price) FROM Products;
```
- Lưu ý:
    - COUNT(*) đếm số bản ghi.
    - COUNT(column) chỉ đếm các giá trị không NULL.
    - Các hàm SUM, AVG, MIN, MAX thường bỏ qua NULL.
# VI. JOIN – KẾT HỢP CÁC BẢNG

### Giả sử có 2 bảng
### Users
|Id|Name|
|---|---|
|1|An|
|2|Bình|
|3|Cường|
### Orders
|Id|UserId|Total|
|---|---|---|
|1|1|500000|
|2|1|300000|
|3|2|200000|

## 1. INNER JOIN
- Chỉ lấy các bản ghi có dữ liệu khớp ở cả hai bảng.
```SQL
SELECT
    u.Id,
    u.Name,
    o.Total
FROM Users u
INNER JOIN Orders o
ON u.Id = o.UserId;
```

Kết quả:

| Name | Total |
|---|---:|
| An | 500000 |
| An | 300000 |
| Bình | 200000 |

=> Cường không xuất hiện vì không có đơn hàng.

## 2. LEFT JOIN
- Lấy toàn bộ bản ghi của bảng bên trái và dữ liệu khớp từ bảng bên phải.

```SQL
SELECT
    u.Name,
    o.Total
FROM Users u
LEFT JOIN Orders o
ON u.Id = o.UserId;
```
=> Cường vẫn xuất hiện, nhưng Total là NULL.

## 3. RIGHT JOIN
- Lấy toàn bộ bản ghi bảng bên phải và dữ liệu khớp từ bảng bên trái.

```SQL
SELECT
    u.Name,
    o.Total
FROM Users u
RIGHT JOIN Orders o
ON u.Id = o.UserId;
```

## 4. CROSS JOIN

Tạo tích Descartes giữa hai bảng.

```SQL
SELECT *
FROM Users
CROSS JOIN Orders;
```
=> Nếu Users có 3 bản ghi và Orders có 3 bản ghi, kết quả có 9 dòng.

## 5. SELF JOIN
- JOIN một bảng với chính nó
### Bảng Employees
|Id|Name|ManagerId|
|---|---|---|
|1|An|NULL|
|2|Bình|1|
|3|Cường|1|

```SQL
SELECT
    e.Name AS Employee,
    m.Name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerId = m.Id;
```
## 6. FULL OUTER JOIN
- MySQL không hỗ trợ cú pháp FULL OUTER JOIN trực tiếp. Có thể mô phỏng bằng UNION
```SQL
SELECT *
FROM Users u
LEFT JOIN Orders o
ON u.Id = o.UserId

UNION

SELECT *
FROM Users u
RIGHT JOIN Orders o
ON u.Id = o.UserId;
```
# VII. SUBQUERY – TRUY VẤN CON
## 1. Subquery là gì?
- Subquery là câu truy vấn SQL nằm bên trong một câu truy vấn SQL khác.
- Ví dụ tìm sản phẩm có giá lớn hơn giá trung bình
```SQL
SELECT *
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);
```
=> Được thực thi để lấy giá trị trung bình, sau đó truy vấn bên ngoài sử dụng kết quả đó.
## 2. Subquery với IN
- Tìm những User dã có đơn hàng 
```SQL
SELECT *
FROM Users
WHERE Id IN (
    SELECT UserId
    FROM Orders
);
```
## 3. Subquery với EXISTS
- Kiểm tra xem có tồn tại bản ghi phù hợp hay không.
```SQL
SELECT *
FROM Users u
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.UserId = u.Id
);
```
=> EXISTS thường được sử dụng khi bạn chỉ cần kiểm tra sự tồn tại.
## 4. Correlated Subquery
- Là Subquery tham chiếu đến dữ liệu của truy vấn bên ngoài.
```SQL
SELECT *
FROM Products p
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE CategoryId = p.CategoryId
);
```
=> Truy vấn con phụ thuộc vào từng bản ghi của truy vấn ngoài

## 5. ANY và ALL
- ANY: Điều kiện đúng nếu thỏa mãn ít nhất một giá trị.
```SQL
SELECT *
FROM Products
WHERE Price > ANY (
    SELECT Price
    FROM Products
    WHERE CategoryId = 1
);
```
- ALL: Điều kiện phải đúng với tất cả giá trị.
```SQL
SELECT *
FROM Products
WHERE Price > ALL (
    SELECT Price
    FROM Products
    WHERE CategoryId = 1
);
```
# VIII. SET OPERATORS – TOÁN TỬ TẬP HỢP
## 1. UNION
- Kết hợp kết quả của nhiều SELECT và loại bỏ dòng trùng lặp.
```SQL
SELECT Email FROM Customers
UNION
SELECT Email FROM Employees;
```
## 2. UNION ALL
- Kết hợp kết quả nhưng giữ nguyên các dòng trùng lặp.
```SQL
SELECT Email FROM Customers
UNION ALL
SELECT Email FROM Employees;
```
# PHẦN IX. FUNCTION – CÁC HÀM CÓ SẴN TRONG MYSQL
## 1. String Functions
|Hàm|Ý nghĩa|
|---|---|
|CONCAT()|Nối chuỗi|
|LENGTH()|Độ dài theo byte|
|CHAR_LENGTH|Số kí tự|
|UPPER()|Chuyển thành chữ hoa|
|LOWER()|Chuyển thành chữ thường|
|SUBSTRING()|Cắt chuỗi|
|REPLACE()|Thay thế chuỗi|
|TRIM()|Loại bỏ khoảng trắng ở đầu và cuối|
|LEFT()|Lấy kí tự bên trái|
|RIGHT()|Lấy kí tự bên phải|

```SQL
SELECT CONCAT('Nguyen', ' ', 'Van A');

SELECT UPPER('mysql');

SELECT LOWER('MYSQL');

SELECT SUBSTRING('DATABASE', 1, 4);

SELECT REPLACE('Hello World', 'World', 'MySQL');

SELECT TRIM('  Hello  ');
```
## 2. Numberic Funtions
|Hàm|Ý nghĩa|
|---|---|
|ABS()|	Giá trị tuyệt đối|
|ROUND()|Làm tròn|
|CEIL()|	Làm tròn lên|
|FLOOR()|	Làm tròn xuống|
|MOD()|	Phần dư|
|POWER()|	Lũy thừa|
|SQRT()|	Căn bậc hai|
|RAND()|	Số ngẫu nhiên|

```SQL
SELECT ABS(-10);

SELECT ROUND(10.567, 2);

SELECT CEIL(10.2);

SELECT FLOOR(10.8);

SELECT MOD(10, 3);
```
## 3. Date Functions

|Hàm|	Ý nghĩa|
|---|---|
|NOW()|	Ngày giờ hiện tại|
|CURDATE()|	Ngày hiện tại|
|CURTIME()|	Giờ hiện tại|
|YEAR()|	Lấy năm|
|MONTH()|	Lấy tháng|
|DAY()|	Lấy ngày|
|DATEDIFF()|	Khoảng cách ngày|
|DATE_ADD()|	Cộng thời gian|
|DATE_SUB()|	Trừ thời gian|
|TIMESTAMPDIFF()|	Tính khoảng thời gian theo đơn vị|

```SQL
SELECT NOW();

SELECT CURDATE();

SELECT YEAR(NOW());

SELECT MONTH(NOW());

SELECT DATE_ADD(NOW(), INTERVAL 7 DAY);

SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH);

SELECT DATEDIFF('2026-12-01', '2026-11-01');
```

## 4. NULL Functions
- COALESCE(): Trả về giá trị đầu tiên khác NULL.
```SQL
SELECT COALESCE(Phone, 'Chưa cập nhật')
FROM Users;
```
- IFNULL(): Nếu giá trị đầu tiên là NULL thì trả về giá trị thứ hai.
```SQL
SELECT IFNULL(Phone, 'Không có số điện thoại')
FROM Users;
```
- NULLIF(): Trả về NULL nếu hai biểu thức bằng nhau.
```SQL
SELECT NULLIF(10, 10);
```
=> Kết quả: NULL.
## 5. Conditional Functions

- IF()
```SQL
SELECT
    Name,
    IF(Quantity > 0, 'Còn hàng', 'Hết hàng') AS Status
FROM Products;
```
- CASE WHEN
```SQL
SELECT
    Name,
    CASE
        WHEN Price >= 10000000 THEN 'Cao cấp'
        WHEN Price >= 5000000 THEN 'Trung cấp'
        ELSE 'Phổ thông'
    END AS ProductType
FROM Products;
```
=> CASE WHEN rất hữu ích trong các báo cáo và xử lý nghiệp vụ.
# Phần X. INDEX - CHỈ MỤC TRONG MYSQL
Đây là một trong những phần quan trọng nhất khi bạn muốn tối ưu hiệu năng database.
## 1. Index là gì? 
Đây là một trong những phần quan trọng nhất khi bạn muốn tối ưu hiệu năng database.

Hãy tưởng tượng:
- Không có Index: Bạn phải đọc từng trang sách để tìm một từ.
- Có Index: Bạn xem mục lục rồi đi thẳng đến trang cần tìm.

Tạo index qua câu lệnh sql
```SQL
CREATE INDEX idx_user_email
ON Users(Email);
```

Khi truy vấn
```SQL
CREATE INDEX idx_user_email
ON Users(Email);
```

MySQL có thể sử dụng Index để tìm kiếm nhanh hơn.

## 2. Xóa Index
```SQL
DROP INDEX idx_user_email
ON Users;
```

## 3. Các loại Index
<b>Primary Index</b>: Index được tạo tự động bởi Primary Key.

<b>Unique Index</b>: Đảm bảo giá trị không trùng lặp.

```SQL
CREATE UNIQUE INDEX idx_email
ON Users(Email);
```
<b>Normal Index</b>: Index thông thường.

```SQL
CREATE INDEX idx_price
ON Products(Price);
```

<b>Composite Index</b>: Index trên nhiều cột.

```SQL
CREATE INDEX idx_category_price
ON Products(CategoryId, Price);
```

<b>Fulltext Index</b>: Hỗ trợ tìm kiếm văn bản toàn văn.

```SQL
CREATE FULLTEXT INDEX idx_product_name
ON Products(Name);
```

## 4. Clustered Index và Secondary Index
Trong InnoDB:
- Primary Key được sử dụng làm Clustered Index.
- Dữ liệu của bảng được tổ chức theo cấu trúc B+Tree của Clustered Index.
- Secondary Index là các chỉ mục khác Primary Key.
Một điểm rất quan trọng:

Secondary Index của InnoDB chứa giá trị khóa chính để tham chiếu đến bản ghi tương ứng trong Clustered Index.

Vì vậy Primary Key nên được thiết kế hợp lý, không quá lớn và ổn định.

## 5. Composite Index và Leftmost Prefix

```SQL
CREATE INDEX idx_category_brand_price
ON Products(CategoryId, BrandId, Price);
```

Index này có thể hỗ trợ tốt các truy vấn theo:
- CategoryId.
- CategoryId và BrandId.
- CategoryId, BrandId và Price.
Nhưng không nhất thiết hỗ trợ hiệu quả truy vấn chỉ lọc theo BrandId hoặc chỉ Price.

Đây gọi là nguyên tắc Leftmost Prefix.

## 6. Khi nào nên tạo Index?
Nên cân nhắc Index cho:
- Cột thường xuyên xuất hiện trong WHERE.
- Cột thường xuyên JOIN.
- Cột dùng để sắp xếp ORDER BY.
- Cột dùng để nhóm GROUP BY.
- Cột có tính phân biệt giá trị tốt.

Không nên tạo Index tràn lan vì:
- Tốn dung lượng lưu trữ.
- Làm chậm INSERT.
- Làm chậm UPDATE.
- Làm chậm DELETE do phải cập nhật Index.

## 7. EXPLAIN – Phân tích truy vấn
Đây là công cụ quan trọng để kiểm tra MySQL thực hiện truy vấn như thế nào.

```SQL
EXPLAIN
SELECT *
FROM Products
WHERE CategoryId = 1;
```

# PHẦN XI. ACID trong MYSQL

## 1. Locking – Cơ chế khóa
### Shared Lock
Khóa chia sẻ, thường dùng để đọc dữ liệu có khóa.

```SQL
SELECT *
FROM Products
WHERE Id = 1
FOR SHARE;
```

Nhiều transaction có thể cùng giữ Shared Lock.

### Exclusive Lock
Khóa độc quyền, thường dùng khi cập nhật dữ liệu.

```SQL
SELECT *
FROM Products
WHERE Id = 1
FOR UPDATE;
```

Transaction khác không thể lấy khóa xung đột trên bản ghi đó cho đến khi khóa được giải phóng.

### Deadlock
Deadlock xảy ra khi hai hoặc nhiều transaction chờ khóa của nhau tạo thành vòng chờ.

Ví dụ:
- Transaction A khóa Product 1, chờ Product 2.
- Transaction B khóa Product 2, chờ Product 1.
MySQL InnoDB có cơ chế phát hiện Deadlock và thường chọn một transaction làm nạn nhân để rollback.

Cách hạn chế:
- Luôn cập nhật nhiều bản ghi theo cùng một thứ tự.
- Giữ transaction ngắn.
- Tạo Index phù hợp.
- Không giữ khóa lâu hơn cần thiết.
- Có cơ chế retry khi gặp lỗi Deadlock.

# PHẦN XII. VIEW – BẢNG ẢO

## 1. View là gì?
View là một bảng ảo được xây dựng từ kết quả của câu SELECT.

View thường không lưu dữ liệu kết quả riêng biệt như một bảng thông thường.

```SQL
CREATE VIEW ActiveUsers AS
SELECT Id, FullName, Email
FROM Users
WHERE IsActive = TRUE;

// Sử dụng 
SELECT *
FROM ActiveUsers;
```

## 2. Cập nhập View
```SQL
CREATE OR REPLACE VIEW ActiveUsers AS
SELECT Id, FullName, Email
FROM Users
WHERE IsActive = TRUE;

// Xóa view
DROP VIEW ActiveUsers;
```

## Tại sao sử dụng View?
- Đơn giản hóa truy vấn phức tạp.
- Tái sử dụng câu truy vấn.
- Hạn chế việc hiển thị các cột không cần thiết.
- Hỗ trợ tổ chức quyền truy cập.

Lưu ý: Không phải View nào cũng có thể UPDATE hoặc 
INSERT. Khả năng cập nhật phụ thuộc cấu trúc View và câu truy vấn bên trong.

# Phần XIII. STORED PROCEDURE
## 1. Stored Procedure là gì?
Stored Procedure là một nhóm câu lệnh SQL được lưu trong database và có thể gọi lại nhiều lần.

Ví dụ:

```SQL
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *
    FROM Products;
END //

DELIMITER ;


// Gọi Procedure:
CALL GetAllProducts();
```

## 2. Procedure có tham số IN

```SQL
DELIMITER //

CREATE PROCEDURE GetProductById(
    IN productId INT
)
BEGIN
    SELECT *
    FROM Products
    WHERE Id = productId;
END //

DELIMITER ;


// Gọi:
CALL GetProductById(1);
```

## 3. Procedure có tham số OUT

```SQL
DELIMITER //

CREATE PROCEDURE CountProducts(
    OUT total INT
)
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM Products;
END //

DELIMITER ;


// Gọi:
CALL CountProducts(@total);

SELECT @total;
```

## 4. INOUT
INOUT vừa nhận giá trị đầu vào vừa trả lại giá trị đầu ra.

```SQL
DELIMITER //

CREATE PROCEDURE IncreaseValue(
    INOUT numberValue INT
)
BEGIN
    SET numberValue = numberValue + 10;
END //

DELIMITER ;


// Gọi:
SET @numberValue = 5;

CALL IncreaseValue(@numberValue);

SELECT @numberValue;
```

Kết quả: 15.

# Phần XIV: FUNCTION – HÀM DO NGƯỜI DÙNG ĐỊNH NGHĨA

## 1. Stored Function là gì?
Stored Function là hàm được tạo trong database, có thể nhận tham số và bắt buộc trả về một giá trị thông qua RETURN.

Ví dụ:

```SQL
DELIMITER //

CREATE FUNCTION CalculateTotal(
    price DECIMAL(15,2),
    quantity INT
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    RETURN price * quantity;
END //

DELIMITER ;


// Sử dụng:
SELECT CalculateTotal(100000, 2);
```

Kết quả: 200000.

## 2. Phân biệt Stored Procedure và Function

|Procedure|Function|
|---|---|
|Gọi bằng CALL|Có thể sử dụng trong biểu thức SQL|
|Có thể trả nhiều kết quả thông qua OUT/result sets|Trả về một giá trị|
|Không bắt buộc có RETURN|Bắt buộc có RETURN|
|Phù hợp với quy trình nghiệp vụ|Phù hợp với tính toán, biểu thức|

# PHẦN XV. TRIGGER

## 1. Trigger là gì?
Trigger là đoạn chương trình tự động thực thi khi một sự kiện xảy ra trên bảng.

Các sự kiện:
- INSERT.
- UPDATE.
- DELETE.
Thời điểm:
- BEFORE.
- AFTER.
Ví dụ tạo bảng lưu lịch sử thay đổi giá:
```SQL
CREATE TABLE ProductPriceHistory (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ProductId INT,
    OldPrice DECIMAL(15,2),
    NewPrice DECIMAL(15,2),
    ChangedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

Tạo Trigger:

```SQL
DELIMITER //

CREATE TRIGGER trg_ProductPriceUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.Price <> NEW.Price THEN
        INSERT INTO ProductPriceHistory (
            ProductId,
            OldPrice,
            NewPrice
        )
        VALUES (
            OLD.Id,
            OLD.Price,
            NEW.Price
        );
    END IF;
END //

DELIMITER ;
```

Trong Trigger:
- OLD: Giá trị trước khi thay đổi.
- NEW: Giá trị sau khi thay đổi.
Lưu ý: Trigger có thể khiến việc ghi dữ liệu khó theo dõi hơn nếu sử dụng quá nhiều. Nên dùng có chủ đích.
