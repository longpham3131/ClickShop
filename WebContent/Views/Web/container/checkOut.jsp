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
    <c:import url="../global/linkCSS.jsp"> </c:import>
</head>
<body class="position-relative">
<c:import url="../commom/header.jsp"> </c:import>
<c:import url="../commom/sideBar.jsp"> </c:import>
<!--checkout-->
<c:if test="${loi == 'mn'}">
    <script> alert("Giá trị đơn hàng vượt quá số dư")</script>
</c:if>

<section class="checkout_wthree py-sm-5 py-3">
    <div class="container">
        <div class="check_w3ls">
            <div class="d-sm-flex justify-content-between mb-4">
                <h4>Giỏ hàng của bạn
                </h4>
                <h4 class="mt-sm-0 mt-3">Hiện tại có :
                    <span class="soLuongSanPham">3 </span> sản phẩm
                </h4>
            </div>
            <div class="checkout-right">
                <table class="timetable_sub tableOrder">
                    <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th class="d-none">Giá</th>
                        <th>Giá</th>
                        <th>Xóa</th>
                    </tr>
                    </thead>
                    <tbody class="tbodyCart">
                    </tbody>
                </table>
            </div>
            <div class="row checkout-left mt-5">
                <div class="col-md-8 address_form">
                    <h4>Địa chỉ giao hàng</h4>
                    <form action="<%=request.getContextPath()%>/order" method="post"
                          class="creditly-card-form shopf-sear-headinfo_form" id="orderForm">
                        <div class="creditly-wrapper wrapper">
                            <div class="information-wrapper">
                                <div class="first-row form-group">
                                    <c:forEach items="${fillTextBox}" var="info">
                                        <div class="card_number_grid_right">
                                            <div class="form-group">
                                                <label class="control-label ">Email: </label>
                                                <input class="form-control mb-0" type="email" placeholder="Email"
                                                       name="email" value="${email}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Họ và tên: </label>
                                                <input class="form-control mb-0" type="text" name="name"
                                                       id="inpFname"
                                                       value="${info.firstName} ${info.lastName} ">
                                                <span class="animate__animated animate__fadeIn" style="display: none;"
                                                      id="tbHo"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Số điện thoại :</label>
                                                <input class="form-control mb-0" type="text"
                                                       name="phone" value="${info.phone}" id="inpPhone">
                                                <span class="animate__animated animate__fadeIn"
                                                      style="display: none;" id="tbSDT"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Địa chỉ: </label>
                                                <input class="form-control mb-0" type="text" placeholder="Địa chỉ"
                                                       name="address" value="${info.address}" id="inpAddress">
                                                <span class="animate__animated animate__fadeIn"
                                                      style="display: none;" id="tbDiaChi"></span>
                                            </div>
                                        </div>
                                        <div id="divIp"></div>
                                    </c:forEach>
                                </div>
                                <div class="wrap-btnCheckOut text-right">
                                    <button type="button" id="btnOrderSubmit" class="btn btn-success btnThanhToan">Thanh
                                        toán bằng coin
                                    </button>

                                    <!-- The Modal -->
                                    <div class="modal fade" id="myOrder">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Thông báo</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    Chờ tí, đơn hàng đang thực hiện...
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <br>
                    <br>
                    <form action="<%=request.getContextPath()%>/authorize-payment" method="post"
                          class="creditly-card-form shopf-sear-headinfo_form" id="orderForm2">
                        <div class="creditly-wrapper wrapper">
                            <div class="information-wrapper">
                                <div class="first-row form-group">
                                    <c:forEach items="${fillTextBox}" var="info">
                                        <div class="card_number_grid_right">
                                            <div class="form-group">
                                                <label class="control-label ">Email: </label>
                                                <input class="form-control mb-0" type="email" placeholder="Email"
                                                       name="email" value="${email}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Họ và tên: </label>
                                                <input class="form-control mb-0" type="text" name="name"
                                                       id="inpFname"
                                                       value="${info.firstName} ${info.lastName} ">
                                                <span class="animate__animated animate__fadeIn" style="display: none;"
                                                      id="tbHo"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Số điện thoại :</label>
                                                <input class="form-control mb-0" type="text"
                                                       name="phone" value="${info.phone}" id="inpPhone">
                                                <span class="animate__animated animate__fadeIn"
                                                      style="display: none;" id="tbSDT"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Địa chỉ: </label>
                                                <input class="form-control mb-0" type="text" placeholder="Địa chỉ"
                                                       name="address" value="${info.address}" id="inpAddress">
                                                <span class="animate__animated animate__fadeIn"
                                                      style="display: none;" id="tbDiaChi"></span>
                                            </div>
                                        </div>
                                        <div id="divIp"></div>
                                        <div id="divIp2"></div>
                                    </c:forEach>
                                </div>
                                <div class="wrap-btnCheckOut text-right">
                                    <button type="submit" id="btnOrderSubmit2" class="btn btn-success btnThanhToan">Thanh
                                        toán PayPal
                                    </button>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="myOrder">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Thông báo</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    Chờ tí, đơn hàng đang thực hiện...
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <h2>Tổng tiền: <span class="totalPrice">0đ</span></h2>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../commom/footer.jsp"> </c:import>

<c:import url="../global/linkScript.jsp"> </c:import>

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>

<script src="<%=request.getContextPath()%>/Views/Global/Validation.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/orderValid.js"></script>


</body>

</html>