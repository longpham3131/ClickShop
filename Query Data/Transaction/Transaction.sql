
BEGIN TRANSACTION 
SAVE TRANSACTION Tran_InsertUpdateAccountRole
EXEC dbo.USP_TaoUser @Email = 'kiethutcan444444@gmail.com', -- varchar(100)
    @FirstName = 'Tuan', -- varchar(50)
    @LastName = 'Kiet', -- varchar(50)
    @Phone = '092', -- varchar(20)
    @Address = 'Quan 9', -- varchar(200)
    @Gender = 'M', -- varchar(1)
    @DayOfBirth = '2012-11-08', -- date
    @Role = 'SHIPPER' -- varchar(20)
COMMIT



