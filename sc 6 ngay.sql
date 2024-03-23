USE [master]
GO
/****** Object:  Database [QLTraSua]    Script Date: 3/3/2024 4:06:55 PM ******/
CREATE DATABASE [QLTraSua]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTraSua', FILENAME = N'D:\Project Web\ictshop_aspnet-master\Database\db\QLTraSua.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTraSua_log', FILENAME = N'D:\Project Web\ictshop_aspnet-master\Database\db\QLTraSua_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLTraSua] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTraSua].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTraSua] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTraSua] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTraSua] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTraSua] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTraSua] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTraSua] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLTraSua] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTraSua] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTraSua] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTraSua] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTraSua] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTraSua] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTraSua] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTraSua] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTraSua] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLTraSua] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTraSua] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTraSua] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTraSua] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTraSua] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTraSua] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTraSua] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTraSua] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTraSua] SET  MULTI_USER 
GO
ALTER DATABASE [QLTraSua] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTraSua] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTraSua] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTraSua] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTraSua] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTraSua] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLTraSua] SET QUERY_STORE = OFF
GO
USE [QLTraSua]
GO
/****** Object:  Table [dbo].[Chitietdonhang]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chitietdonhang](
	[Madon] [int] NOT NULL,
	[Masp] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
	[Thanhtien] [decimal](18, 0) NULL,
	[Phuongthucthanhtoan] [int] NULL,
 CONSTRAINT [PK_Chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[Madon] ASC,
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Danhmuc]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Danhmuc](
	[Madanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[Tendanhmuc] [nchar](10) NULL,
 CONSTRAINT [PK_Danhmuc] PRIMARY KEY CLUSTERED 
(
	[Madanhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhang](
	[Madon] [int] IDENTITY(1,1) NOT NULL,
	[Ngaydat] [datetime] NULL,
	[Tinhtrang] [int] NULL,
	[MaNguoidung] [int] NULL,
	[Thanhtoan] [int] NULL,
	[Diachinhanhang] [nvarchar](100) NULL,
	[Tongtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Donhang] PRIMARY KEY CLUSTERED 
(
	[Madon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Dienthoai] [nchar](10) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
	[Anhdaidien] [nchar](30) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 3/3/2024 4:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[Masp] [int] IDENTITY(1,1) NOT NULL,
	[Tensp] [nvarchar](50) NULL,
	[Giatien] [decimal](18, 0) NULL,
	[Soluong] [int] NULL,
	[Ngaythem] [DATETIME] NULL,
	[Mota] [ntext] NULL,
	[Sanphammoi] [bit] NULL,
	[Anhbia] [nvarchar](50) NULL,
	[Madanhmuc] [int] NULL,
	[Size] [nvarchar](50) NULL,
	
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (24, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (24, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (25, 2, 5, CAST(2000000 AS Decimal(18, 0)), CAST(10000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (25, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (26, 2, 3, CAST(2000000 AS Decimal(18, 0)), CAST(6000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (26, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (27, 2, 3, CAST(2000000 AS Decimal(18, 0)), CAST(6000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (27, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (28, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (28, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (29, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (30, 2, 10, CAST(2000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (30, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (31, 2, 10, CAST(2000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (31, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (32, 9, 2, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan]) VALUES (99, 9, 2, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Danhmuc] ON 

INSERT [dbo].[Danhmuc] ([Madanhmuc], [Tendanhmuc]) VALUES (1, N'Trà Sữa   ')
INSERT [dbo].[Danhmuc] ([Madanhmuc], [Tendanhmuc]) VALUES (2, N'Trái Cây  ')
INSERT [dbo].[Danhmuc] ([Madanhmuc], [Tendanhmuc]) VALUES (3, N'Kem Tươi  ')
SET IDENTITY_INSERT [dbo].[Danhmuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Donhang] ON 

INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (24, CAST(N'2021-09-18T14:59:42.090' AS DateTime), 1, 16, 1, N'Nha Trang', CAST(400000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (25, CAST(N'2021-09-18T15:03:47.463' AS DateTime), 1, 15, 1, N'Nha Trang', CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (26, CAST(N'2021-09-18T15:04:01.733' AS DateTime), NULL, 15, 1, N'Nha Trang', CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (27, CAST(N'2021-09-18T15:04:23.733' AS DateTime), NULL, 15, 1, N'Nha Trang', CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (28, CAST(N'2021-09-18T15:04:57.770' AS DateTime), NULL, 16, 1, N'Nha Trang', CAST(400000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (29, CAST(N'2021-09-18T15:05:21.277' AS DateTime), NULL, 36, 1, N'Nha Trang', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (30, CAST(N'2021-09-18T17:18:36.577' AS DateTime), NULL, 36, 1, N'Nha Trang', CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (31, CAST(N'2021-09-18T17:18:50.487' AS DateTime), NULL, 36, 1, N'Nha Trang', CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (32, CAST(N'2021-09-18T21:48:55.610' AS DateTime), 1, 16, 1, N'Nha Trang', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien]) VALUES (99, CAST(N'2021-09-18T14:59:42.090' AS DateTime), 1, 1, 1, N'Nha Trang', CAST(9364923 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Donhang] OFF
GO
SET IDENTITY_INSERT [dbo].[Nguoidung] ON 

INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (1, N'Hữu Tường', N'Hunter.19oct@gmail.com', N'0812883636', N'12345678', 2, N'Khánh Hoà', N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (14, N'Admin', N'Admin@gmail.com', N'0812883636', N'12345678', 2, N'Khánh Hoà', N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (15, N'test', N'test@gmail.com', N'0812883636', N'12345678', 1, NULL, N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (16, N'Họ tên 11', N'Khach@gmail.com', N'0812883636', N'12345678', NULL, N'Khánh Hoà', N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (36, N'mantran', N'Test@gmail.com', N'0812883637', N'12345678', 1, NULL, N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (39, N'Nguyễn Văn A', N'testa@gmail.com', N'0812883636', N'12345678', 1, NULL, N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (41, N'Nguyễn Văn B', N'tetsb@gmail.com', N'0812883636', N'12345678', 1, NULL, N'/Images/files/user-avatar.png ')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (42, N'Nguyễn Văn C', N'testc@gmail.com', N'0812883636', N'12345678', 1, NULL, N'/Images/files/user-avatar.png ')
SET IDENTITY_INSERT [dbo].[Nguoidung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Member')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Sanpham] ON 

INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong],[Ngaythem], [Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (1, N'Trà Sữa Trân Châu', CAST(200000 AS Decimal(18, 0)), 9,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà đen hoặc trà xanh, sữa tươi, sữa đặc, đường, trân châu.', 1, N'/Images/files/ts1.jpg', 1, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong],[Ngaythem], [Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (2, N'Trà Đào', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh, đào tươi (hoặc đào hộp), đường, đá viên.', 1, N'/Images/files/ts2.jpg', 1,  N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong],[Ngaythem], [Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (3, N'Trà Thạch Dừa', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường, đá viên.', 1, N'/Images/files/ts3.jpg', 1, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (4, N'Trà Thái Xanh', CAST(200000 AS Decimal(18, 0)), 2,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường, đá viên.', 1, N'/Images/files/ts4.jpg', 1, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (5, N'Kem Dâu', CAST(200000 AS Decimal(18, 0)), 9,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà đen hoặc trà xanh, sữa tươi, sữa đặc, đường, trân châu.', 1, N'/Images/files/ts5.jpg', 3,  N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (6, N'Kem Ngọt', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh, đào tươi (hoặc đào hộp), đường, đá viên.', 1, N'/Images/files/ts6.jpg', 3, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (7, N'Kem Sầu Riêng', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường, đá viên.', 1, N'/Images/files/ts7.jpg', 3, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (8, N'Kem Khoai Môn', CAST(200000 AS Decimal(18, 0)), 2,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường,', 1, N'/Images/files/ts8.jpg', 3, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong],[Ngaythem], [Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (9, N'Cam Châu Mỹ', CAST(200000 AS Decimal(18, 0)), 9,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà đen hoặc trà xanh, sữa tươi, sữa đặc, đường, trân châu.', 1, N'/Images/files/ts9.jpg', 2,  N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (10, N'Mận Đà Lạt', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh, đào tươi (hoặc đào hộp), đường, đá viên.', 1, N'/Images/files/ts10.png', 2, N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (11, N'Xoài Thái', CAST(200000 AS Decimal(18, 0)), 10,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường, đá viên.
', 1, N'/Images/files/ts11.jpg', 2,N'M')
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Ngaythem],[Mota], [Sanphammoi], [Anhbia], [Madanhmuc],   [Size]) VALUES (12, N'Dừa Xiêm', CAST(200000 AS Decimal(18, 0)), 2,CAST(N'2021-09-18T15:04:01.733' AS DateTime), N'Thành phần: Trà xanh Thái Lan, sữa tươi, sữa đặc, đường, đá viên.', 1, N'/Images/files/ts12.png', 2, N'M')
SET IDENTITY_INSERT [dbo].[Sanpham] OFF
GO
ALTER TABLE [dbo].[Nguoidung] ADD  CONSTRAINT [DF_Nguoidung_IDQuyen]  DEFAULT ((0)) FOR [IDQuyen]
GO
ALTER TABLE [dbo].[Chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_Chitietdonhang_Donhang] FOREIGN KEY([Madon])
REFERENCES [dbo].[Donhang] ([Madon])
GO
ALTER TABLE [dbo].[Chitietdonhang] CHECK CONSTRAINT [FK_Chitietdonhang_Donhang]
GO
ALTER TABLE [dbo].[Chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_Chitietdonhang_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([Masp])
GO
ALTER TABLE [dbo].[Chitietdonhang] CHECK CONSTRAINT [FK_Chitietdonhang_Sanpham]
GO
ALTER TABLE [dbo].[Donhang]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Khachhang] FOREIGN KEY([MaNguoidung])
REFERENCES [dbo].[Nguoidung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[Donhang] CHECK CONSTRAINT [FK_Donhang_Khachhang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Nguoidung] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Nguoidung]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Danhmuc] FOREIGN KEY([Madanhmuc])
REFERENCES [dbo].[Danhmuc] ([Madanhmuc])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Danhmuc]
GO
USE [master]
GO
ALTER DATABASE [QLTraSua] SET  READ_WRITE 
GO
