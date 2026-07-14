/* Nhóm dữ liệu   
	- GROUP SETS:  Được sử dụng giống GROUP BY nhưng thằng group by nó phải thực thiện nhiều câu lệnh thì group sets ra 
	đời để làm nhanh chạy nhiều câu lệnh.
	Ví dụ thay vì chạy group by nhiều như vậy
	SELECT Product, SUM(Amount) FROM Sales
	GROUP BY Product;

	SELECT City, SUM(Amount) FROM Sales
	GROUP BY City;

	Áp dụng thành Group sets
	SELECT Product, City, SUM(Amount)
	FROM Sales
	GROUP BY GROUPING SETS
	(
		(Product),
		(City)
	);
	- Group set hoạt động như nào:
		-> GROUP BY Product trước
		-> sau đó GROUP BY City
		-> Rồi UNION ALL hai kết quả lại
	-> Phải dùng HAVING với GROUP BY chứ không dùng WHERE
*/
/*Tạo bản dư liệu Sales
SaleId, Product, City, SaleYear, Amount
chèn vào dữ liệu
	(1,N'Laptop',N'Hà Nội',2025,1200),
	(2,N'Laptop',N'HCM',2025,1500),
	(3,N'Phone',N'Hà Nội',2025,800),
	(4,N'Phone',N'HCM',2025,900),
	(5,N'Tablet',N'Hà Nội',2026,700),
	(6,N'Laptop',N'Hà Nội',2026,1800),
	(7,N'Phone',N'Đà Nẵng',2026,950),
	(8,N'Tablet',N'HCM',2026,1100);
*/
CREATE TABLE Sales(
    SaleId INT PRIMARY KEY,
    Product NVARCHAR(50),
    City NVARCHAR(50),
    SaleYear INT,
    Amount MONEY
);
INSERT INTO Sales
VALUES
(1,N'Laptop',N'Hà Nội',2025,1200),
(2,N'Laptop',N'HCM',2025,1500),
(3,N'Phone',N'Hà Nội',2025,800),
(4,N'Phone',N'HCM',2025,900),
(5,N'Tablet',N'Hà Nội',2026,700),
(6,N'Laptop',N'Hà Nội',2026,1800),
(7,N'Phone',N'Đà Nẵng',2026,950),
(8,N'Tablet',N'HCM',2026,1100);

/*1. Tính tổng doanh thu theo từng loại sản phẩm*/
SELECT SUM(Amount) AS[Tổng doanh thu] FROM Sales
GROUP BY Product;

/*2. Tính tổng doanh thu theo từng thành phố*/
SELECT City, SUM(Amount) AS [Doanh thu theo thành phố] FROM Sales
GROUP BY City;

/*3. Tính tổng doanh thu theo từng năm*/
SELECT SaleYear, SUM(Amount) AS [Doanh thu theo năm] FROM Sales
GROUP BY SaleYear;

/*4. Tính tổng doanh thu theo Product và SaleYear*/
SELECT Product, SaleYear, SUM(Amount) FROM Sales
GROUP BY GROUPING SETS (
	(Product),
	(SaleYear)
);

/*5. Tính tổng doanh thu theo Product và City*/
SELECT Product, City, SUM(Amount) FROM Sales
GROUP BY GROUPING SETS(
	(Product),
	(City)
);

/*6. Đếm xem có bao nhiều sản phẩm theo loại và đếm xem có bao nhiêu thành phố theo loại*/
SELECT Product,City, COUNT(Product) AS [Số lượng]  FROM Sales
GROUP BY GROUPING SETS(
	(Product),
	(City)
);
/*7. Tính trung bình xem có bao nhiều sản phẩm theo loại và đếm xem có bao nhiêu thành phố theo loại*/
SELECT Product,City, AVG(Amount) AS [Số lượng]  FROM Sales
GROUP BY GROUPING SETS(
	(Product),
	(City)
);
