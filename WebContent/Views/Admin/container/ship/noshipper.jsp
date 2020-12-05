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
			<h6 class="m-0 font-weight-bold text-primary">Can chi dinh
				shipper cho nhung don hang nay</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Orther ID</th>
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
						<c:forEach items="${listInitOrder}" var="listIO" varStatus="loop">
							<tr>
								<td>${listIO.orderID}</td>
								<td>${listIO.email}</td>
								<td>${listIO.subTotal}</td>
								<td>${listIO.address}</td>
								<td>${listIO.phone}</td>
								<td>${listIO.init}</td>
								<td>Button order detal & select Shipper</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>