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

    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
</head>

<body>
    <c:import url="./commom/header.jsp"> </c:import>
    <section class="product">
        <!-- <div class="product__head d-flex bg-light">
            <p>Trang chủ /</p>
            <p>Danh mục /</p>
            <p>Tất cả sản phẩm (Chỗ này thay đổi theo SideBar)</p> 
        </div> -->
        <div class="product__main pt-5">
            <div class="row">
                <div class="d-none d-lg-block d-xl-block col-lg-2 pl-4">
                    <div class="wrapper">
                        <!-- Sidebar -->
                        <nav id="sidebar">
                            <ul class="list-unstyled components">
                                <li class="active">
                                    <a href="#male" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">GIÀY NAM</a>
                                    <ul class="collapse list-unstyled" id="male">
                                        <li>
                                            <a href="#">CHELSEA BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">DERBY</a>
                                        </li>
                                        <li>
                                            <a href="#">HARNESS BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">ZIP BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">COMBAT BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">OXFORD</a>
                                        </li>
                                        <li>
                                            <a href="#">MONKSTRAP</a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#female" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">GIÀY NỮ</a>
                                    <ul class="collapse list-unstyled" id="female">
                                        <li>
                                            <a href="#">CHELSEA BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">COMBAT BOOT</a>
                                        </li>
                                        <li>
                                            <a href="#">DERBY</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#tee" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">TEE (UNISEX)</a>
                                    <ul class="collapse list-unstyled" id="tee">
                                        <li>
                                            <a href="#">T-SHIRT</a>
                                        </li>
                                        <li>
                                            <a href="#">SHIRT</a>
                                        </li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="#accessory" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">PHỤ KIỆN</a>
                                    <ul class="collapse list-unstyled" id="accessory">
                                        <li>
                                            <a href="#">BELT</a>
                                        </li>
                                        <li>
                                            <a href="#">BRACELET</a>
                                        </li>
                                        <li>
                                            <a href="#">CHAIN</a>
                                        </li>
                                        <li>
                                            <a href="#">BANDANA</a>
                                        </li>
                                        <li>
                                            <a href="#">NECKLAGE</a>
                                        </li>
                                        <li>
                                            <a href="#">BUCKET HAT</a>
                                        </li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="#newCollection" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">NEW COLLECTION</a>
                                    <ul class="collapse list-unstyled" id="newCollection">
                                        <li>
                                            <a href="#">THE ALPHA COLLECTION</a>
                                        </li>
                                        <li>
                                            <a href="#">THE BASIC COLLECTION</a>
                                        </li>


                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="product__catagory">WE ARE WOLFER</a>
                                </li>
                                <li>
                                    <a href="#niceLife" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">LỐI SỐNG ĐẸP</a>
                                    <ul class="collapse list-unstyled" id="niceLife">
                                        <li>
                                            <a href="#">BEAUTIFUL LIFESTYLE</a>
                                        </li>
                                        <li>
                                            <a href="#">CÁC TIPS VỀ THỜI TRANG</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="product__catagory">LIÊN HỆ</a>
                                </li>
                                <li class="filter__color">
                                    <a href="#filterColor" data-toggle="collapse" aria-expanded="false"
                                        class="dropdown-toggle product__catagory">MÀU SẮC</a>
                                    <ul class="collapse list-unstyled" id="filterColor">
                                        <li class="active">
                                            <input type="checkbox" id="data-color-p1" value="TOBACCO"
                                                name="color-filter" data-color="(variant:product**TOBACCO)">
                                            <label for="data-color-p1" style="background-color: #b77543"></label>
                                        </li>
                                        <li class="">
                                            <input type="checkbox" id="data-color-p2" value="TAN" name="color-filter"
                                                data-color="(variant:product**TAN)">
                                            <label for="data-color-p2" style="background-color: #e1b382"></label>
                                        </li>
                                        <li class="">
                                            <input type="checkbox" id="data-color-p3" value="NÂU ĐẤT"
                                                name="color-filter" data-color="(variant:product**NÂU ĐẤT)">
                                            <label for="data-color-p3" style="background-color: #5b3d32"></label>
                                        </li>
                                        <li class="">
                                            <input type="checkbox" id="data-color-p4" value="XÁM CHUỘT"
                                                name="color-filter" data-color="(variant:product**XÁM CHUỘT)">
                                            <label for="data-color-p4" style="background-color: #787775"></label>
                                        </li>
                                        <li class="">
                                            <input type="checkbox" id="data-color-p5" value="FOREST BLUE"
                                                name="color-filter" data-color="(variant:product**FOREST BLUE)">
                                            <label for="data-color-p5" style="background-color: #363e6f"></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="data-color-p6" value="NAVY BLUE"
                                                name="color-filter" data-color="(variant:product**NAVY BLUE)">
                                            <label for="data-color-p6" style="background-color: #393357"></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="data-color-p7" value="BROWN" name="color-filter"
                                                data-color="(variant:product**BROWN)">
                                            <label for="data-color-p7" style="background-color: #6e4a4a"></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="data-color-p8" value="BLACK" name="color-filter"
                                                data-color="(variant:product**BLACK)">
                                            <label for="data-color-p8" style="background-color: #000000"></label>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </div>
                <div class="col-12 col-lg-10">
                    <div class="product__type text-center">
                        <div class="product__catagories d-md-block d-lg-none d-xl-none">
                            <div class="title-bl" href="#thongTinSP" data-toggle="collapse">
                                <h2>
                                    Danh mục sản phẩm

                                </h2>
                                <i class="fa fa-plus"></i>
                            </div>
                            <div class="collapse list-unstyled" id="thongTinSP">
                                <div class="main_details">
                                    <ul class="list-unstyled components">
                                        <li class="active">
                                            <a href="#male" data-toggle="collapse" aria-expanded="false"
                                                class="dropdown-toggle product__catagory">GIÀY NAM</a>
                                            <ul class="collapse list-unstyled" id="male">
                                                <li>
                                                    <a href="#">CHELSEA BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">DERBY</a>
                                                </li>
                                                <li>
                                                    <a href="#">HARNESS BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">ZIP BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">COMBAT BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">OXFORD</a>
                                                </li>
                                                <li>
                                                    <a href="#">MONKSTRAP</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#female" data-toggle="collapse" aria-expanded="false"
                                                class="dropdown-toggle product__catagory">GIÀY NỮ</a>
                                            <ul class="collapse list-unstyled" id="female">
                                                <li>
                                                    <a href="#">CHELSEA BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">COMBAT BOOT</a>
                                                </li>
                                                <li>
                                                    <a href="#">DERBY</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#tee" data-toggle="collapse" aria-expanded="false"
                                                class="dropdown-toggle product__catagory">TEE (UNISEX)</a>
                                            <ul class="collapse list-unstyled" id="tee">
                                                <li>
                                                    <a href="#">T-SHIRT</a>
                                                </li>
                                                <li>
                                                    <a href="#">SHIRT</a>
                                                </li>

                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#accessory" data-toggle="collapse" aria-expanded="false"
                                                class="dropdown-toggle product__catagory">PHỤ KIỆN</a>
                                            <ul class="collapse list-unstyled" id="accessory">
                                                <li>
                                                    <a href="#">BELT</a>
                                                </li>
                                                <li>
                                                    <a href="#">BRACELET</a>
                                                </li>
                                                <li>
                                                    <a href="#">CHAIN</a>
                                                </li>
                                                <li>
                                                    <a href="#">BANDANA</a>
                                                </li>
                                                <li>
                                                    <a href="#">NECKLAGE</a>
                                                </li>
                                                <li>
                                                    <a href="#">BUCKET HAT</a>
                                                </li>

                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="product__colors d-md-block d-lg-none d-xl-none py-3">
                            <div class="title-bl" href="#mauSacSP" data-toggle="collapse">
                                <h2>
                                    Màu sắc sản phẩm
                                </h2>
                                <i class="fa fa-plus"></i>
                            </div>
                            <ul class="collapse list-unstyled row pt-4" id="mauSacSP">
                                <li class="active col-3">
                                    <input type="checkbox" id="data-color-md-p1" value="TOBACCO"
                                        name="color-filter">
                                    <label for="data-color-md-p1"
                                        style="background-color: #b77543"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p2" value="TAN"
                                        name="color-filter">
                                    <label for="data-color-md-p2"
                                        style="background-color: #e1b382"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p3" value="NÂU ĐẤT"
                                        name="color-filter">
                                    <label for="data-color-md-p3"
                                        style="background-color: #5b3d32"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p4" value="XÁM CHUỘT"
                                        name="color-filter">
                                    <label for="data-color-md-p4"
                                        style="background-color: #787775"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p5" value="FOREST BLUE"
                                        name="color-filter">
                                    <label for="data-color-md-p5"
                                        style="background-color: #363e6f"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p6" value="NAVY BLUE"
                                        name="color-filter">
                                    <label for="data-color-md-p6"
                                        style="background-color: #393357"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p7" value="BROWN"
                                        name="color-filter">
                                    <label for="data-color-md-p7"
                                        style="background-color: #6e4a4a"></label>
                                </li>
                                <li class="col-3 ">
                                    <input type="checkbox" id="data-color-md-p8" value="BLACK"
                                        name="color-filter">
                                    <label for="data-color-md-p8"
                                        style="background-color: #000000"></label>
                                </li>
                            </ul>
                        </div>

                        <div class="filter__product text-right pb-5">
                            <!-- <h3>Tất cả sản phẩm (chỗ này thay đổi theo sidebar)</h3> -->
                            <span class="custom-dropdown custom-dropdown--grey pr-3">
                                <select class="sort-by custom-dropdown__select ">

                                    <option value="price-ascending" data-filter="&amp;sortby=(price:product=asc)">Giá:
                                        Tăng dần</option>
                                    <option value="price-descending" data-filter="&amp;sortby=(price:product=desc)">Giá:
                                        Giảm dần</option>
                                    <option value="title-ascending" data-filter="&amp;sortby=(title:product=asc)">Tên:
                                        A-Z</option>
                                    <option value="title-descending" data-filter="&amp;sortby=(price:product=desc)">Tên:
                                        Z-A</option>
                                    <option value="created-ascending"
                                        data-filter="&amp;sortby=(updated_at:product=desc)">Cũ nhất</option>
                                    <option value="created-descending"
                                        data-filter="&amp;sortby=(updated_at:product=asc)">Mới nhất</option>
                                    <option value="best-selling" data-filter="&amp;sortby=(sold_quantity:product=desc)">
                                        Bán chạy nhất</option>
                                    <option value="quantity-descending">Tồn kho: Giảm dần</option>
                                </select>
                            </span>

                        </div>
