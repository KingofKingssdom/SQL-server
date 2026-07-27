# Chuẩn hóa cơ sở dữ liệu

## I. Khái niệm
Chuẩn hóa là một quy trình quan trọng trong thiết kế cơ sở dữ liệu, giúp cải thiện hiệu quả, tính nhất quán và độ chính xác của cơ sở dữ liệu. Nó giúp việc quản lý và bảo trì dữ liệu dễ dàng hơn, đồng thời đảm bảo cơ sở dữ liệu có khả năng thích ứng với những thay đổi trong nhu cầu kinh doanh.

+ Đó là quá trình tổ chức các thuộc tính của cơ sở dữ liệu để giảm thiểu hoặc loại bỏ sự trùng lặp dữ liệu (dữ liệu giống nhau nằm ở những vị trí khác nhau), nếu không sẽ làm tăng kích thước cơ sở dữ liệu một cách không cần thiết.
+ Sự dư thừa dữ liệu dẫn đến các vấn đề không nhất quán trong quá trình chèn, xóa và cập nhật, gây khó khăn cho việc quản lý dữ liệu.
+ Chuẩn hóa bao gồm việc chia một bảng thành nhiều bảng nhỏ hơn, và mỗi khi một truy vấn yêu cầu dữ liệu từ các bảng đã được chia nhỏ, các bảng này phải được liên kết với nhau.
+ **Trước khi chuẩn hóa:** Bảng dễ bị trùng lặp và có các bất thường (chèn, cập nhật và xóa).
+ **Sau khi chuẩn hóa:** Dữ liệu được chia thành các bảng logic để đảm bảo tính nhất quán, tránh trùng lặp và loại bỏ các bất thường, giúp cơ sở dữ liệu hoạt động hiệu quả và đáng tin cậy.

## II. Lợi ích chuẩn hóa cơ sở dữ liệu

+ Giảm thiểu dữ liệu trùng lặp và dung lượng lưu trữ lãng phí.
+ Ngăn chặn các lỗi bất thường khi thêm, cập nhật và xóa dữ liệu.
+ Cải thiện tính nhất quán và toàn vẹn của dữ liệu.
+ Giúp cho việc bảo trì và phát triển lược đồ trở nên dễ dàng hơn.

## III. Các dạng chuẩn hóa cơ sở dữ liệu

### 1. Dạng chuẩn hóa 1NF 

Một bảng được gọi là ở dạng chuẩn 1NF nếu nó thỏa mãn các điều kiện sau:

+ Tất cả các cột đều chứa các giá trị nguyên tử (tức là các giá trị không thể chia nhỏ).
+ Mỗi hàng là duy nhất (tức là không có hàng trùng lặp).
+ Mỗi cột có một tên riêng biệt.
+ Thứ tự lưu trữ dữ liệu không quan trọng.

Ví dụ
Cho bảng Student sau đang vi phạm chuẩn hóa dữ liệu
|StudentId|Name|Email|Phone|
|---|---|---|---|
|001|Nam|nam@gmail.com|0912, 0945|
|002|Hải|hai@gmail.com|0952, 0913|
|002|Hải|hai@gmail.com|0952, 0913|

Bảng dữ liệu này vi phạm nguyên tắc là cột Phone đang chứa dữ liệu đa giá trị. Và bảng này đang chứa 2 dữ liệu trùng lặp ý chang nhau

**Chuẩn hóa lại bảng student theo chuẩn 1NF**
|StudentId|Name|Email|Phone|
|---|---|---|---|
|001|Nam|nam@gmail.com|0912|
|001|Nam|nam@gmail.com|0945|
|002|Hải|hai@gmail.com|0952|
|003|Hải|hai@gmail.com|0913|

**Lưu ý:** là lúc này StudentId nó kh phải là khóa chính mà phải dùng {StudentId, Phone} làm khóa chính. Để tối ưu và tránh lặp lại thông tin Name, Email, người ta thường tách thành 2 bảng ở các bước chuẩn hóa tiếp theo (2NF, 3NF).

