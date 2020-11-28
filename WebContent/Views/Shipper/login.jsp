<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

<!-- Custom fonts for this template-->
<link href="../Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../Admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
	<%
		String id = "";
	if ( session.getAttribute("email") != null)
		id = (String) session.getAttribute("email");
	// lấy dữ liệu vào textbox email khi bấm sai
	%>
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block"
								style="background: url(https://mecha4makers.co.nz/wp-content/uploads/2018/07/courier_scooter_icon.png); background-position: center; background-size:contain; background-repeat:no-repeat;">
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back, Shipper</h1>
									</div>
									<form class="user"
										action="${pageContext.request.contextPath}/login-shipper"
										method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												aria-describedby="emailHelp"
												 name="id" value=<%=id%>>
										</div>
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												 name="password">
										</div>
										<div class="form-group">
											<input type="submit" class="form-control form-control-user" value="Login">
										</div>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Forgot
											Password?</a>
									</div>
									<!-- <div class="text-center">
										<a class="small" href="register.html">Create an Account!</a>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/../Admin/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/../Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath()%>/../Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath()%>/../Admin/js/sb-admin-2.min.js"></script>

</body>

</html>

