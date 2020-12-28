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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
</head>
<body>
<c:import url="../commom/header.jsp"> </c:import>
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

<%--TAT CA DON HANG CUA BAN--%>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"> Tat ca don hang</h6>
    </div>
    <table class="table table-bordered" id="dataTable" width="100%"
           cellspacing="0">
        <thead>
        <tr>
            <th>Account ID</th>
            <th>OrderID</th>
            <th>SubTotal</th>
            <th>Status</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listAllOrder}" var="listAO">
            <tr>
                <td> ${listAO.getAccID()}</td>
                <td> ${listAO.getOrderID()}</td>
                <td> ${listAO.getSubTotal()}</td>
                <td> ${listAO.getStatus()}</td>
                <td>
                    <button type="button" class="btn btn-warning" title="Detail" data-toggle="modal"
                            data-target="#detail${listAO.getOrderID()}">
                        xxx
                    </button>
                    <div class="modal" id="detail${listAO.getOrderID()}">
                        <div class="card shadow mb-4">
                            <table class="table table-bordered" id="orther detail" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>SubTotal</th>
                                    <th>Name</th>
                                    <th>tQuanity</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listAllOrderDetail}" var="listAOD">
                                    <tr>
                                        <c:if test="${listAO.getOrderID() == listAOD.getOrderID()}">
                                            <td> ${listAOD.getOrderID()}</td>
                                            <td> ${listAOD.getAccID()}</td>
                                            <td> ${listAOD.getSubTotal()}</td>
                                            <td> ${listAOD.getName()}</td>
                                            <td> ${listAOD.getQuanity()}</td>
                                            <td> ${listAOD.getStatus()}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%-- DANG GIAO--%>
<div class="card shadow mb-4">
    <h6 class="m-0 font-weight-bold text-primary"> Don hang dang duoc giao</h6>
    <table class="table table-bordered" id="dataTable" width="100%"
           cellspacing="0">
        <thead>
        <tr>
            <th>Account ID</th>
            <th>OrderID</th>
            <th>SubTotal</th>
            <th>Status</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listShipOrder}" var="ListSO">
            <tr>
                <td> ${ListSO.getAccID()}</td>
                <td> ${ListSO.getOrderID()}</td>
                <td> ${ListSO.getSubTotal()}</td>
                <td> ${ListSO.getStatus()}</td>
                <td>
                    <button type="button" class="btn btn-warning" title="Detail" data-toggle="modal"
                            data-target="#detailShip${ListSO.getOrderID()}">
                        xxx
                    </button>
                    <div class="modal" id="detailShip${ListSO.getOrderID()}">
                        <div class="card shadow mb-4">
                            <table class="table table-bordered" id="orther detail" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>SubTotal</th>
                                    <th>Name</th>
                                    <th>tQuanity</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listShipOrderDetail}" var="listSODetail">
                                    <tr>
                                        <c:if test="${ListSO.getOrderID() == listSODetail.getOrderID()}">
                                            <td> ${listSODetail.getOrderID()}</td>
                                            <td> ${listSlistSODetailOD.getAccID()}</td>
                                            <td> ${listSODetail.getSubTotal()}</td>
                                            <td> ${listSODetail.getName()}</td>
                                            <td> ${listSODetail.getQuanity()}</td>
                                            <td> ${listSODetail.getStatus()}</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<c:import url="../commom/footer.jsp"> </c:import>
</body>
</html>
