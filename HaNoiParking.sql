USE [master]
GO
/****** Object:  Database [HaNoiParking]    Script Date: 12/22/2017 11:20:27 AM ******/
CREATE DATABASE [HaNoiParking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HaNoiParking', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HaNoiParking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HaNoiParking_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HaNoiParking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HaNoiParking] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HaNoiParking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HaNoiParking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HaNoiParking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HaNoiParking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HaNoiParking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HaNoiParking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HaNoiParking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HaNoiParking] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HaNoiParking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HaNoiParking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HaNoiParking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HaNoiParking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HaNoiParking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HaNoiParking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HaNoiParking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HaNoiParking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HaNoiParking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HaNoiParking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HaNoiParking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HaNoiParking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HaNoiParking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HaNoiParking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HaNoiParking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HaNoiParking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HaNoiParking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HaNoiParking] SET  MULTI_USER 
GO
ALTER DATABASE [HaNoiParking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HaNoiParking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HaNoiParking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HaNoiParking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HaNoiParking]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/22/2017 11:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/22/2017 11:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Content] [nvarchar](500) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parking]    Script Date: 12/22/2017 11:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parking](
	[ParkingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [varchar](50) NULL,
	[IsOverNight] [bit] NULL,
	[Website] [varchar](500) NULL,
	[OpenTime] [nvarchar](500) NULL,
	[Price] [nvarchar](500) NULL,
	[Lat] [real] NOT NULL,
	[Lng] [real] NOT NULL,
 CONSTRAINT [PK_Parking] PRIMARY KEY CLUSTERED 
(
	[ParkingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParkingImage]    Script Date: 12/22/2017 11:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingID] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ParkingImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 12/22/2017 11:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [nvarchar](500) NOT NULL,
	[Avatar] [varchar](500) NULL,
	[Email] [varchar](500) NOT NULL,
	[Password] [varchar](500) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Username], [Password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Parking] ON 

INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (1, N'Bãi Gửi Xe ĐH Mỏ-địa Chất', N'Cổ Nhuế 2, Từ Liêm, Hanoi, Vietnam', N'+841349346164', 1, N'abcd', NULL, NULL, 21.07385, 105.778)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (2, N'Dịch Vụ Cho Thuê Bãi Đổ Xe Lê Thị Nguyệt
', N'505, Lạc Long Quân, Quận Tây Hồ, Thành Phố Hà Nội, Bưởi, Tây Hồ, Hà Nội, Vietnam
', N'+84 94 516 91 09
', NULL, NULL, NULL, NULL, 21.06352, 105.809418)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (3, N'Bãi gửi xe ô tô Mỹ Đình 1
', N'Cầu Diễn, Từ Liêm, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0350819, 105.762634)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (4, N'Dịch Vụ Giữ Xe Trần Đăng Tư
', N'1079, Đường La Thành, Phường Ngọc Khánh, Quận Ba Đình, Thành Phố Hà Nội, Láng Thượng, Đống Đa, Hà Nội, Vietnam
', N'+84 91 619 10 52
', NULL, NULL, NULL, NULL, 21.0289917, 105.806923)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (5, N'Bãi gửi xe Văn Cao
', N'Văn Cao, Thụy Khuê, Tây Hồ, Hà Nội, Vietnam
', N'+84 91 619 10 52
', NULL, NULL, NULL, NULL, 21.0459747, 105.8174)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (6, N'Bãi đỗ xe Vạn Phúc
', N'Vạn Phúc, Kim Mã, Ba Đình, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0346, 105.817825)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (7, N'Bãi đõ xe Ngọc Hà
', N'Ngọc Hồ, Ba Đình, Ha Tay, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0398865, 105.828728)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (8, N'Bãi đỗ xe Láng Hạ A
', N'Láng Hạ, Đống Đa, Hanoi, Vietnam
', NULL, NULL, N'baidoxelanghaa.com
', NULL, NULL, 21.0152912, 105.807014)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (9, N'Bãi Đỗ Xe Sông Hồng
', N'68 Lê Văn Lương, Nhân Chính, Thanh Xuân, Hà Nội, Vietnam
', N'+84 24 3556 9999
', NULL, N'redriverco.com
', NULL, NULL, 21.0019913, 105.798859)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (10, N'Bãi đỗ xe Đại Thanh
', N'Cầu Hữu Hòa, Tả Thanh Oai, Thanh Trì, Hà Nội, Vietnam
', NULL, NULL, N'kientrucvietas.com
', NULL, NULL, 20.9550667, 105.806419)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (11, N'Dịch Vụ Giữ Xe Hiền Tươi
', N'116, Phố Xốm, Quận Hà Đông, Thành Phố Hà Nội, Thành Phố Hà Nội, Phú Lâm, Hà Đông, Hà Nội, Vietnam
', N'+84 123 293 5535
', NULL, NULL, NULL, NULL, 20.94525, 105.7564)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (12, N'Oanh''s Parking Garage
', N'Dương Kinh, Hà Đông, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9766941, 105.745438)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (13, N'Bãi Xe Hải Vân Hà Nội
', N'Trung Hoà, Cầu Giấy, Hanoi, Vietnam
', N'+84 438717171
', NULL, NULL, NULL, NULL, 21.0143566, 105.795395)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (14, N'Parking Ho Chi Minh Museum
', N'Đội Cấn, Ba Đình, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.03695, 105.831612)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (15, N'Bãi đỗ xe trên cao Nguyễn Công Trứ
', N'Nguyễn Công Trứ, Ngô Thì Nhậm, Hai Bà Trưng, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0141964, 105.831612)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (16, N'Bãi Gửi Xe Thúy Lĩnh
', N'Lĩnh Nam, Hoàng Mai, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9827633, 105.892014)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (17, N'Bãi Giữ Xe Ô Tô Song Thành
', N'Phú Viên, Bồ Đề, Long Biên, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0338955, 105.876366)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (18, N'Điểm Trông Giữ Xe Ô Tô
', N'60, Đường Gia Quất, Phường Thượng Thanh, Quận Long Biên, Thành Phố Hà Nội, Thượng Thanh, Long Biên, Hà Nội, Vietnam
', N'+84 98 275 07 08
', NULL, NULL, NULL, NULL, 21.0544033, 105.8786)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (19, N'Bãi đỗ xe Ocean Park
', N'Phương Mai, Đống Đa, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0082588, 105.840668)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (20, N'Bãi gửi xe CV Thống Nhất
', N'Lê Đại Hành, Hai Bà Trưng District, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0093784, 105.845818)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (21, N'Parking Tran Nhat Duat
', N'6 Trần Nhật Duật, Phúc Tân, Hoàn Kiếm, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0404644, 105.851135)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (22, N'Gửi xe Viện Y Học Cổ Truyền TW
', N'Nguyễn Bỉnh Khiêm, Nguyễn Du, Hai Bà Trưng, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.01659, 105.848045)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (23, N'Bãi xe Đồng Xa
', N'Hoàng Văn Thụ, Hoàng Mai, Hanoi, Vietnam
', N'+84 92 666 56 66
', NULL, NULL, NULL, NULL, 20.9842186, 105.859718)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (24, N'Điểm Trông Xe Ô Tô 24/24
', N'1, Nguyễn Văn Huyên, Phường Nghĩa Đô, Quận Cầu Giấy, Thành Phố Hà Nội, Nghĩa Đô, Cầu Giấy, Hà Nội, Vietnam
', N'+84 98 948 45 96
', NULL, NULL, NULL, NULL, 21.0461464, 105.797432)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (25, N'Bãi đỗ xe 17T10
', N'Ngõ 17T10 - Nguyễn Thị Định, Trung Hoà, Cầu Giấy, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.01151, 105.80452)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (26, N'Bãi gửi xe C1
', N'Trần Đại Nghĩa, Bách Khoa, Hai Bà Trưng, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0079288, 105.80452)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (27, N'Bãi gửi xe Việt Nhật
', N'Đai Mễ, Hà Đông, Hanoi, Vietnam
', N'+84 96 721 38 38
', NULL, NULL, NULL, NULL, 20.9877338, 105.779716)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (28, N'Hầm gửi xe Vincom Nguyễn Chí Thanh
', N'2 Chùa Láng, Láng Thượng, Đống Đa, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.02323, 105.80864)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (29, N'Bãi đỗ xe sau toà nhà Viglacera 671 Hoàng Hoa Thám
', N'671 Hoàng Hoa Thám
', NULL, NULL, NULL, NULL, NULL, 21.0474358, 105.807823)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (30, N'Bãi đỗ xe Hồ Gươm
', N'49 Đinh Tiên Hoàng
', NULL, NULL, NULL, NULL, NULL, 21.0317974, 105.85231)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (31, N'156 parking Phuong Liet
', N'86/35 Phương Liệt, Thanh Xuân, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9975, 105.838737)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (32, N'Bãi Đỗ Xe Số 2 Định Công
', N'phố Trần Điền., Định Công, Hoàng Mai, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9869213, 105.827148)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (33, N'Bãi đỗ xe Tân Mai
', N'Ngõ 273 Tân Mai, Tân Mai, Hoàng Mai, Hà Nội, Vietnam
', N'+84 97 281 39 08
', NULL, NULL, NULL, NULL, 20.98027, 105.850578)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (34, N'Bãi trông giữ xe ô tô Sông Lấp
', N'Sông Lấp, Quỳnh Lôi, Hai Bà Trưng, Hà Nội, Vietnam
', N'+84 97 479 38 81
', NULL, NULL, NULL, NULL, 20.9996624, 105.857018)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (35, N'Bãi Xe Mạnh Hùng
', N'88, Đặng Xuân Bảng, Đại Kim, Hoàng Mai, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9727364, 105.829124)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (36, N'Bãi đỗ xe ô tô TC5
', N'Yên Xá, Tân Triều, Thanh Trì, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.96937, 105.79805)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (37, N'Điểm Gửi Xe Máy
', N'51/2, Ngõ 128C Phố Đại La, Quận Hai Bà Trưng, Thành Phố Hà Nội, Đồng Tâm, Hai Bà Trưng, Hà Nội, Vietnam
', N'+84 436282155
', NULL, NULL, NULL, NULL, 20.99862, 105.843887)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (38, N'Cửa gửi xe R4
', N'Thượng Đình, Thanh Xuân, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0037365, 105.816605)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (39, N'Cửa gửi xe R1
', N'Nhân Chính, Thanh Xuân, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0034161, 105.813683)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (40, N'Bãi trông giữ xe ô tô
', N'160 phố Tân Mai, Hoàng Văn Thụ, Hoàng Mai, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9837132, 105.854614)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (41, N'Bãi đỗ xe
', N'Thuỵ Khuê, Hoàn Kiếm, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0429668, 105.830894)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (42, N'Bãi đỗ xe
', N'Trần Huy Liệu, Giảng Võ, Ba Đình, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.028307, 105.821884)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (43, N'Parking
', N'Quan Hoa, Cau Giay District, Hanoi, Vietnam
', N'+84 437666326
', NULL, NULL, NULL, NULL, 21.0355167, 105.803772)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (44, N'Bãi trông xe
', N'Ngõ 69 Phố Chùa Láng, Láng Thượng, Đống Đa, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.02342, 105.806267)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (45, N'Bãi đỗ xe
', N'Đỗ Quang, Trung Hoà, Cầu Giấy, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0109215, 105.803604)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (46, N'Công Ty Phương Đông - Bãi Đỗ Xe & Khu Dịch Vụ
', N'69, Lê Văn Lương, Quận Cầu Giấy, Thành Phố Hà Nội, Nhân Chính, Thanh Xuân, Hà Nội, Vietnam
', N'+84 435535796
', NULL, NULL, NULL, NULL, 21.0008488, 105.797989)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (47, N'Điểm Giữ Xe Ô Tô
', N'Phú Diễn, Phường Phú Diễn, Quận Bắc Từ Liêm, Thành Phố Hà Nội, Phú Diễn, Bắc Từ Liêm, Hà Nội 100000, Vietnam
', N'+84 98 283 03 93
', NULL, NULL, NULL, NULL, 21.0518818, 105.763741)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (48, N'Bãi đỗ xe Khu đô thị Xa La
', N'Khu đô thị Xa La, Hà Đông, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 20.9633446, 105.793777)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (49, N'Bãi đỗ xe bệnh viện Bạch Mai
', N'78 Giải Phóng, Phương Mai, Đống Đa, Hà Nội, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0024967, 105.839989)
INSERT [dbo].[Parking] ([ParkingID], [Name], [Address], [Phone], [IsOverNight], [Website], [OpenTime], [Price], [Lat], [Lng]) VALUES (50, N'Bãi đỗ xe gần học viện Nông nghiệp VN
', N'tt. Trâu Quỳ, Gia Lâm, Hanoi, Vietnam
', NULL, NULL, NULL, NULL, NULL, 21.0114574, 105.944923)
SET IDENTITY_INSERT [dbo].[Parking] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Nickname], [Avatar], [Email], [Password]) VALUES (1, N'Hiếu đẹp trai', NULL, N'hieunv.dev@gmail.com', N'hieunv')
INSERT [dbo].[User] ([UserID], [Nickname], [Avatar], [Email], [Password]) VALUES (2, N'Giang', NULL, N'vangiang2303@gmail.com', N'1')
INSERT [dbo].[User] ([UserID], [Nickname], [Avatar], [Email], [Password]) VALUES (3, N'Tiệp', N'avatar dây', N'111', N'111')
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [HaNoiParking] SET  READ_WRITE 
GO
