# Bài tập tìm khóa 
## I. khóa ứng viên
### Bài 1: Cho bảng Student các thuộc tính {StudentId, Name, DOB, Phone}. Xác định thuộc tính chọn làm khóa duy nhất 

Khóa duy nhất trong bảng student là thuộc tính StudentId.

### Bài 2: Cho bảng Employee các thuộc tính {EmployeeId, Name, Salary, Department}. Xác định thuộc tính chọn làm khóa duy nhất

Khóa duy nhất trong bảng employee là thuộc tính EmployeeId.

### Bài 3: Cho bảng Student có các thuộc tính {StudentId, Email, Phone, Name}. Biết StudentId và Email là duy nhất. Xác định thuộc tính chọn làm khóa ứng viên. Tại sao

Thuộc tính EmployeeId, Email và cả EmployeeId với Email đều là thuộc chọn làm khóa ứng viên. Vì 2 thuộc tính này duy nhất nên ghép lại để chọn làm khóa ứng viên

### Bài 4: Cho bảng Emloyee có các thuộc tính {EmployeeId, Email, CCCD, Name}. Biết EmployeeId, Email, CCCD là duy nhất. Xác định thuộc tính chọn làm khóa ứng viên. Tại sao

Thuộc tính EmployeeId, Email, CCCD và cả 3 EmployeeId Email CCCD đều là thuộc tính chọn làm khóa ứng viên. Vì 3 thuộc tính này duy nhất nên ghép lại xác định được bản ghi duy nhất.

### Bài 5: Cho bảng dưới đây hãy xác định bảng khóa ứng viên 
|Flight|Seat|
| --- | --- |
| VN1 | A1  |
| VN2 | A2  |
| VN1 | A1  |

Khóa ứng viên là thuộc tính {Flight, Seat}. Vì ghép 2 thuộc tính này lại xác định duy nhất bảng ghi trong bảng.

### Bài 6: Cho bảng dưới đây hãy xác định Khóa ứng viên
|Username|Email|
|---|---|
|Tom|a@gmail.com|
|Jerry|b@gmail.com|
|Tom|c@gmail.com|

Khóa ứng viên là thuộc tính Email. Vì thuộc tính này giúp xác định duy nhất bản ghi 

## II. Siêu khóa 
