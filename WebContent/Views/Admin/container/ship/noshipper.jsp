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
                    <th>Sub Total</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <!----------Noi-dung-------- -->

                <tbody>
                <c:forEach items="${listInitOrder}" var="listIO" varStatus="loop">
                    <c:set var="sum" value="0"/>

                    <tr>
                        <td>${listIO.orderID}</td>
                        <td>${listIO.subTotal}</td>
                        <td>${listIO.address}</td>
                        <td>
                            <button type="button" class="btn btn-info" title="Other Detail"
                                    data-toggle="modal" data-target="#myNoShipDetail${listIO.orderID}">
                                <i class="fa fa-address-book"></i>
                            </button>

                            <button type="button" class="btn btn-primary" title="Choose Shipper"
                                    data-toggle="modal" data-target="#myShipper${listIO.orderID}">
                                <i class="fa fa-shipping-fast"></i>
                            </button>

                            <div class="modal" id="myNoShipDetail${listIO.orderID}">
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
                                                           value="${listIO.orderID}">
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
                                                           value="${listIO.email}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Address
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listIO.address}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Phone
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listIO.phone}">
                                                </div>
                                            </div>
                                        </div>

                                        <table class="table table-bordered" id="orther detal" width="100%"
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
                                            <c:forEach items="${listNoShipDetail}" var="listSpg" varStatus="loop">
                                                <c:if test="${listSpg.orderID == listIO.orderID}">
                                                    <tr>
                                                        <td>${listSpg.productID}</td>
                                                        <td>${listSpg.name}</td>
                                                        <td>${listSpg.quanity}</td>
                                                        <td>${listSpg.subTotal}</td>
                                                        <c:set var="tien" value="${listSpg.subTotal}"/>
                                                        <c:set var="sum" value="${sum + tien}"/>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        SubTolal:  ${sum}
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    data-dismiss="modal">Close
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="modal" id="myShipper${listIO.orderID}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Chose Shipper</h4>
                                            <button type="button" class="close"
                                                    data-dismiss="modal">&times;
                                            </button>
                                        </div>
                                        <table class="table table-bordered" id="orther detal" width="100%"
                                               cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>Shipper ID</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Carrying</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <!----------Noi-dung-------- -->
                                            <tbody>

                                            <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                                    <tr>
                                                        <td>${listSp.getAccountId()}</td>
                                                        <td>${listSp.firstName }</td>
                                                        <td>${listSp.phone}</td>
                                                        <td>${listSp.ortherCarring}</td>
                                                        <td>
                                                            <form action="<%=request.getContextPath()%>/chooseShipper" method="post">
                                                                <input type="hidden" value="chonShipper" name="chooseShipper"/>
                                                                <input type="hidden" value="${listSp.getAccountId()}" name="shipperID"/>
                                                                <input type="hidden" value="${listIO.orderID}" name="OrtherID"/>
                                                                <input type="submit" value="Choose" style="background-color: #357ebd; color: white">
                                                            </form>
                                                        </td>
                                                    </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

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


