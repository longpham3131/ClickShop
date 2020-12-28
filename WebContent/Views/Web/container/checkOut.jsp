<%@ page import="com.model.InfoOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng của bạn</title>
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

<!--checkout-->
<section class="checkout_wthree py-sm-5 py-3">
    <div class="container">
        <div class="check_w3ls">
            <div class="d-sm-flex justify-content-between mb-4">
                <h4>Giỏ hàng của bạn
                </h4>
                <h4 class="mt-sm-0 mt-3">Hiện tại có :
                    <span id="soLuongSanPham">3 </span> sản phẩm
                </h4>
            </div>
            <div class="checkout-right">
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

<%--                <h1>${i} , ${y} , ${str}</h1>--%>
            </div>
            <div class="row checkout-left mt-5">
                <div class="col-md-8 address_form">
                    <h4>Địa chỉ giao hàng</h4>
                    <form action="<%=request.getContextPath()%>/order" method="post"
                          class="creditly-card-form shopf-sear-headinfo_form">
                        <div class="creditly-wrapper wrapper">
                            <div class="information-wrapper">
                                <div class="first-row form-group">
                                    <div class="controls">
                                        <label class="control-label">Họ và tên: </label>
                                        <input class="billing-address-name form-control" type="text" name="name"
                                               placeholder="Họ và tên">
                                    </div>
                                    <div class="card_number_grids">
                                        <div class="card_number_grid_left">
                                            <div class="controls">
                                                <label class="control-label">Số điện thoại :</label>
                                                <input class="form-control" type="text" placeholder="Số điện thoại" name="phone">
                                            </div>
                                        </div>
                                        <div class="card_number_grid_right">
                                            <div class="controls">
                                                <label class="control-label">Email: </label>
                                                <input class="form-control" type="email" placeholder="Email" name="email">
                                            </div>
                                        </div>

                                        <div class="card_number_grid_right">
                                            <div class="controls">
                                                <label class="control-label">Địa chỉ: </label>
                                                <input class="form-control" type="text" placeholder="Địa chỉ" name="address">
                                            </div>
                                        </div>

                                        <div id="divIp">
                                        </div>


                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="wrap-btnCheckOut text-right">
                                    <button class="submit check_out">Thanh toán</button>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <h2>Total price: <span id="totalPrice">1600</span></h2>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>
<!--//checkout-->
<!-- BOOSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script>
    $(window).on("load",function(){
        $(".loader-wrapper").fadeOut("slow");
    });
</script>
<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>

</body>

</html>