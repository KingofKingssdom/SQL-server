# Phụ thuộc hàm trong hệ quản trị cơ sở dữ liệu

## I. Khái niệm
Sự phụ thuộc chức năng xảy ra khi giá trị của một thuộc tính (hoặc một tập hợp các thuộc tính) xác định duy nhất giá trị của một thuộc tính khác. Mối quan hệ này được ký hiệu là:
X → Y

Ở đây, X là biến quyết định, và Y là biến phụ thuộc. Điều này có nghĩa là với mỗi giá trị duy nhất của X, chỉ có chính xác một giá trị tương ứng của Y.

Ví dụ: 

Mã số sinh viên -> Tên sinh viên

Mã số sinh viên -> Tuổi sinh viên

## II. Cách biểu diễn sự phụ thuộc chức năng trong hệ quản trị cơ sở dữ liệu
Mối quan hệ phụ thuộc chức năng được thể hiện dưới dạng phương trình. Ví dụ, nếu ta có một bản ghi nhân viên với các trường "EmployeeID", "FirstName" và "LastName", ta có thể xác định hàm như sau:
Mã nhân viên -> Tên, Họ

Ví dụ, nếu ta có một bảng với các thuộc tính "X", "Y" và "Z" và thuộc tính "X" có thể xác định giá trị của các thuộc tính "Y" và "Z".
X -> Y, Z

Ký hiệu này cho biết giá trị trong thuộc tính "X" quyết định giá trị trong thuộc tính "Y" và "Z". Vì vậy, nếu bạn biết giá trị của "X", bạn cũng có thể xác định giá trị của "Y" và "Z".




