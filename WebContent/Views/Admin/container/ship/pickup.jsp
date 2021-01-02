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
                        <td>${listPkg.init}</td>
                        <td>
                            <button type="button" class="btn btn-info" title="Other Detail"
                                    data-toggle="modal" data-target="#mypick3${listPkg.orderID}">
                                <i class="fa fa-address-book"></i>
                            </button>
                            <button type="button" class="btn btn-primary" title="Shipper Detail"
                                    data-toggle="modal" data-target="#myShipperinTable3${listPkg.shipperID}">
                                <i class="fa fa-shipping-fast"></i>
                            </button>
                            <button type="button" class="btn btn-danger" title="Picked"
                                    data-toggle="modal" data-target="#CheckPick${listPkg.orderID}">
                                <i class="fa fa-cart-arrow-down"></i>
                            </button>

                            <div class="modal" id="mypick3${listPkg.orderID}">
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
                                                           value="${listPkg.orderID}">
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
                                                           value="${listPkg.email}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Address
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listPkg.address}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Phone
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listPkg.phone}.">
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
                                            <c:forEach items="${listPickDetail}" var="listPick3" varStatus="loop">
                                                <c:if test="${listPkg.orderID == listPick3.orderID}">
                                                    <tr>123
                                                        <td>${listPick3.productID}</td>
                                                        <td>${listPick3.name}</td>
                                                        <td>${listPick3.quanity}</td>
                                                        <td>${listPick3.subTotal}</td>
                                                        <c:set var="tien" value="${listPick3.subTotal}"/>
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

                            <div class="modal" id="myShipperinTable3${listPkg.shipperID}">
                                <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                    <c:if test="${listSp.getAccountId() == listPkg.shipperID}">
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

                            <div class="modal" id="CheckPick${listPkg.orderID}">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Xac nhan da dua hang cho shipper</h4>
                                            <button type="button" class="close"
                                                    data-dismiss="modal">&times;
                                            </button>
                                        </div>
                                        <!-- body -->
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <label for="staticID"
                                                       class="col-sm-4 col-form-label">Orther ID
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" Quantity readonly
                                                           class="form-control-plaintext"
                                                           id="staticID"
                                                           value="${listPkg.orderID}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticID"
                                                       class="col-sm-4 col-form-label">Shipper ID
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" Quantity readonly
                                                           class="form-control-plaintext"
                                                           id="staticID"
                                                           value="${listPkg.shipperID}">
                                                </div>
                                            </div>
                                            <form action="<%=request.getContextPath()%>/shippicked" method="post">
                                                <input type="hidden" value="${listPkg.orderID}" name="OrtherID"/>
                                                <input type="submit" value="Dong y"
                                                       style="background-color: #357ebd; color: white">
                                            </form>
                                        </div>
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
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>