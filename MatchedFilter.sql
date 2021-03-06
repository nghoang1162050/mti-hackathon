USE [MatchedFilter]
GO
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [FK_Property_Property_Type]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [FK_Product_Property_Unit_Type]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [FK_Product_Property_Property]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [FK_Product_Property_Product]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Attribute] DROP CONSTRAINT [FK_Attribute_Unit_Type]
GO
ALTER TABLE [dbo].[Attribute] DROP CONSTRAINT [FK_Attribute_Property]
GO
ALTER TABLE [dbo].[Property_Type] DROP CONSTRAINT [DF_Property_Type_created_date]
GO
ALTER TABLE [dbo].[Property_Type] DROP CONSTRAINT [DF_Property_Type_updated_date]
GO
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [DF_Property_created_date]
GO
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [DF_Property_updated_date]
GO
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [DF_Property_is_deleted]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [DF_Product_Property_created_date]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [DF_Product_Property_updated_date]
GO
ALTER TABLE [dbo].[Product_Property] DROP CONSTRAINT [DF_Product_Property_is_deleted]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_created_date]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_updated_date]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_is_deleted]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_created_date]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_updated_date]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_is_deleted]
GO
/****** Object:  Index [IX_Product]    Script Date: 8/6/2018 5:15:10 PM ******/
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [IX_Product]
GO
/****** Object:  Table [dbo].[Unit_Type]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Unit_Type]
GO
/****** Object:  Table [dbo].[Property_Type]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Property_Type]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Property]
GO
/****** Object:  Table [dbo].[Product_Property]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Product_Property]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 8/6/2018 5:15:10 PM ******/
DROP TABLE [dbo].[Attribute]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 8/6/2018 5:15:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[property_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
	[unit_type_id] [bigint] NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/6/2018 5:15:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/6/2018 5:15:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sku_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Property]    Script Date: 8/6/2018 5:15:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Property](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[property_id] [bigint] NOT NULL,
	[value] [nvarchar](50) NOT NULL,
	[unit_type_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Product_Property] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 8/6/2018 5:15:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[property_type_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property_Type]    Script Date: 8/6/2018 5:15:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nchar](10) NOT NULL,
	[updated_date] [datetime] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Property_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit_Type]    Script Date: 8/6/2018 5:15:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (1, 1, N'Area', 0, CAST(N'2018-08-06T16:02:47.957' AS DateTime), CAST(N'2018-08-06T16:02:47.957' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (2, 1, N'Address', 0, CAST(N'2018-08-06T16:02:59.480' AS DateTime), CAST(N'2018-08-06T16:02:59.480' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (3, 1, N'Bed Room(s)', 0, CAST(N'2018-08-06T16:03:36.570' AS DateTime), CAST(N'2018-08-06T16:03:36.570' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (6, 1, N'Floor(s)', 0, CAST(N'2018-08-06T16:03:57.760' AS DateTime), CAST(N'2018-08-06T16:03:57.760' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (7, 1, N'Kitchen(s)', 0, CAST(N'2018-08-06T16:05:11.357' AS DateTime), CAST(N'2018-08-06T16:05:11.357' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (9, 1, N'Living Room(s)', 0, CAST(N'2018-08-06T16:05:36.480' AS DateTime), CAST(N'2018-08-06T16:05:36.480' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (11, 1, N'Bath Room(s)', 0, CAST(N'2018-08-06T16:06:07.603' AS DateTime), CAST(N'2018-08-06T16:06:07.603' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (12, 1, N'Garden', 0, CAST(N'2018-08-06T16:06:32.427' AS DateTime), CAST(N'2018-08-06T16:06:32.427' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (13, 1, N'Parking Slot', 0, CAST(N'2018-08-06T16:06:52.333' AS DateTime), CAST(N'2018-08-06T16:06:52.333' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (14, 2, N'Near Market', 0, CAST(N'2018-08-06T16:09:32.833' AS DateTime), CAST(N'2018-08-06T16:09:32.833' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (15, 2, N'Near Super Market', 0, CAST(N'2018-08-06T16:10:29.100' AS DateTime), CAST(N'2018-08-06T16:10:29.100' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (16, 2, N'Near Nursing School', 0, CAST(N'2018-08-06T16:10:53.140' AS DateTime), CAST(N'2018-08-06T16:10:53.140' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (17, 2, N'Near Primary School', 0, CAST(N'2018-08-06T16:11:13.280' AS DateTime), CAST(N'2018-08-06T16:11:13.280' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (18, 2, N'Near Secondary School', 0, CAST(N'2018-08-06T16:11:34.897' AS DateTime), CAST(N'2018-08-06T16:11:34.897' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (19, 2, N'Near High School', 0, CAST(N'2018-08-06T16:11:45.100' AS DateTime), CAST(N'2018-08-06T16:11:45.100' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (20, 1, N'Width Street', 0, CAST(N'2018-08-06T16:12:46.133' AS DateTime), CAST(N'2018-08-06T16:12:46.133' AS DateTime))
INSERT [dbo].[Property] ([id], [property_type_id], [name], [is_deleted], [updated_date], [created_date]) VALUES (21, 1, N'Used Year(s)', 0, CAST(N'2018-08-06T16:13:28.873' AS DateTime), CAST(N'2018-08-06T16:13:28.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[Property] OFF
SET IDENTITY_INSERT [dbo].[Property_Type] ON 

INSERT [dbo].[Property_Type] ([id], [name], [value], [updated_date], [created_date]) VALUES (1, N'Text Field', N'text      ', CAST(N'2018-08-06T16:02:11.230' AS DateTime), CAST(N'2018-08-06T16:02:11.230' AS DateTime))
INSERT [dbo].[Property_Type] ([id], [name], [value], [updated_date], [created_date]) VALUES (2, N'Boolean', N'boolean   ', CAST(N'2018-08-06T16:10:06.800' AS DateTime), CAST(N'2018-08-06T16:10:06.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Property_Type] OFF
SET IDENTITY_INSERT [dbo].[Unit_Type] ON 

INSERT [dbo].[Unit_Type] ([id], [name], [value]) VALUES (1, N'met', N'm')
INSERT [dbo].[Unit_Type] ([id], [name], [value]) VALUES (3, N'centimet', N'cm')
INSERT [dbo].[Unit_Type] ([id], [name], [value]) VALUES (4, N'kilogram', N'kg')
SET IDENTITY_INSERT [dbo].[Unit_Type] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product]    Script Date: 8/6/2018 5:15:11 PM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [IX_Product] UNIQUE NONCLUSTERED 
(
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Product_Property] ADD  CONSTRAINT [DF_Product_Property_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Product_Property] ADD  CONSTRAINT [DF_Product_Property_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Product_Property] ADD  CONSTRAINT [DF_Product_Property_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Property_Type] ADD  CONSTRAINT [DF_Property_Type_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Property_Type] ADD  CONSTRAINT [DF_Property_Type_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Attribute]  WITH NOCHECK ADD  CONSTRAINT [FK_Attribute_Property] FOREIGN KEY([property_id])
REFERENCES [dbo].[Property] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Attribute] NOCHECK CONSTRAINT [FK_Attribute_Property]
GO
ALTER TABLE [dbo].[Attribute]  WITH NOCHECK ADD  CONSTRAINT [FK_Attribute_Unit_Type] FOREIGN KEY([unit_type_id])
REFERENCES [dbo].[Unit_Type] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Attribute] NOCHECK CONSTRAINT [FK_Attribute_Unit_Type]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Product] NOCHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_Property]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Property_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Product_Property] NOCHECK CONSTRAINT [FK_Product_Property_Product]
GO
ALTER TABLE [dbo].[Product_Property]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Property_Property] FOREIGN KEY([property_id])
REFERENCES [dbo].[Property] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Product_Property] NOCHECK CONSTRAINT [FK_Product_Property_Property]
GO
ALTER TABLE [dbo].[Product_Property]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Property_Unit_Type] FOREIGN KEY([unit_type_id])
REFERENCES [dbo].[Unit_Type] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Product_Property] NOCHECK CONSTRAINT [FK_Product_Property_Unit_Type]
GO
ALTER TABLE [dbo].[Property]  WITH NOCHECK ADD  CONSTRAINT [FK_Property_Property_Type] FOREIGN KEY([property_type_id])
REFERENCES [dbo].[Property_Type] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Property] NOCHECK CONSTRAINT [FK_Property_Property_Type]
GO
