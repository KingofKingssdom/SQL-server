/* Gộp nhiều bảng 
	- CROSS JOIN: dùng để kết hợp các hàng từ hai (hoặc nhiều) bảng lại với nhau, trả về một tập hợp kết quả bao gồm 
	tích của 2 bảng
	- Lấy hàng từng hàng của bảng trái nhân với lần lượt từng hàng ở bảng phải
	- Cú pháp sử dụng CROSS JOIN
		SELECT select_list FROM T1
		CROSS JOIN T2 ON join_predicate;

*/

/*Tạo database StoreManagement và tạo bảng Shirts với dữ liệu sau
	ShirtId, Color
	Chèn vào các dữ liệu sau
	(1, N'Trắng'),
	(2, N'Đen'),
	(3, N'Xanh');
  Tạo tiếp bảng Sizes với dữ liệu sau
	SizeId, SizeName
	Chèn vào dữ liệu sau
	(1,'S'),
	(2,'M'),
	(3,'L');
*/
/*=> khi cross join nó sẽ tạo ra 9 dòng dữ liệu mỗi loại Áo có 3 kích thước đầy đủ để làm dữ liệu mẫu xem toàn bộ*/



