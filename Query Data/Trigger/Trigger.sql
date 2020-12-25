USE ClickShop
GO

-- Không cho phép thêm nhân viên (sale person, shipper) có tuổi nhỏ hơn 18 tuổi.

CREATE TRIGGER UTG_AccountRole_tuoiLonHon18
ON dbo.AccountRole
FOR  INSERT, UPDATE
AS 
BEGIN 
	DECLARE @Count INT = 0
	DECLARE @Email varchar(100)
	SELECT @Count = COUNT(*), @Email = Inserted.Email FROM Inserted , dbo.Account acc
	WHERE acc.Email = Inserted.Email AND  YEAR(GETDATE()) - YEAR(acc.DayOfBirth) < 18 AND
    (Inserted.Role = 'ADMINISTRATOR' OR Inserted.Role ='SHIPPER' OR Inserted.Role ='SALER')
	GROUP BY Inserted.Email

	IF(@Count > 0)
	BEGIN
		PRINT N'Tuổi của nhân viên phải lớn hơn 18'
		ROLLBACK TRAN
		DELETE dbo.Account WHERE Email = @Email
	
	END 
END
GO

EXEC dbo.USP_TaoUser @Email = 'hoanghaulele@gmail.com', -- varchar(100)
    @FirstName = 'Tuan', -- varchar(50)
    @LastName = 'Kiet', -- varchar(50)
    @Phone = '092', -- varchar(20)
    @Address = 'Quan 9', -- varchar(200)
    @Gender = 'F', -- varchar(1)
    @DayOfBirth = '2012-11-08', -- date
    @Role = 'SHIPPER' -- varchar(20)

GO

-----------------------------------------------

CREATE TRIGGER PTG_autoInsertIMG
ON dbo.Product
FOR INSERT
AS
BEGIN
	DECLARE @proID INT
	SELECT @proID = Inserted.ProductId 
	FROM Inserted

	INSERT dbo.Image
	        ( ProductId ,
	          ImagePath ,
	          DisplayOrder
	        )
	VALUES  ( @proID , -- ProductId - int
	          'none' , -- ImagePath - varchar(400)
	          1  -- DisplayOrder - int
	        )
END
GO

INSERT dbo.Product
        ( SubCategoryId ,
          Name ,
          UnitPrice ,
          [Like] ,
          Gender ,
          Description ,
          Available
        )
VALUES  ( 1 , -- SubCategoryId - int
          'Duoi Cao' , -- Name - varchar(100)
          1500000 , -- UnitPrice - decimal
          19 , -- Like - int
          0 , -- Gender - int
          'Duoi con cao' , -- Description - varchar(max)
          1  -- Available - bit
        )

SELECT * FROM dbo.Product 
SELECT * FROM dbo.Image
GO

DELETE dbo.AccountRole WHERE Email = 'hoanghau111@gmail.com'
DELETE dbo.Account WHERE Email ='hoanghau111@gmail.com'
----------------------------------------------------------------------------
-- Không cho cập nhật thông tin nếu tuổi mới nhập vào nhỏ hơn 18
CREATE TRIGGER UTG_Account_tuoiNVLonHon18
ON dbo.Account
FOR UPDATE
AS
BEGIN
		DECLARE @Count INT = 0
		SELECT @Count = COUNT(*) FROM Inserted, dbo.AccountRole Ar
		WHERE Ar.Email = Inserted.Email AND
		YEAR(GETDATE()) - YEAR(Inserted.DayOfBirth) < 18 AND
		Ar.Role <> 'USER'

		IF(	@Count > 0)
		BEGIN
			PRINT N'không được cập nhật tuổi nhân viên nhỏ hơn 18'
			ROLLBACK TRAN
		END	
END
GO 