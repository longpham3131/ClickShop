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
			<h6 class="m-0 font-weight-bold text-primary">Shipper chua lay
				hang</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Orther ID</th>
							<th>Shipper ID</th>
							<th>Email</th>
							<th>Sub Total</th>
							<th>Address</th>
							<th>Phone</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>

					<!----------Noi-dung-------- -->
					<tbody>
						<c:forEach items="${listPicking}" var="listPkg" varStatus="loop">
							<tr>
								<td>${listPkg.orderID}</td>
								<td>${listPkg.shipperID}</td>
								<td>${listPkg.email}</td>
								<td>${listPkg.subTotal}</td>
								<td>${listPkg.address}</td>
								<td>${listPkg.phone}</td>
								<td>${listPkg.init}</td>
								<td>Button Order Detail & Shipper Detail</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>