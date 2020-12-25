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

    <!-- MAIN CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
</head>

<body>
<c:import url="../commom/header.jsp"> </c:import>
<section class="product">
    <div class="product__main pt-5">
        <div class="row">
            <div class="d-none d-lg-block d-xl-block col-lg-2 pl-4">
                <div class="wrapper">
                    <!-- Sidebar -->
                    <nav id="sidebar">
                        <ul class="list-unstyled components">
                            <li class="active">
                                <a href="#allXL" aria-expanded="false" class="product__catagory">
                                    <form action="<%=request.getContextPath()%>//fill-All-Sanpham" method="post">
                                        <button type="submit" style="    background: transparent; border: none;">
                                            TẤT CẢ SẢN PHẨM
                                        </button>
                                    </form>
                                </a>
                                <a href="#maleXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">GIÀY NAM</a>
                                <ul class="collapse list-unstyled" id="maleXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHELSEA BOOT
                                            </button>
                                            <input type="hidden" value="Chealsea Boots - Men" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                DERBY
                                            </button>
                                            <input type="hidden" value="DERBY" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                HARNESS BOOT
                                            </button>
                                            <input type="hidden" value="Harness Boots" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                ZIP BOOT
                                            </button>
                                            <input type="hidden" value="Zip Boots" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                COMBAT BOOT
                                            </button>
                                            <input type="hidden" value="Combat Boots - Men" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                OXFORD
                                            </button>
                                            <input type="hidden" value="OXFORD" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#femaleXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">GIÀY NỮ</a>
                                <ul class="collapse list-unstyled" id="femaleXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHELSEA BOOT
                                            </button>
                                            <input type="hidden" value="Chealsea Boots - Women" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                COMBAT BOOT
                                            </button>
                                            <input type="hidden" value="Combat Boots - Women" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#teeXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">TEE (UNISEX)</a>
                                <ul class="collapse list-unstyled" id="teeXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                T-SHIRT
                                            </button>
                                            <input type="hidden" value="T-SHIRT" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                SHIRT
                                            </button>
                                            <input type="hidden" value="SHIRT" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#accessoryXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">PHỤ KIỆN</a>
                                <ul class="collapse list-unstyled" id="accessoryXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BELT
                                            </button>
                                            <input type="hidden" value="BELT" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BRACELET
                                            </button>
                                            <input type="hidden" value="BRACELET" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHAIN
                                            </button>
                                            <input type="hidden" value="CHAIN" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BANDANA
                                            </button>
                                            <input type="hidden" value="BANDANA" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                NECKLACE
                                            </button>
                                            <input type="hidden" value="NECKLACE" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BUCKET HAT
                                            </button>
                                            <input type="hidden" value="BUCKET HAT" name="Name"/>
                                        </form>
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

                    <div class="filter__product text-right pb-5">
                        <!-- <h3>Tất cả sản phẩm (chỗ này thay đổi theo sidebar)</h3> -->
                        <span class="custom-dropdown custom-dropdown--grey pr-3">
                                <select class="sort-by custom-dropdown__select ">

                                    <option value="price-ascending">Giá:
                                        Tăng dần</option>
                                    <option value="price-descending">Giá:
                                        Giảm dần</option>
                                    <option value="title-ascending">Tên:
                                        A-Z</option>
                                    <option value="title-descending">Tên:
                                        Z-A</option>
                                    <option value="created-ascending"
                                    >Cũ nhất</option>
                                    <option value="created-descending"
                                    >Mới nhất</option>

                                    <option value="best-selling">

                                        Bán chạy nhất</option>
                                    <option value="quantity-descending">Tồn kho: Giảm dần</option>
                                </select>
                            </span>

                    </div>
                    <div class="row">
                        <c:forEach items="${listPhantrang}" var="row">
                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">
                                <form action="<%=request.getContextPath()%>/chooseProduct" method="post">
                                    <button type="submit" style="    background: transparent; border: none;">
                                        <input type="hidden" value="${row.productId}" name="ProductId"/>
                                        <input type="hidden" value="${row.name}" name="Name"/>
                                        <input type="hidden" value="${row.imagePath}" name="ImagePath"/>
                                        <input type="hidden" value="${row.description}" name="Description"/>
                                        <input type="hidden" value="${row.getUnitPrice()}" name="UnitPrice"/>
                                        <img src="<%=request.getContextPath()%>/Views/Web${row.getImagePath()}" alt="">

                                        <h4>
                                                ${row.name}
                                        </h4>
                                        <span>${row.getUnitPrice()}</span>
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation example pt-4">
                        <%--                        <ul class="pagination justify-content-center">--%>
                        <%--                            <li class="page-item">--%>
                        <%--                                <a class="page-link" href="#" aria-label="Previous">--%>
                        <%--                                    <span aria-hidden="true">&laquo;</span>--%>
                        <%--                                    <span class="sr-only">Previous</span>--%>
                        <%--                                </a>--%>
                        <%--                            </li>--%>
                        <%--                            <c:forEach begin="1" end="${numberPage}" var="i">--%>
                        <%--                                <form class="page-link" action="<%=request.getContextPath()%>/fill-All-Sanpham">--%>
                        <%--                                    <button type="submit" value="${i}" name="index"--%>
                        <%--                                            style="    background: transparent; border: none;">--%>
                        <%--                                        <li class="page-item">--%>
                        <%--                                            <input type="hidden" value="${i}" name="index"/>--%>
                        <%--                                                ${i}--%>
                        <%--                                        </li>--%>
                        <%--                                    </button>--%>
                        <%--                                </form>--%>
                        <%--                            </c:forEach>--%>
                        <%--                                <a class="page-link" href="#" aria-label="Next">--%>
                        <%--                                    <span aria-hidden="true">&raquo;</span>--%>
                        <%--                                    <span class="sr-only">Next</span>--%>
                        <%--                                </a>--%>
                        <%--                            </li>--%>
                        <%--                        </ul>--%>
                        <ul class="pagination pt-3 justify-content-center">
                            <c:forEach begin="1" end="${numberPage}" var="i">
                                <form class="page-link" style=" border: none; border-bottom: 2px solid black; margin: 15px; font-size: 20px;
                                " action="<%=request.getContextPath()%>/fill-All-Sanpham">
                                    <button type="submit" value="${i}" name="index"
                                            style="    background: transparent; border: none;">
                                        <li class="page-item">
                                            <input type="hidden" value="${i}" name="index"/>
                                                ${i}
                                        </li>
                                    </button>
                                </form>
                            </c:forEach>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>

    </div>
</section>
<c:import url="../commom/footer.jsp"> </c:import>

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

<%--<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>--%>
</body>

</html>