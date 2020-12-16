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
                    <th>Email</th>
                    <th>Sub Total</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <!----------Noi-dung-------- -->
                <tbody>
                <c:forEach items="${listShipping}" var="listSpg" varStatus="loop">
                <tr>
                    <td>${listSpg.orderID}</td>
                    <td>${listSpg.shipperID}</td>
                    <td>${listSpg.email}</td>
                    <td>${listSpg.subTotal}</td>
                    <td>${listSpg.address}</td>
                    <td>${listSpg.phone}</td>
                    <td>${listSpg.status}</td>
                    <td>
                        <button type="button" class="btn btn-info" title="Other Detail"
                                data-toggle="modal" data-target="#myX${listSpg.orderID}">
                            <i class="fa fa-address-book"></i>
                        </button>
                        <button type="button" class="btn btn-primary" title="Detail"
                                data-toggle="modal" data-target="#mySl${listSpg.orderID}">
                            <i class="fa fa-shipping-fast"></i></button>
                    </td>
                </tr>
                <div class="modal" id="myX${listSpg.orderID}">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Orther-Shipping Detail</h4>
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
                                        <input type="text" Order ID
                                               class="form-control-plaintext"
                                               value="${listSpg.orderID}">
                                    </div>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label for="staticID"
                                               class="col-sm-4 col-form-label">Shipper ID
                                            :</label>
                                        <div class="col-sm-8">
                                            <input type="text" Shipper ID
                                                   class="form-control-plaintext"
                                                   value="${listSpg.shipperID}">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label for="staticID"
                                               class="col-sm-4 col-form-label">Customer Email
                                            :</label>
                                        <div class="col-sm-8">
                                            <input type="text" Shipper ID
                                                   class="form-control-plaintext"
                                                   value="${listSpg.email}">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label for="staticID"
                                               class="col-sm-4 col-form-label">Customer Email
                                            :</label>
                                        <div class="col-sm-8">
                                            <input type="text" Shipper ID
                                                   class="form-control-plaintext"
                                                   value="${listSpg.email}">
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>

                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>