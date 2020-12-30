<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          crossorigin="anonymous"/>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- OWL  CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/owl.carousel.min.css">
    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">

</head>

<body>
<%--<h1>${kq} </h1>--%>



<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>

<c:import url="./commom/header.jsp"> </c:import>
<section class="carousel">
    <div class="owl-carousel owl-theme">
        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel_2.jpg"
                               alt=""></div>
        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel.jpg" alt="">
        </div>


    </div>
</section>
<section class="basicCollection text-center">
    <div class="basicCollection__title">
        <h2><a href="#">THE BASIC COLLECTION</a></h2>
    </div>
    <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${listSanpham}" var="row">
                <c:if test="${row.getProductId()  < 7 }">
                    <div class="swiper-slide">
                        <form action="<%=request.getContextPath()%>/chooseProduct" method="post">
                            <button type="submit" style="    background: transparent; border: none;">
                                <input type="hidden" value="${row.productId}" name="ProductId"/>
                                <input type="hidden" value="${row.name}" name="Name"/>
                                <input type="hidden" value="${row.imagePath}" name="ImagePath"/>
                                <input type="hidden" value="${row.description}" name="Description"/>
                                <input type="hidden" value="${row.getUnitPrice()}" name="UnitPrice"/>
                                <img src="<%=request.getContextPath()%>/Views/Web${row.getImagePath()}" alt="">
                                <h4>
                                    <td>${row.name}</td>
                                </h4>

                                <span>
                                    <td>${row.getUnitPrice()}</td>
                                </span>
                            </button>
                        </form>

                    </div>
                </c:if>
            </c:forEach>

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
        <form action="<%=request.getContextPath()%>/fill-All-Sanpham" method="post">
            <button type="submit" class="btn btn-dark">
                XEM THÊM
            </button>
        </form>
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
    <h4 class="pb-2"><a href="#">Click Shop Founder</a></h4>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kha.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM THUC KHA</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kiet.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>NGUYEN TUAN KIET</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/long.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM HOANG LONG</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kha.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM THUC KHA</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kiet.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>NGUYEN TUAN KIET</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/long.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM HOANG LONG</span></a>
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

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>
<c:if test="${kq == 1}">

<%--Xóa giỏ hàng sau khi đặt hàng thành công --%>
<script> alert("Đặt hàng thành công");</script>
<script>
    dssp.xoaTatCaSP();
    setLocalStorage();
    getLocalStorage();
</script>
        <%  session.setAttribute("kq", "0"); %>
</c:if>
<c:if test="${kq == -1} ">
        <%  session.setAttribute("kq", "0"); %>
<script> alert("Đặt hàng thất bại"); </script>
</c:if>
<script>
    $(window).on("load", function () {
        $(".loader-wrapper").fadeOut("slow");
    });
</script>
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
        pagination: {},
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>