### 2. Dạng chuẩn hóa 2NF
Một bảng được gọi là ở dạng chuẩn 2NF nếu nó thỏa mãn các điều kiện:
+ Đã phải ở dạng chuẩn 1NF 
+ Các thuộc tính không tồn tại sự phụ thuộc một phần, nghĩa là mọi thuộc tính không phải là khóa chính phải phụ thuộc vào toàn bộ khóa chính, chứ không phụ thuộc vào một phần khóa chính
Ví dụ: Cho bảng Student có các thuộc tính sau

|StudentId|Name|Email|CourseId|CourseName|
|---|---|---|---|---|
|001|Hải|hai@gamil.com|01|Lập trình Java|
|002|Nam|nam@gamil.com|02|Lập trình C#|
|003|Minh|minh@gamil.com|03|Lập trình Javascript|
|001|Hải|hai@gamil.com|04|Lập trình Python|

Khóa chính của bảng là {StudentId, CourseId} vì nó mới giúp xác định duy nhất được bản ghi. Trong bảng có cột Name và Email đang phụ thuộc vào StudentId. Vi phạm chuẩn hóa 2 NF vì các thuộc tính phải phụ thuộc toàn bộ vào khóa chính, chứ không phải phụ thuộc 1 phần

**Chuẩn hóa lại bảng theo dạng 2NF**
Tách thành 3 bảng 

Bảng Student có khóa ngoại CourseId nối với khóa chính tương ứng trong bảng Course
|StudentId|Name|Email|CourseId|
|---|---|---|---|
|001|Hải|hai@gamil.com|01|
|002|Nam|nam@gamil.com|02|
|003|Minh|minh@gamil.com|03|


Bảng Course 
|CourseId|CourseName|
|---|---|
|01|Lập trình Java|
|02|Lập trình C#|
|03|Lập trình Javascript|
|04|Lập trình Python|

Bảng trung gian StudentCourse
|StudentId|CourseId|
|---|---|
|001|01|
|002|02|
|003|03|
|001|04|

Các bảng đều có thuộc tính phụ thuộc vào khóa chính, chứ không phụ thuộc 1 phần

### 3. Dạng chuẩn hóa 3 NF

Một bảng được gọi là ở dạng chuẩn 3NF nếu nó thỏa mãn:
+ Đã được chuẩn hóa 2NF
+ Không có sự phụ thuộc bắc cầu. Nói một cách đơn giản hơn, các thuộc tính không phải là thuộc tính chính không nên phụ thuộc vào các thuộc tính không phải là thuộc tính chính khác.

Ví dụ: Cho bảng học sinh sau
|StudentId|Name|RoomNo|Building|
|---|---|---|---|
|001|Hải|101|Tòa A|
|002|Nam|102|Tòa A|
|003|Minh|201|Tòa B|
|004|Nam|101|Tòa A|

Bảng đang chưa chuẩn hóa dạng 3NF. Vì thuộc tính Building phụ thuộc vào thuộc tính RoomNo, mà RoomNo lại phụ thuộc vào StudentId, từ đó cho thấy Building phụ thuộc vào StudentId qua trung gian là RoomNo.

**Chuẩn hóa lại dạng 3NF**

Tách thành bảng

Bảng Student có khóa ngoại là RoomNo tham chiếu đến bảng Room
|StudentId|Name|RoomNo|
|---|---|---|
|001|Hải|101|
|002|Nam|102|
|003|Minh|201|
|004|Nam|101|

Bảng Room
|RoomNo|Building|
|---|---|
|101|Tòa A|
|102|Tòa A|
|201|Tòa B|

### 4. Dạng chuẩn hóa Boyce-Codd (BCNF)
Nếu như 3NF giải quyết hầu hết các vấn đề dư thừa dữ liệu, thì BCNF xử lý nốt trường hợp đặc biệt mà 3NF bỏ sót: khi một bảng có nhiều Khóa ứng viên (Candidate Keys) và các khóa này đè/gối lên nhau.

