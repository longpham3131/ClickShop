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
<c:import url="../commom/header.jsp"> </c:import>

<%--TAT CA DON HANG CUA BAN--%>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"> Tat ca don hang</h6>
    </div>
    <table class="table table-bordered" id="dataTable" width="100%"
           cellspacing="0">
        <thead>
        <tr>
            <th>Account ID</th>
            <th>OrderID</th>
            <th>SubTotal</th>
            <th>Status</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listAllOrder}" var="listAO">
            <tr>
                <td> ${listAO.getAccID()}</td>
                <td> ${listAO.getOrderID()}</td>
                <td> ${listAO.getSubTotal()}</td>
                <td> ${listAO.getStatus()}</td>
                <td>
                    <button type="button" class="btn btn-warning" title="Detail" data-toggle="modal"
                            data-target="#detail${listAO.getOrderID()}">
                        xxx
                    </button>
                    <div class="modal" id="detail${listAO.getOrderID()}">
                        <div class="card shadow mb-4">
                            <table class="table table-bordered" id="orther detail" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>SubTotal</th>
                                    <th>Name</th>
                                    <th>tQuanity</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listAllOrderDetail}" var="listAOD">
                                    <tr>
                                        <c:if test="${listAO.getOrderID() == listAOD.getOrderID()}">
                                            <td> ${listAOD.getOrderID()}</td>
                                            <td> ${listAOD.getAccID()}</td>
                                            <td> ${listAOD.getSubTotal()}</td>
                                            <td> ${listAOD.getName()}</td>
                                            <td> ${listAOD.getQuanity()}</td>
                                            <td> ${listAOD.getStatus()}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%-- DANG GIAO--%>
<div class="card shadow mb-4">
    <h6 class="m-0 font-weight-bold text-primary"> Don hang dang duoc giao</h6>
    <table class="table table-bordered" id="dataTable" width="100%"
           cellspacing="0">
        <thead>
        <tr>
            <th>Account ID</th>
            <th>OrderID</th>
            <th>SubTotal</th>
            <th>Status</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listShipOrder}" var="ListSO">
            <tr>
                <td> ${ListSO.getAccID()}</td>
                <td> ${ListSO.getOrderID()}</td>
                <td> ${ListSO.getSubTotal()}</td>
                <td> ${ListSO.getStatus()}</td>
                <td>
                    <button type="button" class="btn btn-warning" title="Detail" data-toggle="modal"
                            data-target="#detailShip${ListSO.getOrderID()}">
                        xxx
                    </button>
                    <div class="modal" id="detailShip${ListSO.getOrderID()}">
                        <div class="card shadow mb-4">
                            <table class="table table-bordered" id="orther detail" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>SubTotal</th>
                                    <th>Name</th>
                                    <th>tQuanity</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listShipOrderDetail}" var="listSODetail">
                                    <tr>
                                        <c:if test="${ListSO.getOrderID() == listSODetail.getOrderID()}">
                                            <td> ${listSODetail.getOrderID()}</td>
                                            <td> ${listSlistSODetailOD.getAccID()}</td>
                                            <td> ${listSODetail.getSubTotal()}</td>
                                            <td> ${listSODetail.getName()}</td>
                                            <td> ${listSODetail.getQuanity()}</td>
                                            <td> ${listSODetail.getStatus()}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<c:import url="../commom/footer.jsp"> </c:import>


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
        pagination: {},
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