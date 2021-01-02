<%@page import="com.model.Article"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>?<c:out value="${thongbao }" />-<c:out value="${ from}" />
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
<!--  Check authentic --!>
<!-- Servlet return true if complete login authentication
You can't access this page if you use link-url and not login -->
<%-- 	<c:if test="${check != 'true'}">
		<c:redirect url="/admin" />
	</c:if> --%>
<!--  Check authenASDtic --!>

<!---- nhan thong bao phan hoi ---->
<c:if test="${from == 'insert'}">
    <c:if test="${(thongbao == 'true') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm: Thành công!!!');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'error') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm thất bại : Tuổi của nhân viên phải lớn hơn 18');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'input') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm: lỗi nhập liệu!!!');
        </script>
    </c:if>
</c:if>
<c:if test="${from == 'update'}">
    <c:if test="${(thongbao == 'true')}">
        <script type="text/javascript">
            alert('Cập nhật: Thành công!!!');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'error') }">
        <script type="text/javascript">
            alert('Cập nhật: Tuổi nhân viên phải lớn hơn 18');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'input')}">
        <script type="text/javascript">
            alert('Cập nhật: input not true');
        </script>
    </c:if>
</c:if>
<!-- delete -->
<c:if test="${from == 'delete'}">
    <c:if test="${(thongbao == 'true') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock Thành công !!!');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'error') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Thất bại');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'input') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Hãy nhập đầy đủ dữ liệu');
        </script>
    </c:if>
    <c:if test="${(thongbao == 'notFound') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Không tìm thấy email này');
        </script>
    </c:if>
</c:if>
<%
    session.setAttribute("from", "product");
%>
<!-- end of thong bao -->

<!-- Page Wrapper -->
<div id="wrapper">


    <c:import url="../commom/sidebar.jsp" />


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- LEFT PAGE -->
        <div id="content">

            <c:import url="../commom/header.jsp" />

            <!-- -------------------- MAIN CONTAIN ---------------- -->
            <form action="${pageContext.request.contextPath}/fill-All-Order"
                  method="post">
                <input type="submit" value="Refresh data">
            </form>
            <!--  TABLE PRODUCT ----->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">DataTables
                        Example</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%"
                               cellspacing="0">
                            <!-------Ten-cot------ -->
                            <thead>
                            <tr>
                                <th>ID đơn hàng</th>
                                <th>Ngày tạo</th>
                                <th>Email</th>
                                <th>Sub </th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                            </tr>
                            </thead>

                            <!----------Noi-dung-------- -->
                            <tbody>
                            <c:forEach items="${listOrder}" var="row">
                                <tr>
                                    <td><c:out value="${row.purchaseOrderId}" /></td>
                                    <td>${row.createdDate}</td>
                                    <td>${row.getAccountId()}</td>
                                    <td>${row.subTotal}</td>
                                    <td>${row.address}</td>
                                    <td>${row.phone}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- ---- END Of TABLE -- -->

            <!-------------- Them xoa sua !!! Can Design lai !! ------------ -->

<%--            <ul class="nav nav-tabs" id="myTab" role="tablist">--%>
<%--                <li class="nav-item"><a class="nav-link active" id="home-tab"--%>
<%--                                        data-toggle="tab" href="#insert" role="tab" aria-controls="home"--%>
<%--                                        aria-selected="true">Thêm</a></li>--%>

<%--                <li class="nav-item"><a class="nav-link" id="profile-tab"--%>
<%--                                        data-toggle="tab" href="#update" role="tab"--%>
<%--                                        aria-controls="profile" aria-selected="false">Cập nhật</a></li>--%>

<%--                &lt;%&ndash; <li class="nav-item"><a class="nav-link" id="contact-tab"--%>
<%--                    data-toggle="tab" href="#delete" role="tab"--%>
<%--                    aria-controls="contact" aria-selected="false">Delete</a></li> &ndash;%&gt;--%>
<%--            </ul>--%>

<%--            <div class="tab-content" id="myTabContent">--%>
<%--                <div class="tab-pane fade show active" id="insert" role="tabpanel"--%>
<%--                     aria-labelledby="home-tab">--%>
<%--                    <c:import url="product/insert.jsp"></c:import>--%>
<%--                </div>--%>
<%--                <div class="tab-pane fade" id="update" role="tabpanel"--%>
<%--                     aria-labelledby="profile-tab">--%>
<%--                    <c:import url="product/update.jsp"></c:import>--%>
<%--                </div>--%>
<%--                &lt;%&ndash; <div class="tab-pane fade" id="delete" role="tabpanel"--%>
<%--                    aria-labelledby="contact-tab">--%>
<%--                    <c:import url="product/delete.jsp"></c:import>--%>
<%--                </div>  &ndash;%&gt;--%>

<%--                <!--------------END Them xoa sua  ------------ -->--%>


<%--                <!-- Footer -->--%>
<%--                <c:import url="../commom/footer.html" />--%>
<%--                <!-- End of Footer -->--%>
<%--            </div>--%>
            <!-- End of Content Wrapper -->
        </div>


        <!-- End of Page Wrapper -->

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