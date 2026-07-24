# Mô hình quan hệ trong hệ quản trị cơ sở dữ liệu

## I. Khái niệm
Mô hình quan hệ tổ chức dữ liệu bằng cách sử dụng các bảng (quan hệ) bao gồm các hàng và cột.
+ Mô hình quan hệ thể hiện cách dữ liệu được lưu trữ và quản lý trong cơ sở dữ liệu quan hệ, nơi dữ liệu được tổ chức thành các bảng, mỗi bảng được gọi là một quan hệ.
+ Mỗi hàng trong bảng biểu thị một thực thể hoặc bản ghi, và mỗi cột biểu thị một thuộc tính cụ thể của thực thể đó
+ Mô hình quan hệ chuyển đổi các thiết kế khái niệm từ sơ đồ ER thành các cấu trúc có thể triển khai. Các cấu trúc này được sử dụng trong các hệ thống cơ sở dữ liệu quan hệ như Oracle, SQL và MySQL.

## II. Các thuật ngữ chính trong mô hình quan hệ

**Thuộc tính (Attribute):** Thuộc tính là các đặc tính xác định một thực thể. 

Ví dụ: STT, NAME, ADRESS, v.v.

**Sơ đồ quan hệ (Relation Schema):** Là các bảng được nối lại với nhau tạo thành một sơ đồ quan hệ 

Ví dụ: Bảng Student nối với bảng Khóa học, Bảng khóa học nối với Giảng viên tạo thành một sơ đồ

**Tuple:** Tuple biểu thị một hàng trong một quan hệ. Mỗi tuple chứa một tập hợp các giá trị thuộc tính mô tả một thực thể cụ thể

Ví dụ: (1, 092, DELHI, 18) là một tuple trong bảng STUDENT.

**Thể hiện của quan hệ (Relation Instance):** Tập hợp các nhóm dữ liệu của một bảng dữ liệu tại một thời điểm cụ thể được gọi là thể hiện của quan hệ. Nó có thể thay đổi bất cứ khi nào có thao tác chèn, xóa hoặc cập nhật trong cơ sở dữ liệu.

Ví dụ: Tập hợp nhóm dữ liệu sinh viên từ STT thứ I đến X

**Bậc (Degree):** Số lượng thuộc tính trong một quan hệ được gọi là bậc của quan hệ đó. 

Ví dụ, quan hệ SINH VIÊN có bậc là 5, vì nó có 5 thuộc tính.

**Số lượng phần tử (Cardinality):** Số lượng bộ dữ liệu (tuple) trong một quan hệ được gọi là số lượng phần tử . 

Ví dụ, quan hệ STUDENT được định nghĩa ở trên có số lượng phần tử là 4.

**Giá trị null (NULL Values)**: giá trị cột tại vị trí đó có giá trị null

## III. Các ràng buộc trong mô hình quan hệ

### 1. Ràng buộc miền
Đảm bảo rằng giá trị của mỗi thuộc tính A trong một bộ phải là một giá trị nguyên tử được suy ra từ miền được chỉ định của nó, dom(A). Miền được định nghĩa bởi các kiểu dữ liệu liên kết với các thuộc tính. Các kiểu dữ liệu phổ biến bao gồm:

+ Các kiểu dữ liệu số: Bao gồm số nguyên (ngắn, thông thường và dài) cho số nguyên dương và số thực (số thực dấu phẩy động, độ chính xác kép) cho các giá trị thập phân, cho phép thực hiện các phép tính chính xác.
+ Các kiểu ký tự: Bao gồm các chuỗi có độ dài cố định (CHAR) và độ dài thay đổi (VARCHAR, TEXT) để lưu trữ dữ liệu văn bản với nhiều kích thước khác nhau.
+ Giá trị Boolean: Lưu trữ các giá trị đúng hoặc sai, thường được sử dụng cho các cờ hoặc kiểm tra điều kiện trong cơ sở dữ liệu.
+ Các kiểu dữ liệu chuyên dụng: Bao gồm các kiểu dữ liệu cho ngày (DATE), giờ (TIME), dấu thời gian (TIMESTAMP) và tiền tệ (MONEY), được sử dụng để xử lý chính xác dữ liệu liên quan đến thời gian và tài chính.

### 2. Tính toàn vẹn của chìa khóa
Mỗi quan hệ trong cơ sở dữ liệu phải có ít nhất một tập hợp thuộc tính xác định duy nhất một bộ dữ liệu. Tập hợp các thuộc tính đó được gọi là khóa. Ví dụ: ROLL_NO trong STUDENT là khóa. Không có hai sinh viên nào có cùng số hiệu sinh viên. Vì vậy, một khóa có hai thuộc tính: 

+ Nó phải là duy nhất cho tất cả các bộ dữ liệu.
+ Nó không thể có giá trị NULL.

### 3. Ràng buộc toàn vẹn tham chiếu

Khi một thuộc tính của một quan hệ chỉ có thể nhận giá trị từ một thuộc tính khác của cùng quan hệ đó hoặc bất kỳ quan hệ nào khác, điều đó được gọi là tính toàn vẹn tham chiếu