-------------
<%--                        <div class="row">--%>
<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>

<%--                                <c:forEach items="${listSanpham}" var="row">--%>
<%--                                    <tr>--%>

<%--                                        <img src="<%=request.getContextPath()%>${row.getImagePath()}" alt="">--%>
<%--                                        <h4>--%>
<%--                                            <td>${row.name}</td>--%>
<%--                                        </h4>--%>
<%--                                        <span>--%>
<%--                                            <td>${row.getUnitPrice()}</td>--%>
<%--                                        </span>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>

<%--                            </div>--%>

<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/Tee02.PNG" alt="">--%>

<%--                                <h4>--%>
<%--                                    THE WOLF BASIC TEE - TAN--%>
<%--                                </h4>--%>
<%--                                <span>280,000₫</span>--%>
<%--                            </div>--%>


<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/Tee03.jpg" alt="">--%>


<%--                                <h4>--%>
<%--                                    THE WOLF BASIC TEE - WHITE--%>
<%--                                </h4>--%>
<%--                                <span>280,000₫</span>--%>
<%--                            </div>--%>
<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/Tee01.jpg" alt="">--%>


<%--                                <h4> THE WOLF BASIC TEE - BLACK</h4>--%>
<%--                                <span>280,000₫</span>--%>
<%--                            </div>--%>
<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/Tee05.PNG" alt="">--%>


<%--                                <h4>--%>
<%--                                    THE WOLF SEVEN ELEMENTS TEE - WHITE--%>
<%--                                </h4>--%>
<%--                                <span>350,000₫</span>--%>
<%--                            </div>--%>
<%--                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/Oxford02.PNG" alt="">--%>
<%--                                <img src="<%=request.getContextPath()%>/Views/Web/img/derby1__hover.jpg" alt="" class="img__hover">--%>

<%--                                <h4>--%>
<%--                                    THE BASIC WOLF OXFORD - BLACK--%>
<%--                                </h4>--%>
<%--                                <span>1,500,000₫</span>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>

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
    <a href="#" class="backToTop cd-top text-replace js-cd-top"></a>
    <script src="<%=request.getContextPath()%>/Views/Web/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/Views/Web/js/util.js"></script>

    <script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>
</body>

</html>