<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 	String id ="";
	if( request.getAttribute("id")!=null)
		id= (String) request.getAttribute("id");%>
<p>Welcome, USER. let login:<p>
<h1>Login Here</h1>
<form action="${pageContext.request.contextPath}/login"  method="post">
<table cellspacing="5">
    <tr>
      <td align="right">ID: </td>
      <td><input type="text" name="id" value=<%=id%>></td>
    </tr><tr>
      <td align="right">password</td>
      <td> <input type="text" name="password"></td>
    </tr><tr>
    <td></td>
      <td align="left"><input type="submit" value="Login"></td>
    </tr>
  </table>
</form>
</body>
</html>