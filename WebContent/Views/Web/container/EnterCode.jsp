<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 12/27/2020
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Enter code</title>
</head>
<body>
<c:choose>
    <c:when test="${kq == 'true'}">

    <form action="${pageContext.request.contextPath}/reset-pass" method="post">
        Reser Password:
        New Password: <input type="text" name="newpass">
        <input type="hidden" value="${mail}", name="email">
        <input type="submit" value="Xac nhan">
    </form>
        <c:if test="${tb == 0}"> Co loi, password chua reset</c:if>
    </c:when>
    <c:when test="${kq == 'spam'}">
        <form action="${pageContext.request.contextPath}/forgot" method="post">
            Sai qua nhieu roi, tui t se gui cho may code khac. <br>
            Email: (${mail})
            <input type="hidden" value="${mail}", name="email">
            <input type="submit" value="Xac nhan">
        </form>
    </c:when>
    <c:otherwise>
        <form action="${pageContext.request.contextPath}/check-forgot" method="post">
            Kiem tra code duoc gui den email cua ban (${mail}) <br>
            Code: <input type="text" name="inputCode">
            <input type="submit" value="Xac nhan">
            <br>So lan thu: ${dem}
        </form>
    </c:otherwise>
</c:choose>

</body>
</html>