Một bảng đạt chuẩn BCNF khi và chỉ khi:
+ Đã đạt chuẩn 3NF.Với mọi phụ thuộc hàm có dạng X -> Y (trong đó $Y$ không nằm trong $X$), thì $X$ bắt buộc phải là một Super Key (hoặc Candidate Key).

Nói cách khác đơn giản: Bên trái của mũi tên phụ thuộc ($X$) LUÔN LUÔN phải là một Khóa. Không bao giờ cho phép một thuộc tính không phải là khóa đứng ở vế trái để xác định thuộc tính khác.

Ví dụ: có bảng người người cố vấn (Adviser)
|StudentId|Subject|Advisor|
|---|---|---|
|001|C#|Thầy An|
|001|Java|Cô Bình|
|002|C#|Thầy Cường|
|003|C#|Thầy An|

Ràng buộc thực tế của hệ thống:
+ Một sinh viên có thể học nhiều môn ($1 \text{ Student} \rightarrow \text{n Subject}$).
+ Mỗi môn học có nhiều giảng viên tư vấn.
+ Mỗi giảng viên chỉ tư vấn cho duy nhất 1 môn học ($\text{Advisor} \rightarrow \text{Subject}$).

Phân tích phụ thuộc hàm:
+ Bộ đôi (StudentId, Subject) có thể xác định Advisor $\rightarrow$ Đây là Khóa chính.
+ Bộ đôi (StudentId, Advisor) cũng có thể xác định Subject $\rightarrow$ Đây cũng là một Khóa ứng viên.
+ Advisor $\rightarrow$ Subject (Giảng viên xác định Môn học).

Bảng này ĐÃ ĐẠT 3NF! Vì:
+ Không có phụ thuộc từng phần nào vi phạm 2NF.
+ Không có phụ thuộc bắc cầu nào vi phạm 3NF. (Thuộc tính Subject nằm trong một Khóa ứng viên nên theo định nghĩa 3NF nó vẫn được chấp nhận).

Nhưng vấn đề dư thừa dữ liệu vẫn xảy ra:
+ Lặp dữ liệu: Nếu Thầy An tư vấn cho 100 sinh viên học môn C#, thông tin Thầy An $\rightarrow$ C# sẽ bị lặp lại 100 lần.
+ Bất cập khi thêm/xóa: Nếu trường phân công Thầy Dũng dạy môn Python, nhưng chưa có sinh viên nào đăng ký, ta không thể lưu Thầy Dũng vào bảng vì chưa có StudentId (Khóa chính bị khuyết).

**Chuẩn hóa lại dạng BCNF**

Xét phụ thuộc hàm: Advisor $\rightarrow$ Subject
+ Vế trái là Advisor.
+ Advisor không phải là Khóa (vì 1 thầy tư vấn cho nhiều sinh viên).
+ $\rightarrow$ Vi phạm chuẩn BCNF!

Để đưa về BCNF, ta tách phụ thuộc hàm vi phạm ra một bảng riêng:

Bảng 1: AdvisorSubject
|Advisor|Subject|
|---|---|
|Thầy An|C#|
|Cô Bình|Java|
|Thầy Cường|C#|

Bảng 2: StudentAdvisor 
|StudentId|Adviser|
|---|---|
|001|Thầy An|
|001|Cô Bình|
|002|Thầy cường|
|003|Thầy An|

### 5. Dạng chuẩn hóa 4NF

Từ 1NF đến BCNF, chúng ta xử lý các Phụ thuộc hàm (Functional Dependency) — tức là một giá trị $X$ suy ra duy nhất một giá trị $Y$.Đến 4NF, chúng ta xử lý một dạng độc lập dữ liệu cao hơn gọi là Phụ thuộc đa trị (Multivalued Dependency - MVD) — tức là một giá trị $X$ suy ra một tập hợp nhiều giá trị độc lập $Y$.

