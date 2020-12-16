USE ClickShop
GO

CREATE VIEW OV_OrderView AS
SELECT P.PurchaseOrderId, P.CreatedDate , A.Email, P.SubTotal, P.Address, P.Phone FROM PurchaseOrder P, Account A WHERE A.AccountId = P.AccountId
GO

SELECT * FROM dbo.OV_OrderView
GO

------------------------------
--SHIPPER
CREATE VIEW	SV_shipperList
AS
SELECT A.AccountId, A.Email, A.FirstName, A.Phone,  Count(*) as Carrying, A.LastName, A.Address, A.Gender
FROM Shipper S, Account A, AccountRole AR
WHERE A.Email=AR.Email AND AR.Role='shipper' AND A.AccountId = S.ShipperId AND S.Status='shipping'
GROUP BY A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender
GO
------------------------------------------

CREATE VIEW SV_initOrderList
AS
SELECT P.PurchaseOrderId, A.Email, P.SubTotal, P.Address, P.Phone, P.Status
FROM Account A, PurchaseOrder P
WHERE A.AccountId= P.AccountId AND P.Status ='init'
GO

-------------------------------------------
CREATE VIEW SV_OrtherDetailNoShip
 AS

SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal
FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO
WHERE PRO.ProductId = P.ProductId AND PO.Status='init' AND PO.PurchaseOrderId = P.PurchaseOrderId 
GO

------------------------------------------------
CREATE VIEW SV_shippingList
AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='shipping'
GO

--------------------------------------------------
CREATE VIEW SV_pickupList
AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='Picking'