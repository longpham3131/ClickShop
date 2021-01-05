USE Uni3
GO

-- Không cho phép thêm nhân viên (sale person, shipper) có tuổi nhỏ hơn 18 tuổi.
-- thêm nhân viên
CREATE TRIGGER UTG_AccountRole_tuoiLonHon18
ON dbo.AccountRole
FOR  INSERT, UPDATE
AS 
BEGIN 
	DECLARE @Count INT = 0
	DECLARE @Email varchar(100)
	--thực hiện câu truy vấn
	SELECT @Count = COUNT(*), @Email = Inserted.Email
	FROM Inserted , dbo.Account acc
	WHERE acc.Email = Inserted.Email AND  YEAR(GETDATE()) - YEAR(acc.DayOfBirth) < 18 AND
    (Inserted.Role = 'ADMINISTRATOR' OR Inserted.Role ='SHIPPER' OR Inserted.Role ='SALER')
	GROUP BY Inserted.Email
	-- đếm số nhân viên vi phạm 
	IF(@Count > 0)
	BEGIN
		ROLLBACK TRAN
		DELETE dbo.Account WHERE Email = @Email
	END 
END
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



------------------------------ 19/12/2020
-- Mã hóa password sau khi tạo
USE Uni8
GO 
ALTER TRIGGER [dbo].[MaHoa]
ON [dbo].[Account]
For UPDATE
AS
BEGIN
	DECLARE @newPass VARCHAR(200),@oldPass VARCHAR(200), @id VARCHAR(100)

	SELECT @newPass = Inserted.Password
	FROM Inserted

	SELECT @oldPass = Deleted.Password
	FROM Deleted

	PRINT @newPass  
	PRINT @oldPass
	IF @newPass <> @oldPass
	BEGIN
		SELECT @newPass = Inserted.Password, @id = Inserted.Email 
		FROM Inserted
		SET @newPass = dbo.MaHoaMD5(@newPass)
		UPDATE dbo.Account 
		SET Password = @newPass
		WHERE Email = @id
	END
END
GO

ALTER PROC dbo.USP_DangKy
(@Email varchar(100), @Pass varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE)
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
		          dbo.MaHoaMD5(@Pass) , -- Password - varchar(200)
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
		          'USER'  -- Role - varchar(20)
		          )
END 
GO

ALTER PROC dbo.USP_TaoUser 
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
		          dbo.MaHoaMD5('1') , -- Password - varchar(200)
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




EXEC dbo.USP_DangKy @Email = 'TienTien@gmail.com', -- varchar(100)
    @Pass = '1', -- varchar(100)
    @FirstName = 'Tien', -- varchar(50)
    @LastName = 'Tien', -- varchar(50)
    @Phone = '092', -- varchar(20)
    @Address = 'Binh Thanh', -- varchar(200)
    @Gender = 'M', -- varchar(1)
    @DayOfBirth = '2021-01-03 14:06:27' -- date

DELETE dbo.AccountRole WHERE Email = 'TienTien@gmail.com'
DELETE dbo.Account WHERE Email = 'TienTien@gmail.com'

