# Đóng thuộc tính trong hệ quản trị cơ sở dữ liệu

## I. Khái niệm 
Sự phụ thuộc chức năng và tính bao đóng thuộc tính là rất cần thiết để duy trì tính toàn vẹn dữ liệu và xây dựng các cơ sở dữ liệu hiệu quả, có tổ chức và được chuẩn hóa. Tính bao đóng thuộc tính của một tập hợp thuộc tính có thể được định nghĩa là một tập hợp các thuộc tính có thể được xác định về mặt chức năng từ tập hợp đó.

+ Giúp xác định tất cả các thuộc tính có thể được suy ra từ một tập hợp các thuộc tính đã cho.
+ Nó có thể tốn kém về mặt tính toán, đặc biệt là đối với các tập dữ liệu lớn.
+ Giúp ích trong thiết kế cơ sở dữ liệu bằng cách thể hiện mối quan hệ giữa các thuộc tính và bảng, từ đó cải thiện hiệu suất truy vấn.
+ Việc quản lý trở nên phức tạp hơn khi số lượng thuộc tính và bảng tăng lên.

## II. Tìm phần đóng thuộc tính của một tập hợp thuộc tính.

Kí hiệu đóng thuộc tính dấu cộng ở đầu:  Gán $X^+$ = X

Giả sử cho quan hệ $R(A, B, C, D, E)$ với tập phụ thuộc hàm $F$:

1. A -> B
2. B -> C
3. CD -> E
4. E -> A 

Bài toán: Tìm bao đóng $(AD)^+$?

Cách giải:

+ Bước 1 (Khởi tạo): $(AD)^+$ = $\{A, D\}$
+ Bước 2: Xét các phụ thuộc hàm trong $F$:
    + Xét $A -> B$: Vế trái $\{A\} \subseteq \{A, D\}$, nên thêm $B$ vào bao đóng $\implies$ $(AD)^+ = \{A, B, D\}$ 
    + Xét $B -> C$: Vế trái $\{B\} \subseteq \{A, B, D\}$, nên thêm $C$ vào bao đóng $\implies$ $(AD)^+ = \{A, B, C, D\}$
    + Xét $CD \to E$: Vế trái $\{C, D\} \subseteq \{A, B, C, D\}$, nên thêm $E$ vào bao đóng $\implies$ $(AD)^+ = \{A, B, C, D, E\}$
    
+ Bước 3: Kiểm tra xem có thuộc tính nào của $R$ chưa xuất hiện không. $(AD)^+$ lúc này đã chứa đầy đủ 5 thuộc tính $\{A, B, C, D, E\}$. Thuật toán dừng lại.Kết quả: $(AD)^+ = \{A, B, C, D, E\}$.

Kết quả: $(AD)^+ = \{A, B, C, D, E\}$

### III. Bao đóng thuộc tính dùng để làm gì?
+ Xác định khóa candidate (Khóa ứng viên): Nếu bao đóng của một tập thuộc tính $X^+$ chứa tất cả thuộc tính của quan hệ $R$, thì $X$ là một siêu khóa (superkey). Nếu không thể loại bỏ bất kỳ thuộc tính nào khỏi $X$ mà vẫn giữ nguyên điều này, $X$ chính là khóa ứng viên.
+ Kiểm tra tính đúng đắn của $X \to Y$: Muốn biết phụ thuộc hàm $X \to Y$ có thỏa mãn hay không, bạn chỉ cần tính $X^+$ rồi kiểm tra xem $Y$ có nằm trong $X^+$ hay không ($Y \subseteq X^+$).
