<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Shipper dang lam viec (shipping)</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Order are carrying</th>
							<th>Actions</th>
						</tr>
					</thead>

					<!----------Noi-dung-------- -->
					<tbody>
						<c:forEach items="${listShipper}" var="listSp" varStatus="loop">
							<tr>
								<td>${listSp.getAccountId()}</td>
								<td>${listSp.firstName}</td>
								<td>${listSp.phone}</td>
								<td>${listSp.ortherCarring}</td>
								<td> <button type="button" class="btn btn-info" title="Detail"
											 data-toggle="modal" data-target="#myModal${listSp.accountId}">
									<i class="fa fa-address-book"></i>
								</button></td>
								<div class="modal" id="myModal${listSp.accountId}">
									<div class="modal-dialog">
										<div class="modal-content">

											<!-- Modal Header -->
											<div class="modal-header">
												<h4 class="modal-title">Profile Shipper</h4>
												<button type="button" class="close"
														data-dismiss="modal">&times;
												</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												<div class="form-group row">
													<label for="staticID"
														   class="col-sm-4 col-form-label">Account ID
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticID"
															   value="${listSp.accountId}">
													</div>
												</div>
												<div class="form-group row">
													<label for="staticEmail"
														   class="col-sm-4 col-form-label">Email
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticEmail"
															   value="${listSp.email}">
													</div>
												</div>
												<div class="form-group row">
													<label for="staticName"
														   class="col-sm-4 col-form-label">Name
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticName"
															   value="${listSp.firstName} ${listSp.lastName}">
													</div>
												</div>
												<div class="form-group row">
													<label for="staticPhone"
														   class="col-sm-4 col-form-label">Phone
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticPhone"
															   value="${listSp.phone}">
													</div>
												</div>
												<div class="form-group row">
													<label for="staticAddress"
														   class="col-sm-4 col-form-label">Address
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticAddress"
															   value="${listSp.address}">
													</div>
												</div>
												<div class="form-group row">
													<label for="staticGender"
														   class="col-sm-4 col-form-label">Gender
														:</label>
													<div class="col-sm-8">
														<input type="text" readonly
															   class="form-control-plaintext"
															   id="staticGender"
															   value="${listSp.gender}">
													</div>
												</div>

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

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>