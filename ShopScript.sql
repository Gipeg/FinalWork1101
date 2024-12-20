CREATE DATABASE FinalWork1101;
USE FinalWork1101;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PickupPointId] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[PickupCode] [int] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAFC7CC9AED] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 18.12.2024 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A266255BBC081] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 18.12.2024 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2024 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleNumber] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Manufacturer] [nvarchar](max) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[DiscountAmount] [tinyint] NULL,
	[QuantityInStock] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18.12.2024 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__ExamRole__8AFACE3AA2D40FB8] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.12.2024 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamUser__1788CCAC0829F7A9] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (1, 1, 24, N'Новый ', CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 201)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (2, NULL, 25, N'Новый ', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 202)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (3, 2, 26, N'Новый ', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 203)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (4, NULL, 27, N'Новый ', CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 204)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (5, 3, 28, N'Новый ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 205)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (6, NULL, 29, N'Новый ', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 206)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (7, NULL, 30, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 207)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (8, NULL, 31, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 208)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (9, 4, 32, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 209)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [Status], [Date], [DeliveryDate], [PickupCode]) VALUES (10, NULL, 33, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 210)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (1, 11, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (1, 20, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (2, 7, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (2, 10, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (3, 2, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (3, 14, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (4, 3, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (4, 5, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (5, 13, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (5, 17, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (6, 8, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (6, 15, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (7, 9, 6)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (7, 12, 5)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (8, 4, 5)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (8, 18, 4)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (9, 1, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (9, 19, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (10, 6, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId], [Amount]) VALUES (10, 16, 4)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (1, N'344288, г. Ангарск, ул. Чехова, 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (2, N'614164, г.Ангарск,  ул. Степная, 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (3, N'394242, г. Ангарск, ул. Коммунистическая, 43')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (4, N'660540, г. Ангарск, ул. Солнечная, 25')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (5, N'125837, г. Ангарск, ул. Шоссейная, 40')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (6, N'125703, г. Ангарск, ул. Партизанская, 49')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (7, N'625283, г. Ангарск, ул. Победы, 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (8, N'614611, г. Ангарск, ул. Молодежная, 50')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (9, N'454311, г.Ангарск, ул. Новая, 19')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (10, N'660007, г.Ангарск, ул. Октябрьская, 19')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (11, N'603036, г. Ангарск, ул. Садовая, 4')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (12, N'450983, г.Ангарск, ул. Комсомольская, 26')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (13, N'394782, г. Ангарск, ул. Чехова, 3')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (14, N'603002, г. Ангарск, ул. Дзержинского, 28')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (15, N'450558, г. Ангарск, ул. Набережная, 30')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (16, N'394060, г.Ангарск, ул. Фрунзе, 43')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (17, N'410661, г. Ангарск, ул. Школьная, 50')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (18, N'625590, г. Ангарск, ул. Коммунистическая, 20')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (19, N'625683, г. Ангарск, ул. 8 Марта')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (20, N'400562, г. Ангарск, ул. Зеленая, 32')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (21, N'614510, г. Ангарск, ул. Маяковского, 47')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (22, N'410542, г. Ангарск, ул. Светлая, 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (23, N'620839, г. Ангарск, ул. Цветочная, 8')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (24, N'443890, г. Ангарск, ул. Коммунистическая, 1')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (25, N'603379, г. Ангарск, ул. Спортивная, 46')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (26, N'603721, г. Ангарск, ул. Гоголя, 41')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (27, N'410172, г. Ангарск, ул. Северная, 13')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (28, N'420151, г. Ангарск, ул. Вишневая, 32')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (29, N'125061, г. Ангарск, ул. Подгорная, 8')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (30, N'630370, г. Ангарск, ул. Шоссейная, 24')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (31, N'614753, г. Ангарск, ул. Полевая, 35')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (32, N'426030, г. Ангарск, ул. Маяковского, 44')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (33, N'450375, г. Ангарск ул. Клубная, 44')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (34, N'625560, г. Ангарск, ул. Некрасова, 12')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (35, N'630201, г. Ангарск, ул. Комсомольская, 17')
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [Address]) VALUES (36, N'190949, г. Ангарск, ул. Мичурина, 26')
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (1, N'A436H7', N'Тени Георгий Амням', N'Легкий и воздушный', N'Косметика', N'1', N'ВикторЭндАдольф', CAST(2399.0000 AS Decimal(19, 4)), 99, 16, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (2, N'D344Y7', N'Тени Анастасия', N'С нотами банного веника', N'Косметика', N'1', N'ООО Тётя Настя ', CAST(31999.0000 AS Decimal(19, 4)), 13, 47, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (3, N'D378D3', N'Парфюм Джакобс ', N'Ну так пойдет', N'Парфюмерия', N'1', N'ЯкобсМарк', CAST(12799.0000 AS Decimal(19, 4)), 18, 266, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (4, N'D526R4', N'Парфюм Виктор', N'Сладкий и яркий, как шоколад', N'Парфюмерия', N'1', N'ООО ИнвестицияКрасоты', CAST(1499.0000 AS Decimal(19, 4)), 45, 84, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (5, N'E245R5', N'Парфюм Гучи', N'Вдохновленный летом', N'Парфюмерия', N'1', N'Гучи', CAST(16099.0000 AS Decimal(19, 4)), 18, 100, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (6, N'E479G6', N'Помада C# Ubuntu', N'Великий и ужасный', N'Косметика', N'1', N'ВизуалСтудио Энтертеймент', CAST(1099.0000 AS Decimal(19, 4)), 0, 0, N'Нет в наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (7, N'E530Y6', N'Тональный крем Икс Флёур', N'Максимальное покрытие', N'Косметика', N'1', N'Студия Красоты', CAST(4899.0000 AS Decimal(19, 4)), 7, 20, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (8, N'E573G6', N'Тени Урбантикай', N'Теплый приём', N'Косметика', N'1', N'Нарс', CAST(41999.0000 AS Decimal(19, 4)), 40, 41, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (9, N'F344S4', N'Тушь ТуФейсит', N'Цвет фуксия', N'Косметика', N'1', N'Студия Красоты', CAST(9999.0000 AS Decimal(19, 4)), 25, 18, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (10, N'F346G5', N'Бальзам для губ ДиорЛип', N'Уникальный', N'Косметика', N'1', N'Диор', CAST(1499.0000 AS Decimal(19, 4)), 11, 45, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (11, N'F893T5', N'Парфюм Цеханели', N'Легендарный мужской', N'Парфюмерия', N'1', N'Мак Студия', CAST(6499.0000 AS Decimal(19, 4)), 6, 19, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (12, N'G532R5', N'Парфюм Том Форд', N'Объёмный запах', N'Парфюмерия', N'1', N'ДольчеМилк', CAST(47199.0000 AS Decimal(19, 4)), 40, 56, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (13, N'H732R5', N'Блеск для губ Бьюти Блос', N'Ультраглянц', N'Косметика', N'1', N'ФентиБьюти', CAST(32199.0000 AS Decimal(19, 4)), 18, 410, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (14, N'J432E4', N'Парфюм какой-то евес Сейнт', N'Соблазнительный', N'Парфюмерия', N'1', N'ОБС студио', CAST(4899.0000 AS Decimal(19, 4)), 12, 150, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (15, N'K535G6', N'Парфюм Ламком', N'Ноты ириса', N'Парфюмерия', N'1', N'Нарс', CAST(65099.0000 AS Decimal(19, 4)), 20, 88, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (16, N'O875F6', N'Помада А4', N'Высокое покрытие', N'Косметика', N'1', N'Влад Бумага', CAST(2799.0000 AS Decimal(19, 4)), 30, 41, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (17, N'R464G6', N'Консиллер Нарс', N'Идеальный макияж', N'Косметика', N'1', N'ДольчеМилк', CAST(12599.0000 AS Decimal(19, 4)), 18, 11, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (18, N'S753T5', N'Бронзер Рандомный Эффект', N'Матовый', N'Косметика', N'1', N'Студия Рандом', CAST(1099.0000 AS Decimal(19, 4)), 45, 83, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (19, N'V472S3', N'Крем ТартеШапе', N'От загара и перегара', N'Косметика', N'1', N'ТомФорд', CAST(1999.0000 AS Decimal(19, 4)), 45, 75, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductId], [ArticleNumber], [Name], [Description], [Category], [Photo], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Status]) VALUES (20, N'А112Т4', N'Парфюм Шанель', N'Легендарный женский', N'Парфюмерия', N'1', N'Кокошанель', CAST(1299.0000 AS Decimal(19, 4)), 5, 10, N'В наличии')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'Менеджер
')
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'Клиент')
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (3, N'Администратор')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, 1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, 2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, 1, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (4, 3, N'Карпов ', N'Улеб', N' Леонидович', N'loginDEcph2018', N'7YpE0p')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (5, 2, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (6, 2, N'Юдин ', N'Герман', N' Кондратович', N'loginDEwjg2018', N'9UfqWQ')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (7, 3, N'Беляева ', N'Анна', N' Вячеславовна', N'loginDEjbz2018', N'xIAWNI')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (8, 1, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (9, 1, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (10, 2, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (11, 2, N'Власов ', N'Вадим', N' Васильевич', N'loginDEtfj2018', N'{{ksPn')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (12, 3, N'Савельев ', N'Арсений', N' Авксентьевич', N'loginDEpnb2018', N'{ADBdc')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (13, 3, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (14, 2, N'Бурова ', N'Марфа', N' Федотовна', N'loginDEiin2018', N'y9l*b}')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (15, 2, N'Селезнёв ', N'Александр', N' Никитевич', N'loginDEqda2018', N'|h+r}I')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (16, 2, N'Кулакова ', N'Виктория', N' Георгьевна', N'loginDEbnj2018', N'12345')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (17, 2, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (18, 2, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (19, 2, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (20, 1, N'Медведев ', N'Ириней', N' Геннадьевич', N'loginDEjis2018', N'A9K++2')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (21, 1, N'Суханова ', N'Евгения', N' Улебовна', N'loginDExvv2018', N'R1zh}|')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (22, 1, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (23, 2, N'Ефремов ', N'Христофор', N' Владиславович', N'loginDEyzn2018', N'P1v24R')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (24, 2, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (25, 3, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (26, 1, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (27, 3, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (28, 2, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (29, 1, N'Лыткин ', N'Ким', N' Алексеевич', N'loginDEwqc2018', N'vRtAP*')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (30, 1, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (31, 1, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (32, 3, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (33, 2, N'Поляков ', N'Анатолий', N' Игоревич', N'loginDEtfz2018', N'uQY0ZQ')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (34, 3, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (35, 2, N'Воробьёв ', N'Герман', N' Романович', N'loginDEdmi2018', N'HOGFbU')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (36, 3, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (37, 3, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (38, 3, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (39, 2, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (40, 2, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (41, 1, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (42, 2, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (43, 1, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (44, 2, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (45, 3, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (46, 2, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (47, 1, N'Коновалова ', N'Агафья', N' Митрофановна', N'loginDEisp2018', N'dfz5Ii')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (48, 1, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (49, 2, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH')
GO
INSERT [dbo].[User] ([UserId], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (50, 2, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([PickupPointId])
REFERENCES [dbo].[PickupPoint] ([PickupPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__403A8C7D] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_ExamUser_ExamRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_ExamUser_ExamRole]
GO
