USE [master]
GO

DROP DATABASE IF EXISTS [BOOKSHOPex12]

CREATE DATABASE [BOOKSHOPex12]
GO
USE [BOOKSHOPex12]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Role] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Status] bit NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] bit NOT NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[DepartmentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Gender] bit NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[TitleOfCourtesy] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Status] bit NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50)  NULL,
	[Description] [nvarchar](100)  NULL,
	[StartDate] [datetime]  NULL,
	[EndDate] [datetime]  NULL,
	[MinOrderValue] [money]  NULL,
	[Percentage] [real] NOT  NULL,
	[Type] [int]  NULL, --1 giam gia , 2 mien phi van chuyen
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[WarehouseID] [int] NULL,
	[SalePrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[DiscountID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--ALTER TABLE [Order Details]
--ALTER COLUMN [WarehouseID] int NULL;


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipCity] [nvarchar](50) NULL,
	[ShipRegion] [nvarchar](50) NULL,
	[ShipPostalCode] [nvarchar](50) NULL,
	[ShipCountry] [nvarchar](50) NULL,
	[Status] int NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Image]  [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[GenreID] [int] NULL,
	--[UnitsInStock] [int] NULL,
	[CoverPrice] [money] NOT NULL,
	[SalePrice] [money] NOT NULL,
	[AuthorID] [int] NULL,
	[Translator] [nvarchar](50) NULL,
	[PublisherID] [int] NULL,
	[SupplierID] [int] NULL,
	[Language] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[NumberOfPage] [int] NULL,
	[Format] [nvarchar](50) NULL,
	[Image]  [nvarchar](100) NULL,
	--[UnitsOnOrder] [int] NULL,
	--[ReorderLevel] [smallint] NULL,
	[PublishDate] [datetime] NULL,
	[PublishingLicense] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL ,
	[Discontinued] [bit] NOT NULL,
	
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int]  NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[CustomerID] int NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[Image]  [nvarchar](100) NULL,
	[ReviewDate] [date] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[OrderID] ASC,
	[ProductID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventories](
	[WarehouseID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitsInStock] [int]  NOT NULL,
 CONSTRAINT [PK_Inventories] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50)  NOT NULL,
 CONSTRAINT [PK_Warehouses] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (1, N'vuvu15202@gmail.com', N'123', 1, NULL, 3, 'https://lh3.googleusercontent.com/a/AGNmyxbr6EnQBmmVzJd2yO1lfa_pcX46jZo0TzKy5W9Luw=s96-c', 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (2, N'vuvthe163299@fpt.edu.vn', N'123', NULL, 1, 1, NULL, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (3, N'emp1@fpt.edu.vn', N'123', NULL, 2, 2, NULL, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (4, N'trangvthe150505@fpt.edu.vn', N'123', NULL, 3, 1, NULL, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (5, N'thanhdche161092@fpt.edu.vn', N'123', NULL, 4, 1, NULL, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (6, N'huynqhe163720@fpt.edu.vn', N'123', NULL, 5, 1, NULL, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Image], [Status]) VALUES (7, N'quyenkthhs160723@fpt.edu.vn', N'123', NULL, 6, 1, NULL, 1)

SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO



INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (1, N'Truong Vu', N'Vu',1, N'Sales Manager', N'Kirchgasse 6', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (2, N'Nghiên', N'Kim Ngọc',0, N'Marketing Assistant', N'Rua Orós, 92', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (3, N'Quang Huy', N'Nguyễn',1, N'Accounting Manager', N'C/ Moralzarzal, 86', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (4, N'Folies gourmandes', N'Martine Rancé',0, N'Assistant Sales Agent', N'184, chaussée de Tournai', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (5, N'Thanh', N'Dao Cong',1, N'Owner', N'Åkergatan 24', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (6, N'Frankenversand', N'Peter Franken',0, N'Marketing Manager', N'Berliner Platz 43', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (7, N'Dinh', N'Toan Thang',1, N'Marketing Manager', N'54, rue Royale', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (8, N'Franchi S.p.A.', N'Paolo Accorti',0, N'Sales Representative', N'Via Monte Bianco 34', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (9, N'Sơn', N'Đặng Hải',1, N'Sales Manager', N'Jardim das rosas n. 32', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (10, N'Galería del gastrónomo', N'Eduardo Saavedra',0, N'Marketing Manager', N'Rambla de Cataluña, 23', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (11, N'Nghĩa', N'Lý Minh',1, N'Sales Manager', N'C/ Romero, 33', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (12, N'Gourmet Lanchonetes', N'André Fonseca',0, N'Sales Associate', N'Av. Brasil, 442', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (13, N'Cảnh Thương', N'Nguyễn',1, N'Marketing Manager', N'2732 Baker Blvd.', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (14, N'GROSELLA-Restaurante', N'Manuel Pereira',0, N'Owner', N'5ª Ave. Los Palos Grandes', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (15, N'Anh', N'Đỗ Quang',1, N'Accounting Manager', N'Rua do Paço, 67', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (16, N'', N'Carlos Hernández',0, N'Sales Representative', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'2020-01-27')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Gender], [ContactTitle], [Address], [CreateDate]) VALUES (17, N'Tuấn', N'Nguyễn Tuấn Anh',1, N'President', N'Lang Son', N'2020-01-27')
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (1, N'Administrator', N'Bussiness')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (2, N'Saler', N'Bussiness')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (3, N'Addministration Deparment', N'Back Office')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (4, N'R&D Department', N'Back Office')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (5, N'Operating Department', N'Back Office')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (1, N'Truong Vu', N'Vu',1, 1, N'Admin', N'Ms.', CAST(N'1998-12-08T00:00:00.000' AS DateTime), CAST(N'2018-05-01T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (2, N'Thu Trang', N'Vu',1, 2, N'Vice President, Sales', N'Dr.', CAST(N'1999-02-19T00:00:00.000' AS DateTime), CAST(N'2019-08-14T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (3, N'Thu Trang', N'Vu',0, 2, N'Sales Representative', N'Ms.', CAST(N'2000-08-30T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (4, N'Cong Thanh', N'Dao',1, 2, N'Sales Representative', N'Mrs.', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2015-05-03T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (5, N'Quang Huy', N'Nguyen',0, 2, N'Sales Manager', N'Mr.', CAST(N'1995-03-04T00:00:00.000' AS DateTime), CAST(N'2015-10-17T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (6, N'Hong Quyen', N'Kim Thi',1, 2, N'Sales Representative', N'Mr.', CAST(N'1990-07-02T00:00:00.000' AS DateTime), CAST(N'2010-10-17T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (7, N'Hai Son', N'Dang',1, 2, N'Sales Representative', N'Mr.', CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (8, N'Ha Phuong', N'Nguyen',0, 2, N'Inside Sales Coordinator', N'Ms.', CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'2017-03-05T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Gender], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [PhoneNumber], [Status]) VALUES (9, N'Quang Anh', N'Do',1, 2, N'Sales Representative', N'Ms.', CAST(N'1995-01-27T00:00:00.000' AS DateTime), CAST(N'2015-11-15T00:00:00.000' AS DateTime), N'FPTU, Hoa Lac, Thach That, Ha Noi', N'032 7044 182', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO

insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('____________','Giam gia 0%','',GETDATE() ,GETDATE() , 0 ,0, 0,10000)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN10','Giam gia 10%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.1, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN20','Giam gia 20%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.2, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN30','Giam gia 30%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.3, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN40','Giam gia 40%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.4, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN50','Giam gia 50%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.5, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN15','Giam gia 15%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.15, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN25','Giam gia 25%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.25, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN35','Giam gia 35%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.35, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN45','Giam gia 45%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.45, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN55','Giam gia 55%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.55, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN60','Giam gia 60%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.60, 1, 100)
insert into [Discount](DiscountID,Title,[Description],StartDate,EndDate,MinOrderValue, [Percentage], [type], [Quantity]) values('SIEUSAPSAN80','Giam gia 80%','',getdate(),  DATEADD(day, 7,GETDATE()), 1000, 0.80, 1, 1)


GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10303, 2, 1, 147000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10303, 1, 1, 168000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10303, 6, 1, 100000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10327, 2, 1, 152000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10327, 9, 1, 168000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10327, 3, 1, 207000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10327, 34, 1, 106000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10337, 11, 1, 72000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10337, 14, 1, 249000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10337, 4, 1, 152000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10337, 17, 2, 208000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10337, 12, 2, 278000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10342, 6, 2, 152000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10342, 1, 2, 100000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10342, 4, 2, 152000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10342, 25, 2, 192000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10347, 34, 2, 112000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10347, 24, 2, 144000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10347, 14, 2, 147000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10347, 23, 2, 62000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10352, 18, 2, 36000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10352, 35, 2, 59000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10366, 15, 3, 168000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10366, 17, 3, 104000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10368, 1, 3, 80000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10368, 14, 3, 364000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10368, 27, 3, 156000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10368, 44, 3, 266000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10378, 25, 3, 172000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10382, 5, 3, 170000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10382, 18, 3, 500000, 9, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10382, 9, 3, 990000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10382, 7, 3, 20000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10382, 8, 3, 80000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10386, 2, 3, 36000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10386, 23, 3, 112000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10390, 18, 3, 100000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10390, 33, 3, 144000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10390, 27, 3, 96000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10390, 28, 3, 278000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10394, 23, 1, 48000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10394, 34, 1, 394000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10395, 12, 1, 96000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10395, 18, 1, 262000, 7, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10395, 25, 1, 288000, 8, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10396, 21, 1, 72000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10396, 31, 1, 172000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10396, 12, 1, 278000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10402, 23, 1, 72000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10402, 19, 1, 351000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10403, 16, 1, 139000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10403, 8, 1, 102000, 7, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10408, 4, 1, 208000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10408, 6, 1, 59000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10408, 2, 1, 394000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10414, 18, 1, 73000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10414, 3, 1, 20000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10415, 27, 1, 312000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10415, 3, 1, 20000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10422, 6, 1, 249000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10423, 3, 1, 100000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10423, 9, 1, 440000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10426, 24, 1, 304000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10426, 34, 1, 266000, 7, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10430, 17, 1, 312000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10430, 21, 1, 80000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10430, 6, 1, 304000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10430, 9, 1, 440000, 7, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10434, 21, 1, 168000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10434, 76, 1, 144000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10442, 11, 1, 168000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10442, 14, 1, 59000, 8, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10442, 26, 1, 136000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10460, 8, 1, 100000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10460, 5, 1, 62000, 4, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10464, 4, 1, 176000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10464, 3, 2, 368000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10464, 6, 2, 304000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10464, 26, 2, 272000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10476, 5, 2, 192000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10476, 7, 2, 120000, 12, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10480, 17, 2, 76000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10480, 529, 2, 440000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10486, 11, 2, 168000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10486, 1, 2, 424000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10486, 4, 2, 80000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10488, 5, 2, 440000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10488, 7, 2, 120000, 2, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10490, 9, 2, 440000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10490, 8, 2, 100000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10490, 5, 2, 62000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10491, 4, 2, 155000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10491, 7, 2, 104000, 7, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10498, 4, 2, 45000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10498, 43, 2, 184000, 5, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10498, 2, 2, 140000, 3, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10512, 24, 3, 45000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10512, 6, 3, 120000, 9, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10512, 4, 3, 95000, 6, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10520, 1, 3, 340000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10521, 3, 3, 340000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10522, 2, 3, 340000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10523, 4, 3, 340000, 1, NULL)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (10524, 6, 3, 340000, 1, NULL)
GO

INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(2,10512,24,5,N'Sách hơi nhỏ nhưng cũng oke lắm toàn những quyển hothit',N'img-01.jpg',GETDATE())
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(2,10512,6,2,N'Đóng gói kĩ , đúng mô tả,rất hay ,nên mua,ship nhanh',N'img-02.jpg',GETDATE())
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(2,10512,4,5,N'Tớ thấy cũng hợp với số tiền nếu rảnh rỗi thì hãy đọc ',N'img-03.jpg',GETDATE())
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(2,10512,1,1,N'Giao khá nhanh,chất lượng tốt,có vài vết xước nhỏ xíu nên kh sao',N'img-10.jpg',GETDATE())
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(9,10491,4,5,N'Đọc để hiểu thêm đc cách giao tiếp',N'img-11.jpg',CAST(N'2022-01-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(9,10491,6,3,N'bìa đẹp và không bị hỏng, đóng gói ok. Nội dung khá lôi cuốn.',N'img-12.jpg',CAST(N'2022-01-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(9,10491,9,4,N'bìa đẹp và không bị hỏng, đóng gói ok. Nội dung khá lôi cuốn',N'img-05.jpg',CAST(N'2022-01-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(16,10498,4,3,N'Giao khá nhanh,chất lượng tốt,có vài vết xước nhỏ xíu nên kh sao',N'img-06.jpg',CAST(N'2022-03-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(16,10498,43,1,N'Tớ thấy cũng hợp với số tiền nếu rảnh rỗi thì hãy đọc ',N'img-07.jpg',CAST(N'2022-03-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(16,10498,2,3,N'Sách hơi nhỏ nhưng cũng oke lắm toàn những quyển hothit ',N'img-08.jpg',CAST(N'2022-03-27T00:00:00.000' AS DateTime))
INSERT INTO [dbo].[Reviews]([CustomerID],[OrderID],[ProductID],[Rating],[Comment],[Image],[ReviewDate]) VALUES(16,10490,5,2,N'bìa đẹp và không bị hỏng, đóng gói ok, bìa đẹp mắt.',N'img-09.jpg',CAST(N'2022-03-27T00:00:00.000' AS DateTime))


SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10303, 11, 7, CAST(N'2022-09-11T00:00:00.000' AS DateTime), CAST(N'2022-10-09T00:00:00.000' AS DateTime), CAST(N'2022-09-18T00:00:00.000' AS DateTime), 107.8300, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10327, 5, 2, CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-10-14T00:00:00.000' AS DateTime), 63.3600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10337, 6, 4, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-10-29T00:00:00.000' AS DateTime), 108.2600, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10342, 6, 4, CAST(N'2022-10-30T00:00:00.000' AS DateTime), NULL                                        ,  NULL                                        , 54.8300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10347, 2, 4, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), 3.1000, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10352, 9, 3, CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1.3000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10366, 10, 8, CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 10.1400, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10368, 1, 2, CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-02T00:00:00.000' AS DateTime), 101.9500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10378, 5, 5, CAST(N'2022-12-10T00:00:00.000' AS DateTime),  NULL                                        ,  NULL                                        , 5.4400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10382, 1, 4, CAST(N'2022-12-13T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), 94.7700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 5)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10386, 2, 9, CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2022-12-25T00:00:00.000' AS DateTime), 13.9900, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10390, 1, 6, CAST(N'2022-12-23T00:00:00.000' AS DateTime), CAST(N'2023-01-20T00:00:00.000' AS DateTime), CAST(N'2022-12-26T00:00:00.000' AS DateTime), 126.3800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10394, 17, 1, CAST(N'2022-12-25T00:00:00.000' AS DateTime), CAST(N'2023-01-22T00:00:00.000' AS DateTime), CAST(N'2023-01-03T00:00:00.000' AS DateTime), 30.3400, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10395, 16, 6, CAST(N'2022-12-26T00:00:00.000' AS DateTime),  NULL                                        , NULL                                        , 184.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10396, 6, 1, CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-06T00:00:00.000' AS DateTime), 135.3500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10402, 1, 8, CAST(N'2023-01-02T00:00:00.000' AS DateTime),  NULL                                        ,  NULL                                        , 67.8800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10403, 1, 4, CAST(N'2023-01-03T00:00:00.000' AS DateTime), CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-01-09T00:00:00.000' AS DateTime), 73.7900, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10408, 4, 8, CAST(N'2023-01-08T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-01-14T00:00:00.000' AS DateTime), 11.2600, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10414, 2, 2, CAST(N'2023-01-14T00:00:00.000' AS DateTime), CAST(N'2023-02-11T00:00:00.000' AS DateTime), CAST(N'2023-01-17T00:00:00.000' AS DateTime), 21.4800, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10415, 17, 3, CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-01-24T00:00:00.000' AS DateTime), 0.2000, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10422, 8, 2, CAST(N'2023-01-22T00:00:00.000' AS DateTime),  NULL                                        ,  NULL                                        , 3.0200, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10423, 12, 6, CAST(N'2023-01-23T00:00:00.000' AS DateTime), CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-02-24T00:00:00.000' AS DateTime), 24.5000, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10426, 10, 4, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2023-02-24T00:00:00.000' AS DateTime), CAST(N'2023-02-06T00:00:00.000' AS DateTime), 18.6900, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10430, 1, 4, CAST(N'2023-01-30T00:00:00.000' AS DateTime), CAST(N'2023-02-13T00:00:00.000' AS DateTime), CAST(N'2023-02-03T00:00:00.000' AS DateTime), 458.7800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10434, 5, 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime), CAST(N'2023-02-13T00:00:00.000' AS DateTime), 17.9200, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10442, 1, 3, CAST(N'2023-02-11T00:00:00.000' AS DateTime),  NULL                                        ,  NULL                                        , 47.9400, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 6)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10460, 5, 8, CAST(N'2023-02-28T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime), 16.2700, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 5)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10464, 9, 4, CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(N'2023-04-01T00:00:00.000' AS DateTime),  NULL                                        , 89.0000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10476, 16, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-14T00:00:00.000' AS DateTime), NULL                                        , 4.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10480, 4, 6, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-17T00:00:00.000' AS DateTime),  NULL                                        , 1.3500, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10486, 16, 1, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-23T00:00:00.000' AS DateTime),  NULL                                        , 30.5300, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10488, 6, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-24T00:00:00.000' AS DateTime),  NULL                                        , 4.9300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10490, 16, 7, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-28T00:00:00.000' AS DateTime), NULL                                        , 210.1900, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10491, 9, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-28T00:00:00.000' AS DateTime),  NULL                                        , 16.9600, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10498, 16, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-05-05T00:00:00.000' AS DateTime),  NULL                                        , 29.7500, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10512, 2, 7, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-05-19T00:00:00.000' AS DateTime),  NULL                                        , 3.5300, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 6)


INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10520, 1, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-24T00:00:00.000' AS DateTime),  NULL                                        , 4.9300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 5)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10521, 1, 7, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-28T00:00:00.000' AS DateTime),  NULL                                        , 210.1900, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela',4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10522, 1, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-04-28T00:00:00.000' AS DateTime),  NULL                                        , 16.9600, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10523, 1, 8, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-05-05T00:00:00.000' AS DateTime),  NULL                                        , 29.7500, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10524, 1, 7, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-05-19T00:00:00.000' AS DateTime),  NULL                                        , 3.5300, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 1)


SET IDENTITY_INSERT [dbo].[Orders] OFF
GO


INSERT INTO Authors(AuthorName) VALUES(N'Nathaniel Popper')
INSERT INTO Authors(AuthorName) VALUES(N'Alex Tapscott , Don Tapscott')
INSERT INTO Authors(AuthorName) VALUES(N'Andreas M. Antonopoulos')
INSERT INTO Authors(AuthorName) VALUES(N'Jeb Blount')
INSERT INTO Authors(AuthorName) VALUES(N'Mark W Schaefer')
INSERT INTO Authors(AuthorName) VALUES(N'David Meerman Scott')
INSERT INTO Authors(AuthorName) VALUES(N'Paul Falcone')
INSERT INTO Authors(AuthorName) VALUES(N'Alpha Books biên soạn')
INSERT INTO Authors(AuthorName) VALUES(N'Brian Tracy')
INSERT INTO Authors(AuthorName) VALUES(N'Gene Siciliano , Hương Giang')
INSERT INTO Authors(AuthorName) VALUES(N'Huỳnh Ngọc Phiên')
INSERT INTO Authors(AuthorName) VALUES(N'Huỳnh Mai Liên')
INSERT INTO Authors(AuthorName) VALUES(N'Nhiều tác giả')
INSERT INTO Authors(AuthorName) VALUES(N'----Hiên----')
INSERT INTO Authors(AuthorName) VALUES(N'Nguyễn Nhật Ánh')
INSERT INTO Authors(AuthorName) VALUES(N'Hồ Anh Thái')
INSERT INTO Authors(AuthorName) VALUES(N'Louisa May Alcott')
INSERT INTO Authors(AuthorName) VALUES(N'Nguyễn Thị Hoàng')
INSERT INTO Authors(AuthorName) VALUES(N'Nguyễn Văn Khỏa')
INSERT INTO Authors(AuthorName) VALUES(N'Edgar parin D aulaire')
INSERT INTO Authors(AuthorName) VALUES(N'Kousuke Sawamura')
INSERT INTO Authors(AuthorName) VALUES(N'Nhóm 4.0')
INSERT INTO Authors(AuthorName) VALUES(N'Rupi Kaur')
INSERT INTO Authors(AuthorName) VALUES(N'Antonio Guerrero Rodriguez')
INSERT INTO Authors(AuthorName) VALUES(N'Rabindranath Tagore')
INSERT INTO Authors(AuthorName) VALUES(N'Huỳnh Mai Liên , X Lan')
INSERT INTO Authors(AuthorName) VALUES(N'Elizabeth Rose Stanton')
INSERT INTO Authors(AuthorName) VALUES(N'DK , Clive Gifford')
INSERT INTO Authors(AuthorName) VALUES(N'Nhiều tác giả')
INSERT INTO Authors(AuthorName) VALUES(N'Kawa')
INSERT INTO Authors(AuthorName) VALUES(N'Ximena Vengoechea')
INSERT INTO Authors(AuthorName) VALUES(N'Joseph Murphy')
INSERT INTO Authors(AuthorName) VALUES(N'Ryunosuke Koike')
INSERT INTO Authors(AuthorName) VALUES(N'Joshua Becker')
INSERT INTO Authors(AuthorName) VALUES(N'Lý Thượng Long')
INSERT INTO Authors(AuthorName) VALUES(N'Wayne W Dyer')
INSERT INTO Authors(AuthorName) VALUES(N'Ota Hajime')
INSERT INTO Authors(AuthorName) VALUES(N'Đào Thản')
INSERT INTO Authors(AuthorName) VALUES(N'Jean-Claude Pomonti')
INSERT INTO Authors(AuthorName) VALUES(N'Johanna Spyri')
INSERT INTO Authors(AuthorName) VALUES(N'Carlo Collodi')

INSERT INTO Supplier(SupplierName) VALUES(N'NXB Thanh Niên')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB ĐH Kinh tế Quốc dân')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Công Thương')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Tài Chính')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Trẻ')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Lao động - Xã hội')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Dân Trí')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Khoa học và kỹ thuật')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Thế giới')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Hội Nhà Văn')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Hà Nội')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB văn học')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Kim Đồng')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Phụ Nữ')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Đại Học Sư Phạm')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Tổng hợp TP.HCM')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Lao động')
INSERT INTO Supplier(SupplierName) VALUES(N'Wordsworth Editions Ltd.')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Văn hóa - Văn nghệ')
INSERT INTO Supplier(SupplierName) VALUES(N'Tri Thức Trẻ')
INSERT INTO Supplier(SupplierName) VALUES(N'Alpha books')
INSERT INTO Supplier(SupplierName) VALUES(N'BachvietBooks')
INSERT INTO Supplier(SupplierName) VALUES(N'Trí Việt')
INSERT INTO Supplier(SupplierName) VALUES(N'Saigon Books')
INSERT INTO Supplier(SupplierName) VALUES(N'Nhã Nam')
INSERT INTO Supplier(SupplierName) VALUES(N'Skybooks')
INSERT INTO Supplier(SupplierName) VALUES(N'Đinh Tị')
INSERT INTO Supplier(SupplierName) VALUES(N'Bestbooks')
INSERT INTO Supplier(SupplierName) VALUES(N'AZ books')
INSERT INTO Supplier(SupplierName) VALUES(N'Công Ty Cổ Phần Waka')
INSERT INTO Supplier(SupplierName) VALUES(N'Phương Nam')
INSERT INTO Supplier(SupplierName) VALUES(N'NXB Kim Đồng')
INSERT INTO Supplier(SupplierName) VALUES(N'Crabit Kidbooks')
INSERT INTO Supplier(SupplierName) VALUES(N'Muki')
INSERT INTO Supplier(SupplierName) VALUES(N'Huy Hoàng')
INSERT INTO Supplier(SupplierName) VALUES(N'Thái Hà')
INSERT INTO Supplier(SupplierName) VALUES(N'Minh Long')
INSERT INTO Supplier(SupplierName) VALUES(N'1980Books')
INSERT INTO Supplier(SupplierName) VALUES(N'Tân Việt')
INSERT INTO Supplier(SupplierName) VALUES(N'Phúc Minh')
INSERT INTO Supplier(SupplierName) VALUES(N'Marvy')


SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(1,N'Sách Blockchain')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(2,N'Sách Kinh Tế')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(3,N'Sách Văn học trong nước')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(4,N'Sách Văn học Nước Ngoài')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(5,N'Sách Thiếu Nhi ')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(6,N'Sách Phát Triển Bản Thân')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(7,N'Sách Ngoại Văn')
INSERT INTO [dbo].[Categories]([CategoryID],[CategoryName]) VALUES(8,N'Tạp chí')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO

INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Marketing – Bán hàng')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Nhân sự & việc làm')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Tài chính & tiền tệ')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Thơ ca')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Tiểu thuyết')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Truyện dài')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Cổ tích & thần thoại')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Viễn tưởng & kinh dị')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Truyện tranh')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Khoa học tự nhiên')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Mỹ thuật, âm nhạc')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Khoa học xã hội')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Sách học làm người')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Tâm Lý - Kỹ Năng Sống')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Danh nhân')
INSERT INTO [dbo].[Genre]([GenreName]) VALUES(N'Children s Books')


