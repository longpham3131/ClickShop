<div class="modal" id="myModal${listIO.orderID}">
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
                <c:forEach items="${listShipping}" var="listSpg" varStatus="loop">
                    <tr>
                        <td>${listSpg.orderID}</td>
                        <td>${listSpg.shipperID}</td>
                        <td>${listSpg.email}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger"
                        data-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>