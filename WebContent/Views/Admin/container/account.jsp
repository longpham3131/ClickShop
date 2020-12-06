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
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-success" style="width: 15%; margin-left: auto" data-toggle="modal" data-target="#addUser">
						<i class="fa fa-plus mr-2"></i> Add user
					</button>
					<!-- The Modal -->
					<div class="modal" id="addUser">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">Add user</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<form action="${pageContext.request.contextPath}/insert-account" id="formAdd"
										  method="post">
										<div class="form-group">
											<label for="addEmail">Email :</label> <input
												type="email" id="addEmail" class="form-control" name="email"
												>
										</div>
										<div class="form-group">
											<label for="addPass">Password</label> <input
												type="password" id="addPass" class="form-control" name="pass"
										>
										</div>
										<div class="form-group">
											<label for="addFname">First name :</label> <input
												type="text" id="addFname" class="form-control" name="firstname"
												>
										</div>
										<div class="form-group">
											<label for="addLname">Last name :</label> <input
												type="text" id="addLname" class="form-control" name="lastname"
												>
										</div>
										<div class="form-group">
											<label for="addPhone">Phone :</label> <input
												type="tel" id="addPhone" class="form-control" name="phone"
												>
										</div>
										<div class="form-group">
											<label for="addAddress">Address :</label> <input
												type="text" id="addAddress" class="form-control" name="address"
												>
										</div>
										<div class="form-group">
											<label for="addGender">Gender :</label>
											<select name="gender" id="addGender" class="form-control">
												<%
													String[] sex= {"M", "F"};
													for (int s = 0; s < 2; s++) {
												%>
												<option value="<%=sex[s]%>">
													<%
														if (s == 0) {
													%>Male<%
													}
												%>
													<%
														if (s == 1) {
													%>Female<%
													}
												%>
												</option>
												<%
													}
												%>

											</select>
										</div>
										<div class="form-group">
											<label for="addDOfB">Day of birth :</label> <input
												type="datetime" class="form-control" id="addDOfB"
												>
										</div>
										<div class="form-group">
											<label for="addRole">Day of birth :</label>
											<select name="role" id="addRole" class="form-control">
												<%
													String[] Role= {"USER", "SALEPERSON", "ADMINISTRATOR", "SHIPPER"};
													for (int role = 0; role < 4; role++) {
												%>
												<option value="<%=Role[role]%>">
													<%=Role[role]%>
												</option>
												<%
													}
												%>
											</select>
										</div>

											<button type="submit" form="formAdd" class="btn btn-success" >Add</button>
											<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

									</form>
								</div>

								<!-- Modal footer -->


							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>ID</th>
										<th>Email</th>
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
														<button type="button" class="btn btn-info" title="Detail"
															data-toggle="modal" data-target="#myModal${listAcc.accountId}"><i class="fa fa-address-book"></i>
														</button>
														<div class="modal" id="myModal${listAcc.accountId}">
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



																		<div class="form-group row">
																			<label for="staticID" class="col-sm-4 col-form-label">Account ID :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticID" value="${listAcc.accountId}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticEmail" class="col-sm-4 col-form-label">Email :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${listAcc.email}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticName" class="col-sm-4 col-form-label">Name :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticName" value="${listAcc.firstName} ${listAcc.lastName}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticPhone" class="col-sm-4 col-form-label">Phone :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticPhone" value="${listAcc.phone}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticAddress" class="col-sm-4 col-form-label">Address :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticAddress" value="${listAcc.address}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticGender" class="col-sm-4 col-form-label">Gender :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticGender" value="${listAcc.gender}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticDOfB" class="col-sm-4 col-form-label">Date of birth :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticDOfB" value="${listAcc.dayofBirth}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticCreated" class="col-sm-4 col-form-label">Created date :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticCreated" value="${listAcc.createdDay}">
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="staticStatus" class="col-sm-4 col-form-label">Status :</label>
																			<div class="col-sm-8">
																				<input type="text" readonly class="form-control-plaintext" id="staticStatus" value="${listAcc.isAvailable}">
																			</div>
																		</div>



																	</div>
																	<!-- Modal footer -->
																	<div class="modal-footer">
																		<button type="button" class="btn btn-primary"
																				data-toggle="modal" data-target="#editAccount${listAcc.accountId}">Edit
																		</button>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div> <!-- POPUP Edit -->
														<button type="button" class="btn btn-primary" title="Edit"
															data-toggle="modal" data-target="#editAccount${listAcc.accountId}"><i class="fa fa-edit"></i>
														</button> <!-- The Modal -->
														<div class="modal" id="editAccount${listAcc.accountId}">
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
																		<form action="${pageContext.request.contextPath}/update-account"
																			  method="post" id="formEdit">

																			<div class="form-group">
																				<label for="inpEmail">Email :</label> <input
																					type="email" id="inpEmail" class="form-control"
																					value="${listAcc.email}" name="email">
																			</div>
																			<div class="form-group">
																				<label for="inpFName">First name :</label> <input
																					type="text" id="inpFName" class="form-control"
																					value="${listAcc.firstName}" name="firstname">
																			</div>
																			<div class="form-group">
																				<label for="inpLName">Last name :</label> <input
																					type="text" id="inpLName" class="form-control"
																					value=" ${listAcc.lastName}" name="lastname">
																			</div>
																			<div class="form-group">
																				<label for="inpPhone">Phone :</label> <input
																					type="tel" id="inpPhone" class="form-control"
																					value="${listAcc.phone}" name="phone">
																			</div>
																			<div class="form-group">
																				<label for="inpAddress">Address :</label> <input
																					type="text" id="inpAddress" class="form-control"
																					value="${listAcc.address}" name="address">
																			</div>
																			<div class="form-group">
																				<label for="editGender">Gender :</label> <select id="editGender" class="form-control" name="gender">
																				<%
																					String[] genderUser = {"M", "F"};
																					for (int s = 0; s < 2; s++) {
																				%>
																				<option value="<%=genderUser[s]%>">
																					<%
																						if (s == 0) {
																					%>Male<%
																					}
																				%>
																					<%
																						if (s == 1) {
																					%>Female<%
																					}
																				%>
																				</option>
																				<%
																					}
																				%>

																			</select>
																			</div>
																			<div class="form-group">
																				<label for="inpDOfB">Day of birth :</label> <input
																					type="datetime" class="form-control" id="inpDOfB"
																					value="${listAcc.dayofBirth}">
																			</div>

																		</form>

																	</div>

																	<!-- Modal footer -->
																	<div class="modal-footer">
																		<button type="submit" form="formEdit" class="btn btn-success">Update</button>
																		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
																	</div>

																</div>
															</div>
														</div>
														<button type="button" title="Reset password" class="btn btn-warning"><i class="fa fa-redo-alt"></i></button>
														<button type="button" title="Block account" class="btn btn-dark"><i class="fa fa-lock"></i>
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