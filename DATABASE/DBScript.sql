USE [master]
GO
/****** Object:  Database [JQGrid4U]    Script Date: 12/25/2015 7:24:31 PM ******/
CREATE DATABASE [JQGrid4U] ON  PRIMARY 
( NAME = N'JQGrid4U', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\JQGrid4U.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JQGrid4U_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\JQGrid4U_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JQGrid4U] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JQGrid4U].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JQGrid4U] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JQGrid4U] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JQGrid4U] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JQGrid4U] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JQGrid4U] SET ARITHABORT OFF 
GO
ALTER DATABASE [JQGrid4U] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JQGrid4U] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JQGrid4U] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JQGrid4U] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JQGrid4U] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JQGrid4U] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JQGrid4U] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JQGrid4U] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JQGrid4U] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JQGrid4U] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JQGrid4U] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JQGrid4U] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JQGrid4U] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JQGrid4U] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JQGrid4U] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JQGrid4U] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JQGrid4U] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JQGrid4U] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JQGrid4U] SET  MULTI_USER 
GO
ALTER DATABASE [JQGrid4U] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JQGrid4U] SET DB_CHAINING OFF 
GO
USE [JQGrid4U]
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteProduct]    Script Date: 12/25/2015 7:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteProduct]
	@ProductID INT
AS

	DELETE FROM [dbo].[Product]
	WHERE ProductID=@ProductID

	SELECT @@ROWCOUNT






