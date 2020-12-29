<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 12/22/2020
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang tài khoản</title>
<!-- BS4 CSS  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- FONT AWESOME  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"/>

<!-- MAIN CSS  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
<body>
<style>
    .profilePage .nav-pills .nav-link.active{
        color: #fff;
        background-color: #120c0c;
    }
    .profilePage .nav-pills .nav-link{
        background-color: #cec5c552;
    }
</style>
<c:import url="../commom/header.jsp"> </c:import>

<div class="row p-4 profilePage">
    <div class="col-3">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Thông tin cá nhân</a>
            <a class="nav-link " id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Lịch sử đơn hàng</a>


        </div>
    </div>
    <div class="col-9">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade  show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="text-center">
                    <h4>Thông tin cá nhân</h4>
                </div>
                <div class="profile__user container col-9">
                    ${info.size()}
                    <c:forEach items="${myinfo}" var="info">
                        <form>
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${info.email}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputFirstName" class="col-sm-2 col-form-label">Họ và tên</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="inputFirstName" value="${info.firstName}">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputLastName" value="${info.lastName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPhone" class="col-sm-2 col-form-label">Số điện thoại</label>
                                <div class="col-sm-10">
                                    <input type="tel" class="form-control" id="inputPhone" value="${info.phone}">
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <%--TAT CA DON HANG CUA BAN--%>
                <div class="card shadow mb-4">
                    <div class="card-header py-3 text-center">
                        <h5 class="m-0 font-weight-bold text-dark">Tất cả đơn hàng</h5>
                    </div>
                    <table class="table table-bordered"  width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thông tin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listAllOrder}" var="listAO">
                            <tr>
                                <td> ${listAO.getOrderID()}</td>
                                <td> ${listAO.getSubTotal()}</td>
                                <td> ${listAO.getStatus()}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Detail" data-toggle="modal"
                                            data-target="#detail${listAO.getOrderID()}">
                                        Chi tiết đơn hàng
                                    </button>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="detail${listAO.getOrderID()}">
                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <table class="table table-bordered" width="100%" cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã đơn hàng</th>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Trạng thái</th>
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

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                                </div>

                                            </div>
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
                    <div class="card-header py-3 text-center">
                        <h5 class="m-0 font-weight-bold text-dark">Đang vận chuyển</h5>
                    </div>
                    <table class="table table-bordered" id="dataTable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>

                            <th>Mã đơn hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thông tin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listShipOrder}" var="ListSO">
                            <tr>

                                <td> ${ListSO.getOrderID()}</td>
                                <td> ${ListSO.getSubTotal()}</td>
                                <td> ${ListSO.getStatus()}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Detail" data-toggle="modal"
                                            data-target="#detailShip${ListSO.getOrderID()}">
                                        Chi tiết đơn hàng
                                    </button>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="detailShip${ListSO.getOrderID()}">
                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <table class="table table-bordered" id="orther detail" width="100%" cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã đơn hàng</th>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Trạng thái</th>
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

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>
</div>








<c:import url="../commom/footer.jsp"> </c:import>

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