Một bảng đạt chuẩn 4NF khi và chỉ khi:
+ Đã đạt chuẩn BCNF.
+ Không chứa Phụ thuộc đa trị phi vô thưởng vô phạt (Non-trivial Multivalued Dependency).

**Nói một cách đơn giản:** Nếu một thuộc tính $A$ xác định một tập các giá trị độc lập của $B$, và đồng thời xác định một tập các giá trị độc lập của $C$ (mà $B$ và $C$ hoàn toàn không liên quan gì đến nhau), thì $B$ và $C$ không được sống chung trong một bảng.

Ví dụ: Ta có bảng LecturerSkills

|Lecturer|Subject|Language|
|---|---|---|
|Thầy Nam|C#|Tiếng Anh|
|Thầy Nam|C#|Tiếng Nhật|
|Thầy Nam|Java|Tiếng Anh|
|Thầy Nam|Java|Tiếng Nhật|

**Phân tích thực tế:** 
+ Thầy Nam dạy 2 môn: C#, Java.
+ Thầy Nam biết 2 ngoại ngữ: Tiếng Anh, Tiếng Nhật.

Việc Thầy Nam dạy môn gì chẳng liên quan gì đến việc thầy biết tiếng gì (2 thông tin này hoàn toàn độc lập).

**Phân tích phụ thuộc:** 
+ Khóa chính của bảng bắt buộc phải là cả 3 cột: (Lecturer, Subject, Language).
+ Vì toàn bộ 3 cột làm Khóa chính, bảng này nghiễm nhiên đạt BCNF (không có thuộc tính không-khóa nào vi phạm).

Nhưng vấn đề "bùng nổ" dư thừa dữ liệu lại xuất hiện:
+ Do tính độc lập của Môn học và Ngoại ngữ, ta bắt buộc phải nhân bản mọi tổ hợp (2 môn $\times$ 2 ngoại ngữ = 4 dòng).
+ Nếu Thầy Nam biết thêm Tiếng Pháp (thành 3 ngoại ngữ) và dạy thêm Python (thành 3 môn), ta phải lưu tới $3 \times 3 = 9$ dòng!

**Chuẩn hóa dạng 4NF**

Để đưa về 4NF và loại bỏ hiện tượng bùng nổ dòng trùng lặp, ta tách 2 thuộc tính độc lập đa trị ra 2 bảng riêng biệt:

Bảng 1: LecturerSubject 

**Khóa chính:** (Lecturer, Subject)
|Lecturer|Subject|
|---|---|
|Thầy Nam|C#|
|Thầy Nam|Java|

Bảng 2: LecturerLanguage

**Khóa chính:** (Lecturer, Language)

|Lecturer|Language|
|---|---|
|Thầy Nam|Tiếng Anh|
|Thầy Nam|Tiếng Nhật|

KẾT QUẢ: Thay vì tốn 4 dòng (hoặc 9 dòng khi mở rộng), ta chỉ tốn $2 + 2 = 4$ dòng (hoặc $3 + 3 = 6$ dòng ở 2 bảng). Dữ liệu hoàn toàn sạch sẽ và dễ nâng cấp.

### 6. Dạng chuẩn hóa 5NF

Một bảng đạt chuẩn 5NF khi:
+ Đã đạt chuẩn 4NF.
+ Không còn Phụ thuộc Tách-Nối phi lý (Non-trivial Join Dependency).

Nói một cách đơn giản:

Khi bạn tách một bảng lớn thành 3 (hoặc nhiều hơn) bảng nhỏ, nếu bạn gom 3 bảng nhỏ đó lại bằng phép JOIN mà thu được đúng chính xác dữ liệu ban đầu (không bị phát sinh dữ liệu "rác/bóng ma" - spurious rows), thì bảng ban đầu đã vi phạm 5NF và bắt buộc phải tách ra làm 3 bảng riêng biệt đó.

Ví dụ: 

Xét mối quan hệ 3 bên giữa Công ty, Nhà cung cấp, và Sản phẩm.





