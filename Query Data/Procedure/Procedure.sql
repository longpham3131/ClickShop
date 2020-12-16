USE ClickShop
GO



CREATE PROCEDURE USP_TaoUser 
(@Email varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE, @Role varchar(20))
AS
BEGIN
		INSERT dbo.Account
		        ( Email ,
		          Password ,
		          ImageLink ,
		          FirstName ,
		          LastName ,
		          Phone ,
		          Address ,
		          Gender ,
		          DayOfBirth ,
		          CreatedDate ,
		          isAvailable
		        )
		VALUES  ( @Email , -- Email - varchar(100)
		          '1' , -- Password - varchar(200)
		          'none' , -- ImageLink - varchar(400)
		          @FirstName , -- FirstName - varchar(50)
		          @LastName , -- LastName - varchar(50)
		          @Phone , -- Phone - varchar(20)
		          @Address , -- Address - varchar(200)
		          @Gender , -- Gender - varchar(1)
		          @DayOfBirth , -- DayOfBirth - datetime
		          GETDATE() , -- CreatedDate - datetime
		          1  -- isAvailable - bit
		        )
		INSERT dbo.AccountRole
		        ( Email, Role )
		VALUES  ( @Email, -- Email - varchar(100)
		          @Role  -- Role - varchar(20)
		          )
END 
GO	


--------------------------------------------------------------


CREATE PROCEDURE USP_CapNhatUser
@Email varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE
AS
BEGIN
	UPDATE dbo.Account SET FirstName = @FirstName, LastName = @LastName, Phone = @Phone,
	 Address = @Address, DayOfBirth = @DayOfBirth WHERE Email = @Email
END
GO


-------------------------------------------------------------------




CREATE PROCEDURE OSP_CapNhanDonHang
@PurchaseOrderId INT, @Address varchar(MAX), @Phone varchar(MAX)
AS

BEGIN
	UPDATE dbo.PurchaseOrder SET Address = @Address, Phone = @Phone WHERE PurchaseOrderId = @PurchaseOrderId
END
GO


CREATE PROCEDURE OSP_CapNhatChiTiet
@PurchaseOrderDetailId BIGINT, @PurchaseOrderId INT, @ProductId INT, @Quantity INT, @UnitPrice decimal(19, 4), @Subtotal decimal(19, 4)
AS

BEGIN
	UPDATE dbo.PurchaseOrderDetail SET ProductId = @ProductId, Quantity = @Quantity, UnitPrice = @UnitPrice, Subtotal = @Subtotal
	WHERE PurchaseOrderId = @PurchaseOrderId AND PurchaseOrderDetailId = @PurchaseOrderDetailId
END

EXEC dbo.OSP_CapNhatChiTiet @PurchaseOrderDetailId = 0, -- bigint
    @PurchaseOrderId = 0, -- int
    @ProductId = 0, -- int
    @Quantity = 0, -- int
    @UnitPrice = NULL, -- decimal
    @Subtotal = NULL -- decimal

GO

CREATE PROCEDURE PSP_ThemSP
@SubCate INT , @Name VARCHAR(100),@imgPath varchar(400), @UnitPrice decimal(19, 4), @like INT, @Gender INT, @Description varchar(MAX)
AS
BEGIN
	INSERT dbo.Product
	        ( SubCategoryId ,
	          Name ,
	          UnitPrice ,
	          [Like] ,
	          Gender ,
	          Description ,
	          Available
	        )
	VALUES  ( @SubCate , -- SubCategoryId - int
	          @Name , -- Name - varchar(100)
	          @UnitPrice , -- UnitPrice - decimal
	          @like , -- Like - int
	          @Gender , -- Gender - int
	          @Description , -- Description - varchar(max)
	          1  -- Available - bit
	        )

	DECLARE @proID INT

	SELECT @proID = MAX(ProductId) FROM dbo.Product

	
	INSERT dbo.Image
	        ( ProductId ,
	          ImagePath ,
	          DisplayOrder
	        )
	VALUES  ( @proID , -- ProductId - int
	          @imgPath , -- ImagePath - varchar(400)
	          1  -- DisplayOrder - int
	        ) 



END
GO 

DROP PROC dbo.PSP_ThemSP

EXEC dbo.PSP_ThemSP @SubCate = 1, -- int
    @Name = 'Duoi con tho', -- varchar(100)
    @imgPath = 'Duoicontho.img', -- varchar(400)
    @UnitPrice = 1500000, -- decimal
    @like = 15, -- int
    @Gender = 1, -- int
    @Description = 'Duoi con tho' -- varchar(max)


SELECT * FROM dbo.Product
GO
SELECT * FROM dbo.Image
