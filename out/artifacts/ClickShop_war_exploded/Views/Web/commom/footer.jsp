<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- BS4 CSS  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
        integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
        crossorigin="anonymous" />
    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
</head>
<body>
    
    <section class="contact">
        <div class="row">
            <div class="col-8 ">
                <div class="contact__letter d-flex align-items-center">

                    <h4><i class="fa fa-envelope-open-text"></i></i> Đăng kí nhận tin</h4>
                    <input type="email" placeholder="Nhập email của bạn">
                </div>

            </div>
            <div class="col-4 d-flex align-items-center contact__hotline">
                <i class="fa fa-phone-volume"></i>
                <p>Hotline: <span>0888 543 919</span></p>
            </div>
        </div>
    </section>
    <footer class="mt-5 p-4">
        <div class="row">
            <div class="col-6">
                <h4>Giới thiệu</h4>
                <h5>THE WOLF - PR BẰNG GIÁ TRỊ CỐT LÕI</h5>
                <p>Trong thời trang, sự bền vững luôn là yếu tố hàng đầu. Nó là cả một quá trình, từ việc bắt đầu tìm
                    kiếm các nguồn cung cấp nguyên liệu cho đến việc tạo ra những sản phẩm tới tay khách hàng. Bằng cách
                    tránh né cái quan điểm “thời trang nhanh gọn” và bắt tay tập trung vào những dây chuyền sản xuất sản
                    phẩm một cách kĩ lưỡng đã giúp chúng tôi có thể tạo nên sự khác biệt.</p>
            </div>
            <div class="col-3 contact__linked">
                <h4>Liên kết</h4>
                <p>Chính sách bảo hành</p>
                <p>Chính sách đổi trả</p>
                <p>Hướng dẫn chọn size</p>

            </div>
            <div class="col-3">
                <h4>Thông tin liên hệ</h4>
                <div class="contact__location d-flex align-items-center">
                    <i class="fa fa-map-marker-alt"></i>
                    <p>157 Ký Con, phường Nguyễn Thái Bình, Quận 1</p>
                </div>
                <div class="contact__location d-flex align-items-center">
                    <i class="fa fa-map-marker-alt"></i>
                    <p>75 Nguyễn Thượng Hiền, phường 5, Quận 3</p>
                </div>
                <div class="contact__location d-flex align-items-center">
                    <i class="fa fa-phone-volume"></i>
                    <p>0888 543 919</p>
                </div>
                <div class="contact__social d-flex align-items-center">
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-youtube"></i>
                </div>

            </div>
           
        </div>
    </footer>


     <!-- Thư viện hỗ trợ Jquery -->
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"
     integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

 <!-- BS4 JS  -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
     crossorigin="anonymous"></script>
</body>
</html>