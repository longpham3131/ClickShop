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
<!--  Check authentic --!>
<!-- Servlet return true if complete login authentication
You can't access this page if you use link-url and not login -->
<%-- 	<c:if test="${check != 'true'}">
		<c:redirect url="/admin" />
	</c:if> --%>
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

<c:if test="${from == 'block'}">
	<c:if test="${(thongbao == 'true') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: Complete');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'error') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: Error when Block');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'input') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: input not true');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'notFound') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: Not Found this id');
		</script>
	</c:if>
</c:if>

<c:if test="${from == 'unblock'}">
	<c:if test="${(thongbao == 'true') && (from=='unblock')}">
		<script type="text/javascript">
			alert('Unblock: Complete');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'error') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: Error when Block');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'input') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: input not true');
		</script>
	</c:if>
	<c:if test="${(thongbao == 'notFound') && (from=='block')}">
		<script type="text/javascript">
			alert('Block: Not Found this id');
		</script>
	</c:if>
</c:if>
<%
	session.setAttribute("from", "product");
%>
<!-- end of thong bao -->

<!-- Page Wrapper -->
<div id="wrapper">


	<c:import url="../commom/sidebar.jsp"/>


	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- LEFT PAGE -->
		<div id="content">

			<c:import url="../commom/header.jsp"/>

			<!-- -------------------- MAIN CONTAIN ---------------- -->


			<!--  TABLE PRODUCT ----->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary"
						style="display: inline; float: left; padding-top: 6px">Danh sách sản phẩm</h6>
					<!-- Refresh Databa -->
					<div style=" padding-left: 5%; display: inline; width: 30%; float: left">
						<form action="${pageContext.request.contextPath}/fill-All-Product"
							  method="post">
							<button type="submit" class="btn btn-warning"><i class="fa fa-undo"></i> Tải lại bảng
							</button>
						</form>
					</div>

					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-success" style="width: 15%; display:inline; float: right;"
							data-toggle="modal"
							data-target="#addProduct">
						<i class="fa fa-plus mr-2"></i> Thêm sản phẩm
					</button>
					<div class="modal" id="addProduct">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">Thêm sản phẩm</h4>
									<button type="button" class="close"
											data-dismiss="modal">&times;
									</button>
								</div>
								<!-- Modal body -->
								<div class="modal-body">
									<form action="${pageContext.request.contextPath}/insert-product"
										  method="post" id="formAdd">
										<div class="form-group">
											<label for="cateidlbAdd">Loại sản phẩm :</label>

											<select id="cateidlbAdd" class="form-control"
													name="subcategory">

												<c:forEach items="${listCategory}" var="cate">
													<option value="${cate.getCategoryId()}"
													>
															${cate.getName()}
													</option>

												</c:forEach>
											</select>
										</div>
										<div class="form-group row">
											<label for="namelb"
												   class="col-sm-4 col-form-label">Tên sản phẩm
												:</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="namelb" name="name">
											</div>
											<label for="pricelb"
												   class="col-sm-4 col-form-label">Đơn giá
												:</label>
											<div class="col-sm-8">
												<input type="text"
													   class="form-control"
													   id="pricelb"
													   value=""
													   name="unitprice">
											</div>
											<label for="likelb"
												   class="col-sm-4 col-form-label">Like
												:</label>
											<div class="col-sm-8">
												<input type="text"
													   class="form-control"
													   id="likelb"
													   value=""
												>
											</div>
											<label for="deslb"
												   class="col-sm-4 col-form-label">Mô tả sản phẩm
												:</label>
											<div class="col-sm-8">
												<input type="hidden"
													   class="form-control"
													   id="addProdip"
													   value=""
													   name="description">


												<textarea class="form-control"
														  id="addProd"

														  rows="3" placeholder="What's up?"
														  onkeyup="myFunction('addProdip','addProd')"
												> </textarea>
											</div>
											<label for="availb"
												   class="col-sm-4 col-form-label">Available
												:</label>
											<div class="col-sm-8">
												<input type="text"
													   class="form-control-plaintext"
													   id="availb"
													   value=""
													   name="available">
											</div>
											<label for="img"
												   class="col-sm-4 col-form-label">Link ảnh
												:</label>
											<div class="col-sm-8">
												<input type="text"
													   class="form-control-plaintext"
													   id="img"
													   value=""
													   name="img">
											</div>
											<label for="genderlb"
												   class="col-sm-4 col-form-label">Giới tính sản phẩm
												:</label>
											<div class="col-sm-8">
												<input type="text"
													   class="form-control-plaintext"
													   id="genderlb"
													   value=""
													   name="gender">
											</div>
										</div>

									</form>
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" form="formAdd">
									Thêm sản phẩm
								</button>
								<button type="button" class="btn btn-danger"
										data-dismiss="modal">Đóng
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							   cellspacing="0">
							<!-------Ten-cot------ -->
							<thead>
							<tr>
								<th>ID</th>
								<th>Category</th>
								<th>Product Name</th>
								<th>Unit price</th>
								<th>Like</th>
								<th>Gender</th>
								<th>Description</th>
								<th>Available</th>
								<th>Action</th>
							</tr>
							</thead>

							<!----------Noi-dung-------- -->
							<tbody>
							<c:forEach items="${listProduct}" var="row">
								<c:choose>
									<c:when test="${row.getAvailable() >= 1}">
										<tr>
											<td><c:out value="${row.getProductId()}"/></td>
											<td>${row.getSubCategoryId()}</td>
											<td width="180">${row.name}</td>
											<td>${row.getUnitPrice()}</td>
											<td>${row.like}</td>
											<td>${row.gender}</td>
											<td width="320">${row.description}</td>
											<td>${row.available}</td>
											<td>
												<button type="button" class="btn btn-info" title="Detail"
														data-toggle="modal" data-target="#Product${row.productId}">
													<i class="fa fa-address-book"></i>
												</button>
												<div class="modal" id="Product${row.productId}">
													<div class="modal-dialog">
														<div class="modal-content">

															<!-- Modal Header -->
															<div class="modal-header">
																<h4 class="modal-title">Profile</h4>
																<button type="button" class="close"
																		data-dismiss="modal">&times;
																</button>
															</div>

															<!-- Modal body -->
															<div class="modal-body">


																<div class="form-group row">
																	<label for="prodid"
																		   class="col-sm-4 col-form-label">Product
																		ID
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="prodid"
																			   value="${row.productId}">
																	</div>
																	<label for="cateidlb"
																		   class="col-sm-4 col-form-label">Sub
																		Category
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="cateidlb"
																			   value="${row.getSubCategoryId()}">
																	</div>
																	<label for="namelb"
																		   class="col-sm-4 col-form-label">Name
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="namelb"
																			   value="${row.getName()}">
																	</div>
																	<label for="pricelb"
																		   class="col-sm-4 col-form-label">Unit
																		Price
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="pricelb"
																			   value="${row.getUnitPrice()}">
																	</div>
																	<label for="likelb"
																		   class="col-sm-4 col-form-label">Like
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="likelb"
																			   value="${row.getLike()}">
																	</div>
																	<label for="deslb"
																		   class="col-sm-4 col-form-label">Description
																		:</label>
																	<div class="col-sm-8">
																		<input type="hidden" readonly
																			   class="form-control-plaintext"
																			   id="hidenip"
																			   value="${row.getDescription()}">
																			<%-- <input type="text" readonly
                                                                                      class="form-control-plaintext"
                                                                                      id="deslb"
                                                                                      value="${row.getDescription()}"> --%>


																		<textarea class="form-control"
																				  id="deslb"
																				  value="${row.getDescription()}"
																				  rows="3" placeholder="What's up?"
																				  readonly>${row.getDescription()} </textarea>
																	</div>
																	<label for="availb"
																		   class="col-sm-4 col-form-label">Available
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="availb"
																			   value="${row.getAvailable()}">
																	</div>
																	<label for="genderlb"
																		   class="col-sm-4 col-form-label">Gender
																		:</label>
																	<div class="col-sm-8">
																		<input type="text" readonly
																			   class="form-control-plaintext"
																			   id="genderlb"
																			   value="${row.getGender()}">
																	</div>
																</div>


															</div>
															<!-- Modal footer -->
															<div class="modal-footer">
																<button type="button" class="btn btn-primary"
																		data-toggle="modal"
																		data-target="#productedit${row.productId}"
																>
																	Edit
																</button>
																<button type="button" class="btn btn-danger"
																		data-dismiss="modal">Close
																</button>
															</div>
														</div>
													</div>
												</div>
												<button type="button" class="btn btn-primary" title="Edit"
														data-toggle="modal"
														data-target="#productedit${row.productId}"><i
														class="fa fa-edit"></i></button>
												<div class="modal" id="productedit${row.productId}">
													<div class="modal-dialog">
														<div class="modal-content">

															<!-- Modal Header -->
															<div class="modal-header">
																<h4 class="modal-title">Edit Product</h4>
																<button type="button" class="close"
																		data-dismiss="modal">&times;
																</button>
															</div>

															<!-- Modal body -->
															<div class="modal-body">

																<form action="${pageContext.request.contextPath}/update-product"
																	  method="post" id="formEdit">
																	<div class="form-group row">
																		<label for="prodid"
																			   class="col-sm-4 col-form-label">Product
																			ID
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="prodid"
																				   value="${row.productId}"
																				   name="productid">
																		</div>
																		<label for="cateidlb"
																			   class="col-sm-4 col-form-label">Sub
																			Category
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="cateidlb"
																				   value="${row.getSubCategoryId()}"
																				   name="subcategory">
																		</div>
																		<label for="namelb"
																			   class="col-sm-4 col-form-label">Name
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="namelb"
																				   value="${row.getName()}"
																				   name="name">
																		</div>
																		<label for="pricelb"
																			   class="col-sm-4 col-form-label">Unit
																			Price
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="pricelb"
																				   value="${row.getUnitPrice()}"
																				   name="unitprice">
																		</div>
																		<label for="likelb"
																			   class="col-sm-4 col-form-label">Like
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="likelb"
																				   value="${row.getLike()}"
																			>
																		</div>
																		<label for="deslb"
																			   class="col-sm-4 col-form-label">Description
																			:</label>
																		<div class="col-sm-8">
																			<input type="hidden"
																				   class="form-control-plaintext"
																				   id="hidenip${row.productId}"
																				   value="${row.getDescription()}"
																				   name="description">
																				<%-- <input type="text" readonly
                                                                                          class="form-control-plaintext"
                                                                                          id="deslb"
                                                                                          value="${row.getDescription()}"> --%>


																			<textarea class="form-control"
																					  id="deslb${row.productId}"

																					  rows="3"
																					  placeholder="What's up?"
																					  onkeyup="myFunction('hidenip${row.productId}','deslb${row.productId}')"
																			>${row.getDescription()} </textarea>
																		</div>
																		<label for="availb"
																			   class="col-sm-4 col-form-label">Available
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="availb"
																				   value="${row.getAvailable()}"
																				   name="available">
																		</div>
																		<label for="genderlb"
																			   class="col-sm-4 col-form-label">Gender
																			:</label>
																		<div class="col-sm-8">
																			<input type="text"
																				   class="form-control-plaintext"
																				   id="genderlb"
																				   value="${row.getGender()}"
																				   name="gender">
																		</div>

																	</div>
																	<button type="submit" class="btn btn-success">
																		Update
																	</button>
																</form>


															</div>
															<!-- Modal footer -->
															<div class="modal-footer">

																<button type="button" class="btn btn-danger"
																		data-dismiss="modal">Close
																</button>
															</div>
														</div>
													</div>
												</div>
												<button type="button" class="btn btn-dark" title="Block"
														data-toggle="modal"
														data-target="#blockProduct${row.getProductId()}"><i
														class="fa fa-lock"></i>
												</button>
												<!-- The Modal -->

												<div class="modal" id="blockProduct${row.getProductId()}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-body">
																<form action="${pageContext.request.contextPath}/block-product"
																	  method="post">
																	<h4 class="modal-title">Are you sure?
																		Product name:${row.getName()} </h4>
																	<input type="hidden" name="id"
																		   value="${row.productId}"/>
																	<input type="submit" value="Block!"
																		   class="btn btn-warning"/>
																	<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Close
																	</button>
																</form>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr style="background-color: #5a6268; ">
											<td>${row.productId}</td>
											<td>${row.getSubCategoryId()}</td>
											<td width="180">${row.name}</td>
											<td>${row.getUnitPrice()}</td>
											<td>${row.like}</td>
											<td>${row.gender}</td>
											<td width="320">${row.description}</td>
											<td>${row.available}</td>
											<td>
												<form action="${pageContext.request.contextPath}/unblock-product"
													  id="unblock${row.productId}"
													  method="post">
													<input type="hidden" value="${row.productId}" name="id">
													<button type="submit" title="UnBlock" form="unblock${row.productId}" class="btn btn-success">
														<i class="fa fa-key "></i>
													</button>
												</form>
											</td>
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
							<span aria-hidden="true">ï¿½</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Cancel
						</button>
						<a class="btn btn-primary" href="../login.jsp">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script>
			function myFunction(a, b) {
				document.getElementById(a).value = document.getElementById(b).value;
				console.log(document.getElementById(a).value);
			}
		</script>
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