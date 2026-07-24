# Các loại khóa trong mô hình quan hệ
## I. Khái niệm
Khóa là yếu tố cơ bản của mô hình cơ sở dữ liệu quan hệ, đảm bảo tính duy nhất, tính toàn vẹn dữ liệu và khả năng truy cập dữ liệu hiệu quả.

+ Chúng xác định duy nhất từng hàng trong bảng.
+ Chúng ngăn ngừa việc trùng lặp dữ liệu và duy trì tính nhất quán.
+ Chúng tạo ra mối quan hệ giữa các bảng khác nhau.

Tầm quan trọng của khóa trong hệ quản trị cơ sở dữ liệu

+ **Tính duy nhất:** Khóa đảm bảo rằng mỗi bản ghi trong bảng là duy nhất và có thể được xác định riêng biệt.
+ **Tính toàn vẹn dữ liệu:** Khóa giúp ngăn ngừa việc trùng lặp dữ liệu và duy trì tính nhất quán của dữ liệu.
+ **Truy xuất dữ liệu hiệu quả:** Khóa giúp tạo mối quan hệ giữa các bảng, cho phép truy vấn nhanh hơn và tổ chức dữ liệu tốt hơn.
+ Nếu không có khóa, việc quản lý các cơ sở dữ liệu lớn sẽ trở nên khó khăn, và việc truy xuất dữ liệu sẽ chậm và dễ xảy ra lỗi.

## II. Các loại khóa 

### 1. Candidate Key (khóa ứng viên)
Tập hợp tối thiểu các thuộc tính có thể xác định duy nhất một bộ dữ liệu. Nó có thể có 2 hoặc hơn các thuộc tính để làm khóa nhưng phải là tối thiểu không dư

Ví dụ: STU_NO là khóa ứng viên trong bảng STUDENT

+ Khóa ứng viên là một siêu khóa tối thiểu không có thuộc tính dư thừa.
+ Nó phải chứa các giá trị duy nhất, đảm bảo rằng không có hai hàng nào có cùng giá trị trong các cột của khóa ứng viên.
+ Mỗi bảng phải có ít nhất một khóa ứng viên.
+ Một bảng có thể có nhiều khóa ứng viên nhưng chỉ có một khóa chính.

### 2. Super Key (siêu khóa)

Tập hợp một hoặc nhiều thuộc tính có thể xác định duy nhất một bộ dữ liệu. Nó có thể bao gồm các thuộc tính bổ sung không quan trọng đối với tính duy nhất nhưng vẫn xác định duy nhất hàng đó. 

Ví dụ: STUD_NO, (STUD_NO, STUD_NAME), v.v.
nếu cột "STUD_NO" có thể xác định duy nhất một sinh viên, thì việc thêm "SNAME" vào đó vẫn sẽ tạo thành một khóa siêu cấp hợp lệ, mặc dù điều đó không cần thiết.

+ Khóa siêu cấp có thể chứa các thuộc tính bổ sung không cần thiết cho tính duy nhất.

### 3. Alternate Key (khóa thay thế)

Là bất kỳ khóa ứng cử viên nào trong bảng mà không được chọn làm khóa chính. Nói cách khác, tất cả các khóa không được chọn làm khóa chính đều được coi là khóa thay thế.

Ví dụ: Trong bảng STUDENT, cả STUD_NO và PHONE đều là các khóa ứng cử viên. Nếu STUD_NO được chọn làm khóa chính, thì PHONE sẽ được coi là khóa thay thế.

+ Khóa thay thế còn được gọi là khóa phụ vì nó có thể xác định duy nhất các bản ghi trong một bảng, giống như khóa chính.
+ Khóa thay thế có thể bao gồm một hoặc nhiều cột (trường) có thể xác định duy nhất một bản ghi, nhưng nó không phải là khóa chính.

### 4. Foreign Key (khóa ngoại)
Khóa ngoại là một thuộc tính trong một bảng tham chiếu đến khóa chính trong một bảng khác. Bảng chứa khóa ngoại được gọi là bảng tham chiếu và bảng được tham chiếu được gọi là bảng được tham chiếu.

+ Khóa ngoại trong một bảng trỏ đến khóa chính trong bảng khác, thiết lập mối quan hệ giữa chúng.
+ Nó giúp kết nối hai hoặc nhiều bảng, cho phép bạn tạo mối quan hệ giữa chúng. Điều này rất quan trọng để duy trì tính toàn vẹn dữ liệu và ngăn ngừa sự trùng lặp dữ liệu.
+ Chúng đóng vai trò như một bảng đối chiếu giữa các bảng.

### 5. Partial Key (khóa 1 phần)
Khóa một phần được chọn từ một thực thể yếu để giúp xác định các bản ghi, nhưng bản thân nó không thể xác định duy nhất một bản ghi.

