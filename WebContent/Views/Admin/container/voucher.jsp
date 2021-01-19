<%@page import="com.model.Article" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>?<c:out value="${thongbao }"/>-<c:out value="${ from}"/>
    </title>
    <!-- Custom fonts for this template-->

    <link href="<%= request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"

          type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->

    <link href="<%= request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css" rel="stylesheet">

    <jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>
</head>
<body>

<!-- end of thong bao -->
<c:if test="${(voux == 1) }">
    <script type="text/javascript">
        alert('Thêm: Thành công!!!');
    </script>
</c:if>
<c:if test="${(voux == 'trung') }">
    <script type="text/javascript">
        alert('Không thành công vì trùng  code !!!');
    </script>
</c:if>
<!-- Page Wrapper -->
<div id="wrapper">


    <c:import url="../commom/sidebar.jsp"/>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- LEFT PAGE -->
        <div id="content">

            <c:import url="../commom/header.jsp"/>

            <!-- -------------------- MAIN CONTAIN ---------------- -->
            <form action="${pageContext.request.contextPath}/voucher"
                  method="post">
                <input type="submit" value="Refresh data">
            </form>
            <div>
                <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                    <h4> Tạo Voucher </h4>
                    Nhập mã muốn tạo:
                    <input type="text" value="" name="newcode">
                    <input type="number" value="100000" name="coin">
                    <input type="hidden" value="new" name="type">
                    <input type="submit" value="Tạo">
                </form>
            </div>
            <br>
            <div>
                <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                    <h4> Kiểm tra voucher </h4>
                    Nhập mã muốn kiểm tra
                    <input type="text" value="" name="checkcode">
                    <input type="hidden" value="check" name="type">
                    <input type="submit" value="Kiểm tra">
                    <p>${kqcoin} <br>${kqstatus}</p>
                </form>
            </div>


            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th>Mã Voucher</th>
                            <th>Số tiền</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listVou}" var="vou"
                                   varStatus="loop">
                            <tr>
                                <td>${vou.code}</td>
                                <td>${vou.coin} </td>
                                <td>${vou.status} </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="1" name="type">
                                        <input type="submit" class="btn btn-primary" value="1">

                                    </form>
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="0" name="type">
                                        <input type="submit" class="btn btn-primary" value="0">
                                    </form>
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="-1" name="type">
                                        <input type="submit" class="btn btn-primary" value="-1">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top"> <i
                    class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <!-- Xac nhan Logout -->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc sẽ muốn đăng xuất?</h5>
                            <button class="close" type="button" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Chọn "đăng xuất" nếu bạn đã sẵn sàng</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button"
                                    data-dismiss="modal">Hủy
                            </button>
                            <a class="btn btn-primary" href="../login.jsp">Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->

            <script src="<%= request.getContextPath()%>/Views/Admin/	vendor/jquery/jquery.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="<%= request.getContextPath()%>/Views/Admin/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/chart.js/Chart.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/chart-area-demo.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/chart-pie-demo.js"></script>

</body>
</html>