SET IDENTITY_INSERT [dbo].[Products] ON 
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(1,N'Cuộc Cách Mạng Blockchain',2,1,NULL,2,21,299000,255000,N'Tiếng Việt',N'Nguyệt Minh',N' Bìa mềm',N'16 x 24',N'01/05/2018',508,792.00,NULL,'cachmangblockchain.jpg',N'Công nghệ có thể tác động lớn đến tương lai của nền kinh tế thế giới đã xuất hiện, đó không phải là ô tô tự lái, là năng lượng mặt trời hay trí thông minh nhân tạo. Đó chính là Blockchain. Thế hệ thứ nhất của cuộc cách mạng số hóa đã đưa chúng ta đến với kỷ nguyên Internet của thông tin. Thế hệ thứ hai – được tiếp sức bởi công nghệ blockchain – đang đưa chúng ta đến với Internet của giá trị: một nền tảng phi tập trung mới mẻ, thứ có thể giúp chúng ta tái định hình ngành kinh doanh và thay đổi cách thức hoạt động của con người theo hướng tốt hơn. Cuộc cách mạng Blockchain là cuốn sách lý giải tiềm năng kiến tạo tương lai nhân loại của công nghệ blockchain. Cuốn sách là công trình được nghiên cứu kỹ lưỡng với lối trình bày gần gũi dễ hiểu, phù hợp với cả những người chuyên và không chuyên về công nghệ.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(2,N'Rủ Nhau Lên Mạng Đào Vàng',1,1,NULL,2,21,299000,255000,N'Tiếng Việt',N'Minh Thu , Thu Giang',N'Bìa mềm',N'16 x 24','01/07/2018',392,616.00,NULL,'giditalgold.jpg',N'Digital Gold, cuốn sách duy nhất của Popper cho đến nay, được đón nhận nồng nhiệt từ cả giới chuyên môn, cộng đồng bitcoin, và độc giả đại chúng. Cuốn sách được tạp chí Financial Times bình chọn là một trong những cuốn sách kinh doanh tốt nhất năm 2015, và luôn có mặt trong danh sách những cuốn sách phải-đọc về lĩnh vực bitcoin.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(3,N'Bitcoin Thực Hành',3,1,NULL,2,21,299000,255000,N'Tiếng Việt',N'LeVN , Thu Hương',N'Bìa mềm',N'16 x 24',N'01/03/2018',540,704.00,NULL,'bitcoin.jpg',N'Mastering Bitcoin cung cấp các kiến thức cần thiết để giúp độc giả gia nhập thế giới của tiền ảo. Bitcoin là đồng tiền số thành công đầu tiên không do bất kỳ một chính phủ nào phát hành. Mặc dù bitcoin vẫn đang ở giai đoạn mới hình thành tuy nhiên, nó đã tạo ra đươc một nền kinh tế hàng tỉ đô. Nền kinh tế này luôn mở ra chào đón tất cả những ai có kiến thức và đam mê gia nhập. Và cuốn sách cung cấp cho bạn kiến thức, còn bạn chỉ cần theo đuổi nó với đam mê.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(4,N'Kỹ Năng Bán Hàng Trực Tuyến',4,2,1,3,21,219000,186000,N'Tiếng Việt',NULL,N'Bìa mềm',N'24 x 16 x 1',N'01/03/2018',372, 550.00,NULL,'kynangbanhang.jpg',N'Cuốn sách cung cấp những cách thức biến các nền tảng giao tiếp trực tuyến trở thành những công cụ bán hàng vượt trội và hữu hiệu, có thể áp dụng cho tất cả các loại sản phẩm, bất kể độ phức tạp hoặc thời lượng chu kỳ bán hàng của bạn có kéo dài bao lâu, bất kể bạn đang bán hàng từ xa, thường xuyên gặp mặt khách hàng hay phải kết hợp cả hai. Bán hàng trực tuyến là nguồn tham khảo toàn diện và thực tế nhất từ trước đến nay, tập trung khai thác những kỹ năng bán hàng số và qua video.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(5,N'Marketing Đáng Kinh Ngạc',5,2,1,4,22,143000,122000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20 x 13.5 ',N'01/01/2021',476,700.00,N'-QĐ/BV','mktdangkinhngac.jpg',N'Những tư duy hiện đại gây choáng váng, làm lung lay quan niệm Marketing truyền thống. Cẩm nang cứu thoát mọi doanh nghiệp nhỏ, vừa và lớn đang điên đầu vì những kế hoạch Marketing tốn tiền không hiệu quả. Marketing Rebellion'+ CHAR(13) + CHAR(10) +N' Cuốn sách dành cho bất cứ ai muốn trở thành một chiến binh marketing đích thực Bạn là nhà tiếp thị truyền thống, bạn là một marketer năng nổ hay bạn là người chân ướt chân ráo mới vào nghề Bạn đang ngày ngày mò mẫm những phễu bán hàng, vắt óc suy nghĩ nội dung quảng cáo, hao tâm tìm kiếm những KOL hòng thu hút khách hàng Nhưng lọt sàng chẳng được bao nhiêu, lại liêu xiêu trước những đợt phản công của người tiêu dùng Sức cùng lực kiệt, hao tâm tổn trí lại không được kết quả gì, lâu ngày thành ra chướng ngại Chắc chắn bạn đã tìm rất nhiều cách để đổi mới, để sáng tạo, nhưng vẫn thất bại Bạn có thấy, trong thế giới tiếp thị giờ đây, marketer không còn là người chi phối? Người tiêu dùng đang nắm quyền kiểm soát. Các phễu bán hàng đã biến mất. Niềm tin của người tiêu dùng vào sản phẩm sụt giảm, và lòng trung thành của khách hàng chỉ còn là một huyền thoại Bạn cần một con đường mới, và MARKETING ĐÁNG KINH NGẠC sẽ cho trao cho bạn: Tư duy hiện đại gây choáng váng làm lung lay quan niệm Marketing truyền thống Cẩm nang cứu thoát mọi doanh nghiệp đang điên đầu vì những kế hoạch marketing tốn tiền không hiệu quả Cái nhìn sáng suốt về tương lai xa dài của hoạt động tiếp thị và truyền thông Cuốn sách là những câu chuyện tuyệt vời, bóc tách hành trình của tiếp thị hiện đại, để lại những gì là trung tâm của các mối quan hệ, sự tương tác giữa các thương hiệu với khách hàng và đưa ra những ngón nghề cho truyền thông kỷ nguyên mới Hãy nắm lấy MARKETING ĐÁNG KINH NGẠC.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(6,N'Những Quy Luật Mới Của Bán Hàng Và Dịch Vụ',6,2,1,5,5,180000,153000,N'Tiếng Việt',NULL,N'Bìa mềm',N'23 x 16 x 1.5',N'01/01/2022',392,650.00,NULL,'quydluat.jpg',N'Trong cuốn Những quy luật mới của bán hàng và dịch vụ – David Meerman Scott mô tả chi tiết những công cụ và chiến lược đã được chứng minh mà các nhà lãnh đạo doanh nghiệp có thể sử dụng để kết nối một cách hiệu quả với khách hàng và phát triển tổ chức của mình. Được viết theo phong cách đầy lôi cuốn, cuốn sách khám phá những quy luật mới của bán hàng và dịch vụ, bao gồm: Kỹ thuật kể chuyện xác thực tạo sắc thái cho nội dung để làm mối liên kết giữa công ty và khách hàng. Dữ liệu lớn cho phép một cách tiếp cận khoa học hơn với việc bán hàng và dịch vụ. Bán hàng linh hoạt mang đến những giao dịch mới cho công ty của bạn, và việc kết nối thời gian thực giữ gìn sự hài lòng của khách hàng.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(7,N'101 Tình Huống Nhân Sự Nan Giải',7,2,2,6,21,149000,127000,N'Tiếng Việt',N' Nguyễn Đình Viễn , Nhóm dịch VNHR',N'Bìa mềm',N'16 x 24',N'2020-09-15',348,385.00,NULL,'101.jpg',N'Cuốn sách với hàng loạt các giải pháp hữu hiệu này sẽ hướng dẫn bạn cách thức giải quyết toàn bộ những rắc rối và thậm chí là cả những vấn đề nghiêm trọng nhất của nhân viên. Từ đó giúp nhân viên làm việc hiệu quả hơn, mang lại nhiều thành công hơn cho công ty. Cuốn sách đồng thời cũng sẽ giúp bạn giao tiếp với nhân viên bằng sự tôn trọng, và hiểu được rằng trong giao tiếp, điều quan trọng không phải chỉ là nói gì mà còn là nói như thế nào. Cuốn cẩm nang hữu hiệu này sẽ mang đến cho bạn những kỹ thuật hàng đầu thế giới về cách thức quản lý nhân sự để bảo vệ bạn và chính doanh nghiệp của bạn – thông qua việc tối đa hóa được tiềm năng của nhân viên.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(8,N'Nghệ Thuật Thôi Miên Nhà Tuyển Dụng',8,2,2,6,21,109000,93000,N'Tiếng Việt',NULL,N'Bìa mềm',N'13 x 20.5',N'01/10/2019',280,308.00,NULL,'thoimien.jpg',N'“Cuốn sách này gây ấn tượng cho tôi bởi cách tiếp cận vấn đề rất thực tế và gợi mở. Không chỉ là những kỹ năng để vượt qua vòng phỏng vấn, mà quan trọng hơn, cuốn sách còn đưa ra những gợi ý giúp bạn hiểu rõ hơn về bản thân để hướng tới mục tiêu nghề nghiệp lâu dài, cũng như giúp bạn tìm ra những cách tiếp cận hiệu quả với những người xung quanh, để có được sự ủng hộ và hợp tác từ họ đồng thời giúp bạn thăng tiến trong sự nghiệp.”',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(9,N'Bí Quyết Tuyển Dụng & Đãi Ngộ Người Tài (Tái Bản)',9,2,2,7,23,68000,58000,N'Tiếng Việt',N'Trương Hồng Dũng',N'Bìa mềm',N'20.5 x 14.5 x 1 ',N'01/01/2021',136, 400.00,NULL,'biquyetdaingotuyendung.jpg',N'Thu nhập và cơ hội thăng tiến của người quản lý lúc đó lại phụ thuộc vào khả năng làm việc của những người mà họ đã tuyển. Việc lựa chọn và giữ chân những nhân viên giỏi không phải là một việc có thể học được nhờ giáo trình và những khóa đào tạo. Công việc này đòi hỏi cả một nghệ thuật cùng với những kỹ năng cần thiết mà chúng ta chỉ có thể có được từ những trải nghiệm thực tế. Chúng ta thường xem việc tìm người để lấp vào vị trí còn trống là một vấn đề phải giải quyết càng sớm càng tốt để chúng ta có thời gian tập trung vào công việc của mình. Thế nhưng, chính chúng ta đã quên một điều rằng lựa chọn đúng người cho vị trí đó mới là việc quan trọng nhất mà chúng ta cần phải làm. 22 bí quyết trong cuốn sách này sẽ giúp bạn có cái nhìn mới trong việc tuyển dụng và đãi ngộ những người tài giỏi. Chỉ sau một giờ đọc sách, bạn sẽ nắm được những nguyên tắc quan trọng nhất trong việc chiêu mộ và giữ chân nhân viên mà những nhà quản lý hàng đầu trong các công ty danh tiếng vẫn thường áp dụng.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(10,N'Tài Chính Dành Cho Nhà Quản Lý',10,2,3,8,21,149000,127000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20.5 x 13 x 0.6',N'01/01/2022',344,550.00,NULL,'taichnh.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(11,N'Tiền Tệ Và Chuyện Làm Giàu An Toàn',11,2,3,9,24,150000,120000,N'Tiếng Việt',NULL,N'Bìa mềm',N'20.5 x 13 x 0.6',N'01/10/2020',220,242.00,NULL,'tiente.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(12,N'Biển Là Trẻ Con',12,3,4,10,25,70000,56000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20 x 18 ',N'2020-08-19',104,148,NULL,'bienlatrecon.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(13,N'Tuyển Tập Văn Tế Đại Thi Hào Nguyễn Du',13,3,4,5,5,145000,123000,N'Tiếng Việt',NULL,N'Bìa mềm',N'16 x 24',N'02/10/2020',196,330.00,NULL,'nguyendu.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(14,N'Thần Thoại Bắc Âu',NULL,4,7,1,27,168000,150000,N'Tiếng Việt',N'Lệ Chi',N'Bìa cứng',N' 14.5 x 19.2',N'01/08/2018',280,616.00,NULL,'thanthoaibacau.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(15,N'Truyện Thạch Yêu',20,4,7,11,25,116000,93000,N'Tiếng Việt',N'Đoàn Mai',N'Bìa mềm',N'20.5 x 28.5',N'2020-08-28',70,140.00,NULL,'thachyeu.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(16,N'Tiệm Cắt Tóc Lúc Nửa Đêm',21,4,8,1,29,116000,104000,N'Tiếng Việt',N'Annie',N'Bìa mềm',N'20.5 x 14.5 ',N'01/01/2022',250,550.00 ,N'-QĐ/ThN','tiemcattocnuadem.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(17,N'Sữa Và Mật',23,4,4,10,25,108000,92000,N'Tiếng Việt',N'Anh Thư',N'Bìa mềm',N' 14 x 20.5 ',N'12/10/2019',212,220.00,NULL,'suavamat.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(18,N'Mùa Hái Quả',25,4,4,13,13,20000,20000,N'Tiếng Việt',N'Bùi Xuân',N'Bìa mềm',N'13 x 19',N'01/09/2017',88,110.00,NULL,'muahaiqua.jpg',NULL,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(19,N'BKTT Về Các Loại Phương Tiện Giao Thông',28,5,10,1,27,280000,238000,N'Tiếng Việt',N' Thu Trang',N'Bìa mềm',N' 26.7 x 21',N'01/11/2020',256,450.00,NULL,'bktt.jpg',NULL,0)
GO
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(20,N'Xin Chào Tình Yêu',14,3,4,11,26,75000,64000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 17 x 10',N'01/07/2020',176,200.00 ,NULL,'hien.jpg',N'Nhẹ nhàng, lãng mạn, nhưng cũng rất day dứt. Cuốn sách này, hãy đọc nó vào những ngày bạn thấy lòng mình chênh vênh, không tìm nổi đích đến, cũng chẳng đủ can đảm để quay đầu. Có lẽ nó không thể chữa lành ngay lập tức trái tim đang tổn thương của bạn vào những ngày giông gió như vậy, nhưng tin rằng bạn sẽ tìm thấy được sự đồng cảm ở từng câu chữ, rồi dần dần tìm được cảm giác an lòng.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(21,N'Ngôi Trường Mọi Khi (Tái Bản 2022)',3,3,5,5,5,43000,37000,N'Tiếng Việt',NULL,N'Bìa mềm',N'14.5 x 10 x 0.5',N'01/01/2022',244,450.00  ,NULL,'ngoitruongmoikhi.jpg',N'..Thực ra, cô gái mà tất cả bạn bè của bạn năm ngoái nôn nao được nhìn thấy nhất không phải là bạn, Kiếng Cận, Hạt Tiêu hay Hột Mít. Đó chính là nhỏ Tóc Ngắn Chính bạn, bạn cũng háo hức chời đợi sự xuất hiện của Tóc Ngắn biết bao! Mọi người mong ngóng nhỏ Tóc Ngắn chẳng phải vì muốn coi nó mặc áo dài đẹp hay xấu, mà cái chính là muốn coi con nhỏ này khi mặc áo dài trông nó ra làm sao! Hầu như bạn bè cùng trường năm ngoái chưa hề thấy Tóc Ngắn mặc quần áo con gái bao giờ, mặc dù Tóc Ngắn là con gái một trăm phần phần trăm. Chính mẹ nó xác nhận với mẹ của bạn như vậy…” Trích đoạn truyện dài của Nguyễn Nhật Ánh',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(22,N'Thằng Quỷ Nhỏ (2022)',15,3,5,5,5,110000,94000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20 x 13',N'01/01/2022',228,500.00 ,NULL,'thangquy.jpg',N'Bạn bè thân của Nguyễn Nhật Ánh vẫn gọi anh bằng biệt danh “thằng quỷ nhỏ”, theo tên một truyện dài cùng tên của anh, đã được in lần thứ 11 và được dựng thành kịch, thành phim. Thằng quỷ nhỏ trong truyện là một cậu học trò nghèo, chăm học, tinh nghịch và có đặc điểm “hai vành tai ve vẩy như hai cánh bướm”. Ở ngoài đời anh không có đặc điểm đó, nhưng anh biết cách kể chuyện khiến người nghe phải “ve vẩy” đôi vành tai.Ông Lê Hoàng, Giám đốc NXB Trẻ, cho biết: “Trong năm 2003, NXB Trẻ sẽ tái bản toàn bộ truyện của Nguyễn Nhật Ánh, mỗi tuần một tập (phát hành vào ngày thứ hai) theo nhu cầu của các em thiếu niên”.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(23,N'Đức Phật, Nữ Chúa Và Điệp Viên',16,3,5,5,5,95000,81000,N'Tiếng Việt',NULL,N'Bìa mềm',N'20 x 13 x 1 ',N'01/01/2022',232,450.00 ,NULL,'hoanhthai.jpg',N'“Đức Phật, Nữ Chúa Và Điệp Viên” là cuốn tiểu thuyết nối dài niềm đam mê Ấn Độ của Hồ Anh Thái. Mảnh đất huyền bí với nhiều vỉa tầng văn hóa cổ luôn bám riết nhà văn, làm nên một vùng thẩm mỹ, một mảng đề tài, một series truyện về xứ thiêng Ấn Độ, tiếp sau cuốn tiểu thuyết đầy ma lực hấp dẫn “Đức Phật, nàng Savitri và tôi”. Từ câu chuyện lịch sử, dòng đời, khuôn diện cuộc sống cứ tươi ròng qua lối viết vừa ẩn vừa lộ đậm chất tiểu thuyết. Thiện ác, nhân quả, Trung đạo, tư tưởng cốt lõi của tác phẩm, không chỉ là lý thuyết siêu hình mà đậm nhạt qua một cõi nhân sinh lộn lạo nhiều dục vọng, chênh vênh giữa buông bỏ và níu giữ hận thù.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(24,N'Bông Hồng Trên Ngọn Đồi Xanh (Eight Cousins)',17,3,6,1,27,99000,84000,N'Tiếng Việt',NULL,N'Bìa mềm',N'20.5 x 14.5',N'01/11/2020',364,385.00 ,NULL,'bonghong.jpg',N'“Nếu các cô bé như cháu học được vẻ đẹp thực sự là gì, không cố bó chặt cơ thể, nhịn đói hay tẩy trắng làn da của mình, cháu sẽ tiết kiệm được cả đống thời gian, tiền bạc, và không cần phải chịu nhiều đau đớn đến thế. Một tâm hồn vui vẻ trong một cơ thể khỏe mạnh sẽ tạo ra vẻ đẹp hoàn hảo nhất cho bất cứ người đàn ông hay phụ nữ nào.”'+ CHAR(13) + CHAR(10) +N' Với tư tưởng tiến bộ cùng văn phong đơn giản nhưng không kém phần hài hước, Louisa May Alcott đã tạo nên một tác phẩm tuyệt vời khiến biết bao thế hệ độc giả say sưa theo dõi. Thông qua quá trình hòa nhập với cuộc sống mới của cô bé Rose rụt rè, nhút nhát bên những người bà, người thím cổ hủ cùng những người anh em họ ồn ào, hiếu động, Bông hồng trên ngọn đồi xanh đã đem đến một câu chuyện thú vị, hấp dẫn về tình bạn và tình thân. Mang trong mình những giá trị nhân văn sâu sắc, tác phẩm xứng đáng được coi là một kiệt tác dành cho các bạn đọc nhỏ tuổi.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(25,N'Một Ngày Rồi Thôi (Bìa Cứng)',18,3,6,10,25,140000,119000,N'Tiếng Việt',NULL,N'Bìa cứng',N' 14 x 20.5 ',N'01/01/2021',342,450.00 ,NULL,'motngayroithoi.jpg',N'Kể từ ngày người vợ bỏ đi, ông Vĩnh Hoài đã phải chịu đựng khoảng thời gian cô đơn cùng cực, thế nhưng đây không phải chỉ là sự biến mất của một người vợ mà còn là của một người mẹ. Hai chị em Diễm và Nguyện một mặt phải chứng kiến nỗi đau của cha, một mặt phải tự lớn lên giữa những cảm xúc xáo trộn của chính mình. Diễm đi qua một cuộc tình bấp bênh còn Nguyện tha thiết muốn biết tình yêu là gì. Diễm nhẹ nhàng đi tìm sự hàn gắn còn Nguyện vô tư lao vào đời như muốn phá mọi thứ tan ra. Một Ngày Rồi Thôi là câu chuyện về những trái tim khao khát yêu và khao khát được yêu. Câu chuyện về những người trẻ với tâm hồn thanh tao, mơ mộng, và phảng phất buồn tựa như những cơn mưa xứ Huế.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(26,N'Làm Bạn Với Bầu Trời (Bìa Cứng)',15,3,6,5,5,220000,209000,N'Tiếng Việt',NULL,N'Bìa cứng',N'13 x 20',N'11/09/2019',252,506.00 ,NULL,'lamban.jpg',N'Một câu chuyện giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Và đẹp lộng lẫy, vì lòng vị tha và tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên lòng khát khao sống tốt trên đời. Viết về điều tốt đã không dễ, viết sao cho người đọc có thể đón nhận đầy cảm xúc tích cực, và muốn được hưởng, được làm những điều tốt dù nhỏ bé... mới thật là khó. Làm bạn với bầu trời của Nguyễn Nhật Ánh đã làm được điều này. Như nhà văn từng phát biểu “...điểm mạnh của văn chương nằm ở khả năng thẩm thấu. Bằng hình thức đặc thù của mình, văn chương góp phần mài sắc các ý niệm đạo đức nơi người đọc',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(27,N'Thần Thoại Hy Lạp',19,4,7,12,28,260000,208000,N'Tiếng Việt',NULL,N'Bìa cứng',N' 16 x 24',N'01/01/2021',900,2000.00 ,NULL,'thanthoaihilap.jpg',N'Thần thoại Hy Lạp bao gồm những chuyện có tính chất hoang đường về nguồn gốc vũ trụ, loài người, giải thích các hiện tượng tự nhiên, xã hội, lịch sử các thành bang và bộ tộc Hy Lạp, đồng thời kể lại những sự tích về các anh hùng cổ xưa của đất nước Hy Lạp.'+ CHAR(13) + CHAR(10) +N'Nó là cơ sở của tôn giáo, là nền tảng của văn học, nghệ thuật Hy Lạp, đồng thời là một bộ phận không thể thiếu được của văn hóa châu Âu. Sự hiểu biết thần thoại Hy Lạp rất cần cho những người muốn làm quen với văn học, vì từ lâu thần thoại Hy Lạp đã trở thành nguồn cảm hứng bất tuyệt của các nhà văn phương Tây, một nguồn văn liệu dồi dào, một di sản vô giá đối với văn học và nghệ thuật thế giới. Chỉ xét riêng về giá trị văn học, thần thoại Hy Lạp cũng rất đặc sắc.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(28,N'Sự Thật Đặt Tên Tôi',24,4,4,10,31,75000,67000,N'Tiếng Việt',NULL,N' Bìa mềm',N' 14.5 x 20.5',N'01/05/2018',160,198.00,NULL,'suthuat.jpg',N'Với mùi vị của bức tường nhà tù và ổ khóa vương trong chiếc miệng cỡ rộng của mình bằng tình thương không thể bại bao giờ tôi muốn đặt tên sự vẹn toàn mềm mại. Đặt tên cho di sản cuộc đời tôi đập vào dá cứng và biết giữ sự kế thừa trong trắng bất chấp cú đánh nặng nề và cả vết thương. Đặt tên tất cả những gì chói sáng mà tình yêu thủy chung đặt trên ngực tôi trong thời gian tồn tại của bóng tối này. Đặt tên sự căm thù, tội ác và lừa đảo, không sợ hãi, không ngại ngần và không thù hận bởi vì khi làm điều đó, sự thật đặt tên tôi.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(29,N'Việt Ma Tân Lục - Quyển 1',22,4,8,7,30,145000,138000,N'Tiếng Việt',NULL,N'Bìa mềm',N'20.5 x 14.5 ',N'01/01/2022',464,700.00,NULL,'vietmatanluc.jpg',N'Dòng họ Trịnh cứ 18 năm lại có một người con gái treo cổ.' + CHAR(13) + CHAR(10) +N'Nhưng, một năm trở lại đây, liên tiếp những cái chết bất đắc kỳ tử – không kể nam nữ, không tính trẻ già, chỉ biết, đều là những cái chết thảm khốc!'+ CHAR(13) + CHAR(10) +N'Ngay cả những thầy tà, pháp lực nổi tiếng một vùng, cũng không sống sót nổi sau một đêm trú lại nơi này.'+ CHAR(13) + CHAR(10) +N'Điều gì đã xảy ra ở ngôi nhà ma ám này? Là hệ lụy của hàng trăm năm oán khí? Hay, oan hồn người con dâu treo cổ ngay trong đêm tân hôn quấy phá? Tất cả đều chưa rõ, chỉ biết, người sống vẫn cứ hoảng loạn, còn những người đã chết thì cứ mãi không siêu thoát, vất vưởng gieo tang tóc.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(30,N'Mẹ Yêu Ai Nhất',12,5,9,10,25,60000,51000,N'Tiếng Việt',NULL,N' Bìa mềm',N'23 x 23 x 0.3',N'01/01/2022',40,300.00,N'-QĐ/HNV','meyeuainhat.jpg',N'"Mẹ yêu lúc các con ngoan và cả khi quên ngoan, lúc các con bật cười và cả khi òa khóc , lúc đang quấn chân mẹ và rồi sau này rời xa mẹ...'+ CHAR(13) + CHAR(10) +N'Sóc Chị: Mẹ nói dài quá. Cuối cùng mẹ yêu ai hơn?'+ CHAR(13) + CHAR(10) +N'Sóc Em: Em không hiếu gì cả!"'+ CHAR(13) + CHAR(10) +N'Một câu chuyện dài bất tận xảy ra trong nhiều gia đình. Một câu hỏi bé nhỏ nhưng cô cùng hóc búa với bất cứ bà mẹ nào. Và một sợi dây nối thời gian với mẹ của mẹ. Bao trùm tất cả, cuốn truyện tranh nhỏ sẽ đưa độc giả trở về một thời yêu thương',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(31,N'Henny',27,5,9,11,32,89000,89000,N'Tiếng Việt',NULL,N'Bìa mềm',N'21 x 20.5',N'01/01/2022',40,300.00,NULL,'Henny.jpg',N'“Henny là một trong mười cuốn sách thiếu nhi yêu thích nhất của tôi. Cuốn sách thật khác thường, sáng tạo và ấm áp. Và mười lần như một, cuốn sách luôn khiến các con tôi cười khoái chí.” – Drew Daywalt, The Day the Crayons Quit'+ CHAR(13) + CHAR(10) +N'Henny là cô gà mái sinh ra với một đôi tay. Phải, em không đọc nhầm đâu, một đôi tay hồng hào giống như tất cả chúng ta vậy, chứ không phải một đôi cánh phủ lông!',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(32,N'Bách Khoa Tri Thức Cho Trẻ Em',13,5,10,1,27,280000,238000,N'Tiếng Việt',NULL,N'Bìa mềm',N'21.0 x 24 x 0.7',N'01/01/2022',224, 550.00,NULL,'bachkhoatoanthutreem.jpg',N'Tủ Sách Bách Khoa Tri Thức - Bách Khoa Tri Thức Cho Trẻ Em' + CHAR(13) + CHAR(10) +N'Em có nghĩ đọc sách bách khoa là nhàm chán? Hay những kiến thức đơn thuần sẽ thật khô khan?'+ CHAR(13) + CHAR(10) +N' Ồ không đâu nhé! Bách khoa tri thức cho trẻ em là một cuốn sách siêu thú vị và không hề tẻ nhạt chút nào! Bảy chủ đề lớn trong sách được trình bày một cách khoa học nhưng vô cùng dễ hiểu, sẽ cung cấp vô vàn tri thức hữu ích cho các em trong giai đoạn đầu tìm hiểu về thế giới xung quanh. Các em sẽ được khám phá từ những loài động vật trên thảo nguyên bao la cho đến những loài đang ngụp lặn dưới đại dương xanh thẳm, từ những hành tinh xa xôi ngoài vũ trụ cho đến thế giới bí ẩn ngay dưới chân chúng ta.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(33,N'Mê Cung Phát Triển Kỹ Năng - An Toàn',29,5,11,14,33,29000,23000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 18 x 18',N'2020-09-22',28,110.00,NULL,'antoan.jpg',N'TẤT CẢ TRẺ EM ĐỀU THÍCH CHƠI TRÒ MÊ CUNG - Trích lời của Giáo sư Đại học Khoa học tự nhiên Shuwa Tokyo - Shinohara Kikunori'+ CHAR(13) + CHAR(10) +N'Tại sao trẻ lại thích chơi mê cung đến vậy?'+ CHAR(13) + CHAR(10) +N'Bởi vì tính dự đoán trong trò chơi này kích thích tính tò mò, sự hiếu kì muốn biết, muốn tìm hiểu và khám phá của trẻ nhỏ. Trong khi chơi mê cung, trẻ phải tự động não và tự ra quyết định nên đi đường nào, hướng nào, trẻ phải tự suy nghĩ xem mỗi nước đi sẽ có kết quả như thế nào.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(34,N'Xưởng Sáng Tạo Rộn Ràng',13,5,11,7,25,169000,135000,N'Tiếng Việt',N'Hoàng Linh , Bảo Bình',N'Bìa mềm',N' 18 x 23',N'07/08/2020',368,525.00,NULL,'xuongsangtao.jpg',N'Bộ sách chứa rất nhiều tâm huyết của Nhã Nam và Usborne - nhà xuất bản sách thiếu nhi thành công nhất tại Anh, mang tầm vóc toàn cầu, được phụ huynh và trẻ em trên khắp thế giới tin yêu.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(35,N'Câu Lạc Bộ Rừng Xanh',NULL,5,12,15,34,135000,115000,N'Tiếng Việt',NULL,N'Bìa mềm',N'29.5 x 20.5',N'01/11/2020',NULL,110.00 ,NULL,'clbrungxanh.jpg',N'Bốn mùa xuân hạ thu đông đều là thời điểm thích hợp để ta cùng khám phá thiên nhiên kì thú. Hãy ra ngoài và bát đầu tìm hiểu nào - Bé sẽ quan sát được gì, ngửi thấy mùi gì và lắng nghe những âm thanh nào nhỉ?'+ CHAR(13) + CHAR(10) +N'Với muôn vàn ý tưởng về các hoạt động vui chơi ngoài trời, làm đồ thủ công sáng tạo cùng rất nhiều các thông tin hữu ích về tự nhiên, Câu lạc bộ Rừng Xanh sẽ là cầu nối giúp các bé tiếp xúc gần hơn với môi trường tự nhiên.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(36,N'Muốn Học Giỏi Lịch Sử Không? ',30,5,12,9,35,145000,123000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20 x 14.5 x 1 ',N'01/01/2022',202,350.00,NULL,'lichsu.jpg',N'Muốn học giỏi lịch sử không? Tớ cho cậu mượn vở là một bộ sách tóm lược một cách toàn diện lịch sử thế giới từ những giống loài đầu tiên đến tận thời đại kỹ thuật số. Những kiến thức được tóm lược theo một hệ thống vô cùng dễ hiển, với những kiến thức mấu chốt được nhấn mạnh và đúc kết lại cuối mỗi bài. Đây là một tài liệu vô cùng thú vị dành cho tất cả các bạn học sinh muốn tìm hiểu về lịch sử thế giới, và cả những người lớn muốn kiểm tra lại kiến thức của mình. Lịch sử thế giới được tóm gọn trong 3 cuốn sách mỏng trình bày như một cuốn vở ghi chép thay cho những cuốn sách hàn lâm dày cộp, chắc chắn cuốn “vở” này sẽ làm cho nỗi sợ trả bài môn lịch sử thế giới biến mất.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(37,N'Sức Mạnh Tiềm Thức (Bìa Cứng)',31,6,13,16,23,158000,134000,N'Tiếng Việt',N'Mai Sơn , Bùi Thanh Châu',N'Bìa cứng',N' 16 x 24',N'01/12/2021',272, 528.00,NULL,'sucmanhtiemthuc.jpg','Là một trong những quyển sách về nghệ thuật sống nhận được nhiều lời ngợi khen và bán chạy nhất mọi thời đại, Sức Mạnh Tiềm Thức đã giúp hàng triệu độc giả trên thế giới đạt được những mục tiêu quan trọng trong đời chỉ bằng một cách đơn giản là thay đổi tư duy.'+ CHAR(13) + CHAR(10) +N'Sức Mạnh Tiềm Thức giới thiệu và giải thích các phương pháp tập trung tâm thức nhằm xoá bỏ những rào cản tiềm thức đã ngăn chúng ta đạt được những điều mình mong muốn.'+ CHAR(13) + CHAR(10) +N'Sức Mạnh Tiềm Thức không những có khả năng truyền cảm hứng cho người đọc, mà nó còn rất thực tế vì được minh hoạ bằng những ví dụ sinh động trong cuộc sống hằng ngày. Từ đó, Sức Mạnh Tiềm Thức giúp độc giả vận dụng năng lực trí tuệ phi thường tiềm ẩn troing mỗi người để tạo dựng sự tự tin, xây dựng các mối quan hệ hoà hợp, đạt được thành công trong sự nghiệp, vượt qua những nỗi sợ hãi và ám ảnh, xua đi những thói quen tiêu cực, và thậm chí còn hướng dẫn cách ta chữa lành những vết thương về thể chất cũng như tâm hồn để có sự bình an, hạnh phúc trọn vẹn trong cuộc sống.' ,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(38,N'Để Tâm Không Bận',32,6,13,11,35,65000,52000,N'Tiếng Việt',N'Hương Linh',N'Bìa mềm',N' 13 x 19',N'02/12/2020',156,252.00,NULL,'detamkhongban.jpg',N'Nếu bận tâm, trọng lực sẽ dồn vào vai, khiến chúng ta căng thẳng.'+ CHAR(13) + CHAR(10) +N'Nếu không bận tâm, trọng lực sẽ được giải toả, chúng ta quay về một bản thân tự do tự tại như vốn dĩ.'+ CHAR(13) + CHAR(10) +N'Nếu bận tâm, những “người”, “vật”, và “hiện tượng” không đáp ứng được bận tâm ấy, tất thảy đều trở thành “kẻ địch”. Mỗi khi chạm trán kẻ địch, căng thẳng nảy sinh.'+ CHAR(13) + CHAR(10) +N'Nếu không bận tâm, “kẻ địch” trên nhân gian tiêu biến. Tâm hồn trong trẻo và an yên.' ,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(39,N'Đại Học Không Lạc Hướng',34,6,14,14,36,105000,89000,N'Tiếng Việt',NULL,N'Bìa mềm',N'20.5 x 15 x 0.7',N'01/01/2022',288,480.00 ,NULL,'daihoc.jpg',N'Kim Chỉ Nam Dành Cho Bạn Trẻ - Đại Học Không Lạc Hướng (2022)'+ CHAR(13) + CHAR(10) +N'Một người bình thường liệu có thể có một cuộc đời ngoạn mục? Câu trả lời tất nhiên là có! Vậy, một sinh viên tại một trường đại học hạng hai liệu có thể nắm trong tay mình một cuộc đời hạng nhất? Câu trả lời cũng hoàn toàn tương tự! Cuốn sách “Đại học không lạc hướng” của tác giả Lý Thượng Long đem đến một cái nhìn mới lạ về “lộ trình trưởng thành ngoạn mục” của bất cứ sinh viên ở bất cứ trường học nào, dù là trường hạng nhất, hay hạng hai.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(40,N'Sống Tối Giản',33,6,13,16,23,158000,126000,N'Tiếng Việt',N'Thục Quyên',N'Bìa mềm',N'20.5 x 13',N'01/09/2020',312,352.00,NULL,'songtoigian.jpg',N'Bạn nghĩ gì khi nghe đến cụm từ “sống tối giản”? Nếu bạn cũng giống như nhiều người khác, có lẽ bạn sẽ tưởng tượng ra sống tối giản là sống với những hình ảnh đơn điệu, khắc khổ, những bức tường trắng trống trơn, sự tằn tiện hết mức hoặc cảnh tượng một người ngồi trên sàn vì trong nhà không có lấy một món đồ nội thất. Đối với bạn, dường như đó là một bài tập khổ tu. “Thật buồn tẻ và nhạt nhẽo biết bao! Ai lại muốn làm vậy cơ chứ?!”, tác giả Joshua Becker thốt lên trong cuốn sách “Sống tối giản”.' ,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(41,N'Hạnh Phúc Là Hành Trình Không Phải Là Đích Đến',35,6,14,1,37,139000,120000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 19 x 13 x 0.5' ,N'01/01/2022',284,450.00 ,NULL,'hanhphuclahanhtrinh.jpg',N'Chúng ta thường tìm kiếm những điều đến từ bên ngoài và cho rằng chúng sẽ quyết định thái độ, suy nghĩ của chúng ta, nhưng thực ra, chính bản thân ta, với nguồn sức mạnh từ bên trong và tình yêu thương vốn có sẽ mang lại cho ta niềm vui, sự hứng khởi và niềm hạnh phúc. Hành trình tìm kiếm hạnh phúc tưởng như xa vời, khó khăn song lại vô cùng gần gũi, giản đơn, chỉ cần chúng ta nhìn lại và lắng nghe chính bản thân mình, Cuốn sách mang lại nguồn năng lượng tích cực cho người đọc cũng như thể hiện quan điểm sống có phần lý tưởng của tác giả.'+ CHAR(13) + CHAR(10) +N'Hạnh phúc là con đường bạn bước đi mỗi ngày, hãy vun đắp nó, thu nhận những điều tích cực để hành trình của bạn luôn ngập tràn niềm vui và thành công.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(42,N'Nghệ Thuật Kiến Tạo Động Lực Cho Nhân Viên',36,6,14,17,38,95000,81000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 20.5 x 14.5 ',N'01/03/2020',277,480.00, N'_QĐ/TV','taodonglucnguoitai.jpg ',N'KHI NHÂN SỰ ĐANG CẢM THẤY LẠC LỐI, NGƯỜI LÃNH ĐẠO KHÔNG THỂ NGÓ MẶT LÀM NGƠ'+ CHAR(13) + CHAR(10) +N'Những năm gần đây, cụm từ "Kiến tạo động lực" trở thành tâm điểm được tìm kiếm trên internet, đặc biệt là trong giới kinh doanh.'+ CHAR(13) + CHAR(10) +N'Tôi, dù có được hỏi hàng trăm lần về việc có hay không nên tìm hiểu về kiến tạo động lực cho nhân viên, thì câu trả lời vẫn luôn là "tất nhiên rồi". Dù bạn có là CEO, nhà quản lý, doanh nhân lỗi lạc hay chỉ là một nhà báo, sinh viên khối ngành kinh tế, chỉ cần bạn quan tâm tới quản lý tổ chức bạn nhất định nên đọc. Trên lộ trình đi tìm lời giải đáp cho những khúc mắc xoay quanh Kiến tạo động lực, tôi mong cuốn sách sẽ trở thành người đồng hành đáng tin tưởng của bạn.' ,0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(43,N'Lời Non Nước',37,6,15,5,5,70000,56000,N'Tiếng Việt',NULL,N'Bìa mềm',N' 13 x 20.5',N'01/03/2020',156,198.00,NULL,'loinonnuoc.jpg',N'Lời non nước - là những lời hay ý đẹp, luận định, luận điểm, quan niệm mang tính chất triết lí về sự đời, về thực tế cuộc sống và chiến đấu của Hồ Chủ tịch, được PGS. Đào Thản sưu tầm và tuyển chọn, xin trân trọng giới thiệu cùng bạn đọc. Sách thuộc bộ sách DI SẢN HỒ CHÍ MINH',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(44,N'Một Người Việt Trầm Lặng (Tái Bản 2020)',38,6,15,NULL,23,92000,74000,N'Tiếng Việt',N' Nguyễn Văn Sự',N'Bìa mềm',N'13 x 20.5',N'2020-08-25',208,242.00 ,NULL,'motngviet.jpg',N'Một người Việt trầm lặng của tác giả Jean-Claude Pomonti - thêm một tác phẩm độc đáo với những góc nhìn mới, về Thiếu tướng tình báo Phạm Xuân Ẩn. Một người Việt trầm lặng - món quà tri thức đầy trân trọng và ý nghĩa dành cho độc giả nhân dịp kỷ niệm sự kiện lịch sử 30-4 năm nay. Cùng với cuốn "X6- Điệp viên hoàn hảo" của Larry Berman, đây là cuốn không thể thiếu trên kệ sách lịch sử chiến tranh Việt Nam của mỗi gia đình người Việt.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(45,N'Christmas Gift',NULL,7,16,14,39,88000,70000,N'Tiếng Anh',NULL,N' Bìa cứng',N'21 x 21',N'2019-08-31',46,418.00,NULL,'giangisnh.jpg',N'Với những câu chuyện thú vị, được viết bằng ngôn ngữ tiếng Anh đơn giản, dễ hiểu, cùng tranh minh họa đẹp mắt, bộ sách The Seeds of love sẽ giúp các bé học tiếng Anh một cách hứng thú và hiệu quả hơn.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(46,N'Heidi',39,7,16,18,18,75000,85000,N'Tiếng Anh',NULL,N'Bìa mềm',N'13 x 19.9 x 1.6',N'2023-04-20',240,159.00,NULL,'heidi.jpg',N'Heidi is the heart-warming tale of a small girls power for good, and it has remained a firm favourite since it was published over 100 years ago. It tells of the orphan Heidi and her idyllic existence with her gruff grandfather in the mountains. When she is sent to live in a city, comic chaos ensues, and eventually it is arranged that Heidi should return to the mountains. Together she and her friend Peter, the goat-herd, achieve wondrous changes in the community in which they live.',0)
INSERT INTO [dbo].[Products]([ProductID], [ProductName], [AuthorID], [CategoryID], [GenreID], [PublisherID], [SupplierID], [CoverPrice], [SalePrice], [Language], [Translator], [Format], [Size], [PublishDate], [NumberOfPage], [Weight], [PublishingLicense], [Image], [Description], [Discontinued])VALUES(47,N'Pinocchio',40,7,16,18,18,75000,45000,N'Tiếng Anh',NULL,N'Bìa mềm',N'11.2 x 17.8 x 1.3',N'2023-05-13',192,120.00 ,NULL,'pinochio.jpg',N'Vẫn những câu chuyện cổ tích quen thuộc đã lớn lên cùng hàng trăm thế hệ độc giả, nhưng bộ truyện Cổ tích Ngày xửa ngày xưa với những hình vẽ đặc sắc, sống động sẽ khắc họa cho bạn những nàng công chúa, chàng hoàng tử của thế hệ mới: Vui tươi hơn, sinh động hơn và mạnh mẽ hơn.'+ CHAR(13) + CHAR(10) + N'Không chỉ vậy, mỗi cuốn sách sẽ là sự kết hợp giữa những câu chuyện kể và các trò chơi tương tác, giúp các bạn nhỏ có thể Nhớ lâu, nghĩ nhanh, viết hay. Những câu chuyện nhỏ giúp mở ra cho chúng ta một thế giới mới - thế giới của những điều đẹp đẽ, ấm áp và nhân văn nhất...',0)

SET IDENTITY_INSERT [dbo].[Products] OFF
GO



INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(1,1,2)
INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(2,4,5)
INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(3,6,3)
INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(4,9,4)
INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(5,15,3)
INSERT INTO [dbo].[Cart]([AccountID],[ProductID],[Quantity]) VALUES(6,43,1)

GO


SET IDENTITY_INSERT [dbo].[Warehouses] ON 
INSERT INTO [dbo].[Warehouses]([WarehouseID],[Location],[PhoneNumber]) VALUES(1,N'Ha Dong, Ha Noi',N'1900 9999')
INSERT INTO [dbo].[Warehouses]([WarehouseID],[Location],[PhoneNumber]) VALUES(2,N'Quan 1 , tp. Ho Chi Minh',N'1900 9999')
INSERT INTO [dbo].[Warehouses]([WarehouseID],[Location],[PhoneNumber]) VALUES(3,N'Can Tho',N'1900 9999')
INSERT INTO [dbo].[Warehouses]([WarehouseID],[Location],[PhoneNumber]) VALUES(4,N'Da nang',N'1900 9999')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO


INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,1,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,2,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,3,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,4,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,5,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,6,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,7,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,8,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,9,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,10,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,11,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,12,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,13,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,14,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,15,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,16,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,17,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,18,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,19,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,20,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,21,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,22,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,23,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,24,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,25,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,26,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,27,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,28,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,29,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,30,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,31,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,32,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,33,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,34,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,35,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,36,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,37,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,38,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,39,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,40,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,41,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,42,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,43,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,44,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,45,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,46,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,47,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,48,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,49,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(1,50,0)
GO
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,1,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,2,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,3,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,4,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,5,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,6,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,7,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,8,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,9,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,10,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,11,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,12,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,13,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,14,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,15,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,16,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,17,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,18,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,19,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,20,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,21,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,22,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,23,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,24,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,25,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,26,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,27,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,28,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,29,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,30,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,31,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,32,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,33,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,34,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,35,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,36,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,37,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,38,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,39,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,40,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,41,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,42,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,43,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,44,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,45,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,46,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,47,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,48,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,49,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(2,50,0)
GO

INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,1,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,2,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,3,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,4,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,5,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,6,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,7,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,8,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,9,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,10,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,11,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,12,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,13,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,14,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,15,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,16,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,17,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,18,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,19,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,20,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,21,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,22,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,23,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,24,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,25,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,26,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,27,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,28,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,29,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,30,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,31,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,32,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,33,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,34,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,35,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,36,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,37,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,38,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,39,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,40,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,41,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,42,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,43,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,44,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,45,1000)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,46,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,47,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,48,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,49,0)
INSERT INTO [dbo].[Inventories]([WarehouseID],[ProductID],[UnitsInStock]) VALUES(3,50,0)
GO




ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, /**SORT_IN_TEMPDB = OFF,**/ IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Categories]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [FirstName] ON [dbo].[Customers]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [LastName] ON [dbo].[Employees]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[Order Details]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[Order Details]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[Order Details]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[Order Details]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[Orders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[Orders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[Orders]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[Orders]
(
	[ShippedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[Orders]
(
	[ShipPostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[Products]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_SalePrice]  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
--ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
--GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_SalePrice]  DEFAULT ((0)) FOR [SalePrice]
GO
--ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
--GO
--ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
--GO
--ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
--GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO


ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [FK_Accounts_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO


ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO


ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Warehouses]
GO

ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Discount]
GO

ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Authors]
GO


ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Publisher]
GO


ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Supplier]
GO

ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Genre] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Genre]
GO

ALTER TABLE [dbo].[Reviews]  WITH NOCHECK ADD  CONSTRAINT [FK_Reviews_Order_Details] FOREIGN KEY([OrderID],[ProductID])
REFERENCES [dbo].[Order Details] ([OrderID],[ProductID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Order_Details]
GO

ALTER TABLE [dbo].[Reviews]  WITH NOCHECK ADD  CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customers]
GO

ALTER TABLE [dbo].[Cart]  WITH NOCHECK ADD  CONSTRAINT [FK_Cart_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Accounts]
GO

ALTER TABLE [dbo].[Cart]  WITH NOCHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO

ALTER TABLE [dbo].[Inventories]  WITH NOCHECK ADD  CONSTRAINT [FK_Inventories_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Inventories] CHECK CONSTRAINT [FK_Inventories_Products]
GO

ALTER TABLE [dbo].[Inventories]  WITH NOCHECK ADD  CONSTRAINT [FK_Inventories_Warehouses] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[Inventories] CHECK CONSTRAINT [FK_Inventories_Warehouses]
GO


--Constrant

ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Birthdate]
GO
--ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
--GO
--ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
--GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_SalePrice] CHECK  (([SalePrice]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_SalePrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_SalePrice] CHECK  (([SalePrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_SalePrice]
GO
--ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
--GO
--ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ReorderLevel]
--GO
--ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
--GO
--ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
--GO
--ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
--GO
--ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsOnOrder]
--GO
ALTER TABLE [dbo].[Reviews]  WITH NOCHECK ADD  CONSTRAINT [CK_Reviews_Rating] CHECK  (([Rating]>=(0)) AND ([Rating]<=(5)))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [CK_Reviews_Rating]
GO




------------------------Procedure -------------------

CREATE PROCEDURE createAccount(@CustomerID int, @FirstName nvarchar(50), @LastName nvarchar(50), @ContactTitle nvarchar(50), @DateOfBirth date, @Address nvarchar(100),  @PhoneNumber nvarchar(11),@AccountID int ,@Email nvarchar(50),@Password nvarchar(50), @Image nvarchar(100), @Status bit)
AS
BEGIN
    insert into Customers(CustomerID, FirstName , LastName,ContactTitle,[Gender],DateOfBirth,[Address],PhoneNumber,CreateDate) values(@CustomerID,@FirstName,@LastName,@ContactTitle,1,@DateOfBirth,@Address,@PhoneNumber,getDate())
	SET IDENTITY_INSERT [dbo].[Accounts] ON 
	insert into Accounts(AccountID ,Email, [Password],CustomerID,[Role],[Image],[Status]) values(@AccountID,@Email,@Password,@CustomerID,3,@Image,@Status)
	SET IDENTITY_INSERT [dbo].[Accounts] OFF
END;
GO

--exec createAccountt 340,'vu','vu','vu','2022-01-01','vu','vu',116,'email','vu','',1 go

CREATE PROCEDURE updateAccount(@CustomerID int, @FirstName nvarchar(50), @LastName nvarchar(50), @ContactTitle nvarchar(50), @DateOfBirth date, @Address nvarchar(50),  @PhoneNumber nvarchar(11),@Email nvarchar(50),@Password nvarchar(50))
AS
BEGIN
    UPDATE Customers SET FirstName = @FirstName, LastName = @LastName, ContactTitle=@ContactTitle, DateOfBirth= @DateOfBirth, [Address]=@Address, PhoneNumber= @PhoneNumber  WHERE CustomerID=@CustomerID
	UPDATE Accounts SET [Password] = @Password WHERE Email=@Email
END;
GO

CREATE PROCEDURE ConfirmCompletionOrder(@OrderID int, @ProductID int, @WarehouseID int, @Quantity int)
AS
BEGIN
    UPDATE Orders SET ShippedDate = Getdate() where OrderID = @OrderID
	UPDATE Inventories SET UnitsInStock = UnitsInStock - @Quantity where ProductID = @ProductID AND WarehouseID = @WarehouseID
END;
GO


create proc [dbo].[OrderAction] (@AccountID int, @OrderID int, @CustomerID int, @ShipAddress nvarchar(100), @ShipCity nvarchar(100), @ShipPostalCode nvarchar(100),  @DiscountID nvarchar(50))
as
begin
	IF EXISTS(SELECT * FROM Accounts WHERE AccountID = @AccountID)
	begin 
		if EXISTS(select * from Cart where AccountID = @AccountID)
		begin

			SET IDENTITY_INSERT [dbo].[Orders] ON 
			INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShipAddress], [ShipCity], [ShipPostalCode], [Status]) 
			VALUES(@OrderID,@CustomerID, getdate(), DATEADD(day, 7,GETDATE()), @ShipAddress, @ShipCity, @ShipPostalCode, 1)
			SET IDENTITY_INSERT [dbo].[Orders] OFF
			
			declare @discount float;
			select @discount = Percentage from Discount where DiscountID = @DiscountID
			
			INSERT INTO [Order Details](OrderID, ProductID, SalePrice, Quantity,DiscountID,WarehouseID) 
			SELECT
				@OrderID,
				c.ProductID,
				p.SalePrice -(p.SalePrice * @discount),
				c.Quantity,
				@DiscountID
				, 1
			FROM
				Cart c, Products p
			Where c.AccountID=@AccountID AND c.ProductID=p.ProductID

			delete Cart where AccountID=@AccountID
		end
	end
end;
GO
CREATE PROCEDURE createAccountEmp(@EmployeeID int, @FirstName nvarchar(50), @LastName nvarchar(50), @Gender bit, @AccountID int ,@Email nvarchar(50),@Password nvarchar(50))
AS
BEGIN
	SET IDENTITY_INSERT [dbo].[Employees] ON 
    INSERT INTO [Employees]([EmployeeID],[LastName],[FirstName],[DepartmentID],[Gender],[HireDate],[Status]) values(@EmployeeID, @LastName, @FirstName,2, 1, GETDATE(), 0)
	SET IDENTITY_INSERT [dbo].[Employees] OFF
	SET IDENTITY_INSERT [dbo].[Accounts] ON 
	insert into Accounts(AccountID ,Email, [Password],[EmployeeID],[Role],[Status]) values(@AccountID,@Email,@Password,@EmployeeID,2,0)
	SET IDENTITY_INSERT [dbo].[Accounts] OFF
END;
GO

--exec OrderAction 1,12346,1,'FPTU, HN, VN','HN', '2345', 'SIEUSAPSAN40'

--insert into Cart values(1,3,4)
--INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (40303, 11, 7, CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime),NULL, 107.8300, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')

--INSERT [dbo].[Order Details] ([OrderID], [ProductID], [WarehouseID], [SalePrice], [Quantity], [DiscountID]) VALUES (40303, 2, 1, 14.7000, 40, NULL)
--exec ConfirmCompletionOrder 40303 , 2 , 1, 40

--update Discount set Quantity = 3 Where DiscountID='SIEUSAPSAN40'
--select * from Discount

