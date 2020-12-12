<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- OWL  CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/owl.carousel.min.css">
    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">

</head>

<body>
    <c:import url="./commom/header.jsp"> </c:import>

    <section class="carousel">
        <div class="owl-carousel owl-theme">
            <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/img/banner__carousel.jpg" alt=""></div>
            <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/img/banner__carousel_2.jpg" alt=""></div>

        </div>
    </section>
    <section class="basicCollection text-center">
        <div class="basicCollection__title">
            <h2><a href="#">THE BASIC COLLECTION</a></h2>
        </div>
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Tee02.PNG" alt="">

                    <h4>
                        THE WOLF BASIC TEE - TAN
                    </h4>
                    <span>280,000₫</span>

                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Tee03.jpg" alt="">


                    <h4>
                        THE WOLF BASIC TEE - WHITE
                    </h4>
                    <span>280,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Tee01.jpg" alt="">


                    <h4> THE WOLF BASIC TEE - BLACK</h4>
                    <span>280,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Tee04.jpg" alt="">


                    <h4>
                        THE WOLF SEVEN ELEMENTS TEE - Black
                    </h4>
                    <span>350,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Tee05.PNG   " alt="">


                    <h4>
                        THE WOLF SEVEN ELEMENTS TEE - WHITE
                    </h4>
                    <span>350,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Oxford01.jpg" alt="">


                    <h4>
                        THE BASIC WOLF OXFORD - BLACK
                    </h4>
                    <span>1,500,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Chelsea02.jpg" alt="">


                    <h4>
                        THE BASIC WOLF CHELSEA BOOT - TAN
                    </h4>
                    <span>1,600,000₫</span>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/Chelsea01.jpg" alt="">

                    <h4>
                        THE BASIC WOLF CHELSEA BOOT - BLACK
                    </h4>
                    <span>1,600,000₫</span>
                </div>

            </div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>
    <section class="banner position-relative">
        <div class="banner__content">
            <h4>THE WOLF</h4>
            <h2>THE BASIC COLLECTION</h2>
            <button type="button" class="btn btn-dark">XEM THÊM</button>
        </div>
    </section>
    <section class="story text-center container">
        <h2 class="p-5">
            THE BASIC COLLECTION | A STORY OF THE WOLF
        </h2>
        <iframe width="100%" height="600" src="https://www.youtube.com/embed/wBS9QH6qCUQ" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
    </section>
    <section class="outfit container">
        <h4 class="pb-2"><a href="#">@thewolf.vn - Outfit Inspiration</a></h4>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit1.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit2.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit3.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit4.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit6.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit7.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit8.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit9.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>
                <div class="swiper-slide">
                    <img src="<%=request.getContextPath()%>/Views/Web/img/outfit10.jpg" alt="">
                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span>SHOP THIS LOOK</span></a>
                </div>


            </div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>

    </section>

    <c:import url="./commom/footer.jsp"> </c:import>




    <!-- Thư viện hỗ trợ Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- BS4 JS  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
    <!-- OWL CAROUSEL JS -->
    <script src="<%=request.getContextPath()%>/Views/Web/js/owl.carousel.min.js"></script>
    <script>
        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            autoHeight: true,

            responsive: {
                0: {
                    items: 1
                },
            }
        })
    </script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            spaceBetween: 15,
            loop: true,
            pagination: {


            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
    <script>
        // When the user scrolls down 20px from the top of the document, slide down the navbar
        // window.onscroll = function() {scrollFunction()};

        // function scrollFunction() {
        //   if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        //     document.getElementById("header").style.top = "0";
        //   } else {
        //     document.getElementById("header").style.top = "-50px";
        //   }
        // }
        // </script>
    <!-- SCROLL TO TOP  -->

    <a href="#" class="backToTop cd-top text-replace js-cd-top"></a>
    <script src="<%=request.getContextPath()%>/Views/Web/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/Views/Web/js/util.js"></script>
    <script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
    <script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
    <script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>
</body>

</html>