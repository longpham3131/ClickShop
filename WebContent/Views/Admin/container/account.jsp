<%@page import="com.model.Article"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tài khoản</title>
<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->

<link
	href="<%=request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css"
	rel="stylesheet">

<jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>
</head>
<body>
	<!--  Check authentic --!>
	<!-- Servlet return true if complete login authentication
	You can't access this page if you use link-url and not login -->

	<%--  <c:if test="${check != 'true'}">
		<c:redirect url="/admin" />
	</c:if>  --%>

	<!--  Check authentic --!>
	
	<!---- nhan thong bao phan hoi ---->
	<c:if test="${from == 'insert'}">
		<c:if test="${(thongbao == 'true') && (from=='insert')}">
			<script type="text/javascript">
				alert('INSERT: Insert Complete');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'error') && (from=='insert')}">
			<script type="text/javascript">
				alert('INSERT: Error when insert');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'input') && (from=='insert')}">
			<script type="text/javascript">
				alert('INSERT: input not true');
			</script>
		</c:if>
	</c:if>
	<c:if test="${from == 'update'}">
		<c:if test="${(thongbao == 'true')}">
			<script type="text/javascript">
				alert('update: update Complete');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'error') }">
			<script type="text/javascript">
				alert('update: Error when update');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'input')}">
			<script type="text/javascript">
				alert('update: input not true');
			</script>
		</c:if>
	</c:if>
	<!-- delete -->
	<c:if test="${from == 'delete'}">
		<c:if test="${(thongbao == 'true') && (from=='delete')}">
			<script type="text/javascript">
				alert('DELETE: delete Complete');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'error') && (from=='delete')}">
			<script type="text/javascript">
				alert('DELETE: Error when delete');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'input') && (from=='delete')}">
			<script type="text/javascript">
				alert('DELETE: input not true');
			</script>
		</c:if>
		<c:if test="${(thongbao == 'notFound') && (from=='delete')}">
			<script type="text/javascript">
				alert('DELETE: Not Found this email');
			</script>
		</c:if>
	</c:if>
	<%
		session.setAttribute("from", "acc");
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
				<form action="${pageContext.request.contextPath}/fill-All-Account"
					method="post">
					<input type="submit" value="Refresh data">

				</form>
				<!--  TABLEE ----->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">DataTables
							Example</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>ID</th>
										<th >Email</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Phone</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>

								<!----------Noi-dung-------- -->
								<tbody>
									<c:forEach items="${listAccount}" var="listAcc"
										varStatus="loop">
										<c:choose>
											<c:when test="${listAcc.isAvailable ==1}">
												<tr>
													<td>${listAcc.accountId}</td>
													<td>${listAcc.email}</td>
													<td>${listAcc.firstName}</td>
													<td>${listAcc.lastName}</td>
													<td>${listAcc.phone}</td>
													<td>${listAcc.isAvailable}</td>
													<td>
														<!-- POPUP Detail  -->
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#myModal">Detail
														</button>
														<div class="modal" id="myModal">
															<div class="modal-dialog">
																<div class="modal-content">

																	<!-- Modal Header -->
																	<div class="modal-header">
																		<h4 class="modal-title">Profile</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																	</div>
																	<!-- Modal body -->
																	<div class="modal-body">
																		<h5>Account ID : ${listAcc.accountId}</h5>
																		<h5>Email : ${listAcc.email}</h5>
																		<h5>First Name :${listAcc.firstName}</h5>
																		<h5>Last Name : ${listAcc.lastName}</h5>
																		<h5>Phone : ${listAcc.phone}</h5>
																		<h5>Address : ${listAcc.address}</h5>
																		<h5>Gender : ${listAcc.gender}</h5>
																		<h5>Day Of Birth : ${listAcc.dayofBirth}</h5>
																		<h5>Created Date : ${listAcc.createdDay}</h5>
																		<h5>Status : ${listAcc.isAvailable}</h5>
																	</div>
																	<!-- Modal footer -->
																	<div class="modal-footer">
																		<button type="button" class="btn btn-primary"
																			data-toggle="modal" data-target="#editAccount">Edit
																		</button>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div> <!-- POPUP Edit -->
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#editAccount">Edit
														</button> <!-- The Modal -->
														<div class="modal" id="editAccount">
															<div class="modal-dialog">
																<div class="modal-content">

																	<!-- Modal Header -->
																	<div class="modal-header">
																		<h4 class="modal-title">Modal Heading</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																	</div>

																	<!-- Modal body -->
																	<div class="modal-body">
																		<div class="form-group">
																			<labelfor"inpEmail">Email :</label> <input
																				type="email" id="inpEmail" class="form-control"
																				value="${listAcc.email}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpFname">First name :</label> <input
																				type="text" id="inpFName" class="form-control"
																				value="${listAcc.firstName}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpLName">Last name :</label> <input
																				type="text" id="inpLName" class="form-control"
																				value=" ${listAcc.lastName}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpPhone">Phone :</label> <input
																				type="tel" id="inpPhone" class="form-control"
																				value="${listAcc.phone}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpAddress">Address :</label> <input
																				type="text" id="inpPhone" class="form-control"
																				value="${listAcc.address}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpGender">Gender :</label> <input
																				id="inpGender" class="form-control"
																				value="${listAcc.gender}">
																		</div>
																		<div class="form-group">
																			<labelfor"inpDOfB">Day of birth :</label> <input
																				type="datetime" class="form-control" id="inpDOfB"
																				value="${listAcc.dayofBirth}">
																		</div>
																		<%-- <div class="form-group">
																			<label for"inpEmail">Email :</label>
																			<input id="inpRole" value="${listAcc.email}">
																		</div> --%>

																		<%-- <h5>Email : ${listAcc.email}</h5>
																		<h5>First Name :${listAcc.firstName}</h5>
																		<h5>Last Name : ${listAcc.lastName}</h5>
																		<h5>Phone : ${listAcc.phone}</h5>
																		<h5>Address : ${listAcc.address}</h5>
																		<h5>Gender : ${listAcc.gender}</h5>
																		<h5>Day Of Birth : ${listAcc.dayofBirth}</h5>
																		<h5>Created Date : ${listAcc.createdDay}</h5>
																		<h5>Status : ${listAcc.isAvailable}</h5> --%>
																	</div>

																	<!-- Modal footer -->
																	<div class="modal-footer">
																		<button type="button" class="btn btn-success">Update</button>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Close</button>

																	</div>

																</div>
															</div>
														</div>
														<button type="button" class="btn btn-primary">Reset
															Password</button>
														<button type="button" class="btn btn-primary">Block
														</button>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr style="background-color: black;">
													<td>${listAcc.accountId}</td>
													<td>${listAcc.email}</td>
													<td>${listAcc.firstName}</td>
													<td>${listAcc.lastName}</td>
													<td>${listAcc.phone}</td>
													<td>${listAcc.isAvailable}</td>
												</tr>
											</c:otherwise>
										</c:choose>


									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>

				<!-- ---- END Of TABLE -- -->

				<!-------------- Them xoa sua !!! Can Design lai !! ------------ -->

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#insert" role="tab" aria-controls="home"
						aria-selected="true">Insert</a></li>

					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#update" role="tab"
						aria-controls="profile" aria-selected="false">Update</a></li>

					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#delete" role="tab"
						aria-controls="contact" aria-selected="false">Delete</a></li>
				</ul>

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="insert" role="tabpanel"
						aria-labelledby="home-tab">
						<c:import url="account/insert.jsp"></c:import>
					</div>
					<div class="tab-pane fade" id="update" role="tabpanel"
						aria-labelledby="profile-tab">
						<c:import url="account/update.jsp"></c:import>
					</div>
					<div class="tab-pane fade" id="delete" role="tabpanel"
						aria-labelledby="contact-tab">
						<c:import url="account/delete.jsp"></c:import>
					</div>

					<!--------------END Them xoa sua  ------------ -->


					<!-- Footer -->
					<c:import url="../commom/footer.html" />
					<!-- End of Footer -->
				</div>
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
							<h5 class="modal-title" id="exampleModalLabel">Ready to
								Leave?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are
							ready to end your current session.</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" href="../login.jsp">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Bootstrap core JavaScript-->
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/jquery/jquery.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script
				src="<%=request.getContextPath()%>/Views/Admin/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/chart.js/Chart.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/jquery.dataTables.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script
				src="<%=request.getContextPath()%>/Views/Admin/js/demo/chart-area-demo.js"></script>
			<script
				src="<%=request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>
			<script
				src="<%=request.getContextPath()%>/Views/Admin/js/demo/chart-pie-demo.js"></script>
</body>
</html>