GO
/****** Object:  StoredProcedure [dbo].[uspInsertProduct]    Script Date: 12/25/2015 7:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProduct]
	@ProductName nvarchar(100)
	,@ProductCode nvarchar(10)
	,@StockLevel float
	,@ReOrderLevel float
	,@CostPrice money
	,@SellingPrice money
	,@ExpiryDate datetime
AS
	INSERT INTO [dbo].[Product]
	([ProductName],[ProductCode],[StockLevel],[ReOrderLevel],[CostPrice],[SellingPrice],[ExpiryDate])
	VALUES
	(@ProductName,@ProductCode,@StockLevel,@ReOrderLevel,@CostPrice,@SellingPrice,@ExpiryDate)

	SELECT @@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[uspSelectProduct]    Script Date: 12/25/2015 7:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspSelectProduct]

AS
SELECT [ProductID]
      ,[ProductName]
      ,[ProductCode]
      ,[StockLevel]
      ,[ReOrderLevel]
      ,[CostPrice]
      ,[SellingPrice]
      ,[ExpiryDate]
  FROM [dbo].[Product]
  ORDER BY [ProductName]





GO
/****** Object:  StoredProcedure [dbo].[uspUpdateProduct]    Script Date: 12/25/2015 7:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateProduct]
	@ProductID INT
	,@ProductName nvarchar(100)
	,@ProductCode nvarchar(10)
	,@StockLevel float
	,@ReOrderLevel float
	,@CostPrice money
	,@SellingPrice money
	,@ExpiryDate datetime
AS

	UPDATE [dbo].[Product]
	SET [ProductName] = @ProductName
	,[ProductCode] = @ProductCode
	,[StockLevel] = @StockLevel
	,[ReOrderLevel] = @ReOrderLevel
	,[CostPrice] = @CostPrice
	,[SellingPrice] = @SellingPrice
	,[ExpiryDate] = @ExpiryDate
	WHERE ProductID=@ProductID

	SELECT @@ROWCOUNT






GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/25/2015 7:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductCode] [nvarchar](10) NULL,
	[StockLevel] [float] NOT NULL,
	[ReOrderLevel] [float] NOT NULL,
	[CostPrice] [money] NOT NULL,
	[SellingPrice] [money] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (1, N'AAdjustable Race', N'AR-5381', 1000, 750, 30.0000, 100.0000, CAST(0x00009B4900000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (2, N'Bearing Ball', N'BA-8327', 1000, 750, 0.0000, 0.0000, CAST(0x0000AC9900000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (3, N'BB Ball Bearing', N'BE-2349', 800, 600, 50.0000, 78.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (4, N'Headset Ball Bearings', N'BE-2908', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (6, N'LL Crankarm', N'CA-5965', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (7, N'ML Crankarm', N'CA-6738', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (8, N'HL Crankarm', N'CA-7457', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (9, N'Chainring Bolts', N'CB-2903', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (10, N'Chainring Nut', N'CN-6137', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (11, N'Chainring', N'CR-7833', 1000, 750, 0.0000, 0.0000, CAST(0x0000A57600000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (12, N'Crown Race', N'CR-9981', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (13, N'Chain Stays', N'CS-2812', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (14, N'Decal 1', N'DC-8732', 1000, 750, 0.0000, 0.0000, CAST(0x0000A57F00000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (15, N'Decal 2', N'DC-9824', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (16, N'Down Tube', N'DT-2377', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (17, N'Mountain End Caps', N'EC-M092', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (18, N'Road End Caps', N'EC-R098', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (19, N'Touring End Caps', N'EC-T209', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (20, N'Fork End', N'FE-3760', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (21, N'Freewheel', N'FH-2981', 500, 375, 0.0000, 0.0000, CAST(0x00009B6400000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (22, N'Flat Washer 1', N'FW-1000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (23, N'Flat Washer 6', N'FW-1200', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (24, N'Flat Washer 2', N'FW-1400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (25, N'Flat Washer 9', N'FW-3400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (26, N'Flat Washer 4', N'FW-3800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (27, N'Flat Washer 3', N'FW-5160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (28, N'Flat Washer 8', N'FW-5800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (29, N'Flat Washer 5', N'FW-7160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (30, N'Flat Washer 7', N'FW-9160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (31, N'Fork Crown', N'FC-3654', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (32, N'Front Derailleur Cage', N'FC-3982', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (33, N'Front Derailleur Linkage', N'FL-2301', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (34, N'Guide Pulley', N'GP-0982', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (35, N'LL Grip Tape', N'GT-0820', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (36, N'ML Grip Tape', N'GT-1209', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (37, N'HL Grip Tape', N'GT-2908', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (38, N'Thin-Jam Hex Nut 9', N'HJ-1213', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (39, N'Thin-Jam Hex Nut 10', N'HJ-1220', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (40, N'Thin-Jam Hex Nut 1', N'HJ-1420', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (41, N'Thin-Jam Hex Nut 2', N'HJ-1428', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (42, N'Thin-Jam Hex Nut 15', N'HJ-3410', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (43, N'Thin-Jam Hex Nut 16', N'HJ-3416', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (44, N'Thin-Jam Hex Nut 5', N'HJ-3816', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (45, N'Thin-Jam Hex Nut 6', N'HJ-3824', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (46, N'Thin-Jam Hex Nut 3', N'HJ-5161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (47, N'Thin-Jam Hex Nut 4', N'HJ-5162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (48, N'Thin-Jam Hex Nut 13', N'HJ-5811', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (49, N'Thin-Jam Hex Nut 14', N'HJ-5818', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (50, N'Thin-Jam Hex Nut 7', N'HJ-7161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (51, N'Thin-Jam Hex Nut 8', N'HJ-7162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (52, N'Thin-Jam Hex Nut 12', N'HJ-9080', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (53, N'Thin-Jam Hex Nut 11', N'HJ-9161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (54, N'Hex Nut 5', N'HN-1024', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (55, N'Hex Nut 6', N'HN-1032', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (56, N'Hex Nut 16', N'HN-1213', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (57, N'Hex Nut 17', N'HN-1220', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (58, N'Hex Nut 7', N'HN-1224', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (59, N'Hex Nut 8', N'HN-1420', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (60, N'Hex Nut 9', N'HN-1428', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (61, N'Hex Nut 22', N'HN-3410', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (62, N'Hex Nut 23', N'HN-3416', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (63, N'Hex Nut 12', N'HN-3816', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (64, N'Hex Nut 13', N'HN-3824', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (65, N'Hex Nut 1', N'HN-4402', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (66, N'Hex Nut 10', N'HN-5161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (67, N'Hex Nut 11', N'HN-5162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (68, N'Hex Nut 2', N'HN-5400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (69, N'Hex Nut 20', N'HN-5811', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (70, N'Hex Nut 21', N'HN-5818', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (71, N'Hex Nut 3', N'HN-6320', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (72, N'Hex Nut 14', N'HN-7161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (73, N'Hex Nut 15', N'HN-7162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (74, N'Hex Nut 4', N'HN-8320', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (75, N'Hex Nut 18', N'HN-9161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (76, N'Hex Nut 19', N'HN-9168', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (77, N'Handlebar Tube', N'HT-2981', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (78, N'Head Tube', N'HT-8019', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (79, N'LL Hub', N'HU-6280', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (80, N'HL Hub', N'HU-8998', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (81, N'Keyed Washer', N'KW-4091', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (82, N'External Lock Washer 3', N'LE-1000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (83, N'External Lock Washer 4', N'LE-1200', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (84, N'External Lock Washer 9', N'LE-1201', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (85, N'External Lock Washer 5', N'LE-1400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (86, N'External Lock Washer 7', N'LE-3800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (87, N'External Lock Washer 6', N'LE-5160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (88, N'External Lock Washer 1', N'LE-6000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (89, N'External Lock Washer 8', N'LE-7160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (90, N'External Lock Washer 2', N'LE-8000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (91, N'Internal Lock Washer 3', N'LI-1000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (92, N'Internal Lock Washer 4', N'LI-1200', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (93, N'Internal Lock Washer 9', N'LI-1201', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (94, N'Internal Lock Washer 5', N'LI-1400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (95, N'Internal Lock Washer 7', N'LI-3800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (96, N'Internal Lock Washer 6', N'LI-5160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (97, N'Internal Lock Washer 10', N'LI-5800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (98, N'Internal Lock Washer 1', N'LI-6000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (99, N'Internal Lock Washer 8', N'LI-7160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (100, N'Internal Lock Washer 2', N'LI-8000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (101, N'Thin-Jam Lock Nut 9', N'LJ-1213', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (102, N'Thin-Jam Lock Nut 10', N'LJ-1220', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (103, N'Thin-Jam Lock Nut 1', N'LJ-1420', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (104, N'Thin-Jam Lock Nut 2', N'LJ-1428', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (105, N'Thin-Jam Lock Nut 15', N'LJ-3410', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (106, N'Thin-Jam Lock Nut 16', N'LJ-3416', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (107, N'Thin-Jam Lock Nut 5', N'LJ-3816', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (108, N'Thin-Jam Lock Nut 6', N'LJ-3824', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (109, N'Thin-Jam Lock Nut 3', N'LJ-5161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (110, N'Thin-Jam Lock Nut 4', N'LJ-5162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (111, N'Thin-Jam Lock Nut 13', N'LJ-5811', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (112, N'Thin-Jam Lock Nut 14', N'LJ-5818', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (113, N'Thin-Jam Lock Nut 7', N'LJ-7161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (114, N'Thin-Jam Lock Nut 8', N'LJ-7162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (115, N'Thin-Jam Lock Nut 12', N'LJ-9080', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (116, N'Thin-Jam Lock Nut 11', N'LJ-9161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (117, N'Lock Nut 5', N'LN-1024', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (118, N'Lock Nut 6', N'LN-1032', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (119, N'Lock Nut 16', N'LN-1213', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (120, N'Lock Nut 17', N'LN-1220', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (121, N'Lock Nut 7', N'LN-1224', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (122, N'Lock Nut 8', N'LN-1420', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (123, N'Lock Nut 9', N'LN-1428', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (124, N'Lock Nut 22', N'LN-3410', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (125, N'Lock Nut 23', N'LN-3416', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (126, N'Lock Nut 12', N'LN-3816', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (127, N'Lock Nut 13', N'LN-3824', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (128, N'Lock Nut 1', N'LN-4400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (129, N'Lock Nut 10', N'LN-5161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (130, N'Lock Nut 11', N'LN-5162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (131, N'Lock Nut 2', N'LN-5400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (132, N'Lock Nut 20', N'LN-5811', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (133, N'Lock Nut 21', N'LN-5818', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (134, N'Lock Nut 3', N'LN-6320', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (135, N'Lock Nut 14', N'LN-7161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (136, N'Lock Nut 15', N'LN-7162', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (137, N'Lock Nut 4', N'LN-8320', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (138, N'Lock Nut 19', N'LN-9080', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (139, N'Lock Nut 18', N'LN-9161', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (140, N'Lock Ring', N'LR-2398', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (141, N'Lower Head Race', N'LR-8520', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (142, N'Lock Washer 4', N'LW-1000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (143, N'Lock Washer 5', N'LW-1200', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (144, N'Lock Washer 10', N'LW-1201', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (145, N'Lock Washer 6', N'LW-1400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (146, N'Lock Washer 13', N'LW-3400', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (147, N'Lock Washer 8', N'LW-3800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (148, N'Lock Washer 1', N'LW-4000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (149, N'Lock Washer 7', N'LW-5160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (150, N'Lock Washer 12', N'LW-5800', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (151, N'Lock Washer 2', N'LW-6000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (152, N'Lock Washer 9', N'LW-7160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (153, N'Lock Washer 3', N'LW-8000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (154, N'Lock Washer 11', N'LW-9160', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (155, N'Metal Angle', N'MA-7075', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (156, N'Metal Bar 1', N'MB-2024', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (157, N'Metal Bar 2', N'MB-6061', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (158, N'Metal Plate 2', N'MP-2066', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (159, N'Metal Plate 1', N'MP-2503', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (160, N'Metal Plate 3', N'MP-4960', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (161, N'Metal Sheet 2', N'MS-0253', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (162, N'Metal Sheet 3', N'MS-1256', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (163, N'Metal Sheet 7', N'MS-1981', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (164, N'Metal Sheet 4', N'MS-2259', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (165, N'Metal Sheet 5', N'MS-2341', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (166, N'Metal Sheet 6', N'MS-2348', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (167, N'Metal Sheet 1', N'MS-6061', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (168, N'Metal Tread Plate', N'MT-1000', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (169, N'LL Nipple', N'NI-4127', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (170, N'HL Nipple', N'NI-9522', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (171, N'Paint - Black', N'PA-187B', 60, 45, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (172, N'Paint - Red', N'PA-361R', 60, 45, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (173, N'Paint - Silver', N'PA-529S', 60, 45, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (174, N'Paint - Blue', N'PA-632U', 60, 45, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (175, N'Paint - Yellow', N'PA-823Y', 60, 45, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (176, N'Pinch Bolt', N'PB-6109', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (177, N'Cup-Shaped Race', N'RA-2345', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (178, N'Cone-Shaped Race', N'RA-7490', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (179, N'Reflector', N'RF-9198', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (180, N'LL Mountain Rim', N'RM-M464', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (181, N'ML Mountain Rim', N'RM-M692', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (182, N'HL Mountain Rim', N'RM-M823', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (183, N'LL Road Rim', N'RM-R436', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (184, N'ML Road Rim', N'RM-R600', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (185, N'HL Road Rim', N'RM-R800', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (186, N'Touring Rim', N'RM-T801', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (187, N'LL Mountain Seat Assembly', N'SA-M198', 500, 375, 98.7700, 133.3400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (188, N'ML Mountain Seat Assembly', N'SA-M237', 500, 375, 108.9900, 147.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (189, N'HL Mountain Seat Assembly', N'SA-M687', 500, 375, 145.8700, 196.9200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (190, N'LL Road Seat Assembly', N'SA-R127', 500, 375, 98.7700, 133.3400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (191, N'ML Road Seat Assembly', N'SA-R430', 500, 375, 108.9900, 147.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (192, N'HL Road Seat Assembly', N'SA-R522', 500, 375, 145.8700, 196.9200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (193, N'LL Touring Seat Assembly', N'SA-T467', 500, 375, 98.7700, 133.3400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (194, N'ML Touring Seat Assembly', N'SA-T612', 500, 375, 108.9900, 147.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (195, N'HL Touring Seat Assembly', N'SA-T872', 500, 375, 145.8700, 196.9200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (196, N'LL Spindle/Axle', N'SD-2342', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (197, N'HL Spindle/Axle', N'SD-9872', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (198, N'LL Shell', N'SH-4562', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (199, N'HL Shell', N'SH-9312', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (200, N'Spokes', N'SK-9283', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (201, N'Seat Lug', N'SL-0931', 1000, 750, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (202, N'Stem', N'SM-9087', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (203, N'Seat Post', N'SP-2981', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (204, N'Steerer', N'SR-2098', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (205, N'Seat Stays', N'SS-2985', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (206, N'Seat Tube', N'ST-9828', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (207, N'Top Tube', N'TO-2301', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (208, N'Tension Pulley', N'TP-0923', 800, 600, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (209, N'Rear Derailleur Cage', N'RC-0291', 500, 375, 0.0000, 0.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (210, N'HL Road Frame - Black, 58', N'FR-R92B-58', 500, 375, 1059.3100, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (211, N'HL Road Frame - Red, 58', N'FR-R92R-58', 500, 375, 1059.3100, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (212, N'Sport-100 Helmet, Red', N'HL-U509-R', 4, 3, 13.0863, 34.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (213, N'Sport-100 Helmet, Black', N'HL-U509', 4, 3, 13.0863, 34.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (214, N'Mountain Bike Socks, M', N'SO-B909-M', 4, 3, 3.3963, 9.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (215, N'Mountain Bike Socks, L', N'SO-B909-L', 4, 3, 3.3963, 9.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (216, N'Sport-100 Helmet, Blue', N'HL-U509-B', 4, 3, 13.0863, 34.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (217, N'Long-Sleeve Logo Jersey, S', N'LJ-0192-S', 4, 3, 38.4923, 49.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (218, N'Long-Sleeve Logo Jersey, M', N'LJ-0192-M', 4, 3, 38.4923, 49.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (219, N'Long-Sleeve Logo Jersey, L', N'LJ-0192-L', 4, 3, 38.4923, 49.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (220, N'Long-Sleeve Logo Jersey, XL', N'LJ-0192-X', 4, 3, 38.4923, 49.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (221, N'HL Road Frame - Red, 62', N'FR-R92R-62', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (222, N'HL Road Frame - Red, 44', N'FR-R92R-44', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (223, N'HL Road Frame - Red, 48', N'FR-R92R-48', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (224, N'HL Road Frame - Red, 52', N'FR-R92R-52', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (225, N'HL Road Frame - Red, 56', N'FR-R92R-56', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (226, N'LL Road Frame - Black, 58', N'FR-R38B-58', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (227, N'LL Road Frame - Black, 60', N'FR-R38B-60', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (228, N'LL Road Frame - Black, 62', N'FR-R38B-62', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (229, N'LL Road Frame - Red, 44', N'FR-R38R-44', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (230, N'LL Road Frame - Red, 48', N'FR-R38R-48', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (231, N'LL Road Frame - Red, 52', N'FR-R38R-52', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (232, N'LL Road Frame - Red, 58', N'FR-R38R-58', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (233, N'LL Road Frame - Red, 60', N'FR-R38R-60', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (234, N'LL Road Frame - Red, 62', N'FR-R38R-62', 500, 375, 187.1571, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (235, N'ML Road Frame - Red, 44', N'FR-R72R-44', 500, 375, 352.1394, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (236, N'ML Road Frame - Red, 48', N'FR-R72R-48', 500, 375, 352.1394, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (237, N'ML Road Frame - Red, 52', N'FR-R72R-52', 500, 375, 352.1394, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (238, N'ML Road Frame - Red, 58', N'FR-R72R-58', 500, 375, 352.1394, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (239, N'ML Road Frame - Red, 60', N'FR-R72R-60', 500, 375, 352.1394, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (240, N'LL Road Frame - Black, 44', N'FR-R38B-44', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (241, N'LL Road Frame - Black, 48', N'FR-R38B-48', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (242, N'LL Road Frame - Black, 52', N'FR-R38B-52', 500, 375, 204.6251, 337.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (243, N'HL Mountain Frame - Silver, 42', N'FR-M94S-42', 500, 375, 747.2002, 1364.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (244, N'HL Mountain Frame - Silver, 44', N'FR-M94S-44', 500, 375, 706.8110, 1364.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (245, N'HL Mountain Frame - Silver, 48', N'FR-M94S-52', 500, 375, 706.8110, 1364.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (246, N'HL Mountain Frame - Silver, 46', N'FR-M94S-46', 500, 375, 747.2002, 1364.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (247, N'HL Mountain Frame - Black, 42', N'FR-M94B-42', 500, 375, 739.0410, 1349.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (248, N'HL Mountain Frame - Black, 44', N'FR-M94B-44', 500, 375, 699.0928, 1349.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (249, N'HL Mountain Frame - Black, 48', N'FR-M94B-48', 500, 375, 699.0928, 1349.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (250, N'HL Mountain Frame - Black, 46', N'FR-M94B-46', 500, 375, 739.0410, 1349.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (251, N'HL Mountain Frame - Black, 38', N'FR-M94B-38', 500, 375, 739.0410, 1349.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (252, N'HL Mountain Frame - Silver, 38', N'FR-M94S-38', 500, 375, 747.2002, 1364.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (253, N'Road-150 Red, 62', N'BK-R93R-62', 100, 75, 2171.2942, 3578.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (254, N'Road-150 Red, 44', N'BK-R93R-44', 100, 75, 2171.2942, 3578.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (255, N'Road-150 Red, 48', N'BK-R93R-48', 100, 75, 2171.2942, 3578.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (256, N'Road-150 Red, 52', N'BK-R93R-52', 100, 75, 2171.2942, 3578.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (257, N'Road-150 Red, 56', N'BK-R93R-56', 100, 75, 2171.2942, 3578.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (258, N'Road-450 Red, 58', N'BK-R68R-58', 100, 75, 884.7083, 1457.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (259, N'Road-450 Red, 60', N'BK-R68R-60', 100, 75, 884.7083, 1457.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (260, N'Road-450 Red, 44', N'BK-R68R-44', 100, 75, 884.7083, 1457.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (261, N'Road-450 Red, 48', N'BK-R68R-48', 100, 75, 884.7083, 1457.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (262, N'Road-450 Red, 52', N'BK-R68R-52', 100, 75, 884.7083, 1457.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (263, N'Road-650 Red, 58', N'BK-R50R-58', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (264, N'Road-650 Red, 60', N'BK-R50R-60', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (265, N'Road-650 Red, 62', N'BK-R50R-62', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (266, N'Road-650 Red, 44', N'BK-R50R-44', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (267, N'Road-650 Red, 48', N'BK-R50R-48', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (268, N'Road-650 Red, 52', N'BK-R50R-52', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (269, N'Road-650 Black, 58', N'BK-R50B-58', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (270, N'Road-650 Black, 60', N'BK-R50B-60', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (271, N'Road-650 Black, 62', N'BK-R50B-62', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (272, N'Road-650 Black, 44', N'BK-R50B-44', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (273, N'Road-650 Black, 48', N'BK-R50B-48', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (274, N'Road-650 Black, 52', N'BK-R50B-52', 100, 75, 486.7066, 782.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (275, N'Mountain-100 Silver, 38', N'BK-M82S-38', 100, 75, 1912.1544, 3399.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (276, N'Mountain-100 Silver, 42', N'BK-M82S-42', 100, 75, 1912.1544, 3399.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (277, N'Mountain-100 Silver, 44', N'BK-M82S-44', 100, 75, 1912.1544, 3399.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (278, N'Mountain-100 Silver, 48', N'BK-M82S-48', 100, 75, 1912.1544, 3399.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (279, N'Mountain-100 Black, 38', N'BK-M82B-38', 100, 75, 1898.0944, 3374.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (280, N'Mountain-100 Black, 42', N'BK-M82B-42', 100, 75, 1898.0944, 3374.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (281, N'Mountain-100 Black, 44', N'BK-M82B-44', 100, 75, 1898.0944, 3374.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (282, N'Mountain-100 Black, 48', N'BK-M82B-48', 100, 75, 1898.0944, 3374.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (283, N'Mountain-200 Silver, 38', N'BK-M68S-38', 100, 75, 1265.6195, 2319.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (284, N'Mountain-200 Silver, 42', N'BK-M68S-42', 100, 75, 1265.6195, 2319.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (285, N'Mountain-200 Silver, 46', N'BK-M68S-46', 100, 75, 1265.6195, 2319.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (286, N'Mountain-200 Black, 38', N'BK-M68B-38', 100, 75, 1251.9813, 2294.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (287, N'Mountain-200 Black, 42', N'BK-M68B-42', 100, 75, 1251.9813, 2294.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (288, N'Mountain-200 Black, 46', N'BK-M68B-46', 100, 75, 1251.9813, 2294.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (289, N'Mountain-300 Black, 38', N'BK-M47B-38', 100, 75, 598.4354, 1079.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (290, N'Mountain-300 Black, 40', N'BK-M47B-40', 100, 75, 598.4354, 1079.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (291, N'Mountain-300 Black, 44', N'BK-M47B-44', 100, 75, 598.4354, 1079.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (292, N'Mountain-300 Black, 48', N'BK-M47B-48', 100, 75, 598.4354, 1079.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (293, N'Road-250 Red, 44', N'BK-R89R-44', 100, 75, 1518.7864, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (294, N'Road-250 Red, 48', N'BK-R89R-48', 100, 75, 1518.7864, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (295, N'Road-250 Red, 52', N'BK-R89R-52', 100, 75, 1518.7864, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (296, N'Road-250 Red, 58', N'BK-R89R-58', 100, 75, 1554.9479, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (297, N'Road-250 Black, 44', N'BK-R89B-44', 100, 75, 1554.9479, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (298, N'Road-250 Black, 48', N'BK-R89B-48', 100, 75, 1554.9479, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (299, N'Road-250 Black, 52', N'BK-R89B-52', 100, 75, 1554.9479, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (300, N'Road-250 Black, 58', N'BK-R89B-58', 100, 75, 1554.9479, 2443.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (301, N'Road-550-W Yellow, 38', N'BK-R64Y-38', 100, 75, 713.0798, 1120.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (302, N'Road-550-W Yellow, 40', N'BK-R64Y-40', 100, 75, 713.0798, 1120.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (303, N'Road-550-W Yellow, 42', N'BK-R64Y-42', 100, 75, 713.0798, 1120.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (304, N'Road-550-W Yellow, 44', N'BK-R64Y-44', 100, 75, 713.0798, 1120.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (305, N'Road-550-W Yellow, 48', N'BK-R64Y-48', 100, 75, 713.0798, 1120.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (306, N'LL Fork', N'FK-1639', 500, 375, 65.8097, 148.2200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (307, N'ML Fork', N'FK-5136', 500, 375, 77.9176, 175.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (308, N'HL Fork', N'FK-9939', 500, 375, 101.8936, 229.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (309, N'LL Headset', N'HS-0296', 500, 375, 15.1848, 34.2000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (310, N'ML Headset', N'HS-2451', 500, 375, 45.4168, 102.2900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (311, N'HL Headset', N'HS-3479', 500, 375, 55.3801, 124.7300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (312, N'LL Mountain Handlebars', N'HB-M243', 500, 375, 19.7758, 44.5400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (313, N'ML Mountain Handlebars', N'HB-M763', 500, 375, 27.4925, 61.9200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (314, N'HL Mountain Handlebars', N'HB-M918', 500, 375, 53.3999, 120.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (315, N'LL Road Handlebars', N'HB-R504', 500, 375, 19.7758, 44.5400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (316, N'ML Road Handlebars', N'HB-R720', 500, 375, 27.4925, 61.9200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (317, N'HL Road Handlebars', N'HB-R956', 500, 375, 53.3999, 120.2700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (318, N'ML Mountain Frame - Black, 38', N'FR-M63B-38', 500, 375, 185.8193, 348.7600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (319, N'LL Mountain Front Wheel', N'FW-M423', 500, 375, 26.9708, 60.7450, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (320, N'ML Mountain Front Wheel', N'FW-M762', 500, 375, 92.8071, 209.0250, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (321, N'HL Mountain Front Wheel', N'FW-M928', 500, 375, 133.2955, 300.2150, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (322, N'LL Road Front Wheel', N'FW-R623', 500, 375, 37.9909, 85.5650, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (323, N'ML Road Front Wheel', N'FW-R762', 500, 375, 110.2829, 248.3850, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (324, N'HL Road Front Wheel', N'FW-R820', 500, 375, 146.5466, 330.0600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (325, N'Touring Front Wheel', N'FW-T905', 500, 375, 96.7964, 218.0100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (326, N'ML Road Frame-W - Yellow, 38', N'FR-R72Y-38', 500, 375, 360.9428, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (327, N'LL Mountain Rear Wheel', N'RW-M423', 500, 375, 38.9588, 87.7450, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (328, N'ML Mountain Rear Wheel', N'RW-M762', 500, 375, 104.7951, 236.0250, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (329, N'HL Mountain Rear Wheel', N'RW-M928', 500, 375, 145.2835, 327.2150, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (330, N'LL Road Rear Wheel', N'RW-R623', 500, 375, 49.9789, 112.5650, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (331, N'ML Road Rear Wheel', N'RW-R762', 500, 375, 122.2709, 275.3850, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (332, N'HL Road Rear Wheel', N'RW-R820', 500, 375, 158.5346, 357.0600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (333, N'Touring Rear Wheel', N'RW-T905', 500, 375, 108.7844, 245.0100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (334, N'ML Mountain Frame - Black, 40', N'FR-M63B-40', 500, 375, 185.8193, 348.7600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (335, N'ML Mountain Frame - Black, 44', N'FR-M63B-44', 500, 375, 185.8193, 348.7600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (336, N'ML Mountain Frame - Black, 48', N'FR-M63B-48', 500, 375, 185.8193, 348.7600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (337, N'ML Road Frame-W - Yellow, 40', N'FR-R72Y-40', 500, 375, 360.9428, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (338, N'ML Road Frame-W - Yellow, 42', N'FR-R72Y-42', 500, 375, 360.9428, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (339, N'ML Road Frame-W - Yellow, 44', N'FR-R72Y-44', 500, 375, 360.9428, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (340, N'ML Road Frame-W - Yellow, 48', N'FR-R72Y-48', 500, 375, 360.9428, 594.8300, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (341, N'HL Road Frame - Black, 62', N'FR-R92B-62', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (342, N'HL Road Frame - Black, 44', N'FR-R92B-44', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (343, N'HL Road Frame - Black, 48', N'FR-R92B-48', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (344, N'HL Road Frame - Black, 52', N'FR-R92B-52', 500, 375, 868.6342, 1431.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (345, N'Men''s Sports Shorts, S', N'SH-M897-S', 4, 3, 24.7459, 59.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (346, N'Touring-Panniers, Large', N'PA-T100', 4, 3, 51.5625, 125.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (347, N'Cable Lock', N'LO-C100', 4, 3, 10.3125, 25.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (348, N'Minipump', N'PU-0452', 4, 3, 8.2459, 19.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (349, N'Mountain Pump', N'PU-M044', 4, 3, 10.3084, 24.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (350, N'Taillights - Battery-Powered', N'LT-T990', 4, 3, 5.7709, 13.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (351, N'Headlights - Dual-Beam', N'LT-H902', 4, 3, 14.4334, 34.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (352, N'Headlights - Weatherproof', N'LT-H903', 4, 3, 18.5584, 44.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (353, N'Men''s Sports Shorts, M', N'SH-M897-M', 4, 3, 24.7459, 59.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (354, N'Men''s Sports Shorts, L', N'SH-M897-L', 4, 3, 24.7459, 59.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (355, N'Men''s Sports Shorts, XL', N'SH-M897-X', 4, 3, 24.7459, 59.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (356, N'Women''s Tights, S', N'TG-W091-S', 4, 3, 30.9334, 74.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (357, N'Women''s Tights, M', N'TG-W091-M', 4, 3, 30.9334, 74.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (358, N'Women''s Tights, L', N'TG-W091-L', 4, 3, 30.9334, 74.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (359, N'Men''s Bib-Shorts, S', N'SB-M891-S', 4, 3, 37.1209, 89.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (360, N'Men''s Bib-Shorts, M', N'SB-M891-M', 4, 3, 37.1209, 89.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (361, N'Men''s Bib-Shorts, L', N'SB-M891-L', 4, 3, 37.1209, 89.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (362, N'Half-Finger Gloves, S', N'GL-H102-S', 4, 3, 9.1593, 24.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (363, N'Half-Finger Gloves, M', N'GL-H102-M', 4, 3, 9.1593, 24.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (364, N'Half-Finger Gloves, L', N'GL-H102-L', 4, 3, 9.1593, 24.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (365, N'Full-Finger Gloves, S', N'GL-F110-S', 4, 3, 15.6709, 37.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (366, N'Full-Finger Gloves, M', N'GL-F110-M', 4, 3, 15.6709, 37.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (367, N'Full-Finger Gloves, L', N'GL-F110-L', 4, 3, 15.6709, 37.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (368, N'Classic Vest, S', N'VE-C304-S', 4, 3, 23.7490, 63.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (369, N'Classic Vest, M', N'VE-C304-M', 4, 3, 23.7490, 63.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (370, N'Classic Vest, L', N'VE-C304-L', 4, 3, 23.7490, 63.5000, CAST(0x00009B4900000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (371, N'Women''s Mountain Shorts, S', N'SH-W890-S', 4, 3, 26.1763, 69.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (372, N'Women''s Mountain Shorts, M', N'SH-W890-M', 4, 3, 26.1763, 69.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (373, N'Women''s Mountain Shorts, L', N'SH-W890-L', 4, 3, 26.1763, 69.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (374, N'Water Bottle - 30 oz.', N'WB-H098', 4, 3, 1.8663, 4.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (375, N'Mountain Bottle Cage', N'BC-M005', 4, 3, 3.7363, 9.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (376, N'Road Bottle Cage', N'BC-R205', 4, 3, 3.3623, 8.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (377, N'Patch Kit/8 Patches', N'PK-7098', 4, 3, 0.8565, 2.2900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (378, N'Racing Socks, M', N'SO-R809-M', 4, 3, 3.3623, 8.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (379, N'Racing Socks, L', N'SO-R809-L', 4, 3, 3.3623, 8.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (380, N'Hitch Rack - 4-Bike', N'RA-H123', 4, 3, 44.8800, 120.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (381, N'Bike Wash - Dissolver', N'CL-9009', 4, 3, 2.9733, 7.9500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (382, N'Fender Set - Mountain', N'FE-6654', 4, 3, 8.2205, 21.9800, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (383, N'All-Purpose Bike Stand', N'ST-1401', 4, 3, 59.4660, 159.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (384, N'Hydration Pack - 70 oz.', N'HY-1023-70', 4, 3, 20.5663, 54.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (385, N'Short-Sleeve Classic Jersey, S', N'SJ-0194-S', 4, 3, 41.5723, 53.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (386, N'Short-Sleeve Classic Jersey, M', N'SJ-0194-M', 4, 3, 41.5723, 53.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (387, N'Short-Sleeve Classic Jersey, L', N'SJ-0194-L', 4, 3, 41.5723, 53.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (388, N'Short-Sleeve Classic Jersey, XL', N'SJ-0194-X', 4, 3, 41.5723, 53.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (389, N'HL Touring Frame - Yellow, 60', N'FR-T98Y-60', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (390, N'LL Touring Frame - Yellow, 62', N'FR-T67Y-62', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (391, N'HL Touring Frame - Yellow, 46', N'FR-T98Y-46', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (392, N'HL Touring Frame - Yellow, 50', N'FR-T98Y-50', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (393, N'HL Touring Frame - Yellow, 54', N'FR-T98Y-54', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (394, N'HL Touring Frame - Blue, 46', N'FR-T98U-46', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (395, N'HL Touring Frame - Blue, 50', N'FR-T98U-50', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (396, N'HL Touring Frame - Blue, 54', N'FR-T98U-54', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (397, N'HL Touring Frame - Blue, 60', N'FR-T98U-60', 500, 375, 601.7437, 1003.9100, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (398, N'Rear Derailleur', N'RD-2308', 500, 375, 53.9282, 121.4600, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (399, N'LL Touring Frame - Blue, 50', N'FR-T67U-50', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (400, N'LL Touring Frame - Blue, 54', N'FR-T67U-54', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (401, N'LL Touring Frame - Blue, 58', N'FR-T67U-58', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (402, N'LL Touring Frame - Blue, 62', N'FR-T67U-62', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (403, N'LL Touring Frame - Yellow, 44', N'FR-T67Y-44', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (404, N'LL Touring Frame - Yellow, 50', N'FR-T67Y-50', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (405, N'LL Touring Frame - Yellow, 54', N'FR-T67Y-54', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (406, N'LL Touring Frame - Yellow, 58', N'FR-T67Y-58', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (407, N'LL Touring Frame - Blue, 44', N'FR-T67U-44', 500, 375, 199.8519, 333.4200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (408, N'ML Mountain Frame-W - Silver, 40', N'FR-M63S-40', 500, 375, 199.3757, 364.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (409, N'ML Mountain Frame-W - Silver, 42', N'FR-M63S-42', 500, 375, 199.3757, 364.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (410, N'ML Mountain Frame-W - Silver, 46', N'FR-M63S-46', 500, 375, 199.3757, 364.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (411, N'Rear Brakes', N'RB-9231', 500, 375, 47.2860, 106.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (412, N'LL Mountain Seat/Saddle', N'SE-M236', 500, 375, 12.0413, 27.1200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (413, N'ML Mountain Seat/Saddle', N'SE-M798', 500, 375, 17.3782, 39.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (414, N'HL Mountain Seat/Saddle', N'SE-M940', 500, 375, 23.3722, 52.6400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (415, N'LL Road Seat/Saddle', N'SE-R581', 500, 375, 12.0413, 27.1200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (416, N'ML Road Seat/Saddle', N'SE-R908', 500, 375, 17.3782, 39.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (417, N'HL Road Seat/Saddle', N'SE-R995', 500, 375, 23.3722, 52.6400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (418, N'LL Touring Seat/Saddle', N'SE-T312', 500, 375, 12.0413, 27.1200, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (419, N'ML Touring Seat/Saddle', N'SE-T762', 500, 375, 17.3782, 39.1400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (420, N'HL Touring Seat/Saddle', N'SE-T924', 500, 375, 23.3722, 52.6400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (421, N'LL Mountain Frame - Silver, 42', N'FR-M21S-42', 500, 375, 144.5938, 264.0500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (422, N'LL Mountain Frame - Silver, 44', N'FR-M21S-44', 500, 375, 144.5938, 264.0500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (423, N'LL Mountain Frame - Silver, 48', N'FR-M21S-48', 500, 375, 144.5938, 264.0500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (424, N'LL Mountain Frame - Silver, 52', N'FR-M21S-52', 500, 375, 144.5938, 264.0500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (425, N'Mountain Tire Tube', N'TT-M928', 500, 375, 1.8663, 4.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (426, N'Road Tire Tube', N'TT-R982', 500, 375, 1.4923, 3.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (427, N'Touring Tire Tube', N'TT-T092', 500, 375, 1.8663, 4.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (428, N'LL Mountain Frame - Black, 42', N'FR-M21B-42', 500, 375, 136.7850, 249.7900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (429, N'LL Mountain Frame - Black, 44', N'FR-M21B-44', 500, 375, 136.7850, 249.7900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (430, N'LL Mountain Frame - Black, 48', N'FR-M21B-48', 500, 375, 136.7850, 249.7900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (431, N'LL Mountain Frame - Black, 52', N'FR-M21B-52', 500, 375, 136.7850, 249.7900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (432, N'LL Mountain Tire', N'TI-M267', 500, 375, 9.3463, 24.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (433, N'ML Mountain Tire', N'TI-M602', 500, 375, 11.2163, 29.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (434, N'HL Mountain Tire', N'TI-M823', 500, 375, 13.0900, 35.0000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (435, N'LL Road Tire', N'TI-R092', 500, 375, 8.0373, 21.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (436, N'ML Road Tire', N'TI-R628', 500, 375, 9.3463, 24.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (437, N'HL Road Tire', N'TI-R982', 500, 375, 12.1924, 32.6000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (438, N'Touring Tire', N'TI-T723', 500, 375, 10.8423, 28.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (439, N'LL Mountain Pedal', N'PD-M282', 500, 375, 17.9776, 40.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (440, N'ML Mountain Pedal', N'PD-M340', 500, 375, 27.5680, 62.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (441, N'HL Mountain Pedal', N'PD-M562', 500, 375, 35.9596, 80.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (442, N'LL Road Pedal', N'PD-R347', 500, 375, 17.9776, 40.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (443, N'ML Road Pedal', N'PD-R563', 500, 375, 27.5680, 62.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (444, N'HL Road Pedal', N'PD-R853', 500, 375, 35.9596, 80.9900, CAST(0x00009A5C00A5DF7D AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (445, N'Touring Pedal', N'PD-T852', 500, 375, 35.9596, 80.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (446, N'ML Mountain Frame-W - Silver, 38', N'FR-M63S-38', 500, 375, 199.3757, 364.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (447, N'LL Mountain Frame - Black, 40', N'FR-M21B-40', 500, 375, 136.7850, 249.7900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (448, N'LL Mountain Frame - Silver, 40', N'FR-M21S-40', 500, 375, 144.5938, 264.0500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (449, N'Front Derailleur', N'FD-2342', 500, 375, 40.6216, 91.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (450, N'LL Touring Handlebars', N'HB-T721', 500, 375, 20.4640, 46.0900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (451, N'HL Touring Handlebars', N'HB-T928', 500, 375, 40.6571, 91.5700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (452, N'Front Brakes', N'FB-9873', 500, 375, 47.2860, 106.5000, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (453, N'LL Crankset', N'CS-4759', 500, 375, 77.9176, 175.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (454, N'ML Crankset', N'CS-6583', 500, 375, 113.8816, 256.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (455, N'HL Crankset', N'CS-9183', 500, 375, 179.8156, 404.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (456, N'Chain', N'CH-0234', 500, 375, 8.9866, 20.2400, CAST(0x0000A85500000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (457, N'Touring-2000 Blue, 60', N'BK-T44U-60', 100, 75, 755.1508, 1214.8500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (458, N'Touring-1000 Yellow, 46', N'BK-T79Y-46', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (459, N'Touring-1000 Yellow, 50', N'BK-T79Y-50', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (460, N'Touring-1000 Yellow, 54', N'BK-T79Y-54', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (461, N'Touring-1000 Yellow, 60', N'BK-T79Y-60', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (462, N'Touring-3000 Blue, 54', N'BK-T18U-54', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (463, N'Touring-3000 Blue, 58', N'BK-T18U-58', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (464, N'Touring-3000 Blue, 62', N'BK-T18U-62', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (465, N'Touring-3000 Yellow, 44', N'BK-T18Y-44', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (466, N'Touring-3000 Yellow, 50', N'BK-T18Y-50', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (467, N'Touring-3000 Yellow, 54', N'BK-T18Y-54', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (468, N'Touring-3000 Yellow, 58', N'BK-T18Y-58', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (469, N'Touring-3000 Yellow, 62', N'BK-T18Y-62', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (470, N'Touring-1000 Blue, 46', N'BK-T79U-46', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (471, N'Touring-1000 Blue, 50', N'BK-T79U-50', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (472, N'Touring-1000 Blue, 54', N'BK-T79U-54', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (473, N'Touring-1000 Blue, 60', N'BK-T79U-60', 100, 75, 1481.9379, 2384.0700, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (474, N'Touring-2000 Blue, 46', N'BK-T44U-46', 100, 75, 755.1508, 1214.8500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (475, N'Touring-2000 Blue, 50', N'BK-T44U-50', 100, 75, 755.1508, 1214.8500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (476, N'Touring-2000 Blue, 54', N'BK-T44U-54', 100, 75, 755.1508, 1214.8500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (477, N'Road-350-W Yellow, 40', N'BK-R79Y-40', 100, 75, 1082.5100, 1700.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (478, N'Road-350-W Yellow, 42', N'BK-R79Y-42', 100, 75, 1082.5100, 1700.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (479, N'Road-350-W Yellow, 44', N'BK-R79Y-44', 100, 75, 1082.5100, 1700.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (480, N'Road-350-W Yellow, 48', N'BK-R79Y-48', 100, 75, 1082.5100, 1700.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (481, N'Road-750 Black, 58', N'BK-R19B-58', 100, 75, 343.6496, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (482, N'Touring-3000 Blue, 44', N'BK-T18U-44', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (483, N'Touring-3000 Blue, 50', N'BK-T18U-50', 100, 75, 461.4448, 742.3500, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (484, N'Mountain-400-W Silver, 38', N'BK-M38S-38', 100, 75, 419.7784, 769.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (485, N'Mountain-400-W Silver, 40', N'BK-M38S-40', 100, 75, 419.7784, 769.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (486, N'Mountain-400-W Silver, 42', N'BK-M38S-42', 100, 75, 419.7784, 769.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (487, N'Mountain-400-W Silver, 46', N'BK-M38S-46', 100, 75, 419.7784, 769.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (488, N'Mountain-500 Silver, 40', N'BK-M18S-40', 100, 75, 308.2179, 564.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (489, N'Mountain-500 Silver, 42', N'BK-M18S-42', 100, 75, 308.2179, 564.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (490, N'Mountain-500 Silver, 44', N'BK-M18S-44', 100, 75, 308.2179, 564.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (491, N'Mountain-500 Silver, 48', N'BK-M18S-48', 100, 75, 308.2179, 564.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (492, N'Mountain-500 Silver, 52', N'BK-M18S-52', 100, 75, 308.2179, 564.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (493, N'Mountain-500 Black, 40', N'BK-M18B-40', 100, 75, 294.5797, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (494, N'Mountain-500 Black, 42', N'BK-M18B-42', 100, 75, 294.5797, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (495, N'Mountain-500 Black, 44', N'BK-M18B-44', 100, 75, 294.5797, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (496, N'Mountain-500 Black, 48', N'BK-M18B-48', 100, 75, 294.5797, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (497, N'Mountain-500 Black, 52', N'BK-M18B-52', 100, 75, 294.5797, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (498, N'LL Bottom Bracket', N'BB-7421', 500, 375, 23.9716, 53.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (499, N'ML Bottom Bracket', N'BB-8107', 500, 375, 44.9506, 101.2400, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (500, N'HL Bottom Bracket', N'BB-9108', 500, 375, 53.9416, 121.4900, CAST(0x00009A5C00A53CF8 AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (501, N'Road-750 Black, 44', N'BK-R19B-44', 100, 75, 343.6496, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (502, N'Road-750 Black, 48', N'BK-R19B-48', 100, 75, 343.6496, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (503, N'Road-750 Black, 52', N'BK-R19B-52', 100, 75, 343.6496, 539.9900, CAST(0x00009A5C00A53CF8 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (504, N'Abdelooo', N'024545', 1000, 20, 150.0000, 270.0000, CAST(0x0000A44A00000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (505, N'Fataou', N'1111', 12, 10, 10.0000, 20.0000, CAST(0x0000A3C000000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (506, N'qqqqqq', N'qqq', 12, 12, 12.0000, 12.0000, CAST(0x0000A48900000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (507, N'BBC', N'005', 100, 2, 15.0000, 20.0000, CAST(0x0000A3E000000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (508, N'BBC3', N'100', 100, 2, 25.0000, 10.0000, CAST(0x0000A57700000000 AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCode], [StockLevel], [ReOrderLevel], [CostPrice], [SellingPrice], [ExpiryDate]) VALUES (509, N'RICE', N'00008', 100, 2, 10.0000, 15.0000, CAST(0x0000AC8F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_StockLevel]  DEFAULT ((0)) FOR [StockLevel]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ReOrderLevel]  DEFAULT ((0)) FOR [ReOrderLevel]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CostPrice]  DEFAULT ((0)) FOR [CostPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ExpiryDate]  DEFAULT (getdate()) FOR [ExpiryDate]
GO
USE [master]
GO
ALTER DATABASE [JQGrid4U] SET  READ_WRITE 
GO
