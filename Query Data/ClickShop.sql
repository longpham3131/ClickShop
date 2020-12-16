
CREATE DATABASE [ClickShop]
GO
USE [ClickShop]
GO
/****** Object:  UserDefinedFunction [dbo].[UF_KiemTraTonTai]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UF_KiemTraTonTai] (@Email varchar(100))
RETURNS INT 
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Account WHERE Email = @Email)
		RETURN 1;
	RETURN 0;
END	

GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[ImageLink] [varchar](400) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Gender] [varchar](1) NOT NULL,
	[DayOfBirth] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Account_CreatedDate]  DEFAULT (getdate()),
	[isAvailable] [bit] NOT NULL CONSTRAINT [DF_Account_isAvailable]  DEFAULT ((1)),
 CONSTRAINT [PK_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountRole](
	[Email] [varchar](100) NOT NULL,
	[Role] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Like] [int] NOT NULL CONSTRAINT [DF_Comment_Like]  DEFAULT ((0)),
	[Comments] [varchar](8000) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Comment_ModifiedDate]  DEFAULT (getdate()),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Comment_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [FK_COMMENT] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()),
	[Status] [int] NOT NULL,
 CONSTRAINT [FK_FEEDBACKID] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImagePath] [varchar](400) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[PriceHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[Price] [decimal](19, 4) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PriceHistory_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_PriceHistory] PRIMARY KEY CLUSTERED 
(
	[PriceHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
	[Like] [int] NOT NULL CONSTRAINT [DF_Product_Like]  DEFAULT ((0)),
	[Gender] [int] NULL,
	[Description] [varchar](max) NULL,
	[Available] [bit] NOT NULL CONSTRAINT [DF_Product_Available]  DEFAULT ((0)),
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[SubTotal] [decimal](19, 4) NOT NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](max) NULL,
	[Status] [varchar](20) NOT NULL CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PurchaseOrder_CreatedDate]  DEFAULT (getdate()),
	[Name] [varchar](max) NULL,
	[CancelInvoice] [bit] NOT NULL CONSTRAINT [DF_PurchaseOrder_CancelInvoice]  DEFAULT ((1)),
 CONSTRAINT [PK_PURCHASEORDER] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[PurchaseOrderDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
	[Subtotal] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_PurchaseOrderDetailId] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[PurchaseOrderId] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK__Shipper__2A05CAB3DB5CEE87] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[DemTheoSub]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DemTheoSub]()
Returns table
as
	return (
		select Pro.SubCategoryId, SUM(A.soLanMua) as soLanMua
		from Product Pro, 
			(select Pur.ProductId, COUNT(*) as soLanMua
			from PurchaseOrderDetail Pur
			group by Pur.ProductId) A
		where A.ProductId = Pro.ProductId
		group by Pro.SubCategoryId
	)

GO
/****** Object:  UserDefinedFunction [dbo].[DemTheoCategory]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DemTheoCategory]()
Returns table
as
	return select Sub.CategoryId, SUM(A.soLanMua) as soLanMua
	from SubCategory Sub, 
		DemTheoSub() A
	where A.SubCategoryId = Sub.SubCategoryId
	group by Sub.CategoryId

GO
/****** Object:  UserDefinedFunction [dbo].[CountNV]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CountNV]()
Returns table
as
	return (
		Select count(*)as soluongNV From AccountRole
		where AccountRole.Role = 'Saler' OR AccountRole.Role = 'Shipper'
	)

GO
/****** Object:  View [dbo].[OV_OrderView]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OV_OrderView] AS
SELECT P.PurchaseOrderId, P.CreatedDate , A.Email, P.SubTotal, P.Address, P.Phone FROM PurchaseOrder P, Account A WHERE A.AccountId = P.AccountId
GO
/****** Object:  View [dbo].[SV_initOrderList]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_initOrderList]
AS
SELECT P.PurchaseOrderId, A.Email, P.SubTotal, P.Address, P.Phone, P.Status
FROM Account A, PurchaseOrder P
WHERE A.AccountId= P.AccountId AND P.Status ='init'

GO
/****** Object:  View [dbo].[SV_OrtherDetailNoShip]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_OrtherDetailNoShip] AS

SELECT  PO.PurchaseOrderId, P.ProductId, Pro.Name, P.Quantity, P.Subtotal
FROM PurchaseOrderDetail P, Product Pro, PurchaseOrder PO
WHERE PRO.ProductId = P.ProductId AND PO.Status='init' AND PO.PurchaseOrderId = P.PurchaseOrderId 
GO
/****** Object:  View [dbo].[SV_pickupList]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_pickupList]
AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='Picking'
GO
/****** Object:  View [dbo].[SV_shipperList]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW	[dbo].[SV_shipperList]
AS
SELECT A.AccountId, A.Email, A.FirstName, A.Phone,  Count(*) as Carrying, A.LastName, A.Address, A.Gender
FROM Shipper S, Account A, AccountRole AR
WHERE A.Email=AR.Email AND AR.Role='shipper' AND A.AccountId = S.ShipperId AND S.Status='shipping'
GROUP BY A.AccountId, A.Email, A.FirstName, A.Phone, A.LastName, A.Address, A.Gender

GO
/****** Object:  View [dbo].[SV_shippingList]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SV_shippingList]
AS
SELECT S.PurchaseOrderId, S.ShipperId, A.Email, P.SubTotal, P.Address, P.Phone, S.Status
FROM Account A, PurchaseOrder P, Shipper S
WHERE A.AccountId= P.AccountId  AND S.PurchaseOrderId = P.PurchaseOrderId AND S.Status='shipping'

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (1, N'admin@yourstore.com', N'1', N'/img/user01.jpg', N'Pham', N'Hoang Long', N'0929372005', N'Quan 9', N'M', CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (2, N'tuankiet@gmail.com', N'1', N'/img/user02.jpg', N'Nguyen', N'Tuan Kiet', N'0904755055', N'Quan 9', N'M', CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (3, N'thuckha@gmail.com', N'1', N'/img/user03.jpg', N'Pham', N'Thuc Kha', N'0904152369', N'Phu Nhuan', N'M', CAST(N'2000-01-03 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (4, N'ngocuyen@gmail.com', N'1', N'/img/user04.jpg', N'Nguyen', N'Ngoc Uyen', N'0923991122', N'Thu Duc', N'F', CAST(N'2000-01-04 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (5, N'thiennhi@gmail.com', N'1', N'/img/user05.jpg', N'Chung', N'Thien Nhi', N'0904755555', N'Thu Duc', N'F', CAST(N'2000-01-05 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (11, N'kimhoang@gmail.com', N'1', N'none', N'Kim', N'Hoang', N'092', N'Long Xuyen', N'F', CAST(N'2002-07-16 00:00:00.000' AS DateTime), CAST(N'2020-12-15 14:32:16.427' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (12, N'trunghau@gmail.com', N'1', N'none', N'trung', N'hau', N'092', N'Ben Tre', N'M', CAST(N'2000-06-11 00:00:00.000' AS DateTime), CAST(N'2020-12-15 14:35:02.153' AS DateTime), 1)
INSERT [dbo].[Account] ([AccountId], [Email], [Password], [ImageLink], [FirstName], [LastName], [Phone], [Address], [Gender], [DayOfBirth], [CreatedDate], [isAvailable]) VALUES (21, N'quangtien@gmail.com', N'1', N'none', N'Quang', N'Tien', N'092', N'Quan 9', N'M', CAST(N'2000-06-10 00:00:00.000' AS DateTime), CAST(N'2020-12-15 14:49:34.510' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'admin@yourstore.com', N'Administrator')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'kimhoang@gmail.com', N'SALEPERSON')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'ngocuyen@gmail.com', N'User')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'quangtien@gmail.com', N'USER')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'tuankiet@gmail.com', N'Saler')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'thiennhi@gmail.com', N'User')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'thuckha@gmail.com', N'Shipper')
INSERT [dbo].[AccountRole] ([Email], [Role]) VALUES (N'trunghau@gmail.com', N'USER')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'Accessories')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Men Shoes')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Tee (Unisex)')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Women Shoes')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentId], [ProductId], [AccountId], [Like], [Comments], [ModifiedDate], [CreatedDate]) VALUES (1, 11, 4, 81, N'The product is OK', CAST(N'2020-12-01 00:00:00.000' AS DateTime), CAST(N'2020-12-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FeedBackId], [AccountId], [Title], [Description], [CreatedDate], [Status]) VALUES (1, 3, N'Review', N'Good!', CAST(N'2020-12-03 20:07:01.673' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (1, 1, N'/image_product/Chelsea01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (2, 2, N'/image_product/Chelsea02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (3, 3, N'/image_product/Chelsea03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (4, 4, N'/image_product/Chelsea04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (5, 5, N'/image_product/Chelsea05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (6, 6, N'image_product/Chelsea06.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (7, 7, N'/image_product/Chelsea07.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (8, 8, N'/image_product/Chelsea08.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (9, 9, N'/image_product/Chelsea09.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (10, 10, N'/image_product/Chelsea10.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (11, 11, N'/image_product/Chelsea11.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (12, 12, N'/image_product/Derby01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (13, 13, N'/image_product/Derby02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (14, 14, N'/image_product/Derby03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (15, 15, N'/image_product/Derby04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (16, 16, N'/image_product/Derby05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (17, 17, N'/image_product/Harness01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (18, 18, N'/image_product/Harness02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (19, 19, N'/image_product/Harness03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (20, 20, N'/image_product/Zip01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (21, 21, N'/image_product/Combat01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (22, 22, N'/image_product/Combat02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (23, 23, N'/image_product/Oxford01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (24, 24, N'/image_product/Oxford02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (25, 25, N'/image_product/Combat_Women01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (26, 26, N'/image_product/Combat_Women02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (27, 27, N'/image_product/Chelsea_Women01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (28, 28, N'/image_product/Chelsea_Women02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (29, 29, N'/image_product/Tee01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (30, 30, N'/image_product/Tee02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (31, 31, N'/image_product/Tee03.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (32, 32, N'/image_product/Tee04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (33, 33, N'/image_product/Tee05.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (34, 34, N'/image_product/Shirt01.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (35, 35, N'/image_product/Shirt02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (36, 36, N'/image_product/Belt01.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (37, 37, N'/image_product/Belt02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (38, 38, N'/image_product/Bracelet01.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (39, 39, N'/image_product/Bracelet02.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (40, 40, N'/image_product/Chain01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (41, 41, N'/image_product/Bandana01.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (42, 42, N'/image_product/Bandana02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (43, 43, N'/image_product/Bandana03.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (44, 44, N'/image_product/Bandana04.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (45, 45, N'/image_product/Bandana05.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (46, 46, N'/image_product/Bandana06.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (47, 47, N'/image_product/Necklace01.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (48, 48, N'/image_product/Bucket01.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (49, 49, N'/image_product/Bucket02.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (50, 50, N'/image_product/Bucket03.png', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (51, 51, N'none', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (52, 52, N'none', 1)
INSERT [dbo].[Image] ([ImageId], [ProductId], [ImagePath], [DisplayOrder]) VALUES (53, 52, N'Duoicontho.img', 1)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[PriceHistory] ON 

INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (1, 1, CAST(1300000.0000 AS Decimal(19, 4)), CAST(1700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (2, 2, CAST(1200000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (3, 3, CAST(1400000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (4, 4, CAST(1900000.0000 AS Decimal(19, 4)), CAST(2300000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (5, 5, CAST(1900000.0000 AS Decimal(19, 4)), CAST(2300000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (6, 6, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2005000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (7, 7, CAST(1800000.0000 AS Decimal(19, 4)), CAST(2200000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (8, 8, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2005000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (9, 9, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2005000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (10, 10, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2005000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (11, 11, CAST(1400000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (12, 12, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2005000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (13, 13, CAST(1000000.0000 AS Decimal(19, 4)), CAST(1200000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (14, 14, CAST(1400000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (15, 15, CAST(1200000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (16, 16, CAST(1400000.0000 AS Decimal(19, 4)), CAST(1800000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (17, 17, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2450000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (18, 18, CAST(2300000.0000 AS Decimal(19, 4)), CAST(2700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (19, 19, CAST(2050000.0000 AS Decimal(19, 4)), CAST(2450000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (20, 20, CAST(1900000.0000 AS Decimal(19, 4)), CAST(2300000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (21, 21, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2000000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (22, 22, CAST(1600000.0000 AS Decimal(19, 4)), CAST(2000000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (23, 23, CAST(1100000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (24, 24, CAST(1100000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (25, 25, CAST(1200000.0000 AS Decimal(19, 4)), CAST(1600000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (26, 26, CAST(1300000.0000 AS Decimal(19, 4)), CAST(1700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (27, 27, CAST(1100000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (28, 28, CAST(1100000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (29, 29, CAST(180000.0000 AS Decimal(19, 4)), CAST(280000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (30, 30, CAST(180000.0000 AS Decimal(19, 4)), CAST(280000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (31, 31, CAST(180000.0000 AS Decimal(19, 4)), CAST(280000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (32, 32, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (33, 33, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (34, 34, CAST(300000.0000 AS Decimal(19, 4)), CAST(500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (35, 35, CAST(300000.0000 AS Decimal(19, 4)), CAST(500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (36, 36, CAST(250000.0000 AS Decimal(19, 4)), CAST(450000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (37, 37, CAST(250000.0000 AS Decimal(19, 4)), CAST(450000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (38, 38, CAST(300000.0000 AS Decimal(19, 4)), CAST(500000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (39, 39, CAST(150000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (40, 40, CAST(150000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (41, 41, CAST(150000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (42, 42, CAST(150000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (43, 43, CAST(150000.0000 AS Decimal(19, 4)), CAST(250000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (44, 44, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (45, 45, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (46, 46, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (47, 47, CAST(250000.0000 AS Decimal(19, 4)), CAST(350000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (48, 48, CAST(400000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (49, 49, CAST(400000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[PriceHistory] ([PriceHistoryId], [ProductId], [Cost], [Price], [CreatedDate]) VALUES (50, 50, CAST(400000.0000 AS Decimal(19, 4)), CAST(700000.0000 AS Decimal(19, 4)), CAST(N'2020-11-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PriceHistory] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (1, 1, N'The Basic Wolf Chelsea Boots - Black', CAST(1700000.0000 AS Decimal(19, 4)), 63, 0, N'Black, Cowhide Material,Rubber Shoe Sole, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (2, 1, N'The Basic Chealsea Boots - Tan', CAST(1600000.0000 AS Decimal(19, 4)), 42, 0, N'Tan, Cowhide Material, Canvas Lining, Rubber Shoe Sole, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (3, 1, N'The Classic Chealsea Boots - Black', CAST(1800000.0000 AS Decimal(19, 4)), 98, 0, N'Black, Glossy, Cowhide Material,Canvas Lining, Rubber Shoe Sole, 2.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (4, 1, N'The Rising Chelsea Boots Wolf Warrior - Black', CAST(2300000.0000 AS Decimal(19, 4)), 55, 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (5, 1, N'The Rising Chelsea Boots Wolf Warrior - Tobacco', CAST(2300000.0000 AS Decimal(19, 4)), 46, 0, N'Tabacco, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (6, 1, N'The Wild Walk Chelsea Boots - Black', CAST(2050000.0000 AS Decimal(19, 4)), 87, 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (7, 1, N'The Wild Walk Chelsea Boots - Black Lizard', CAST(2200000.0000 AS Decimal(19, 4)), 79, 0, N'Black Lizard, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (8, 1, N'The Wild Walk Chelsea Boots - Black Suede', CAST(2050000.0000 AS Decimal(19, 4)), 89, 0, N'Black Suede, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (9, 1, N'The Wild Walk Chelsea Boots - Tan', CAST(2050000.0000 AS Decimal(19, 4)), 56, 0, N'Tan, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (10, 1, N'The Wild Walk Chelsea Boots - Tabacco', CAST(2050000.0000 AS Decimal(19, 4)), 89, 0, N'Tabacco, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (11, 1, N'The X Flawless Chelsea Boots - Black Suede', CAST(1800000.0000 AS Decimal(19, 4)), 99, 0, N'Black Suede, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (12, 2, N'The 4cm Heel Derby - Black Lizard', CAST(1005000.0000 AS Decimal(19, 4)), 53, 0, N'Black Lizard, Cowhide Material, Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (13, 2, N'The Modern Brogue Derby - Black', CAST(1200000.0000 AS Decimal(19, 4)), 56, 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (14, 2, N'The Modern Brogue Derby - Black Grain and White', CAST(1800000.0000 AS Decimal(19, 4)), 72, 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (15, 2, N'The Modern Derby - Black', CAST(1600000.0000 AS Decimal(19, 4)), 81, 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (16, 2, N'The Modern Derby - Black Grain', CAST(1800000.0000 AS Decimal(19, 4)), 68, 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (17, 3, N'The Alpha Wolf Harness Boots - Black', CAST(2450000.0000 AS Decimal(19, 4)), 124, 0, N'Black, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (18, 3, N'The Alpha Wolf Harness Boots - Black Bandana', CAST(2700000.0000 AS Decimal(19, 4)), 151, 0, N'Matte Black, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high, YKK Zipper, Blake Stitch', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (19, 3, N'The Alpha Wolf Harness Boots - Tobacco', CAST(2450000.0000 AS Decimal(19, 4)), 151, 0, N'Tabacco, Italian Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.7cm high, YKK Zipper, Blake Stitch', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (20, 4, N'The Ghost Zip Boot - Tobacco', CAST(2300000.0000 AS Decimal(19, 4)), 83, 0, N'Tobacco, Cowhide Material, High Quality Rubber Shoe Sole, Goat Leather Lining, 4.3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (21, 5, N'The Combat Boots - Black', CAST(2000000.0000 AS Decimal(19, 4)), 230, 0, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (22, 5, N'The Combat Boots - Black Grain', CAST(2000000.0000 AS Decimal(19, 4)), 245, 0, N'Black Grain, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (23, 6, N'The Basic Wolf Oxford - Black', CAST(1500000.0000 AS Decimal(19, 4)), 73, 0, N'Black, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (24, 6, N'The Classic Captoe Oxford - Black', CAST(1500000.0000 AS Decimal(19, 4)), 64, 0, N'Black,Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (25, 7, N'The Basic Wolf Chelsea Boots - Tan - Women', CAST(1600000.0000 AS Decimal(19, 4)), 109, 1, N'Tan, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (26, 7, N'The Basic Wolf Chelsea Boots - Black - Women', CAST(1700000.0000 AS Decimal(19, 4)), 118, 1, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (27, 8, N'The SheWolf Classic Combat Boots - Black - Women', CAST(1500000.0000 AS Decimal(19, 4)), 92, 1, N'Black,Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 2.5cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (28, 8, N'The SheWolf Modern Combat Boots - Women', CAST(1500000.0000 AS Decimal(19, 4)), 82, 1, N'Black, Glossy, Cowhide Material, Rubber Shoe Sole, Canvas and Goat Leather Lining, 3cm high', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (29, 9, N'The Wolf Basic Tee - Black', CAST(280000.0000 AS Decimal(19, 4)), 96, 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (30, 9, N'The Wolf Basic Tee - Tan', CAST(280000.0000 AS Decimal(19, 4)), 96, 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (31, 9, N'The Wolf Basic Tee - White', CAST(280000.0000 AS Decimal(19, 4)), 112, 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (32, 9, N'The Wolf Seven Elements Tee - Black', CAST(350000.0000 AS Decimal(19, 4)), 163, 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (33, 9, N'The Wolf Seven Elements Tee - White', CAST(350000.0000 AS Decimal(19, 4)), 123, 2, N'97% cotton, 3% spandex, Anti-wrinkle - deodorizing - anti-stretch - fast color, 4-way stretch elastic', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (34, 10, N'The Brave Wolf Shirt - Black', CAST(500000.0000 AS Decimal(19, 4)), 189, 2, N'Black, Mango Silk Fabric', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (35, 10, N'The Brave Wolf Shirt - White', CAST(500000.0000 AS Decimal(19, 4)), 147, 2, N'White, Mango Silk Fabric', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (36, 11, N'The Alpha Wolf Belt Circle', CAST(450000.0000 AS Decimal(19, 4)), 152, 2, N'Facial skin: cow skin stamping varanus, Leather lining: nubuck cow leather, Key: pure copper, Structure: 50% machine sewing, 50% hand sewing', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (37, 11, N'The Alpha Wolf Belt Square', CAST(450000.0000 AS Decimal(19, 4)), 122, 2, N'Facial skin: cow skin stamping varanus, Leather lining: nubuck cow leather, Key: pure copper, Structure: 50% machine sewing, 50% hand sewing', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (38, 12, N'The Alpha Wolf Bracelet', CAST(500000.0000 AS Decimal(19, 4)), 137, 2, N'Facial skin: Ostrich feet (real), Leather lining: nubuck cow leather, Chain chain: stainless high-grade alloy, Canopy head: stainless high-grade alloy, Key: stainless high-grade alloy, Structure: 50% machine sewing, 50% hand sewing', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (39, 12, N'The Rising Wolf Bracelet', CAST(250000.0000 AS Decimal(19, 4)), 171, 2, N'Color: Black, Material: Cowhide', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (40, 13, N'The Rising Chain', CAST(250000.0000 AS Decimal(19, 4)), 150, 2, N'Silver', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (41, 14, N'The Brave Wolf Bandana - Black', CAST(250000.0000 AS Decimal(19, 4)), 109, 2, N'Color: Black, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (42, 14, N'The Brave Wolf Bandana - Forest Blue', CAST(250000.0000 AS Decimal(19, 4)), 129, 2, N'Color: Forest Blue, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (43, 14, N'The Brave Wolf Bandana - Navy Blue', CAST(250000.0000 AS Decimal(19, 4)), 94, 2, N'Color: Navy Blue, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (44, 14, N'The Brave Wolf Bandana Keychain - Black', CAST(350000.0000 AS Decimal(19, 4)), 111, 2, N'Color: Black, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (45, 14, N'The Brave Wolf Bandana Keychain - Forest Blue', CAST(350000.0000 AS Decimal(19, 4)), 120, 2, N'Color: Forest Blue, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (46, 14, N'The Brave Wolf Bandana Keychain - Navy Blue', CAST(350000.0000 AS Decimal(19, 4)), 149, 2, N'Color: Navy Blue, Material: Silk, Size: 53 x 53 cm', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (47, 15, N'The Brave Wolf Necklace', CAST(350000.0000 AS Decimal(19, 4)), 182, 2, N'Stainless Steel', 0)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (48, 16, N'The Wolf Bucket Hat - Black', CAST(700000.0000 AS Decimal(19, 4)), 94, 2, N'Black,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (49, 16, N'The Wolf Bucket Hat - Black Lizard', CAST(700000.0000 AS Decimal(19, 4)), 91, 2, N'Black Lizard ,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (50, 16, N'The Wolf Bucket Hat - Black Python', CAST(700000.0000 AS Decimal(19, 4)), 85, 2, N'Black Python ,Diameter 18 cm, suitable for top styles, Facial skin: Italian cowhide, covered with waterproof, 70-80% water resistant, Inner lining: High-grade denim, Zippers: Branded YKK stainless steel, Transparent surface: made of high quality PVC, flexible, unlike products sold on the market', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (51, 1, N'Duoi Cao', CAST(1500000.0000 AS Decimal(19, 4)), 19, 0, N'Duoi con cao', 1)
INSERT [dbo].[Product] ([ProductId], [SubCategoryId], [Name], [UnitPrice], [Like], [Gender], [Description], [Available]) VALUES (52, 1, N'Duoi con tho', CAST(1500000.0000 AS Decimal(19, 4)), 15, 1, N'Duoi con tho', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (1, 5, CAST(1680000.0000 AS Decimal(19, 4)), N'Thu Duc', N'0923991122', N'Completed', CAST(N'2020-12-01 00:00:00.000' AS DateTime), N'Ngoc Uyen', 0)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (2, 2, CAST(7.0000 AS Decimal(19, 4)), N'Quan 2', N'540474747', N'Completed', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'TranH ung Dao', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (3, 1, CAST(2.0000 AS Decimal(19, 4)), N'Quan 7', N'066332', N'Processing', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Bray', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (4, 3, CAST(3.0000 AS Decimal(19, 4)), N'Quan 8', N'07032030', N'Processing', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Hoang Long', 1)
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [AccountId], [SubTotal], [Address], [Phone], [Status], [CreatedDate], [Name], [CancelInvoice]) VALUES (5, 4, CAST(13.0000 AS Decimal(19, 4)), N'Quan 9', N'01364', N'init', CAST(N'1905-07-01 00:00:00.000' AS DateTime), N'Tuan Kiet', 1)
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] ON 

INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (1, 1, 26, 300, CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)), CAST(1500000.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (2, 2, 2, 1, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (3, 2, 13, 2, CAST(2.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (4, 3, 30, 2, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(2.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (5, 4, 44, 1, CAST(2.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)), CAST(3.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (6, 5, 49, 2, CAST(5.0000 AS Decimal(19, 4)), CAST(6.0000 AS Decimal(19, 4)), CAST(12.0000 AS Decimal(19, 4)))
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailId], [PurchaseOrderId], [ProductId], [Quantity], [Cost], [UnitPrice], [Subtotal]) VALUES (7, 5, 6, 1, CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] OFF
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (1, 3, N'Cancel')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (2, 3, N'Completed')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (3, 3, N'Shipping')
INSERT [dbo].[Shipper] ([PurchaseOrderId], [ShipperId], [Status]) VALUES (4, 3, N'Picking')
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (1, 1, N'Chealsea Boots - Men')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (2, 1, N'Derby')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (3, 1, N'Harness Boots')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (4, 1, N'Zip Boots')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (5, 1, N'Combat Boots - Men')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (6, 1, N'Oxford')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (7, 2, N'Chealsea Boots - Women')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (8, 2, N'Combat Boots - Women')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (9, 3, N'T-Shirt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (10, 3, N'Shirt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (11, 4, N'Belt')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (12, 4, N'Bracelet')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (13, 4, N'Chain')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (14, 4, N'Bandana')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (15, 4, N'Necklace')
INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Name]) VALUES (16, 4, N'Bucket Hat')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_ACCOUNT_EMAIL]    Script Date: 16/12/2020 4:02:22 CH ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UC_ACCOUNT_EMAIL] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_ACCOUNTROLE_EMAIL_ROLE]    Script Date: 16/12/2020 4:02:22 CH ******/
ALTER TABLE [dbo].[AccountRole] ADD  CONSTRAINT [UQ_ACCOUNTROLE_EMAIL_ROLE] UNIQUE NONCLUSTERED 
(
	[Email] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_CATEGORY_NAME]    Script Date: 16/12/2020 4:02:22 CH ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UC_CATEGORY_NAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_PRODUCTNAME]    Script Date: 16/12/2020 4:02:22 CH ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UC_PRODUCTNAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_SUBCATEGORY_NAME]    Script Date: 16/12/2020 4:02:22 CH ******/
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [UC_SUBCATEGORY_NAME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountRole]  WITH CHECK ADD  CONSTRAINT [FK_EMAIL_ACCOUNT] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[AccountRole] CHECK CONSTRAINT [FK_EMAIL_ACCOUNT]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_ACCOUNT] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_COMMENT_ACCOUNT]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_COMMENT_PRODUCT]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FEEDBACK_ACCOUNT] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FEEDBACK_ACCOUNT]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_IMAGE_PRODUCT]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PRICEHISTORY_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PRICEHISTORY_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SUBCATEGORYID_PRODUCT] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_SUBCATEGORYID_PRODUCT]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDER_ACCOUNT] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PURCHASEORDER_ACCOUNT]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDERDETAIL_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PURCHASEORDERDETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASEORDERDETAIL_PURCHCASEORDER] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PURCHASEORDERDETAIL_PURCHCASEORDER]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK__Shipper__Purchas__5CD6CB2B] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK__Shipper__Purchas__5CD6CB2B]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SUBCATEGORY_CATEGORY] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SUBCATEGORY_CATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[OSP_CapNhanDonHang]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OSP_CapNhanDonHang]
@PurchaseOrderId INT, @Address varchar(MAX), @Phone varchar(MAX)
AS

