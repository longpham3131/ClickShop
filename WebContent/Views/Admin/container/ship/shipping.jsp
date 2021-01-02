<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Dang giao</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th>Orther ID</th>
                    <th>Shipper ID</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <!----------Noi-dung-------- -->
                <tbody>
                <c:forEach items="${listShipping}" var="listSpg" varStatus="loop">
                    <c:choose>
                        <c:when test="${listSpg.status == 'Cancel'}">
                            <tr style="background-color: #fededf">
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Other Detail"
                                            data-toggle="modal" data-target="#myShippingOrder1${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Detail"
                                            data-toggle="modal" data-target="#myship1${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger" title="Complete Order"
                                            data-toggle="modal" data-target="#endOrder${listSpg.orderID}">
                                        <i class="fa fa-check-square"></i>
                                    </button>

                                    <div class="modal" id="myShippingOrder1${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Orther Detail</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Orther ID
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"
                                                                   id="staticID"
                                                                   value="${listSpg.orderID}">
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
                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Address
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Phone
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table table-bordered" id="orther detail" width="100%"
                                                       cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th>Product ID</th>
                                                        <th>Name</th>
                                                        <th>Quantity</th>
                                                        <th>Sub Total</th>
                                                    </tr>
                                                    </thead>
                                                    <!----------Noi-dung-------- -->
                                                    <tbody>
                                                    <c:set var="sum" value="0"/>
                                                    <c:forEach items="${listShippingDetail}" var="listShiping"
                                                               varStatus="loop">
                                                        <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                            <tr>
                                                                <td>${listShiping.productID}</td>
                                                                <td>${listShiping.name}</td>
                                                                <td>${listShiping.quanity}</td>
                                                                <td>${listShiping.subTotal}</td>
                                                                <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                <c:set var="sum" value="${sum + tien}"/>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                SubTolal: ${sum}
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal" id="myship1${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
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

                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <div class="modal" id="endOrder${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Shipper Da Hoan Thanh</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                Ket thuc don hang: ${listSpg.orderID}<br>
                                                Trang thai: ${listSpg.status}
                                                <form action="<%=request.getContextPath()%>/endOrder" method="post">
                                                    <input type="hidden" value="${listSpg.orderID}" name="OrtherID"/>
                                                    <input type="hidden" value="${listSpg.status}" name="Status"/>
                                                    <input type="submit" value="Agree"
                                                           style="background-color: #357ebd; color: white">
                                                </form>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${listSpg.status == 'Completed'}">
                            <tr style="background-color: #cccdff">
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Other Detail"
                                            data-toggle="modal" data-target="#myShippingOrder${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Detail"
                                            data-toggle="modal" data-target="#myship2${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger" title="Complete Order"
                                            data-toggle="modal" data-target="#endOrder${listSpg.orderID}">
                                        <i class="fa fa-check-square"></i>
                                    </button>

                                    <div class="modal" id="myShippingOrder${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Orther Detail</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Orther ID
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"
                                                                   id="staticID"
                                                                   value="${listSpg.orderID}">
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
                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Address
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Phone
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table table-bordered" id="orther detail" width="100%"
                                                       cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th>Product ID</th>
                                                        <th>Name</th>
                                                        <th>Quantity</th>
                                                        <th>Sub Total</th>
                                                    </tr>
                                                    </thead>
                                                    <!----------Noi-dung-------- -->
                                                    <tbody>
                                                    <c:set var="sum" value="0"/>
                                                    <c:forEach items="${listShippingDetail}" var="listShiping"
                                                               varStatus="loop">
                                                        <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                            <tr>
                                                                <td>${listShiping.productID}</td>
                                                                <td>${listShiping.name}</td>
                                                                <td>${listShiping.quanity}</td>
                                                                <td>${listShiping.subTotal}</td>
                                                                <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                <c:set var="sum" value="${sum + tien}"/>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                SubTolal: ${sum}
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal" id="myship2${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
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

                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <div class="modal" id="endOrder${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Shipper Da Hoan Thanh</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                Ket thuc don hang: ${listSpg.orderID}<br>
                                                Trang thai: ${listSpg.status}
                                                <form action="<%=request.getContextPath()%>/endOrder" method="post">
                                                    <input type="hidden" value="${listSpg.orderID}" name="OrtherID"/>
                                                    <input type="hidden" value="${listSpg.status}" name="Status"/>
                                                    <input type="submit" value="Agree"
                                                           style="background-color: #357ebd; color: white">
                                                </form>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Other Detail"
                                            data-toggle="modal" data-target="#myShippingOrder${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Detail"
                                            data-toggle="modal" data-target="#myship3${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i></button>

                                    <div class="modal" id="myShippingOrder${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Orther Detail</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Orther ID
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"
                                                                   id="staticID"
                                                                   value="${listSpg.orderID}">
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
                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Address
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Phone
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table table-bordered" id="orther detail" width="100%"
                                                       cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th>Product ID</th>
                                                        <th>Name</th>
                                                        <th>Quantity</th>
                                                        <th>Sub Total</th>
                                                    </tr>
                                                    </thead>
                                                    <!----------Noi-dung-------- -->
                                                    <tbody>
                                                    <c:set var="sum" value="0"/>
                                                    <c:forEach items="${listShippingDetail}" var="listShiping"
                                                               varStatus="loop">
                                                        <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                            <tr>
                                                                <td>${listShiping.productID}</td>
                                                                <td>${listShiping.name}</td>
                                                                <td>${listShiping.quanity}</td>
                                                                <td>${listShiping.subTotal}</td>
                                                                <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                <c:set var="sum" value="${sum + tien}"/>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                SubTolal: ${sum}
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal" id="myship3${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
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

                                            </c:if>
                                        </c:forEach>
                                    </div>

                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>