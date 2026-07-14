/* Nhóm dữ liệu   
	- GROUP BY: là việc nhóm dữ liệu trùng lặp dựa vào 1 cột.
	- GROUP BY sinh ra không chỉ để thu gọn danh sách (vì nếu chỉ muốn lọc trùng, người ta thường dùng DISTINCT). 
	Mục đích tối thượng của GROUP BY là để tính toán thống kê trên từng nhóm đó thông qua các hàm gom cụm (Aggregate Functions) như: COUNT() (đếm), SUM() (tổng), AVG() (trung bình), MAX(), MIN()  
	
	- Cú pháp sử dụng GROUP BY
		SELECT select_list FROM table_name
        GROUP BY
            column_name1,
            column_name2 ,...;
	-> Với nhóm nhiều cột thì cứ nhóm cột 1 trước, xong qua nhóm cột 2
*/

