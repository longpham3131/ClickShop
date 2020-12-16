-- Hàm kiểm tra user tồn tại 
CREATE FUNCTION UF_KiemTraTonTai (@Email varchar(100))
RETURNS INT 
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Account WHERE Email = @Email)
		RETURN 1;
	RETURN 0;
END	
GO

DROP FUNCTION dbo.UF_KiemTraTonTai

SELECT dbo.UF_KiemTraTonTai('kiethutcan@gmail.com')