BEGIN
	UPDATE dbo.PurchaseOrder SET Address = @Address, Phone = @Phone WHERE PurchaseOrderId = @PurchaseOrderId
END

GO
/****** Object:  StoredProcedure [dbo].[OSP_CapNhatChiTiet]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OSP_CapNhatChiTiet]
@PurchaseOrderDetailId BIGINT, @PurchaseOrderId INT, @ProductId INT, @Quantity INT, @UnitPrice decimal(19, 4), @Subtotal decimal(19, 4)
AS

BEGIN
	UPDATE dbo.PurchaseOrderDetail SET ProductId = @ProductId, Quantity = @Quantity, UnitPrice = @UnitPrice, Subtotal = @Subtotal
	WHERE PurchaseOrderId = @PurchaseOrderId AND PurchaseOrderDetailId = @PurchaseOrderDetailId
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_ThemSP]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSP_ThemSP]
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
/****** Object:  StoredProcedure [dbo].[USP_CapNhatUser]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------


CREATE PROCEDURE [dbo].[USP_CapNhatUser]
@Email varchar(100), @FirstName varchar(50), @LastName varchar(50), @Phone varchar(20), 
@Address varchar(200), @Gender varchar(1), @DayOfBirth DATE
AS
BEGIN
	UPDATE dbo.Account SET FirstName = @FirstName, LastName = @LastName, Phone = @Phone,
	 Address = @Address, DayOfBirth = @DayOfBirth WHERE Email = @Email
END

GO
/****** Object:  StoredProcedure [dbo].[USP_TaoUser]    Script Date: 16/12/2020 4:02:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[USP_TaoUser] 
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
USE [master]
GO
ALTER DATABASE [ClickShop] SET  READ_WRITE 
GO
