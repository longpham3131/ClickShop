<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 12/22/2020
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${info.size()}
<c:forEach items="${myinfo}" var="info">
    ${info.accountId}<br>
    ${info.email}<br>
    ${info.firstName}<br>
    ${info.lastName}<br>
    ${info.phone}<br>
    ${info.isAvailable}<br>
    ${info.role}<br>
</c:forEach>
</body>
</html>
