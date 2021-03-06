
USE [Shop]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng Orders chứa thông tin hóa đơn
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipPhone] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Total] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ChartRevenue]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng danh mục sản phẩm chưa thông tin danh mục
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Descriptions] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteProduct]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng Chi tiết hóa đơn
CREATE TABLE [dbo].[OrderDetails](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng chứa thông tin sản phẩm
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng chứa thông tin nhà cung cấp
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo bảng chứa thông tin tài khoản
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
--Thêm dữ liệu danh mục sản phẩm
INSERT [dbo].[Category] ([ID], [Name], [Descriptions]) VALUES (1, N'Laptop', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Descriptions]) VALUES (2, N'Điện thoại', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Descriptions]) VALUES (3, N'Đồng hồ', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Descriptions]) VALUES (4, N'Phụ kiện', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Descriptions]) VALUES (5, N'Camera', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
--Thêm dữ liệu chi tiết hóa đơn
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 23, 1, CAST(56990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 24, 1, CAST(56990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (6, 18, 1, CAST(11590000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (9, 22, 1, CAST(22890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 19, 1, CAST(21290000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 21, 1, CAST(43890000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (19, 20, 2, CAST(21000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20, 23, 1, CAST(16007000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (24, 18, 1, CAST(40810000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 22, 1, CAST(24990000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (49, 20, 1, CAST(6490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (68, 21, 1, CAST(5490000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (69, 17, 2, CAST(8990000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Orders] ON 
--Thêm dữ liệu đơn hàng
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (17, N'Nguyễn Thanh Khánh', N'972485201', N'338/13 Phạm Văn Chiêu Phường 9 Quận Gò Vấp', N'kabald8945129@gmail.com', CAST(17980000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (18, N'Dũng', N'097161712', N'172 Phạm Văn Chiêu', N'dung@gmail.com', CAST(11590000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (19, N'Thoại', N'029698747', N'12 Bắc Hải', N'thoai@gmail.com', CAST(21290000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (20, N'An', N'0821654', N'123 Lý Thường Kiệt', N'An@gmail.com', CAST(6490000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (21, N'Trường', N'08746516', N'121 Phan Huy Ích', N'truong@gmail.com', CAST(5490000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-06-21T11:57:15.270' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (22, N'Thiện', N'0654984984', N'123 Quang Trung', N'thien@gmail.com', CAST(24990000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-07-02T22:57:59.600' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (23, N'Thục', N'0154654956', N'12 Nguyễn Văn Quá', N'thuc@gmail.com', CAST(56990000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-07-02T22:58:54.877' AS DateTime))
INSERT [dbo].[Orders] ([ID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Total], [Status], [UserID], [CreateDate]) VALUES (24, N'Nam', N'0654561651', N'88 Nguyễn Văn Lượng', N'nam@gmail.com', CAST(56990000 AS Decimal(18, 0)), 0, 2, CAST(N'2020-07-03T22:59:34.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 
--Thêm dữ liệu thông tin sản phẩm
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (1, N'MacBook Air 2017 i5 1.8GHz/8GB/128GB (MQD32SA/A)', N'A00001', N'MacBook Air 2017 i5 128GB là mẫu laptop văn phòng, có thiết kế siêu mỏng và nhẹ, vỏ nhôm nguyên khối sang trọng. Máy có hiệu năng ổn định, thời lượng pin cực lâu 12 giờ, phù hợp cho hầu hết các nhu cầu làm việc và giải trí.', N'/assets/client/images/Laptop/A00001.png', CAST(19990000 AS Decimal(18, 0)), 0, 25, CAST(N'2020-05-01T16:00:33.620' AS DateTime), 1, 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (2, N'Macbook Pro Touch 2019 i5 1.4GHz/8GB/256GB (MUHP2SA/A)
', N'A00002', N'Laptop Apple Macbook Pro Touch 2019 được trang bị màn hình Retina tuyệt đẹp với công nghệ True Tone mang đến những thước phim cực sống động. Hơn nữa, cấu hình Intel Core i5 mạnh mẽ đưa bạn đến những trải nghiệm làm việc cực mượt mà khi thiết kế đồ hoạ hay chơi game giải trí', N'/assets/client/images/Laptop/A00002.png', CAST(37990000 AS Decimal(18, 0)), 0, 26, CAST(N'2020-05-01T16:01:49.950' AS DateTime), 1, 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (3, N'Macbook Pro Touch 16 inch 2019 i7 2.6GHz/16GB/512GB/4GB Radeon Pro 5300M (MVVJ2SA/A)
', N'A00003', N'MacBook ProTouch 2019 i7 chiếc laptop cấu hình mạnh mẽ của Apple sẽ đem đến những trải nghiệm mà không phải chiếc laptop nào cũng có được. Thiết kế sang trọng tinh tế, cấu hình khủng, được trang bị card đồ họa và các công nghệ độc quyền của Apple sẽ đem lại nhiều thích thú cho người dùng', N'/assets/client/images/Laptop/A00003.png', CAST(56990000 AS Decimal(18, 0)), 0, 42, CAST(N'2020-05-01T16:03:45.093' AS DateTime), 1, 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (5, N'MacBook Air 2019 i5 1.6GHz/8GB/256GB (MVFL2SA/A)
', N'A00004', N'Apple Macbook Air 2019 i5 (MVFL2SA/A) là phiên bản nâng cấp nhẹ so với MacBook Air 2018. Màn hình Retina nay được trang bị công nghệ Truetone hiện đại, có nhiều cải tiến trên bàn phím cánh bướm', N'/assets/client/images/Laptop/A00004.png', CAST(32990000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T16:06:30.987' AS DateTime), 1, 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (6, N'VivoBook X509FA i3 8145U/4GB/512GB/Chuột/Win10 (EJ857T)
', N'AS00001', N'Nếu bạn là sinh viên hay nhân viên văn phòng đang tìm một chiếc laptop có cấu hình ổn định, phù hợp mang theo đi làm mỗi ngày thì laptop Asus VivoBook X509FA là một sự lựa chọn đáng để bạn cân nhắc', N'/assets/client/images/Laptop/AS00001.png', CAST(11590000 AS Decimal(18, 0)), 0, 34, CAST(N'2020-05-01T16:11:30.280' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (7, N'VivoBook A412FA i5 10210U/8GB/512GB/Win10 (EK738T)
', N'AS00002', N'Đặc điểm nổi bật của Asus VivoBook A412FA i5 10210U/8GB/512GB/Win10 (EK738T)

Tìm hiểu thêm
Tìm hiểu thêm
Tìm hiểu thêm
Bộ sản phẩm chuẩn: Cáp (nâng cấp HDD)

Laptop ASUS VivoBook A412FA i5 (EK738T) là mẫu laptop văn phòng, sinh viên mỏng nhẹ, có cấu hình khỏe với CPU Intel thế hệ mới nhất. Ngoài ra máy còn sở hữu ổ cứng SSD 512 GB siêu nhanh và cảm biến vân tay giúp mở khóa tiện lợi, bảo mật cao', N'/assets/client/images/Laptop/AS00002.png', CAST(15890000 AS Decimal(18, 0)), 0, 41, CAST(N'2020-05-01T16:12:31.720' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (8, N'VivoBook X509FJ i7 8565U/8GB/512GB/2GB MX230/Win10 (EJ133T)', N'AS00003', N'Laptop Asus Vivobook X509FJ (EJ133T) là chiếc máy tính xách tay mang đến hiệu năng mạnh mẽ cùng hình ảnh chân thực đáp ứng mọi nhu cầu cho dù là học tập văn phòng hay giải trí', N'/assets/client/images/Laptop/AS00003.png', CAST(17890000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T16:14:16.730' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (9, N'ZenBook UX533FD i5 8265U/8GB/256GB/2GB GTX1050/Túi/Win10 (A9091T)', N'AS00004', N'Laptop ASUS Zenbook 15 UX533FD sở hữu thiết kế đậm chất thời trang và cuốn hút. Bên trong là cấu hình mạnh mẽ cùng thời lượng pin 17 giờ ấn tượng. ', N'/assets/client/images/Laptop/AS00004.png', CAST(22890000 AS Decimal(18, 0)), 0, 31, CAST(N'2020-05-01T16:15:20.807' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (10, N'Gaming ROG Strix G531GD i7 9750H/8GB/512GB/4GB GTX1050/Win10 (AL034T)
', N'AS00005', N'Laptop ASUS Gaming ROG G531GD i7 (AL034T) là một “cỗ máy chiến game” cực kì ấn tượng với vẻ ngoài cực ngầu, cấu hình khủng. ASUS Gaming ROG là một trong số những chiếc laptop gaming được các game thủ mong chờ nhất hiện nay.', N'/assets/client/images/Laptop/AS00005.png', CAST(24990000 AS Decimal(18, 0)), 0, 12, CAST(N'2020-05-01T16:17:11.040' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (11, N'Gaming ROG Strix G531G i7 9750H/8GB/512GB/4GB GTX1650/Win10 (AL017T)', N'AS00006', N'Laptop ASUS ROG Strix G G531GT-AL017T là một trong những hiện thân của phong cách tối giản, điểm nhấn được tạo nên chỉ bởi các dải đèn và đèn nền bàn phím RGB trầm tĩnh và cực chất. Chiếc laptop này tập trung tối đa vào trải nghiệm của game thủ, mang trong mình những công nghệ tiên tiến nhất ở đầu thế kỷ 21', N'/assets/client/images/Laptop/AS00006.png', CAST(26990000 AS Decimal(18, 0)), 0, 29, CAST(N'2020-05-01T16:18:15.563' AS DateTime), 1, 5, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (12, N'Vostro 3590 i7 10510U/8GB/256GB/2GB 610R5/Win10 (GRMGK2)', N'D00001', N'Laptop Dell Vostro 3590 i7 (GRMGK2) là phiên bản laptop đồ họa kĩ thuật có thiết kế hiện đại, cấu hình khỏe với vi xử lí gen 10 và card đồ họa rời. Đây chính là chiếc laptop đáng cân nhắc đối với dân đồ họa hay sinh viên khối ngành kĩ thuật', N'/assets/client/images/Laptop/D00001.png', CAST(18890000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T16:21:56.963' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (13, N'Inspiron N3580 i5 8265U/4GB/1TB/Win10 (P75F106N80I)', N'D00002', N'Laptop Dell Inspiron N3580 i5 (P75F106N80I) là mẫu máy tính xách tay văn phòng có cấu hình mạnh và ổn định, phục vụ tốt nhu cầu học tập, văn phòng cũng như giải trí thường ngày', N'/assets/client/images/Laptop/D00002.png', CAST(13890000 AS Decimal(18, 0)), 0, 36, CAST(N'2020-05-01T16:22:58.050' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (14, N'Vostro 3580 i7 8565U/8GB/256GB/2GB R520/Win10 (T3RMD2)', N'D00003', N'Laptop Dell Vostro 3580 i7 8565U (T3RMD2) có cấu hình cực cao bao gồm vi xử lý i7, 8GB RAM và card đồ họa rời Radeon 520. Với những “vũ khí” mạnh mẽ được trang bị thì laptop có thể chạy tốt các ứng dụng phục vụ cho công việc, học tập, xử lý đồ hoạ cũng như chơi game ở mức cấu hình tầm trung', N'/assets/client/images/Laptop/D00003.png', CAST(21290000 AS Decimal(18, 0)), 0, 34, CAST(N'2020-05-01T16:24:07.577' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (15, N'Inspiron 7373 i5 8250U/8GB/256GB/Office365/Win10 (C3TI501OW)
', N'D00004', N'Dell Inspiron 7373 i5 8250U là mẫu laptop có thiết kế mỏng nhẹ và sang trọng với chất liệu nhôm nguyên khối thuộc phân khúc laptop phù hợp với doanh nhân, máy được trang bị cấu hình khá mạnh cho các nhu cầu làm việc, giải trí', N'/assets/client/images/Laptop/D00004.png', CAST(26390000 AS Decimal(18, 0)), 0, 22, CAST(N'2020-05-01T16:25:16.140' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (16, N'XPS 13 9370 i7 8550U/8GB/256GB/Office365/Win10 (415PX3)

', N'D00005', N'Nếu bạn đang tìm kiếm một chiếc laptop mỏng nhẹ dễ dàng di chuyển nhưng vẫn sở hữu một cấu hình mạnh thì laptop Dell XPS 13 9370 chính là lựa chọn hợp lí. Dell XPS 13 được thiết kế siêu mỏng nhẹ, bắt mắt, được trang bị chip Core i7 mạnh mẽ cùng nhiều tính năng hiện đại', N'/assets/client/images/Laptop/D00005.png', CAST(43890000 AS Decimal(18, 0)), 0, 36, CAST(N'2020-05-01T16:26:31.023' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (17, N'VivoBook S530FA i3 8145U/4GB/1TB/Win10 (BQ185T)', N'D00006', N'ASUS VivoBook S15 S530FA là một trong những mẫu laptop có hiệu năng tốt trong phân khúc phổ thông. Bản lề Ergolift thông minh nâng phím tự động, giúp tản nhiệt và khuếch đại âm thanh cũng là một ưu điểm lớn.', N'/assets/client/images/Laptop/D00006.png', CAST(12190000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T16:28:08.503' AS DateTime), 1, 6, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (18, N'HP Pavilion 15 cs3014TU i5 1035G1/4GB/256GB/Win10 (8QP20PA)', N'H00001', N'Laptop HP Pavilion 15 cs3014TU i5 (8QP20PA) là chiếc máy tính xách tay học tập văn phòng có cấu hình khá, vận hành nhanh, thiết kế gọn nhẹ phù hợp với nhu cầu của người dùng trẻ cần di chuyển nhiều', N'/assets/client/images/Laptop/H00001.png', CAST(14390000 AS Decimal(18, 0)), 0, 15, CAST(N'2020-05-01T16:31:28.407' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (19, N'HP Envy 13 aq1022TU i5 10210U/8GB/512GB/Win10 (8QN69PA)', N'H00002', N'Laptop HP Envy 13 aq1022TU i5 (8QN69PA) là chiếc laptop doanh nhân cao cấp có thiết kế siêu mỏng nhẹ và cấu hình mạnh. Bảo mật vân tay hiện đại, ổ cứng SSD cực nhanh là những điểm cộng nổi bật của chiếc laptop này.', N'/assets/client/images/Laptop/H00002.png', CAST(21000000 AS Decimal(18, 0)), 0, 38, CAST(N'2020-05-01T16:32:49.190' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (20, N'HP 15s du1035TX i5 10210U/8GB/512GB/2GB MX130/Win10 (8RK36PA)', N'H00003', N'Laptop HP 15s du1035TX (8RK36PA) là mẫu laptop có mức giá trung bình dành cho sinh viên và nhân viên văn phòng với cấu hình mạnh và thiết kế sang trọng. Cấu hình laptop chạy tốt các ứng dụng từ văn phòng đến thiết kế đồ hoạ (cơ bản)', N'/assets/client/images/Laptop/H00003.png', CAST(16007000 AS Decimal(18, 0)), 0, 21, CAST(N'2020-05-01T16:33:48.393' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (21, N'HP Envy x360 ar0071AU R5 3500U/8GB/256GB/Touch/Win10 (6ZF30PA)', N'H00004', N'Laptop HP Envy x360 ar0071AU R5 với sức mạnh xử lý của AMD Ryzen 5, mẫu laptop cao cấp sẵn sàng xử lý mọi công việc đòi hỏi cấu hình cao, chỉnh sửa hình ảnh, video mượt mà', N'/assets/client/images/Laptop/H00004.png', CAST(21790000 AS Decimal(18, 0)), 0, 56, CAST(N'2020-05-01T16:34:35.843' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (22, N'HP Palivion 15 cx0178TX i7 8750H/8GB/1TB+128GB/2GB GTX1050/Win10 (5EF41PA)', N'H00005', N'Đặc điểm nổi bật của HP Palivion 15 cx0178TX i7 8750H/8GB/1TB+128GB/2GB GTX1050/Win10 (5EF41PA)

Tìm hiểu thêm
Tìm hiểu thêm
Tìm hiểu thêm
Bộ sản phẩm chuẩn: Sách hướng dẫn, Thùng máy, Adapter sạc, Dây nguồn

Laptop HP Pavilion Power 15-cx0178TX 5EF41PA là một cỗ máy chiến game thực thụ với cấu hình mạnh mẽ, thách thức các tựa game hot hiện nay. Máy có thiết kế hiện đại, kiểu dáng mạnh mẽ và đẳng cấp, sự kết hợp giữa hai tông màu xanh và đen lạ mắt và ấn tượng.
', N'/assets/client/images/Laptop/H00005.png', CAST(24580000 AS Decimal(18, 0)), 0, 26, CAST(N'2020-05-01T16:36:06.443' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (23, N'HP EliteBook X360 13 i7 8550U/16GB/512GB/Win10 (5AS42PA)
', N'H00006', N'Laptop HP Elitebook X360 1030 G3 5AS42PA là chiếc laptop được thiết kế hướng đến sự hiện đại, trẻ trung. Với thiết kế siêu mỏng nhẹ, bản lề gập xoay và màn hình cảm ứng cùng cấu hình mạnh mẽ, HP Elitebook X360 1030 G3 5AS42PA đem đến cho bạn chiếc laptop 2 trong 1 tiện lợi cho học tập, làm việc và giải trí.', N'/assets/client/images/Laptop/H00006.png', CAST(46390000 AS Decimal(18, 0)), 0, 37, CAST(N'2020-05-01T16:37:06.383' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (24, N'HP EliteBook X360 1030 G3 i7 8550U/8GB/256GB/Touch/Win10 (5AS44PA)', N'H00007', N'Sở hữu thiết kế siêu mỏng nhẹ và cấu hình cao cấp, laptop 2 in 1 HP EliteBook X360 1030 G3 5AS44PA sẵn sàng cùng bạn khởi đầu ngày làm việc bận rộn một cách tốt nhất', N'/assets/client/images/Laptop/H00007.png', CAST(40810000 AS Decimal(18, 0)), 0, -4, CAST(N'2020-05-01T16:38:23.720' AS DateTime), 1, 7, 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (25, N'iPhone 11 Pro 256GB', N'AP00001', N'iPhone 11 Pro 256GB có lẽ sẽ là chiếc iPhone được nhiều người dùng lựa chọn khi nó sở hữu mức giá tốt hơn chiếc iPhone 11 Pro Max nhưng vẫn sở hữu tất cả những ưu điểm trên người anh em của mình.
', N'/assets/client/images/Smartphone/AP00001.png', CAST(34190000 AS Decimal(18, 0)), 0, 54, CAST(N'2020-05-01T17:12:15.110' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (26, N'iPhone 11 Pro Max 256GB', N'AP00002', N'iPhone 11 Pro Max 256GB là chiếc iPhone cao cấp nhất trong bộ 3 iPhone Apple giới thiệu trong năm 2019 và quả thực chiếc smartphone này mang trong mình nhiều trang bị xứng đáng với tên gọi "Pro".
', N'/assets/client/images/Smartphone/AP00002.png', CAST(35990000 AS Decimal(18, 0)), 0, 27, CAST(N'2020-05-01T17:13:17.370' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (27, N'iPhone 11 Pro Max 512GB', N'AP00003', N'Để tìm kiếm một chiếc smartphone có hiệu năng mạnh mẽ và có thể sử dụng mượt mà trong 2-3 năm tới thì không có chiếc máy nào xứng đang hơn chiếc iPhone 11 Pro Max 512GB mới ra mắt trong năm 2019 của Apple.
', N'/assets/client/images/Smartphone/AP00003.png', CAST(40990000 AS Decimal(18, 0)), 0, 45, CAST(N'2020-05-01T17:14:15.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (28, N'iPhone Xs Max 64GB', N'AP00004', N'Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.
', N'/assets/client/images/Smartphone/AP00004.png', CAST(24990000 AS Decimal(18, 0)), 0, 29, CAST(N'2020-05-01T17:15:06.037' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (29, N'iPhone Xs 64GB', N'AP00005', N'Đến hẹn lại lên, năm nay Apple giới thiệu tới người dùng thế hệ tiếp theo với 3 phiên bản, trong đó có cái tên iPhone Xs 64 GB với những nâng cấp mạnh mẽ về phần cứng đến hiệu năng, màn hình cùng hàng loạt các trang bị cao cấp khác. 
', N'/assets/client/images/Smartphone/AP00005.png', CAST(19990000 AS Decimal(18, 0)), 0, 24, CAST(N'2020-05-01T17:16:13.380' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (30, N'iPhone 8 Plus 64GB', N'AP00006', N'Thừa hưởng những thiết kế đã đạt đến độ chuẩn mực, thế hệ iPhone 8 Plus thay đổi phong cách bóng bẩy hơn và bổ sung hàng loạt tính năng cao cấp cho trải nghiệm sử dụng vô cùng tuyệt vời.
', N'/assets/client/images/Smartphone/AP00006.png', CAST(14990000 AS Decimal(18, 0)), 0, 45, CAST(N'2020-05-01T17:17:19.010' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (31, N'iPhone 7 32GB', N'AP00007', N'iPhone 7 32GB vẫn mang trên mình thiết kế quen thuộc của từ thời iPhone 6 nhưng có nhiều thay đổi lớn về phần cứng, dàn loa stereo và cấu hình cực mạnh.
', N'/assets/client/images/Smartphone/AP00007.png', CAST(9999000 AS Decimal(18, 0)), 0, 52, CAST(N'2020-05-01T17:18:30.843' AS DateTime), 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (32, N'Samsung Galaxy Fold
', N'S00001', N'Sau rất nhiều chờ đợi thì Samsung Galaxy Fold - chiếc smartphone màn hình gập đầu tiên của Samsung cũng đã chính thức trình làng với thiết kế mới lạ.
', N'/assets/client/images/Smartphone/S00001.png', CAST(50000000 AS Decimal(18, 0)), 0, 56, CAST(N'2020-05-01T17:20:02.293' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (33, N'Samsung Galaxy Z Flip', N'S00002', N'Cuối cùng sau bao nhiêu thời gian chờ đợi, chiếc điện thoại Samsung Galaxy Z Flip đã được Samsung ra mắt tại sự kiện Unpacked 2020. Siêu phẩm với thiết kế màn hình gập vỏ sò độc đáo, hiệu năng tuyệt đỉnh cùng nhiều công nghệ thời thượng, dẫn dầu 2020.
', N'/assets/client/images/Smartphone/S00002.png', CAST(36000000 AS Decimal(18, 0)), 0, 34, CAST(N'2020-05-01T17:20:48.237' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (34, N'Samsung Galaxy Note 10', N'S00003', N'Nếu như từ trước tới nay dòng Galaxy Note của Samsung thường ít được các bạn nữ sử dụng bởi kích thước màn hình khá lớn khiến việc cầm nắm trở nên khó khăn thì Samsung Galaxy Note 10 sẽ là chiếc smartphone nhỏ gọn, phù hợp với cả những bạn có bàn tay nhỏ.
', N'/assets/client/images/Smartphone/S00003.png', CAST(21490000 AS Decimal(18, 0)), 0, 47, CAST(N'2020-05-01T17:22:04.563' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (35, N'Samsung Galaxy Note 10 Lite', N'S00004', N'Sau bao đồn đoán và trông ngóng thì cuối cùng "người em út" trong series Note 10 cũng đã chính thức trình làng với tên gọi Samsung Galaxy Note 10 Lite với những thay đổi nhất định về ngoại hình.
', N'/assets/client/images/Smartphone/S00004.png', CAST(12490000 AS Decimal(18, 0)), 0, 42, CAST(N'2020-05-01T17:22:47.043' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (37, N'Samsung Galaxy S20 Ultra', N'S00005', N'Samsung Galaxy S20 Ultra siêu phẩm công nghệ hàng đầu của Samsung mới ra mắt với nhiều đột phá công nghệ, màn hình tràn viền không khuyết điểm, hiệu năng đỉnh cao, camera độ phân giải siêu khủng 108 MP cùng khả năng zoom 100X thách thức mọi giới hạn smartphone.
', N'/assets/client/images/Smartphone/S00005.png', CAST(29990000 AS Decimal(18, 0)), 0, 39, CAST(N'2020-05-01T17:23:49.707' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (38, N'Samsung Galaxy S20+', N'S00006', N'Chiếc điện thoại Samsung Galaxy S20 Plus - Siêu phẩm với thiết màn hình tràn viền, hiệu năng đỉnh cao kết hợp cùng nhiều đột phá về công nghệ dẫn đầu thế giới smartphone.
', N'/assets/client/images/Smartphone/S00006.png', CAST(23990000 AS Decimal(18, 0)), 0, 42, CAST(N'2020-05-01T17:24:29.737' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (39, N'Samsung Galaxy A71', N'S00007', N'Sau A51, Samsung tiếp tục ra mắt Galaxy A71 là đại diện kế tiếp thuộc thế hệ smartphone Galaxy A 2020. Máy được cải tiến với camera macro siêu cận đột phá, camera chính lên đến 64 MP cùng thiết kế thời thượng và cao cấp.
', N'/assets/client/images/Smartphone/S00007.png', CAST(9790000 AS Decimal(18, 0)), 0, 33, CAST(N'2020-05-01T17:25:52.240' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (40, N'Samsung Galaxy S10 Lite', N'S00008', N'Samsung Galaxy S10 Lite là một phiên bản khác của dòng Galaxy S10 đã ra mắt trước đó nhưng mang trong mình khá nhiều khác biệt về ngoại hình cũng như bên trong.
', N'/assets/client/images/Smartphone/S00008.png', CAST(13990000 AS Decimal(18, 0)), 0, 28, CAST(N'2020-05-01T17:26:40.840' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (41, N'Samsung Galaxy A70', N'S00009', N'Samsung Galaxy A70 là một phiên bản phóng to của chiếc Samsung Galaxy A50 đã ra mắt trước đó với nhiều cải tiến tới từ bên trong.
', N'/assets/client/images/Smartphone/S00009.png', CAST(9290000 AS Decimal(18, 0)), 0, 48, CAST(N'2020-05-01T17:27:25.860' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (42, N'Samsung Galaxy A51 (6GB/128GB)', N'S00010', N'Samsung đã ra mắt điện thoại Samsung Galaxy A51 mở đầu cho thế hệ Galaxy A 2020 hướng tới giới trẻ hiện đại, thời thượng. Máy sở hữu cụm 4 camera, bao gồm camera macro chụp cận cảnh lần đầu xuất hiện trên smartphone Galaxy, màn hình tràn viền vô cực cùng mặt lưng họa tiết kim cương nổi bật.
', N'/assets/client/images/Smartphone/S00010.png', CAST(7590000 AS Decimal(18, 0)), 0, 43, CAST(N'2020-05-01T17:28:14.610' AS DateTime), 1, 2, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (43, N'OPPO Find X2', N'O00001', N'Tiếp nối thành công vang dội của thế hệ Find X, OPPO chính thức ra mắt Find X2 với những đường nét thanh lịch từ thiết kế phần cứng cho đến trải nghiệm phần mềm, hứa hẹn một vẻ đẹp hoàn hảo, một sức mạnh xứng tầm.
', N'/assets/client/images/Smartphone/O00001.png', CAST(23990000 AS Decimal(18, 0)), 0, 64, CAST(N'2020-05-01T17:29:42.783' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (44, N'OPPO Reno3 Pro', N'O00002', N'OPPO Reno3 Pro tiếp nối truyền thống dòng Reno, vẫn sở hữu cụm camera sau chất lượng cao và bổ sung tính năng quay video Siêu chống rung 2.0 ấn tượng. OPPO cũng trang bị cho máy cụm camera selfie kép tích hợp AI, thiết kế cao cấp cùng màn hình siêu mượt 90Hz theo kịp xu hướng.
', N'/assets/client/images/Smartphone/O00002.png', CAST(13800000 AS Decimal(18, 0)), 0, 34, CAST(N'2020-05-01T17:30:37.673' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (45, N'OPPO A9 (2020)', N'O00003', N'Kế thừa phiên bản OPPO A7 đã từng gây hot trước đó, OPPO A9 (2020) có nhiều sự cải tiến hơn về màn hình, camera và hiệu năng trải nghiệm.
', N'/assets/client/images/Smartphone/O00003.png', CAST(5990000 AS Decimal(18, 0)), 0, 46, CAST(N'2020-05-01T17:31:35.487' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (46, N'OPPO Reno2 F', N'O00004', N'OPPO Reno2 F là một trong 3 chiếc smartphone thuộc dòng OPPO Reno2 vừa được OPPO giới thiệu với thiết kế thời trang cùng nhiều nâng cấp mạnh mẽ về camera.
', N'/assets/client/images/Smartphone/O00004.png', CAST(7490000 AS Decimal(18, 0)), 0, 41, CAST(N'2020-05-01T17:32:29.197' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (49, N'OPPO A91', N'O00005', N'OPPO A91 là một mẫu smartphone tầm trung mới ra mắt vào cuối năm 2019 của OPPO với nhiều tính năng thú vị, cấu hình ổn cùng giá bán phải chăng.
', N'/assets/client/images/Smartphone/O00005.png', CAST(6490000 AS Decimal(18, 0)), 0, 32, CAST(N'2020-05-01T17:32:29.197' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (50, N'OPPO A5s', N'O00006', N'OPPO A5s là một chiếc máy giá rẻ và vẫn giữ được cho mình những ưu điểm mà người dùng yêu thích của một chiếc smartphone tới từ OPPO.
', N'/assets/client/images/Smartphone/O00006.png', CAST(3290000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T17:34:47.017' AS DateTime), 1, 3, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (51, N'Xiaomi Mi Note 10 Pro', N'Mi00001', N'Siêu phẩm tầm trung Xiaomi Mi Note 10 Pro, chiếc smartphone đầu tiên sở hữu ống kính độ phân giải 108 MP cùng hệ thống 5 camera độc đáo, công nghệ sạc siêu nhanh 30W đi kèm nhiều tính năng nổi trội khác.
', N'/assets/client/images/Smartphone/Mi00001.png', CAST(13990000 AS Decimal(18, 0)), 0, 32, CAST(N'2020-05-01T17:36:16.190' AS DateTime), 1, 4, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (52, N'Xiaomi Redmi Note 9S', N'Mi00002', N'Redmi Note 9s là sản phẩm tầm trung nhà Xiaomi, gây ấn tượng với thiết kế tràn viền độc đáo, cấu hình mạnh mẽ và hệ thống bốn camera sau chất lượng.
', N'/assets/client/images/Smartphone/Mi00002.png', CAST(5590000 AS Decimal(18, 0)), 0, 46, CAST(N'2020-05-01T17:36:52.413' AS DateTime), 1, 4, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (53, N'Xiaomi Redmi Note 8 Pro (6GB/64GB)', N'Mi00003', N'Xiaomi Redmi Note 8 Pro là chiếc smartphone hứa hẹn sẽ gây bão trong thời gian tới, khi có vẻ ngoài ấn tượng và được cải tiến mạnh mẽ về cấu hình bên trong.

', N'/assets/client/images/Smartphone/Mi00003.png', CAST(5490000 AS Decimal(18, 0)), 0, 55, CAST(N'2020-05-01T17:37:46.727' AS DateTime), 1, 4, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (54, N'Xiaomi Redmi Note 8 (4GB/128GB)', N'Mi00004', N'Vào đầu tháng 10/2019 Xiaomi đã ra mắt một smartphone tầm trung mới nhất của họ mang tên Xiaomi Redmi Note 8 4GB/128GB. Chiếc điện thoại gây ấn tượng với thiết kế màn hình giọt nước thời trang, bộ 4 camera chất lượng cao, vi xử lý hiệu năng tốt đi kèm giá bán vô cùng hấp dẫn.
', N'/assets/client/images/Smartphone/Mi00004.png', CAST(4790000 AS Decimal(18, 0)), 0, 34, CAST(N'2020-05-01T17:38:28.840' AS DateTime), 1, 4, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (55, N'Xiaomi Redmi Note 7 (4GB/64GB)', N'Mi00005', N'Xiaomi Redmi Note 7 4GB/64GB là chiếc smartphone giá rẻ mới được giới thiệu vào đầu năm 2019 với nhiều trang bị đáng giá như thiết kế notch giọt nước hay camera lên tới 48 MP.
', N'/assets/client/images/Smartphone/Mi00005.png', CAST(4990000 AS Decimal(18, 0)), 0, 7, CAST(N'2020-05-01T17:39:45.697' AS DateTime), 1, 4, 2)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (56, N'Apple Watch S3 GPS, 38mm viền nhôm, dây cao su', N'AW00001', NULL, N'/assets/client/images/Watch/AW00001.png', CAST(5690000 AS Decimal(18, 0)), 0, 41, CAST(N'2020-05-01T17:46:31.973' AS DateTime), 1, 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (57, N'Apple Watch S3 GPS 42mm viền nhôm xám dây cao su', N'AW00002', N'Về mặt tổng thể Apple Watch S3 42 mm có kích thước tương tự như Apple Watch Series 2. Sản phẩm chú trọng thêm về mặt thẩm mỹ với thiết kế sang trọng, năng động, dây đeo có nhiều màu sắc khác nhau.

', N'/assets/client/images/Watch/AW00002.png', CAST(6690000 AS Decimal(18, 0)), 0, 43, CAST(N'2020-05-01T17:47:12.587' AS DateTime), 1, 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (58, N'Apple Watch S5 LTE 44mm viền nhôm dây cao su
', N'AW00003', N'Apple Watch S5 LTE là phiên bản nâng cấp với phiên bản Apple Watch S5 . Lần đầu tiên Apple Watch sẽ được trang bị màn hình OLED luôn bật, tính năng la bàn và khả năng cảnh báo khẩn cấp trên nhiều quốc gia hơn và đặc biệt chiếc Apple Watch phiên bản LTE có tích hợp tính năng nghe gọi độc lập như một chiếc điện thoại...
', N'/assets/client/images/Watch/AW00003.png', CAST(14990000 AS Decimal(18, 0)), 0, 134, CAST(N'2020-05-01T17:48:15.047' AS DateTime), 1, 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (59, N'Apple Watch S5 44mm viền nhôm dây cao su
', N'AW00004', N'Apple Watch S5 44 mm là phiên bản nâng cấp nhẹ so với phiên bản Apple Watch S4 tiền nhiệm. Lần đầu tiên Apple Watch sẽ được trang bị màn hình OLED luôn bật, tính năng la bàn và khả năng cảnh báo khẩn cấp trên nhiều quốc gia hơn. 
', N'/assets/client/images/Watch/AW00004.png', CAST(12490000 AS Decimal(18, 0)), 0, 43, CAST(N'2020-05-01T17:48:48.733' AS DateTime), 1, 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (60, N'Apple Watch S5 LTE 40mm viền thép dây thép
', N'AW00005', N'Apple Watch S5 LTE 44mm viền thép dây thép mang ngoại hình tương tự như thế hệ Apple Watch Series 4 và thậm chí linh kiện, kết cấu cũng tương tự. Dây đeo thiết kế dạng lưới đan mỏng, gia công hoàn toàn từ thép không gỉ, vừa quý phái lại vừa mang cảm giác thoải mái cho người đeo.

', N'/assets/client/images/Watch/AW00005.png', CAST(20990000 AS Decimal(18, 0)), 0, 40, CAST(N'2020-05-01T17:50:36.730' AS DateTime), 1, 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (61, N'Samsung Galaxy Fit e R375', N'SW00001', N'Samsung Galaxy Fit e là một trong những vòng tay thông minh nhỏ gọn có tính năng cơ bản cùng mức giá mềm. Thiết bị này phù hợp những ai muốn có một vòng đeo chất lượng, giá thành thấp và đến từ một nhà sản xuất lớn và uy tín.
', N'/assets/client/images/Watch/SW00001.png', CAST(990000 AS Decimal(18, 0)), 0, 13, CAST(N'2020-05-01T17:52:05.617' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (62, N'Samsung Galaxy Watch 42mm', N'SW00002', N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 nổi bật với màn hình rộng 1.2 Inch với độ phân giải 360 x 360 Pixels và mặt kính cường lực giúp người đeo an tâm khi mang ra ngoài. Giao diện mặt đồng hồ có thể thay đổi tuỳ ý theo phòng cách người dùng. Dây đeo Silicon hạn chế bị trầy xước và dễ lau khô khi tiếp xúc với nước hay mồ hôi.

', N'/assets/client/images/Watch/SW00002.png', CAST(6990000 AS Decimal(18, 0)), 0, 23, CAST(N'2020-05-01T17:53:04.903' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (66, N'Samsung Galaxy Watch Active 2 40mm viền nhôm 
', N'SW00003', N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 nổi bật với màn hình rộng 1.2 Inch với độ phân giải 360 x 360 Pixels và mặt kính cường lực giúp người đeo an tâm khi mang ra ngoài. Giao diện mặt đồng hồ có thể thay đổi tuỳ ý theo phòng cách người dùng. Dây đeo Silicon hạn chế bị trầy xước và dễ lau khô khi tiếp xúc với nước hay mồ hôi.

', N'/assets/client/images/Watch/SW00003.png', CAST(6690000 AS Decimal(18, 0)), 0, 124, CAST(N'2020-05-01T17:53:45.573' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (67, N'Samsung Galaxy Watch Active 2 40mm viền nhôm ', N'SW00004', N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 40 mm là phiên bản nhỏ gọn của dòng sản phẩm. Với các tính năng chăm sóc sức khỏe, màn hình cải tiến với viền cảm ứng mang lại trải nghiệm hoàn hảo cho người dùng.
', N'/assets/client/images/Watch/SW00004.png', CAST(6690000 AS Decimal(18, 0)), 0, 44, CAST(N'2020-05-01T17:56:18.313' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (68, N'Samsung Galaxy Watch Active R500', N'SW00005', N'Với thiết kế tối giản nhưng không kém phần thanh lịch, đồng hồ thông minh mới nhất của Samsung - Galaxy Watch Active, sẽ mang đến cho bạn trải nghiệm công nghệ và tính năng theo dõi sức khỏe tuyệt vời.
', N'/assets/client/images/Watch/SW00005.png', CAST(5490000 AS Decimal(18, 0)), 0, 31, CAST(N'2020-05-01T17:56:54.993' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (69, N'Samsung Galaxy Watch Active 2 44mm viền thép ', N'SW00006', N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 44mm là phiên bản có sự cải tiến về công nghệ để mang đến những trải nghiệm tốt nhất cho người dùng với nhiều tính năng chăm sóc sức khỏe, nhận cuộc gọi trực tiếp cũng như nhiều tính năng tiện ích khác.
', N'/assets/client/images/Watch/SW00006.png', CAST(8990000 AS Decimal(18, 0)), 0, -10, CAST(N'2020-05-01T17:57:42.440' AS DateTime), 1, 2, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (70, N'Mi Band 4', N'MiB00001', N'Sáng tạo, năng động, khỏe mạnh với Mi Band 4. Hãy lăn chuột để cùng khám phá những cải tiến đột phá của chiếc vòng tay thông minh Xiaomi rẻ mà chất này.
', N'/assets/client/images/Watch/MiB00001.png', CAST(690000 AS Decimal(18, 0)), 0, 6, CAST(N'2020-05-01T17:58:51.197' AS DateTime), 1, 4, 3)
INSERT [dbo].[Product] ([ID], [Name], [Code], [Descriptions], [Image], [Price], [IncludeVAT], [Quantity], [CreateDate], [Status], [SupplierID], [CategoryID]) VALUES (71, N'test', N'2554', N'sfk;', N'/assets/client/files/AP00006.png', CAST(121212 AS Decimal(18, 0)), 1, 12, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (1, N'A001', N'Apple', N'Phòng 901, Ngôi nhà Đức tại Thành phố Hồ Chí Minh. Số 33, Đường Lê Duẩn, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam', N'support.vn@apple.com', N'02465776')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (2, N'S001', N'Samsung', N' Số 2, đường Hải Triều, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh', N'support.vn@samsung.vn', N'02839157310')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (3, N'O001', N'Oppo', NULL, N'press@oppo.com', N'1800577776')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (4, N'Mi001', N'Xiaomi', N'Tầng 3, TTTM Crescent Mall, 101 Tôn Dật Tiên, Phường Tân Phú, Quận 7, TP. Hồ Chí Minh
', N'support.vn@xiaomi.com', N'1900 633 386')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (5, N'AS001', N'Asus', N'264A – 264B – 264C Nguyễn Thị Minh Khai, Phường 6, Quận 3, TP.HCM', N'support.vn@asus.com', N'1900 1835')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (6, N'D001', N'Dell', N'Tầng 3, 303 Đường Vũ Tông Phan, Thanh Xuân, Hà Nội ', N'support.vn@dell.com', N'1900 6234')
INSERT [dbo].[Supplier] ([ID], [Code], [Name], [Address], [Email], [Phone]) VALUES (7, N'HP001', N'HP', N'HP Inc.
Suite 1002, 29 Le Duan, Saigon Tower, 10th floor, District 1
P.C.
Ho Chi Minh City
Viet Nam', N'support.vn@hp.com', N'02579484897')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 
--Thêm dữ liệu thông tin tài khoản
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (2, N'admin', N'202cb962ac59075b964b07152d234b70', N'admin@gmail', NULL, NULL, NULL, 1, N'admin')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (3, N'khanh', N'202cb962ac59075b964b07152d234b70', N'khanh@gmail.com', NULL, NULL, NULL, 1, N'customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (8, N'haha', N'202cb962ac59075b964b07152d234b70', N'dfsfds', NULL, NULL, CAST(N'2020-04-30T12:12:22.657' AS DateTime), 1, N'customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (9, N'hoho', N'81dc9bdb52d04dc20036dbd8313ed055', N'dfsf', N'5646', N'dfsdf', CAST(N'2020-04-30T12:13:27.207' AS DateTime), 1, N'customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (12, N'khanhnguyen', N'202cb962ac59075b964b07152d234b70', N'dfsd', N'06546', N'kldsjf', CAST(N'2020-05-09T01:16:32.787' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (13, N'khanhnguyen1', N'202cb962ac59075b964b07152d234b70', N'dfsddfdf', N'06546', N'jkhdsjf', CAST(N'2020-05-09T01:19:14.250' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (14, N'khanhnguyen12', N'202cb962ac59075b964b07152d234b70', N'qweqweq', N'06546', N'jkhdsjf', CAST(N'2020-05-09T01:23:36.857' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (15, N'khanhnguyen122', N'202cb962ac59075b964b07152d234b70', N'áa', N'06546', N'jkhdsjf', CAST(N'2020-05-09T01:30:44.407' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (16, N'khanhnguyen1222', N'202cb962ac59075b964b07152d234b70', N'aaaaaaaaaaaaaa', N'06546', N'kldsjf', CAST(N'2020-05-09T01:33:50.600' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (17, N'khanhnguyen12222222', N'202cb962ac59075b964b07152d234b70', N'aaaaaaaaaaaaaaaaaa', N'06546', N'kldsjf', CAST(N'2020-05-09T01:36:31.420' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (18, N'khanhnguyen1222222223', N'202cb962ac59075b964b07152d234b70', N'aaaaaaaaaaaaaaaaaaaaa', N'06546', N'kldsjf', CAST(N'2020-05-09T01:37:51.560' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (19, N'khanhnguyen1222222223aa', N'202cb962ac59075b964b07152d234b70', N'aaaaaaaaaaaaaaaaaaaaab', N'06546', N'kldsjf', CAST(N'2020-05-09T01:38:50.097' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (20, N'khanhnguyen1222222223aaa', N'202cb962ac59075b964b07152d234b70', N'aaaaaaaaaaaaaaaaaaaaabbb', N'06546', N'kldsjf', CAST(N'2020-05-09T01:39:59.857' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (21, N'khanhnguyen1222222223aaaaa', N'202cb962ac59075b964b07152d234b70', N'kldjffff', N'06546', N'kldsjf', CAST(N'2020-05-09T01:40:37.783' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (22, N'khanhnguyen1222222223aaaaaâb', N'202cb962ac59075b964b07152d234b70', N'kldjffffgds', N'06546', N'kldsjf', CAST(N'2020-05-09T01:45:53.727' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (23, N'khanhnguyen1222222223aaaaaâbâ', N'202cb962ac59075b964b07152d234b70', N'vf', N'06546', N'kldsjf', CAST(N'2020-05-09T01:49:07.677' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (24, N'khanhnguyen1222222223aaaaaâbâa', N'202cb962ac59075b964b07152d234b70', N'vff', N'06546', N'kldsjf', CAST(N'2020-05-09T01:49:45.963' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (25, N'khanhnguyena', N'202cb962ac59075b964b07152d234b70', N'dsffdsf', N'dsfdsf', N'â', CAST(N'2020-05-09T01:54:14.343' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (26, N'khanhnguyenabc', N'202cb962ac59075b964b07152d234b70', N'đá', N'aaaaa', N'ád', CAST(N'2020-05-09T01:55:32.727' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (27, N'khanhnguyenaaaaaaaaaaa', N'202cb962ac59075b964b07152d234b70', N'ádsadaaa', N'aaaaa', N'ád', CAST(N'2020-05-09T01:56:25.860' AS DateTime), 1, N'Customer')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Email], [Phone], [Address], [CreateDate], [Status], [Role]) VALUES (28, N'cus1', N'202cb962ac59075b964b07152d234b70', N'cus1@gmail.com', N'095465', N'PVC', CAST(N'2020-05-09T08:22:30.020' AS DateTime), 1, N'Customer')
SET IDENTITY_INSERT [dbo].[User] OFF
--set giá trị khởi tạo cho các trường
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Role]  DEFAULT (N'customer') FOR [Role]
GO
--Thêm khóa ngoại
ALTER TABLE [dbo].[FavoriteProduct]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[FavoriteProduct] CHECK CONSTRAINT [FK_FavoriteProduct_Product]
GO
ALTER TABLE [dbo].[FavoriteProduct]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProduct_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[FavoriteProduct] CHECK CONSTRAINT [FK_FavoriteProduct_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
--Store lấy dữ liệu hiển thị biểu đồ
/****** Object:  StoredProcedure [dbo].[ChartByDay]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChartByDay]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT concat(DAY(o.CreateDate),'/',MONTH(o.CreateDate),'/',YEAR(o.CreateDate)) as Date, SUM(o.ToTal) as ToTal
	FROM Orders o WITH(NOLOCK)
	GROUP BY concat(DAY(o.CreateDate),'/',MONTH(o.CreateDate),'/',YEAR(o.CreateDate))
	ORDER BY concat(DAY(o.CreateDate),'/',MONTH(o.CreateDate),'/',YEAR(o.CreateDate))
END
GO
/****** Object:  StoredProcedure [dbo].[ChartByMonth]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChartByMonth]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT concat(MONTH(o.CreateDate),'/',YEAR(o.CreateDate)) as Date, SUM(o.ToTal) as ToTal
	FROM Orders o WITH(NOLOCK)
	GROUP BY concat(MONTH(o.CreateDate),'/',YEAR(o.CreateDate))
	ORDER BY concat(MONTH(o.CreateDate),'/',YEAR(o.CreateDate))
END
GO
--Store lấy dữ liệu cho report
/****** Object:  StoredProcedure [dbo].[RPT_RevenueByDay]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_RevenueByDay]
	-- Add the parameters for the stored procedure here
	@DATE DATETIME
	
AS
BEGIN
	SELECT 
	o.ID as OrderID,		
	od.ProductID as ProductID,
	p.Name as ProductName,
	p.Code as ProductCode,
	od.Quantity as Quantity,
	SUM(od.Price) as Total,	
	u.UserName as UserName,
	o.ShipName as CustomerName,
	o.ShipAddress as CustomerAddress,
	o.ShipEmail as CustomerEmail,
	o.CreateDate
	
		FROM Orders o
		LEFT JOIN OrderDetails od ON o.ID=od.OrderID
		LEFT JOIN Product p ON od.ProductID=p.ID
		LEFT JOIN [User] u ON o.UserID=u.ID
		WHERE DAY(o.CreateDate)=DAY(@DATE)
		GROUP BY o.ID,od.ProductID,	od.Quantity,p.Name,p.Code,u.UserName,o.ShipName,o.ShipAddress,o.ShipEmail,o.CreateDate
END
GO
/****** Object:  StoredProcedure [dbo].[RPT_RevenueByMonth]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_RevenueByMonth]
	-- Add the parameters for the stored procedure here
	@DATE NVARCHAR(100)
	
AS
BEGIN
SET NOCOUNT ON;
	SELECT 
	o.ID as OrderID,		
	od.ProductID as ProductID,
	p.Name as ProductName,
	p.Code as ProductCode,
	od.Quantity as Quantity,
	SUM(od.Price) as Total,	
	u.UserName as UserName,
	o.ShipName as CustomerName,
	o.ShipAddress as CustomerAddress,
	o.ShipEmail as CustomerEmail,
	o.CreateDate
	
		FROM Orders o
		LEFT JOIN OrderDetails od ON o.ID=od.OrderID
		LEFT JOIN Product p ON od.ProductID=p.ID
		LEFT JOIN [User] u ON o.UserID=u.ID
		WHERE MONTH(o.CreateDate)=MONTH(@DATE)
		GROUP BY o.ID,od.ProductID,	od.Quantity,p.Name,p.Code,u.UserName,o.ShipName,o.ShipAddress,o.ShipEmail,o.CreateDate
		
		
END
GO
/****** Object:  StoredProcedure [dbo].[RPT_RevenueByYear]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_RevenueByYear]
	-- Add the parameters for the stored procedure here
	@DATE DATETIME
	
AS
BEGIN
	SELECT 
	o.ID as OrderID,		
	od.ProductID as ProductID,
	p.Name as ProductName,
	p.Code as ProductCode,
	od.Quantity as Quantity,
	SUM(od.Price) as Total,	
	u.UserName as UserName,
	o.ShipName as CustomerName,
	o.ShipAddress as CustomerAddress,
	o.ShipEmail as CustomerEmail,
	o.CreateDate
	
		FROM Orders o
		LEFT JOIN OrderDetails od ON o.ID=od.OrderID
		LEFT JOIN Product p ON od.ProductID=p.ID
		LEFT JOIN [User] u ON o.UserID=u.ID
		WHERE YEAR(o.CreateDate)=YEAR(@DATE)
		GROUP BY o.ID,od.ProductID,	od.Quantity,p.Name,p.Code,u.UserName,o.ShipName,o.ShipAddress,o.ShipEmail,o.CreateDate
END
GO
--Store lấy dữ liệu những sản phẩm bán chạy
/****** Object:  StoredProcedure [dbo].[RPT_TopSellingProduct]    Script Date: 04-Jul-20 11:09:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_TopSellingProduct]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 10 ProductID,p.Name as ProductName,p.Code as ProductCode,SUM(o.Quantity) as ToTalProduct,SUM(o.Price) as ToTalPrice
from OrderDetails o
join Product p 
on o.ProductID=p.ID
group by ProductID,p.Name,p.Code
order by SUM(o.Quantity) desc
END
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
