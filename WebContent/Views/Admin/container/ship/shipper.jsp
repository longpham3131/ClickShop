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
			<h6 class="m-0 font-weight-bold text-primary">These are all
				shipper we have</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>ID</th>
							<th>Email</th>
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
								<td>${listSp.email}</td>
								<td>${listSp.firstName}</td>
								<td>${listSp.phone}</td>
								<td>${listSp.ortherCarring}</td>
								<td>Button Shipper Detail</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>