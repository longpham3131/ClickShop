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

    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/owl.carousel.min.css">
    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
</head>

<body>
    <div class="loginTW">
        <div class="container">
            <div class="row">
                <div class="d-none d-lg-block d-xl-block col-lg-6">
                    <div class="owl-carousel owl-theme">
                        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/outfit9.jpg" alt=""></div>
                        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/outfit6.jpg" alt=""></div>
                        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/outfit7.jpg" alt=""></div>
                        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/outfit8.jpg" alt=""></div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <ul class="nav nav-pills mb-5" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link link__login active" id="pills-home-tab" data-toggle="pill" href="#formLogin" role="tab"
                                aria-controls="pills-home" aria-selected="true">Đăng nhập</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link"  data-toggle="pill" href="#formRegister" role="tab"
                                aria-controls="pills-profile" aria-selected="false">Đăng kí</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link"  data-toggle="pill" href="#formForgot" role="tab"
                               aria-controls="pills-profile" aria-selected="false">Quên mật khẩu</a>
                        </li>
    
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="formLogin" role="tabpanel"
                            aria-labelledby="pills-home-tab">
                            <div class="logo__brand text-center p-2">
                                <img src="<%=request.getContextPath()%>/Views/Web/image_product/logo.png" alt="">

                            </div>
                           
                                <div class="form-group">
                            
                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email"
                                        aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Mật khẩu">
                                </div>
                                <div class="form-group text-right">
                                    <button type="submit" class="btn btn-success">Đăng nhập</button>
                                </div>
                               
                            </form>
                        </div>
                        <div class="tab-pane fade" id="formRegister" role="tabpanel" aria-labelledby="pills-profile-tab">
                           <form action="">
                            <div class="logo__brand text-center p-2">
                                <img src="<%=request.getContextPath()%>/Views/Web/image_product/logo.png" alt="">
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="text" id="firstName" placeholder="Họ" class="form-control" autofocus>
                                </div>
                            </div>
                            <div class="form-group">
                           
                                <div class="col-sm-12">
                                    <input type="text" id="lastName" placeholder="Tên" class="form-control" autofocus>
                                </div>
                            </div>
    
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="email" id="email" placeholder="Email" class="form-control" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="password" id="password" placeholder="Mật khẩu" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
    
                                <div class="col-sm-12">
                                    <input type="password" id="passwordRewrite" placeholder="Nhập lại mật khẩu" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
    
                                <div class="col-sm-12">
                                    <input type="date" id="birthDate" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
    
                                <div class="col-sm-12">
                                    <input type="phoneNumber" id="phoneNumber" placeholder="Số điện thoại"
                                        class="form-control">
    
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="row ml-3">
                                        <div class="form-check col-6">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="radioNam" value="Male" checked>
                                            <label class="form-check-label" for="radioNam">
                                              Nam
                                            </label>
                                          </div>
                                          <div class="form-check col-6">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="radioNu" value="Female">
                                            <label class="form-check-label" for="radioNu">
                                              Nữ
                                            </label>
                                          </div>
                                    </div>
                                </div>
                            </div> <!-- /.form-group -->
                            <button type="submit" class="btn btn-outline-success w-100">Đăng kí</button>
                           </form>
                        </div>
                        <div class="tab-pane fade" id="formForgot" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <form action="">
                                <div class="logo__brand text-center p-2">
                                    <h4> Quên mật khẩu</h4>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" id="firstName" placeholder="Họ" class="form-control" autofocus>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12">
                                        <input type="text" id="lastName" placeholder="Tên" class="form-control" autofocus>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="email" id="email" placeholder="Email" class="form-control" name="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="password" id="password" placeholder="Mật khẩu" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12">
                                        <input type="password" id="passwordRewrite" placeholder="Nhập lại mật khẩu" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12">
                                        <input type="date" id="birthDate" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12">
                                        <input type="phoneNumber" id="phoneNumber" placeholder="Số điện thoại"
                                               class="form-control">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row ml-3">
                                            <div class="form-check col-6">
                                                <input class="form-check-input" type="radio" name="exampleRadios" id="radioNam" value="Male" checked>
                                                <label class="form-check-label" for="radioNam">
                                                    Nam
                                                </label>
                                            </div>
                                            <div class="form-check col-6">
                                                <input class="form-check-input" type="radio" name="exampleRadios" id="radioNu" value="Female">
                                                <label class="form-check-label" for="radioNu">
                                                    Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- /.form-group -->
                                <button type="submit" class="btn btn-outline-success w-100">Đăng kí</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BOOSTRAP JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <!-- Owl carousel  -->
    <script src="<%=request.getContextPath()%>/Views/Web/js/owl.carousel.min.js"></script>
    <script>$('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            autoplay: true,
            responsive: {
                0: {
                    items: 1
                },
            }
        })</script>
</body>

</html>