+ Giúp phân biệt các bản ghi trong một thực thể yếu khi được kết hợp với dữ liệu từ một thực thể mạnh có liên quan.
+ Giá trị này không thể là NULL, vì nó cần thiết để xác định các bản ghi có dữ liệu khác.
+ Đó có thể là một cột đơn hoặc sự kết hợp của nhiều cột.
+ Đảm bảo tính nhất quán khi kết hợp với dữ liệu từ một nguồn đáng tin cậy.

### 6. Primary Key (khóa chính)
Khóa  chính  được chọn từ tập hợp các khóa ứng viên để xác định duy nhất mỗi bản ghi trong một bảng 

+ Giá trị này không thể là NULL, vì mỗi bản ghi phải có một mã định danh hợp lệ.
+ Nó có thể là một cột duy nhất hoặc một cột hỗn hợp (được tạo thành từ nhiều cột).
+ Cơ sở dữ liệu thường sắp xếp dữ liệu bằng khóa chính để cho phép truy cập và tìm kiếm nhanh hơn.

### 7. Secondary Key (khóa phụ)
Khóa phụ là một thuộc tính hoặc sự kết hợp của các thuộc tính được sử dụng để tìm kiếm hoặc truy vấn các bản ghi trong bảng, nhưng nó không đảm bảo tính duy nhất.

Ví dụ, cột STUD_NAME trong bảng STUDENT có thể được sử dụng để tìm sinh viên theo tên, ngay cả khi nhiều sinh viên có cùng tên.

+ Nó giúp truy xuất dữ liệu nhanh chóng, thường bằng cách tạo chỉ mục.
+ Nó không xác định duy nhất từng bản ghi; nhiều bản ghi có thể có cùng một giá trị.
+ Mục đích chính là để cải thiện hiệu quả tìm kiếm, chứ không phải để duy trì tính duy nhất của dữ liệu.

### 8. Unique Key (khóa duy nhất)
Khóa duy nhất là một ràng buộc cơ sở dữ liệu đảm bảo rằng tất cả các giá trị trong một cột cụ thể hoặc sự kết hợp của các cột là duy nhất trên tất cả các hàng trong bảng. Nó đảm bảo rằng không có hai hàng nào trong bảng có cùng giá trị trong các cột được định nghĩa là một phần của khóa duy nhất.

Ví dụ: Trong bảng STUDENT_COURSE, sự kết hợp của STUD_EMAIL và STUD_NAME có thể tạo thành một Khóa duy nhất để đảm bảo rằng mỗi cặp email và tên của sinh viên là duy nhất trong toàn bộ bảng.

+ Ngăn chặn các giá trị trùng lặp trong (các) cột được chỉ định.
+ Nó cho phép giá trị NULL, nhưng chỉ một giá trị NULL trên mỗi cột.
+ Phương pháp này có thể áp dụng cho một cột hoặc nhiều cột.
+ Giúp duy trì tính toàn vẹn và độ chính xác của dữ liệu trong bảng.

### 9. Composite Key (khóa tổng hợp)

Đôi khi, một cột duy nhất không đủ để xác định duy nhất tất cả các bản ghi trong một bảng, vì vậy người ta sử dụng kết hợp nhiều thuộc tính. Một tập hợp các thuộc tính tối ưu được lựa chọn để đảm bảo rằng mỗi hàng đều có thể được xác định duy nhất.

Nó đóng vai trò là khóa chính nếu bảng chưa có khóa chính.

+ Bắt buộc có hai hoặc nhiều thuộc tính được sử dụng cùng nhau để tạo thành một khóa tổng hợp .
+ Các tổ hợp thuộc tính khác nhau có thể mang lại độ chính xác khác nhau trong việc xác định các hàng một cách duy nhất. (có thể chứa thuộc tính dư thừa miễn là nó xác định được duy nhất bản ghi)

Ví dụ: Trong bảng STUDENT_COURSE, {STUD_NO, COURSE_NO} có thể tạo thành khóa tổng hợp để xác định duy nhất từng bản ghi.

### 10. Surrogate Keys 
Khóa thay thế là một thuộc tính nhân tạo được tạo ra để xác định duy nhất mỗi bản ghi trong bảng khi không có khóa tự nhiên phù hợp.

+ Nó thường được hệ thống tự động tạo ra (giống như các số tự động tăng).
+ Nó đóng vai trò là khóa chính khi các khóa tự nhiên hoặc khóa phức hợp không khả thi hoặc không hiệu quả.
+ Một thuộc tính duy nhất do hệ thống tạo ra được sử dụng để tạo khóa thay thế.
+ Nó không có ý nghĩa thực tế nào và chỉ được sử dụng cho mục đích nhận dạng.









