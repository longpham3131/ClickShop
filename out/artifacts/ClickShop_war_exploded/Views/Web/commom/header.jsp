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
    <header>
        <div class="container ">
            <div class="header__top d-flex align-items-center justify-content-center">
                <div class="header__logo ">
                    <a href="<%=request.getContextPath()%>/Views/Web/index.jsp">
                        <img src="<%=request.getContextPath()%>/Views/Web/img/logo.png" alt="">
                    </a>

                </div>
                <div class="header__icons">
                    <a href="<%=request.getContextPath()%>/Views/Web/container/login.jsp" aria-label="Tài khoản" title="Tài khoản"><i class="fa fa-user"></i></a>
                    <a href="#" aria-label="Tìm kiếm" title="Tìm kiếm"><i class="fa fa-search"></i></a>
                    <a href="#" aria-label="Giỏ hàng" title="Giỏ hàng" data-toggle="modal" data-target="#myModal"><i class="fa fa-shopping-cart"></i></a>
                </div>
            </div>

            <div class="header__nav">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-around" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__giaynam" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    GIÀY NAM
                                </a>
                                <div class="dropdown-menu dropdown__giaynam nav-item__dropdown"
                                    aria-labelledby="dropdown__giaynam">
                                    <div class="row">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">CHELSEA BOOT</a>
                                            <a class="dropdown-item" href="#">DERBY</a>
                                            <a class="dropdown-item" href="#">HARNESS BOOT</a>
                                            <a class="dropdown-item" href="#">ZIP BOOT</a>
                                            <a class="dropdown-item" href="#">COMBAT BOOT</a>
                                            <a class="dropdown-item" href="#">OXFORD</a>
                                            <a class="dropdown-item" href="#">MONKSTRAP</a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="row">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nam_1.png" alt="">
                                                    <span> <a href="#">GIÀY CAO CỔ</a></span>
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nam_2.png" alt="">
                                                    <span> <a href="#">GIÀY THẤP CỔ</a></span>

                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nam_3.png" alt="">
                                                    <span><a href="#">GIÀY TĂNG CHIỀU CAO</a></span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__giaynu" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    GIÀY NỮ
                                </a>
                                <div class="dropdown-menu dropdown__giaynu nav-item__dropdown"
                                    aria-labelledby="dropdown__giaynu">
                                    <div class="row">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">CHELSEA BOOT</a>
                                            <a class="dropdown-item" href="#">DERBY</a>
                                            <a class="dropdown-item" href="#">COMBAT BOOT</a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="row">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nu_1.png" alt="Responsive image">
                                                    <span> <a href="#">GIÀY CAO CỔ</a></span>

                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nu_2.png" alt="Responsive image">
                                                    <span> <a href="#">GIÀY THẤP CỔ</a></span>

                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/img/dropdown__nu_3.png" alt="Responsive image">
                                                    <span> <a href="#">GIÀY TĂNG CHIỀU CAO</a></span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__Tee" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    TEE(UNISEX)
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown__Tee">
                                    <a class="dropdown-item" href="#">T-SHIRT</a>
                                    <a class="dropdown-item" href="#">SHIRT</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__phuKien" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    PHỤ KIỆN
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown__phuKien">
                                    <a class="dropdown-item" href="#">BELT</a>
                                    <a class="dropdown-item" href="#">BRACELET</a>
                                    <a class="dropdown-item" href="#">CHAIN</a>
                                    <a class="dropdown-item" href="#">BANDANA</a>
                                    <a class="dropdown-item" href="#">NECKLACE</a>
                                    <a class="dropdown-item" href="#">BUKET HAT</a>
                                </div>

                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__newCollection" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    NEW COLLECTION
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown__newCollection">
                                    <a class="dropdown-item" href="#">THE ALPHA COLLECTION</a>
                                    <a class="dropdown-item" href="#">THE BASIC COLLECTION</a>
                                </div>


                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">WE ARE WOLFER <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__niceLife" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    LỐI SỐNG ĐẸP
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown__newCollection">
                                    <a class="dropdown-item" href="#">BEAUTIFUL LIFESTYLE</a>
                                    <a class="dropdown-item" href="#">CÁC TIP VỀ THỜI TRANG</a>
                                </div>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">LIÊN HỆ</a>
                            </li>


                        </ul>
                    </div>
                </nav>
            </div>
            <!-- Modal giỏ hàng -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Giỏ hàng của bạn</h4>
                            <button type="button" class="close"
                                    data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="d-sm-flex justify-content-end mb-4">

                                <h4 class="mt-sm-0 mt-3">Hiện tại có :
                                    <span id="soLuongSanPham">3 </span> sản phẩm
                                </h4>
                            </div>
                            <table class="timetable_sub" id="tableOrder">
                                <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th class="d-none">Giá</th>
                                    <th>Giá</th>
                                    <th>Xóa</th>
                                </tr>
                                </thead>
                                <tbody id="tbodySP">

                                </tbody>
                            </table>
                            <div class="text-right pt-3">
                                <h3>Tổng tiền: <span id="totalPrice">0đ</span> </h3>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <a href="<%=request.getContextPath()%>/Views/Web/container/checkOut.jsp"> <button type="button"
                                                               class="btn btn-success">Thanh
                                Toán</button></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <!-- Thư viện hỗ trợ Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- BS4 JS  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>

</html>