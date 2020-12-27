<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V3</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--===============================================================================================-->
    <link rel="icon" type="image/png"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/util.css">
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/main.css">
    <!--===============================================================================================-->

    <%
        String a = request.getContextPath() + "/";
        System.out.println(a);
    %>
</head>
<body>
<%
    String id = "";
    if (request.getAttribute("id") != null)
        id = (String) request.getAttribute("id");
%>
<%--<h1> -- <%=request.getAttribute("Message")%> ---</h1>--%>
<div class="limiter">
    <div class="container-login100" style="">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="${pageContext.request.contextPath}/login-all"
                  method="post">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

                <span class="login100-form-title p-b-34 p-t-27">
						Login For All
					</span>

                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="id" placeholder="Username" value=<%= id%>>
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                </div>

                <div class="contact100-form-checkbox">
                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                    <label class="label-checkbox100" for="ckb1">
                        Remember me
                    </label>
                </div>

                <div class="container-login100-form-btn mt-4">
                    <button class="login100-form-btn" type="submit">
                        Login
                    </button>
                </div>
            </form>
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Register
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myForgot">
                Forgot Password
            </button>
        </div>
    </div>

</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/registed" method="post">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Register</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inpEmail">Email:</label>
                            <input type="email" class="form-control" id="inpEmail" name="email" placeholder="Email">
                        </div>

                        <div class="form-group col-6">
                            <label for="inpPass">Password:</label>
                            <input type="pass" class="form-control" id="inpPass" name="passw"
                                   placeholder="Password">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-6">
                            <label>First name:</label>
                            <input type="text" class="form-control" name="inpFname"
                                   placeholder="First name">

                        </div>
                        <div class="form-group col-6">
                            <label for="inpLname">Last name:</label>
                            <input type="text" class="form-control" name="Lname" id="inpLname"
                                   placeholder="Last name"></div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="DOfB">Day of birth</label>
                            <input type="date" class="form-control" id="DOfB" name="Bday">
                        </div>
                        <div class="form-group col-6">
                            <label for="Gender">Gender</label>
                            <select name="gender" id="Gender" class="form-control" name="gender">
                                <!-- <%
                                String[] sex = {"M", "F"};
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
                            %> -->
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>

                            </select></div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inpPhone">Phone:</label>
                            <input type="tel" class="form-control" id="inpPhone" name="phone"
                                   placeholder="Phone number">
                        </div>
                        <div class="form-group col-6">
                            <label for="inpAddress">Address:</label>
                            <input type="text" class="form-control" name="address" id="inpAddress"
                                   placeholder="Address">
                        </div>
                    </div>

                </div>
                <!-- Modal footer -->
                <div class="modal-footer">

                    <button type="submit" class="btn btn-success">Add</button>

                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="myForgot">
    <div class="modal-dialog ">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/forgot" method="post">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Forgot Password</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="DOfB">Your email:</label>
                            <input type="text" class="form-control" id="mail" name="email">
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Send code</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>

<!-- Thư viện hỗ trợ Jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- BS4 JS  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/js/main.js"></script>

</body>
</html>