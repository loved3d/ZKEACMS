﻿CREATE DATABASE [ZKEACMS_Blog2] ON  PRIMARY 
( NAME = N'ZKEACMS_Blog2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ZKEACMS_Blog2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ZKEACMS_Blog2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ZKEACMS_Blog2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZKEACMS_Blog2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET  MULTI_USER 
GO
ALTER DATABASE [ZKEACMS_Blog2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZKEACMS_Blog2] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZKEACMS_Blog2', N'ON'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationSetting](
	[SettingKey] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ApplicationSetting] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Summary] [nvarchar](255) NULL,
	[MetaKeyWords] [nvarchar](255) NULL,
	[MetaDescription] [nvarchar](255) NULL,
	[Counter] [int] NULL,
	[ArticleTypeID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ArticleContent] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[Url] [nvarchar](100) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleDetailWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleDetailWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleListWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
	[IsPageable] [bit] NOT NULL,
	[PageSize] [int] NULL,
 CONSTRAINT [PK_ArticleListWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleSummaryWidget](
	[ID] [nvarchar](100) NOT NULL,
	[SubTitle] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[DetailLink] [nvarchar](255) NULL,
	[Summary] [nvarchar](max) NULL,
 CONSTRAINT [PK_ArticleSummaryWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTopWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[Tops] [int] NULL,
	[SubTitle] [nvarchar](255) NULL,
	[MoreLink] [nvarchar](255) NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleTopWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](100) NULL,
	[SEOKeyWord] [nvarchar](100) NULL,
	[SEODescription] [nvarchar](300) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ArticleType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTypeWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[TargetPage] [nvarchar](255) NULL,
 CONSTRAINT [PK_ArticleTypeWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Height] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarouselItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CarouselID] [int] NULL,
	[CarouselWidgetID] [nvarchar](100) NULL,
	[TargetLink] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CarouselItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarouselWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CarouselID] [int] NULL,
 CONSTRAINT [PK_CarouselWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Layout](
	[ID] [nvarchar](100) NOT NULL,
	[LayoutName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[ContainerClass] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Script] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[Theme] [nvarchar](255) NULL,
 CONSTRAINT [PK_CMS_Layout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_LayoutHtml](
	[LayoutHtmlId] [int] IDENTITY(1,1) NOT NULL,
	[LayoutId] [nvarchar](100) NOT NULL,
	[PageId] [nvarchar](100) NULL,
	[Html] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_LayoutHtml] PRIMARY KEY CLUSTERED 
(
	[LayoutHtmlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Media](
	[ID] [nvarchar](50) NOT NULL,
	[ParentID] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[MediaType] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_CMS_Media] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PostMessage] [nvarchar](max) NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_CMS_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Page](
	[ID] [nvarchar](100) NOT NULL,
	[ReferencePageID] [nvarchar](100) NULL,
	[IsPublishedPage] [bit] NULL,
	[ParentId] [nvarchar](100) NULL,
	[PageName] [nvarchar](100) NULL,
	[IsHomePage] [bit] NOT NULL,
	[Url] [nvarchar](255) NULL,
	[LayoutId] [nvarchar](100) NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[MetaKeyWorlds] [nvarchar](255) NULL,
	[MetaDescription] [nvarchar](255) NULL,
	[Script] [nvarchar](255) NULL,
	[Style] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Redirection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[InComingUrl] [nvarchar](500) NOT NULL,
	[DestinationURL] [nvarchar](500) NOT NULL,
	[IsPermanent] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_Redirection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Rule](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ZoneName] [nvarchar](50) NULL,
	[RuleExpression] [nvarchar](800) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RuleItems] [nvarchar](max) NULL,
 CONSTRAINT [PK_CMS_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Theme](
	[ID] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Url] [nvarchar](100) NULL,
	[UrlDebugger] [nvarchar](100) NULL,
	[Thumbnail] [nvarchar](100) NULL,
	[IsActived] [bit] NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CMS_Theme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_WidgetBase](
	[ID] [nvarchar](100) NOT NULL,
	[WidgetName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[LayoutId] [nvarchar](100) NULL,
	[PageId] [nvarchar](100) NULL,
	[ZoneId] [nvarchar](100) NULL,
	[PartialView] [nvarchar](255) NULL,
	[AssemblyName] [nvarchar](255) NULL,
	[ServiceTypeName] [nvarchar](255) NULL,
	[ViewModelTypeName] [nvarchar](255) NULL,
	[FormView] [nvarchar](255) NULL,
	[StyleClass] [nvarchar](1000) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[IsTemplate] [bit] NULL,
	[Thumbnail] [nvarchar](200) NULL,
	[IsSystem] [bit] NULL,
	[ExtendData] [nvarchar](max) NULL,
	[RuleID] [int] NULL,
 CONSTRAINT [PK_CMS_WidgetBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_Zone](
	[ID] [nvarchar](100) NOT NULL,
	[LayoutId] [nvarchar](100) NULL,
	[PageId] [nvarchar](100) NULL,
	[ZoneName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[HeadingCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_CMS_Zone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PagePath] [nvarchar](300) NULL,
	[UserId] [nvarchar](100) NULL,
	[Picture] [nvarchar](300) NULL,
	[UserName] [nvarchar](100) NULL,
	[CommentContent] [nvarchar](500) NULL,
	[Agrees] [int] NULL,
	[Disagrees] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataArchived](
	[ID] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DataArchived] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataDictionary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DicName] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[DicValue] [nvarchar](255) NULL,
	[Order] [int] NULL,
	[Pid] [int] NULL,
	[IsSystem] [bit] NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DataDictionary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendField](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Value] [nvarchar](max) NULL,
	[OwnerModule] [nvarchar](50) NULL,
	[OwnerID] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExtendField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[FormId] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FormData_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormDataItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormDataId] [int] NOT NULL,
	[FieldId] [varchar](50) NULL,
	[FieldText] [nvarchar](1000) NULL,
	[FieldValue] [nvarchar](max) NULL,
	[OptionValue] [varchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FormData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[ID] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[FieldsData] [nvarchar](max) NULL,
	[NotificationReceiver] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HtmlWidget](
	[ID] [nvarchar](100) NOT NULL,
	[HTML] [nvarchar](max) NULL,
 CONSTRAINT [PK_HtmlWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[AltText] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
 CONSTRAINT [PK_ImageWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanKey] [nvarchar](190) NOT NULL,
	[CultureName] [nvarchar](10) NOT NULL,
	[LanValue] [nvarchar](max) NULL,
	[Module] [nvarchar](50) NULL,
	[LanType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanKey] ASC,
	[CultureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigation](
	[ID] [nvarchar](100) NOT NULL,
	[ParentId] [nvarchar](100) NULL,
	[Url] [nvarchar](255) NULL,
	[Title] [nvarchar](200) NULL,
	[IsMobile] [bit] NULL,
	[Html] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[DisplayOrder] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Logo] [nvarchar](255) NULL,
	[AlignClass] [nvarchar](50) NULL,
	[IsTopFix] [bit] NULL,
	[RootID] [nvarchar](100) NULL,
	[ShowBasket] [bit] NULL,
 CONSTRAINT [PK_NavigationWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Total] [decimal](18, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PayTime] [datetime] NULL,
	[CompletePayTime] [datetime] NULL,
	[TrackingNumber] [nvarchar](50) NULL,
	[LogisticsCompany] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
	[PaymentGateway] [nvarchar](50) NULL,
	[PaymentID] [nvarchar](500) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RefundID] [nvarchar](100) NULL,
	[Refund] [decimal](18, 4) NULL,
	[RefundDate] [datetime] NULL,
	[RefundReason] [nvarchar](500) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageUrl] [nvarchar](500) NULL,
	[PageTitle] [nvarchar](200) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[SessionID] [nvarchar](50) NULL,
	[UserAgent] [nvarchar](500) NULL,
	[Referer] [nvarchar](1000) NULL,
	[RefererName] [nvarchar](255) NULL,
	[KeyWords] [nvarchar](255) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_PageView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionKey] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Module] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK__Permission_PermissionKey_RoleId] PRIMARY KEY CLUSTERED 
(
	[PermissionKey] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[ImageThumbUrl] [nvarchar](255) NULL,
	[BrandCD] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Color] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[RebatePrice] [money] NULL,
	[PurchasePrice] [money] NULL,
	[Norm] [nvarchar](255) NULL,
	[ShelfLife] [nvarchar](255) NULL,
	[ProductContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWord] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](max) NULL,
	[OrderIndex] [int] NULL,
	[SourceFrom] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[TargetFrom] [nvarchar](255) NULL,
	[TargetUrl] [nvarchar](255) NULL,
	[PartNumber] [nvarchar](200) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[SEOTitle] [nvarchar](100) NULL,
	[SEOKeyWord] [nvarchar](100) NULL,
	[SEODescription] [nvarchar](300) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryId] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[ParentId] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCategoryTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryWidget](
	[ID] [nvarchar](100) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[TargetPage] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductCategoryWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetailWidget](
	[ID] [nvarchar](100) NOT NULL,
	[CustomerClass] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductDetailWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductListWidget](
	[ID] [nvarchar](100) NOT NULL,
	[IsPageable] [bit] NOT NULL,
	[ProductCategoryID] [int] NULL,
	[DetailPageUrl] [nvarchar](255) NULL,
	[Columns] [nvarchar](255) NULL,
	[PageSize] [int] NULL,
 CONSTRAINT [PK_ProductListWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[TagId] [int] NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScriptWidget](
	[ID] [nvarchar](100) NOT NULL,
	[Script] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScriptWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContent](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[SectionGroupId] [nvarchar](100) NOT NULL,
	[SectionContentType] [int] NULL,
	[Order] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_SectionContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentCallToAction](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[InnerText] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
 CONSTRAINT [PK_SectionContentCallToAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentImage](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[ImageSrc] [nvarchar](255) NULL,
	[ImageAlt] [nvarchar](255) NULL,
	[ImageTitle] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
 CONSTRAINT [PK_SectionContentImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentParagraph](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[HtmlContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_SectionContentParagraph] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentTitle](
	[ID] [nvarchar](100) NOT NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[InnerText] [nvarchar](255) NULL,
	[Href] [nvarchar](255) NULL,
	[TitleLevel] [nvarchar](10) NULL,
 CONSTRAINT [PK_SectionContentTitle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionContentVideo](
	[ID] [nvarchar](100) NOT NULL,
	[VideoTitle] [nvarchar](200) NULL,
	[Thumbnail] [nvarchar](200) NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Url] [nvarchar](256) NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_SectionContentVideo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionGroup](
	[ID] [nvarchar](100) NOT NULL,
	[GroupName] [nvarchar](255) NULL,
	[SectionWidgetId] [nvarchar](100) NOT NULL,
	[PartialView] [nvarchar](100) NULL,
	[Order] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[PercentWidth] [nvarchar](100) NULL,
 CONSTRAINT [PK_SectionGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTemplate](
	[TemplateName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Thumbnail] [nvarchar](100) NULL,
	[ExampleData] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_SectionTemplate] PRIMARY KEY CLUSTERED 
(
	[TemplateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionWidget](
	[ID] [nvarchar](100) NOT NULL,
	[SectionTitle] [nvarchar](255) NULL,
	[IsHorizontal] [bit] NULL,
 CONSTRAINT [PK_SectionWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleSheetWidget](
	[ID] [nvarchar](100) NOT NULL,
	[StyleSheet] [nvarchar](max) NULL,
 CONSTRAINT [PK_StyleSheetWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleRelation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](255) NULL,
	[ApiLoginToken] [nvarchar](255) NULL,
	[LastLoginDate] [datetime] NULL,
	[LoginIP] [nvarchar](50) NULL,
	[PhotoUrl] [nvarchar](255) NULL,
	[Timestamp] [bigint] NULL,
	[UserName] [nvarchar](100) NULL,
	[UserTypeCD] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[Age] [int] NULL,
	[Birthday] [datetime] NULL,
	[Birthplace] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[EnglishName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Hobby] [nvarchar](100) NULL,
	[LastName] [nvarchar](50) NULL,
	[MaritalStatus] [int] NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Profession] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[School] [nvarchar](50) NULL,
	[Sex] [int] NULL,
	[Telephone] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[Status] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[ResetToken] [nvarchar](50) NULL,
	[ResetTokenDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoWidget](
	[ID] [nvarchar](100) NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Url] [nvarchar](255) NULL,
	[Code] [nvarchar](500) NULL,
 CONSTRAINT [PK_VideoWidget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ExpandAllPage', N'true', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.247' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Favicon', N'~/favicon.ico', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T20:57:33.627' AS DateTime))
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTP-Email', N'', NULL, N'用于发送邮件的邮箱', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTP-Host', N'', NULL, N'邮件服务地址，如 smtp.qq.com', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTP-PassWord', N'', NULL, N'用于发送邮件的邮箱密码', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTP-Port', N'25', NULL, N'邮件服务器端口号', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ApplicationSetting] ([SettingKey], [Value], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SMTP-UseSSL', N'false', NULL, N'是否启用SSL', 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'Build ZKEACMS Core Docker image', N'使用Docker build生成ZKEACMS Core的docker image', N'ZKEACMS,Docker', N'在项目的根目录，直接使用docker build来生成docker image，在构建过程中，会自动生成和发布程序', 3, 2, NULL, N'<p>在项目的根目录，直接使用docker build来生成docker image，在构建过程中，会自动生成和发布程序</p>
<pre>docker build -t zkeacms:latest .</pre>
<h3>手动发布后生成 docker image</h3>
<p>使用Publish.cmd或者Publish.sh(Linux)先发布ZKEACMS，发布完以后，可以定位到发布目录\src\ZKEACMS.WebHost\bin\Release\PublishOutput做一些配置和修改。</p>
<p>定位到目录\src\ZKEACMS.WebHost再使用docker build来生成docker image</p>
<pre>docker build -t zkeacms:latest .</pre>
<p>使用以下命令来查看生成的Docker image</p>
<pre>docker images</pre>
<h3>运行ZKEACMS</h3>
<p>运行ZKEACMS，数据库是必需的，在可以正常运行之前，还需要配置好数据库。然后可以使用docker run来运行</p>
<pre>docker run -d -p 2345:80 zkeacms</pre>
<h3>拉取最新的ZKEACMS镜像</h3>
<p>您可以不用自己生成，可以直接拉取我们整理好的镜像，该镜像已经配置好数据，可以直接运行</p>
<pre>docker pull zkeasoft/zkeacms</pre>
<h3>MySql</h3>
<p>首先需要拉取MySql的镜像</p>
<pre>docker pull mysql</pre>
<p>运行一个MySql的实例</p>
<pre>docker run -d -e MYSQL_ROOT_PASSWORD=root --name mysql -p 3306:3306 mysql --lower_case_table_names=1</pre>
<p>在MySql里面初始化一个ZKEACMS的数据库</p>
<p>拉取MySql的ZKEACMS镜像，镜像中已经初始化了MySql连接字符串：Server=mysql;Database=ZKEACMS_Core;User Id=root;Password=root;</p>
<pre>docker pull zkeasoft/zkeacms:mysql</pre>
<p>链接MySql运行。</p>
<pre>docker run -p 808:80 --link=mysql zkeacms:mysql</pre>', 1, N'/themes/blog/images/docker.jpg', NULL, 1, CAST(N'2017-11-19T23:41:19.000' AS DateTime), NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-19T23:41:19.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:09.147' AS DateTime))
INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'SQL中的 XACT_ABORT{ ON | OFF }', N'SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。', N'SQL,XACT_ABORT', N'SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。', 10, 5, NULL, N'<p>SQL Server（从 2008 开始），可以通过设置XACT_ABORT来指定当 SQL Server 语句出现运行时错误时， Transact-SQL 是否自动回滚当前事务。</p>
<h3>XACT_ABORT</h3>
<p>语法：</p>
<pre>SET XACT_ABORT { ON | OFF }</pre>
<p>&nbsp;&nbsp;</p>
<ul>
<li>当 SET XACT_ABORT 为 ON 时，如果执行&nbsp;Transact-SQL&nbsp;语句产生运行时错误，则整个事务将终止并回滚。</li>
<li>当 SET XACT_ABORT 为 OFF 时，有时只回滚产生错误的&nbsp;Transact-SQL&nbsp;语句，而事务将继续进行处理。&nbsp;如果错误很严重，那么即使 SET XACT_ABORT 为 OFF，也可能回滚整个事务。&nbsp;OFF 是默认设置。</li>
</ul>
<p>&nbsp;</p>
<p>编译错误（如语法错误）不受 SET XACT_ABORT 的影响。</p>
<p>对于大多数 OLE DB 访问接口（包括&nbsp;SQL Server），必须将隐式或显示事务中的数据修改语句中的 XACT_ABORT 设置为 ON。&nbsp;唯一不需要该选项的情况是在提供程序支持嵌套事务时。</p>
<p>当 ANSI_WARNINGS=OFF 时，违反权限的行为导致事务中止。</p>
<p>SET XACT_ABORT 的设置是在执行或运行时设置，而不是在分析时设置。</p>
<p>要查看此设置的当前设置，请运行以下查询。</p>
<pre>DECLARE @XACT_ABORT VARCHAR(3) = ''OFF''; <br />IF ( (16384 &amp; @@OPTIONS) = 16384 ) SET @XACT_ABORT = ''ON''; <br />SELECT @XACT_ABORT AS XACT_ABORT;</pre>
<p>原文链接：<a href="https://docs.microsoft.com/en-us/sql/t-sql/statements/set-xact-abort-transact-sql" target="_blank" rel="noopener">https://docs.microsoft.com/en-us/sql/t-sql/statements/set-xact-abort-transact-sql</a></p>
<p></p>', 1, N'/themes/blog/images/sql.png', NULL, 1, CAST(N'2018-04-03T11:00:32.153' AS DateTime), NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-19T23:53:16.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T11:00:32.153' AS DateTime))
INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'JavaScript 数组删除的几种方式', N'JavaScript 数组删除的几种方式，shift，slice，pop，filter', N'JavaScript 数组删除，shift，slice，pop，filter', N'JavaScript 数组删除的几种方式，shift，slice，pop，filter', NULL, 3, NULL, N'<h3>按索引删除</h3>
<pre>//1
someArray.shift(); // 删除第一个元素
//2
someArray = someArray.slice(1); // 删除第一个元素
//3
someArray.splice(0,1); // 删除第一个元素
//4
someArray.pop(); // 删除最后一个元素
</pre>
<h3>按条件删除</h3>
<pre>someArray = [{name:"Kristian", lines:"2,5,10"},
             {name:"John", lines:"1,19,26,96"},
             {name:"Brian",lines:"3,9,62,36" }];
johnRemoved = someArray.filter(function(el) {
    return el.name !== "John";
});

console.log(JSON.stringify(johnRemoved, null, '' ''));</pre>', 1, N'/themes/blog/images/javascript.jpg', NULL, 1, CAST(N'2018-04-03T10:48:28.863' AS DateTime), NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:48:28.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:48:28.863' AS DateTime))
INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'CSS 的一些常用技巧', N'下面这些CSS常用技巧，学会了，你也是前端达人。', N'CSS 技巧', N'下面这些CSS常用技巧，学会了，你也是前端达人。', NULL, 4, NULL, N'<h2>使用 :not() 在菜单上应用/取消应用边框</h2>
<p>先给每一个菜单项添加边框</p>
<div>
<pre>/* add border */
.nav li {
  border-right: 1px solid #666;
}
</pre>
</div>
<p>&hellip;&hellip;然后再除去最后一个元素&hellip;&hellip;</p>
<p>//* remove border */</p>
<div>
<pre>.nav li:last-child {
  border-right: none;
}
</pre>
</div>
<p>&hellip;&hellip;可以直接使用 :not() 伪类来应用元素：</p>
<div>
<pre>.nav li:not(:last-child) {
  border-right: 1px solid #666;
}
</pre>
</div>
<p>这样代码就干净，易读，易于理解了。</p>
<p>当然，如果你的新元素有兄弟元素的话，也可以使用通用的兄弟选择符（~）：</p>
<p>..nav li:first-child ~ li {</p>
<div>
<pre>  border-left: 1px solid #666;
}</pre>
</div>
<h2>逗号分隔的列表</h2>
<p>让HTML列表项看上去像一个真正的，用逗号分隔的列表：</p>
<div>
<pre>ul &gt; li:not(:last-child)::after {
  content: ",";
}
</pre>
</div>
<p>对最后一个列表项使用 :not() 伪类。</p>
<h2>使用负的 nth-child 选择项目</h2>
<p>在CSS中使用负的 nth-child 选择项目1到项目n。</p>
<div>
<pre>li {
  display: none;
}

/* select items 1 through 3 and display them */
li:nth-child(-n+3) {
  display: block;
}
</pre>
</div>
<p>就是这么容易。</p>
<h2>对图标使用SVG</h2>
<p>我们没有理由不对图标使用SVG：</p>
<div>
<pre>.logo {
  background: url("logo.svg");
}
</pre>
</div>
<p>SVG对所有的分辨率类型都具有良好的扩展性，并支持所有浏览器都回归到IE9。这样可以避开.png、.jpg或.gif文件了。</p>
<h2>优化显示文本</h2>
<p>有时，字体并不能在所有设备上都达到最佳的显示，所以可以让设备浏览器来帮助你：</p>
<div>
<pre>html {
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}
</pre>
</div>
<p>注：请负责任地使用 optimizeLegibility。此外，IE /Edge没有 text-rendering 支持。</p>
<h2>对纯CSS滑块使用 max-height</h2>
<p>使用 max-height 和溢出隐藏来实现只有CSS的滑块：</p>
<div>
<pre>.slider ul {
  max-height: 0;
  overlow: hidden;
}

.slider:hover ul {
  max-height: 1000px;
  transition: .3s ease;
}
</pre>
</div>
<h2>继承 box-sizing</h2>
<p>让 box-sizing 继承 html：</p>
<div>
<pre>html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}
</pre>
</div>
<p>这样在插件或杠杆其他行为的其他组件中就能更容易地改变 box-sizing 了。</p>
<h2>表格单元格等宽</h2>
<p>表格工作起来很麻烦，所以务必尽量使用 table-layout: fixed 来保持单元格的等宽：</p>
<div>
<pre>.calendar {
  table-layout: fixed;
}</pre>
</div>
<h2>使用属性选择器用于空链接</h2>
<p>当 &lt;a&gt; 元素没有文本值，但 href 属性有链接的时候显示链接：</p>
<div>
<pre>a[href^="http"]:empty::before {
  content: attr(href);
}
</pre>
</div>
<p>相当方便。</p>', 1, N'/themes/blog/images/css.png', NULL, 1, CAST(N'2018-04-03T10:49:37.457' AS DateTime), NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:49:37.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:49:37.457' AS DateTime))
INSERT [dbo].[Article] ([ID], [Title], [Summary], [MetaKeyWords], [MetaDescription], [Counter], [ArticleTypeID], [Description], [ArticleContent], [Status], [ImageThumbUrl], [ImageUrl], [IsPublish], [PublishDate], [Url], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'Linux 如何获取命令的完整路径', N'在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径', N'Linux命令路径', N'在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径，那么应该如何得到这个路径呢？', 5, 6, NULL, N'<p>在一些时候，会需要知道执行命令的完整路径，如添加服务时，就要写完整的路径，那么应该如何得到这个路径呢？</p>
<h3>type 命令</h3>
<p>type 命令用于查询命令的别名，功能，是否是builtin命令或可执行命令文件。一般用法：</p>
<pre><span>type {command-name}</span></pre>
<p>例如查询dotnet命令的路径，可以这样输入</p>
<pre>type dotnet</pre>
<p>输出</p>
<p>dotnet is /usr/bin/dotnet</p>
<h3>whereis 命令</h3>
<p><span>whereis会得到很多条结果，因为这个命令把所有包含（不管是文件还是文件夹）的路径都列了出来。</span></p>
<pre><span>whereis dotnet</span></pre>
<p><span>输出</span></p>
<p><span>dotnet: /usr/bin/dotnet /usr/local/bin/dotnet /usr/share/dotnet /usr/share/man/man1/dotnet.1<br /></span></p>
<h3><span>which 命令</span></h3>
<p><span>which 返回的是 PATH路径中第一个位置，也就是命令默认执行的位置</span></p>
<pre><span> which dotnet<br /></span></pre>
<p><span>输出</span></p>
<p><span>/usr/bin/dotnet<br /></span></p>', 1, N'/themes/blog/images/linux.jpg', NULL, 1, CAST(N'2018-04-03T10:51:03.177' AS DateTime), NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:51:03.160' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:51:03.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] OFF
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'1883b0242b004386b247d889af7aea22', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'650a600b40494f609e11424ef7bf71c5', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'865c4dee3f8e4647b1b5f3ef389d9ef2', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'9ebe1c2aaeb044eea707885c075ccce4', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'ad2e89beefd542709124bd4e81eedf58', NULL)
INSERT [dbo].[ArticleDetailWidget] ([ID], [CustomerClass]) VALUES (N'ecdd746ec2bd49bca3e6b13321eb9ae1', NULL)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'03c0002864334a168ea2ea3c1d96c829', 1, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'0796c731dd5e45579e8855fd474b390f', 4, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'20d16bd9c1f2448b8d2a008342b4d331', 1, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'26e01f9029ee47f1a6dd772c228a2ce2', 2, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'341172334fa74e13bc260c680392d466', 3, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'712173677e3c467f884340375778ec7f', 2, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'78b94e0e1ca24601abc129cf1738a45e', 5, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'8f6a4eed88e5415e97d28bfd221e1c6e', 3, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'b1661efc756d4ab7ac4931b0539ac82d', 5, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'cbeae50bcefc4a08ae94f812b5733c75', 6, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'defdfcdef32c4080bde0ecad73ca2e1d', 6, N'~/View-Article', 1, 10)
INSERT [dbo].[ArticleListWidget] ([ID], [ArticleTypeID], [DetailPageUrl], [IsPageable], [PageSize]) VALUES (N'f3a7879104fb4e229e78a94751b3878a', 4, N'~/View-Article', 1, 10)
SET IDENTITY_INSERT [dbo].[ArticleType] ON 

INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'博客', NULL, 0, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:18.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:00.387' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'C#', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:24.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:23.163' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'JavaScript', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:29.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:29.990' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'HTML / CSS', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:39.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:39:17.250' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'SQL', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:48.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:38:48.843' AS DateTime))
INSERT [dbo].[ArticleType] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, N'Linux', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:39:05.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:39:05.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[ArticleType] OFF
SET IDENTITY_INSERT [dbo].[Carousel] ON 

INSERT [dbo].[Carousel] ([ID], [Title], [Height], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'示例', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.203' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carousel] OFF
SET IDENTITY_INSERT [dbo].[CarouselItem] ON 

INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'图1', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg1.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.217' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.053' AS DateTime))
INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'图2', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg2.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.570' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.420' AS DateTime))
INSERT [dbo].[CarouselItem] ([ID], [Title], [CarouselID], [CarouselWidgetID], [TargetLink], [ImageUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'图3', 1, NULL, N'http://www.zkea.net/zkeacms/donate', N'~/images/bg3.jpg', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:14:17.573' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-27T15:17:54.433' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarouselItem] OFF
INSERT [dbo].[CMS_Layout] ([ID], [LayoutName], [Title], [ContainerClass], [Status], [Description], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [ImageUrl], [ImageThumbUrl], [Theme]) VALUES (N'ca16c7482fc3405ea8cc53f5d4990937', N'默认', NULL, N'container', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:50:51.997' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:50:51.997' AS DateTime), N'~/images/layout.jpg', N'~/images/layout.jpg', NULL)
SET IDENTITY_INSERT [dbo].[CMS_LayoutHtml] ON 

INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (278, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.103' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.103' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (279, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.117' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.117' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (280, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.120' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (281, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.123' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.123' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (282, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.127' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.127' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (283, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.130' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.130' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (284, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.137' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (285, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.140' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.140' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (286, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.143' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.143' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (287, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.150' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.150' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (288, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.157' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.157' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (289, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.163' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.163' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (290, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.167' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.167' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (291, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.173' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.173' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (292, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.177' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.177' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (293, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.177' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.177' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (294, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.183' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.183' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (295, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.487' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.487' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (296, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.520' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.520' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (297, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.523' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.523' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (298, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.527' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.527' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (299, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.533' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.533' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (300, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.537' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.537' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (301, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.543' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.543' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (302, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.547' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.547' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (303, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.550' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.550' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (304, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.553' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.553' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (305, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.560' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.560' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (306, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.563' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.563' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (307, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.567' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (308, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.570' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.570' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (309, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.577' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (310, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.580' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (311, N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.583' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.583' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (312, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.707' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.707' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (313, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.717' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.717' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (314, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.717' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.717' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (315, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.720' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.720' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (316, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.723' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (317, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.727' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (318, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.730' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (319, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.733' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.733' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (320, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.737' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (321, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.740' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.740' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (322, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.743' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.743' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (323, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.743' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.743' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (324, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.747' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.747' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (325, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.750' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.750' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (326, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.753' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (327, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.757' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (328, N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.760' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (329, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.817' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.817' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (330, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.820' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (331, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.823' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.823' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (332, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.830' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (333, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (334, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.837' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.837' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (335, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.840' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.840' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (336, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.843' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (337, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.847' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.847' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (338, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.850' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (339, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.853' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (340, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.857' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (341, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.860' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.860' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (342, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.863' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.863' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (343, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.867' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (344, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.870' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.870' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (345, N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.873' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.873' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (346, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (347, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.840' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.840' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (348, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.840' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.840' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (349, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.843' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (350, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.847' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.847' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (351, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.850' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (352, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.857' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (353, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.857' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (354, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.860' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.860' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (355, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.863' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.863' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (356, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.867' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (357, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.867' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (358, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.870' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.870' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (359, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.873' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.873' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (360, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.877' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (361, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.880' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (362, N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.880' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (363, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.673' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.673' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (364, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.680' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (365, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.683' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (366, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.687' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.687' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (367, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.690' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (368, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.693' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (369, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.697' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.697' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (370, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (371, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.707' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.707' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (372, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.710' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.710' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (373, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.713' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.713' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (374, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.713' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.713' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (375, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.720' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.720' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (376, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.723' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (377, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.727' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (378, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.727' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.727' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (379, N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.730' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.730' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (380, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.410' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.410' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (381, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.413' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.413' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (382, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.417' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.417' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (383, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.420' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.420' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (384, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.423' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.423' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (385, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.427' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.427' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (386, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.427' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.427' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (387, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.433' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.433' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (388, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.437' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.437' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (389, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.440' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.440' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (390, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.443' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.443' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (391, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.443' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.443' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (392, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.450' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.450' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (393, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.453' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.453' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (394, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.457' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (395, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.457' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (396, N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.460' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.460' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (397, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.613' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.613' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (398, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (399, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (400, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.623' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.623' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (401, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.627' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (402, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.630' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (403, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.633' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.633' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (404, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.637' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (405, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.643' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.643' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (406, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.647' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (407, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.650' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (408, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.653' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.653' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (409, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.657' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.657' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (410, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.660' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (411, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.663' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (412, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.667' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (413, N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.673' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.673' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (414, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.207' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.207' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (415, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.210' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.210' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (416, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.213' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.213' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (417, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.217' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.217' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (418, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.217' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.217' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (419, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.220' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.220' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (420, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.223' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.223' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (421, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.223' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.223' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (422, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.227' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (423, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.230' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (424, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.233' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.233' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (425, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.237' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.237' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (426, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.240' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.240' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (427, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.243' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.243' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (428, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.243' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.243' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (429, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.247' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (430, N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.247' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (431, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.017' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.017' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (432, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.020' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.020' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (433, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.023' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.023' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (434, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.027' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.027' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (435, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.030' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.030' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (436, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.033' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.033' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (437, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.037' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.037' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (438, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.040' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.040' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (439, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.043' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.043' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (440, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.047' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (441, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.050' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (442, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.057' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.057' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (443, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.060' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.060' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (444, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.063' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.063' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (445, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.067' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.067' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (446, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.070' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.070' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (447, N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.073' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.073' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (448, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.770' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.770' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (449, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.773' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.773' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (450, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.777' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (451, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.780' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (452, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.787' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (453, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.790' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.790' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (454, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.793' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.793' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (455, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.793' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.793' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (456, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.797' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (457, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.800' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (458, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.800' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (459, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.803' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (460, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.807' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.807' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (461, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.810' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (462, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.813' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.813' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (463, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.813' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.813' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (464, N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.817' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.817' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (465, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.657' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.657' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (466, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.660' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (467, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.663' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (468, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.667' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (469, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.670' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.670' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (470, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.673' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.673' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (471, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.677' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.677' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (472, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.680' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.680' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (473, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.683' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (474, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.687' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.687' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (475, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.687' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.687' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (476, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.690' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (477, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.693' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (478, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (479, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.700' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (480, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.703' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.703' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (481, N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.707' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.707' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (482, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.580' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (483, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.580' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (484, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.583' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.583' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (485, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.587' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (486, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.587' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (487, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.590' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.590' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (488, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.593' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (489, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.597' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (490, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.600' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (491, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.600' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (492, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.603' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.603' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (493, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.607' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (494, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.607' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (495, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.613' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.613' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (496, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (497, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (498, N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (499, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.240' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.240' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (500, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.247' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (501, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.250' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.250' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (502, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.257' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (503, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.260' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (504, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.260' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (505, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (506, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (507, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.263' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (508, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.267' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.267' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (509, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.270' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (510, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.270' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (511, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.273' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.273' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (512, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.277' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (513, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.277' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (514, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.280' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.280' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (515, N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.280' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.280' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (516, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.820' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (517, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.823' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.823' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (518, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.830' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (519, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (520, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.833' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.833' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (521, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.837' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.837' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (522, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.840' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.840' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (523, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.843' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (524, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.847' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.847' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (525, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.850' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (526, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.853' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (527, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.857' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (528, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.857' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.857' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (529, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.863' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.863' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (530, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.867' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (531, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.867' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (532, N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.870' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.870' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (533, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.937' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (534, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.943' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.943' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (535, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.947' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (536, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.950' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.950' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (537, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.953' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (538, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.957' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.957' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (539, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.957' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.957' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (540, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.960' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (541, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.963' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.963' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (542, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.963' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.963' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (543, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.967' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.967' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (544, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.973' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.973' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (545, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.973' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.973' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (546, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.977' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.977' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (547, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.980' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (548, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.980' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (549, N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.983' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.983' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (550, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.597' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (551, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.597' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (552, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.600' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (553, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.603' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.603' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (554, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.603' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.603' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (555, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.607' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (556, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.610' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.610' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (557, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.613' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.613' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (558, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.613' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.613' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (559, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (560, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (561, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (562, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.627' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (563, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.630' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (564, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.630' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (565, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.633' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.633' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (566, N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.637' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (567, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.260' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (568, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.263' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (569, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.267' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.267' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (570, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.270' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (571, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.273' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.273' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (572, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.277' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (573, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.277' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (574, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.280' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.280' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (575, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.283' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.283' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (576, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.287' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.287' AS DateTime))
GO
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (577, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.287' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.287' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (578, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.290' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.290' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (579, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.293' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (580, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.293' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (581, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.297' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.297' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (582, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.300' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.300' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (583, N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.303' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.303' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (584, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'<div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.597' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (585, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.600' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (586, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'ZONE-0', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.603' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.603' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (587, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.607' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (588, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container main custom-style">
        <div class="additional row"><div class="col-md-8 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.610' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.610' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (589, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.610' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.610' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (590, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'ZONE-1', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.613' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.613' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (591, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (592, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</div></div></div>
                            <div class="col-md-4 additional">
                                
                            <div class="colContent row"><div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.617' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (593, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.620' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (594, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'ZONE-2', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.623' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.623' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (595, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.627' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (596, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</div></div></div></div>
    </div>
    <div class="container-fluid main custom-style">
        <div class="additional row">
            <div class="col-md-12 additional">
                <div class="colContent row">
                    <div class="additional zone">', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.630' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (597, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'<zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.630' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (598, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'ZONE-3', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.633' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.633' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (599, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</zone>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.637' AS DateTime))
INSERT [dbo].[CMS_LayoutHtml] ([LayoutHtmlId], [LayoutId], [PageId], [Html], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (600, N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'</div>
                </div>
            </div>
        </div>
    </div>', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.640' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[CMS_LayoutHtml] OFF
INSERT [dbo].[CMS_Media] ([ID], [ParentID], [Title], [MediaType], [Url], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (N'6056810a7ede46bb94b55b2756323640', N'#', N'图片', 1, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-04-01T21:42:14.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-04-01T21:42:14.960' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CMS_Message] ON 

INSERT [dbo].[CMS_Message] ([ID], [Title], [Email], [PostMessage], [Reply], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (1, N'ZKEASOFT', N'zkea@zkea.net', N'ZKEACMS是基于ASP.NET MVC4开发的开源CMS，提供免费下载学习使用。', N'KEACMS使用可视化编辑设计，所见即所得，可直接在页面上设计你要的页面。', 1, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:02:34.260' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:02:34.260' AS DateTime), NULL)
INSERT [dbo].[CMS_Message] ([ID], [Title], [Email], [PostMessage], [Reply], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description]) VALUES (2, N'ZKEASOFT', N'zkea@zkea.net', N'ZKEACMS使用可视化编辑设计', N'ZKEACMS是一个内容管理软件（网站），不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。', 1, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:03:09.967' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:03:09.967' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CMS_Message] OFF
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'0b799e73255b44b3994befc95ba243a2', N'6328cdbf6a7c4dacbfa84688ab0bf47a', 1, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 7, NULL, 1, 1, CAST(N'2019-05-07T21:27:42.243' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.243' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.243' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1b80523a21f54c6cbc5a681e9834048d', NULL, 0, N'#', N'C#', 0, N'~/csharp', N'ca16c7482fc3405ea8cc53f5d4990937', N'C# - 博客', NULL, 2, NULL, 1, 1, CAST(N'2019-05-07T21:23:15.810' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.810' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'207ca2a6d2824accb05f70911ebf8fc6', NULL, 0, N'#', N'首页', 0, N'~/index', N'ca16c7482fc3405ea8cc53f5d4990937', N'欢迎使用ZKEACMS进行创作', NULL, 1, NULL, 1, 1, CAST(N'2019-05-07T21:22:36.673' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:53:36.797' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.673' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'30f2d6fc620d4cd28cefcdf06c4016fa', N'207ca2a6d2824accb05f70911ebf8fc6', 1, N'#', N'首页', 0, N'~/index', N'ca16c7482fc3405ea8cc53f5d4990937', N'欢迎使用ZKEACMS进行创作', NULL, 1, NULL, 1, 1, CAST(N'2019-05-07T21:22:36.687' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.690' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'35f86f8ae0e24ee7a9a82ff447931ca9', N'7d3619f621014ee6b9a9327a60e32221', 1, N'#', N'JavaScript', 0, N'~/javascript', N'ca16c7482fc3405ea8cc53f5d4990937', N'JavaScript - 博客', NULL, 4, NULL, 1, 1, CAST(N'2019-05-07T21:24:56.387' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.387' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.387' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'3c7307f174074203a108f3f6253b3aba', N'dfc244751ee0488f9269cf7caff7dcb2', 1, N'#', N'HTML / CSS', 0, N'~/html-css', N'ca16c7482fc3405ea8cc53f5d4990937', N'HTML / CSS - 博客', NULL, 5, NULL, 1, 1, CAST(N'2019-05-07T21:25:23.187' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.187' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.187' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'5f6ee2692eea45fe925ff8cfec298620', N'1b80523a21f54c6cbc5a681e9834048d', 1, N'#', N'C#', 0, N'~/csharp', N'ca16c7482fc3405ea8cc53f5d4990937', N'C# - 博客', NULL, 3, NULL, 1, 1, CAST(N'2019-05-07T21:23:15.817' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.817' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.817' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'5fb68bdbbf9341eba937580f2a6e18e2', N'6328cdbf6a7c4dacbfa84688ab0bf47a', 1, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 7, NULL, 1, 1, CAST(N'2019-05-07T21:27:08.583' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.583' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.583' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6328cdbf6a7c4dacbfa84688ab0bf47a', NULL, 0, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 7, NULL, 1, 1, CAST(N'2019-05-07T21:28:46.557' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:51:53.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.560' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'711bbff5416942dbbb23f996081fb961', N'6328cdbf6a7c4dacbfa84688ab0bf47a', 1, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 7, NULL, 1, 1, CAST(N'2019-05-07T21:28:46.573' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.577' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'77d542abda5f4ad49565187d3416e765', N'6328cdbf6a7c4dacbfa84688ab0bf47a', 1, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 2, NULL, 1, 1, CAST(N'2018-04-03T10:57:11.590' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.593' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'7d3619f621014ee6b9a9327a60e32221', NULL, 0, N'#', N'JavaScript', 0, N'~/javascript', N'ca16c7482fc3405ea8cc53f5d4990937', N'JavaScript - 博客', NULL, 3, NULL, 1, 1, CAST(N'2019-05-07T21:24:56.377' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.633' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.377' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'8f52621c5bcf400ca5cacdd5b426942c', NULL, 0, N'#', N'SQL', 0, N'~/sql', N'ca16c7482fc3405ea8cc53f5d4990937', N'SQL - 博客', NULL, 5, NULL, 1, 1, CAST(N'2019-05-07T21:25:48.747' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:34.977' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.747' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'b8b17e2ea98345d1a13fb0370639ad27', N'da663176840c4eac99a807e7880f2e77', 1, N'#', N'Linux', 0, N'~/linux', N'ca16c7482fc3405ea8cc53f5d4990937', N'Linux - 博客', NULL, 7, NULL, 1, 1, CAST(N'2019-05-07T21:26:21.563' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.567' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'c569d6abb1e749b7b339ce1ae9e3e19c', N'6328cdbf6a7c4dacbfa84688ab0bf47a', 1, N'#', N'查看文章', 0, N'~/View-Article', N'ca16c7482fc3405ea8cc53f5d4990937', N'查看文章', NULL, 2, NULL, 1, 1, CAST(N'2019-05-07T21:27:00.920' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.920' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.920' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'da663176840c4eac99a807e7880f2e77', NULL, 0, N'#', N'Linux', 0, N'~/linux', N'ca16c7482fc3405ea8cc53f5d4990937', N'Linux - 博客', NULL, 6, NULL, 1, 1, CAST(N'2019-05-07T21:26:21.560' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.560' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'dfc244751ee0488f9269cf7caff7dcb2', NULL, 0, N'#', N'HTML / CSS', 0, N'~/html-css', N'ca16c7482fc3405ea8cc53f5d4990937', N'HTML / CSS - 博客', NULL, 4, NULL, 1, 1, CAST(N'2019-05-07T21:25:23.183' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.573' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.183' AS DateTime))
INSERT [dbo].[CMS_Page] ([ID], [ReferencePageID], [IsPublishedPage], [ParentId], [PageName], [IsHomePage], [Url], [LayoutId], [Title], [Content], [DisplayOrder], [Description], [Status], [IsPublish], [PublishDate], [MetaKeyWorlds], [MetaDescription], [Script], [Style], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ea91caaa7263400ea516fabcc9cc8d53', N'8f52621c5bcf400ca5cacdd5b426942c', 1, N'#', N'SQL', 0, N'~/sql', N'ca16c7482fc3405ea8cc53f5d4990937', N'SQL - 博客', NULL, 6, NULL, 1, 1, CAST(N'2019-05-07T21:25:48.753' AS DateTime), NULL, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.753' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[CMS_Redirection] ON 

INSERT [dbo].[CMS_Redirection] ([ID], [Title], [InComingUrl], [DestinationURL], [IsPermanent], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'默认', N'~/', N'~/index', 0, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:58:06.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-08-14T15:53:01.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[CMS_Redirection] OFF
INSERT [dbo].[CMS_Theme] ([ID], [Title], [Url], [UrlDebugger], [Thumbnail], [IsActived], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'blog', N'博客', N'~/themes/blog/css/Theme.min.css', N'~/themes/blog/css/Theme.css', N'~/themes/blog/thumbnail.jpg', 1, 1, N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CMS_Theme] ([ID], [Title], [Url], [UrlDebugger], [Thumbnail], [IsActived], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Default', N'默认', N'~/themes/Default/css/Theme.min.css', N'~/themes/Default/css/Theme.css', N'~/themes/Default/thumbnail.jpg', 0, 1, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-04-04T22:17:10.790' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-04-04T22:21:01.487' AS DateTime))
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'00f62c5acfe840e0bee3ca2979f0f025', N'图片右', NULL, 9, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:13:55.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:13:22.937' AS DateTime), NULL, NULL, 1, N'~/images/template%20(6).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'03c0002864334a168ea2ea3c1d96c829', N'文章列表', NULL, 1, NULL, N'207ca2a6d2824accb05f70911ebf8fc6', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:02:47.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:02:57.357' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'0796c731dd5e45579e8855fd474b390f', N'文章列表', NULL, 1, NULL, N'dfc244751ee0488f9269cf7caff7dcb2', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:16.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:21.920' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'09617f6142934daaadee6cfb9df6d66f', N'段落', NULL, 4, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:53:07.263' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-24T10:49:44.100' AS DateTime), NULL, NULL, 1, N'~/images/template%20(2).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'0cbd1f8be3b44fd0a2729fe941b9dfdd', N'段落', NULL, 4, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-2', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:34.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:53.550' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'文字三列', NULL, 8, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.277' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:12:54.387' AS DateTime), NULL, NULL, 1, N'~/images/template (15).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'1476a3ceef7946eabf563b6b71623feb', N'评论箱', NULL, 2, NULL, N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-1', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.993' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.993' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"RuleID":null,"CustomClass":"container","CustomStyle":null,"DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'16a0f1e9a8294a05a7b988fb54e03f1d', N'个人信息', NULL, 1, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-2', N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'image-circle', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:59.997' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:53.523' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'1883b0242b004386b247d889af7aea22', N'文章内容', NULL, 2, NULL, N'77d542abda5f4ad49565187d3416e765', N'ZONE-0', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.600' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'1fb967867e3b440e86336bc5a51e8719', N'图例三（圆）', NULL, 17, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'align-center image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:19:30.777' AS DateTime), NULL, NULL, 1, N'~/images/template%20(12).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'20d16bd9c1f2448b8d2a008342b4d331', N'文章列表', NULL, 1, NULL, N'30f2d6fc620d4cd28cefcdf06c4016fa', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.767' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'26e01f9029ee47f1a6dd772c228a2ce2', N'文章列表', NULL, 1, NULL, N'5f6ee2692eea45fe925ff8cfec298620', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.883' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.883' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'2b3eb61307d24c50a6b3aaa75db3810e', N'图片左', NULL, 11, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:06:17.637' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:14:54.330' AS DateTime), NULL, NULL, 1, N'~/images/template%20(5).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'2d71120b7f464f46ba26beb19d3120ea', N'分隔符', NULL, 2, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-2', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:20.603' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:53.530' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'341172334fa74e13bc260c680392d466', N'文章列表', NULL, 1, NULL, N'35f86f8ae0e24ee7a9a82ff447931ca9', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.463' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'3d8b565424ef44b99ceb6d95c3ac9f9a', N'版权申明', NULL, 2, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-3', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, N'footer', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:53:08.583' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:34.700' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'481574ebc98b4cdf9a07e3f20c1ab78d', N'图片左（圆）', NULL, 12, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.870' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:15:23.317' AS DateTime), NULL, NULL, 1, N'~/images/template%20(7).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'50f810582d28440eb3bdff9ee5b1ef24', N'图片左（平分）', NULL, 13, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:36:23.247' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:16:05.733' AS DateTime), NULL, NULL, 1, N'~/images/template (17).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'51126da6754749b29cc562357e4e4aaa', N'评论箱', NULL, 1, NULL, N'711bbff5416942dbbb23f996081fb961', N'ZONE-3', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.643' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.643' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"RuleID":null,"CustomClass":"container","CustomStyle":null,"DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'55b73e54fd054de4847960bdac350c6d', N'图例二（圆）', NULL, 15, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'align-center image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.533' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:17:49.737' AS DateTime), NULL, NULL, 1, N'~/images/template%20(10).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'56991d0ff59d4c1db27aff3a50fcb382', N'页头', NULL, 2, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:51:35.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:10:19.703' AS DateTime), NULL, NULL, 1, N'~/images/template%20(1).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'650a600b40494f609e11424ef7bf71c5', N'文章内容', NULL, 1, NULL, N'c569d6abb1e749b7b339ce1ae9e3e19c', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:01.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:01.000' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'712173677e3c467f884340375778ec7f', N'文章列表', NULL, 1, NULL, N'1b80523a21f54c6cbc5a681e9834048d', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:03.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:11.073' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'78b94e0e1ca24601abc129cf1738a45e', N'文章列表', NULL, 1, NULL, N'ea91caaa7263400ea516fabcc9cc8d53', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.820' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7c9b3684a9fb40f6aa656757f24cb9a6', N'评论箱', NULL, 2, NULL, N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-1', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.640' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.640' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"RuleID":null,"CustomClass":"container","CustomStyle":null,"DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'7e6ffef4f66c488c8c36c9012a6df10c', N'评论箱', NULL, 1, NULL, N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-3', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:56:56.617' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:34.680' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"CustomClass":"","CustomStyle":"","DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'865c4dee3f8e4647b1b5f3ef389d9ef2', N'文章内容', NULL, 1, NULL, N'5fb68bdbbf9341eba937580f2a6e18e2', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.643' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.643' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'877e1f5287574639b0f8d564078e1b2f', N'评论箱', NULL, 2, NULL, N'0b799e73255b44b3994befc95ba243a2', N'ZONE-1', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.307' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.307' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"RuleID":null,"CustomClass":"container","CustomStyle":null,"DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8cc061c2e2514ef9b85bbecdec3f84ab', N'分隔符', NULL, 5, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:55:12.377' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T13:55:12.377' AS DateTime), NULL, NULL, 1, N'~/images/template%20(3).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'8f6a4eed88e5415e97d28bfd221e1c6e', N'文章列表', NULL, 1, NULL, N'7d3619f621014ee6b9a9327a60e32221', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:49.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:54.463' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'9ebe1c2aaeb044eea707885c075ccce4', N'文章内容', NULL, 1, NULL, N'711bbff5416942dbbb23f996081fb961', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.650' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'a8259ee60a274b61834ff820f2299843', N'导航', NULL, 2, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-0', N'Widget.Navigation', N'ZKEACMS', N'ZKEACMS.Common.Service.NavigationWidgetService', N'ZKEACMS.Common.Models.NavigationWidget', NULL, N'full', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:52:11.173' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:59:03.893' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'ad2e89beefd542709124bd4e81eedf58', N'文章内容', NULL, 1, NULL, N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:52:08.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:39.403' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'b1661efc756d4ab7ac4931b0539ac82d', N'文章列表', NULL, 1, NULL, N'8f52621c5bcf400ca5cacdd5b426942c', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:36.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:45.567' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'b568ff7f4a894870adaf9afadf787bf9', N'图例二', NULL, 14, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:20:29.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:16:58.140' AS DateTime), NULL, NULL, 1, N'~/images/template%20(9).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'b598f442c2324f91abcab501517dcdef', N'评论箱', NULL, 4, NULL, N'77d542abda5f4ad49565187d3416e765', N'ZONE-0', N'Widget.Comments', N'ZKEACMS.Message', N'ZKEACMS.Message.Service.CommentsWidgetService', N'ZKEACMS.Message.Models.CommentsWidget', NULL, N'container', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:57:11.597' AS DateTime), NULL, NULL, 0, NULL, 0, N'{"CustomClass":"container","CustomStyle":null,"DataSourceLink":null,"DataSourceLinkTitle":null,"ActionType":1}', NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'bb7dab4f077745ef8b5b425eaabb423c', N'巨幕', NULL, 1, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:28:47.827' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:09:41.597' AS DateTime), NULL, NULL, 1, N'~/images/template (16).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'cbeae50bcefc4a08ae94f812b5733c75', N'文章列表', NULL, 1, NULL, N'b8b17e2ea98345d1a13fb0370639ad27', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.627' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.627' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'defdfcdef32c4080bde0ecad73ca2e1d', N'文章列表', NULL, 1, NULL, N'da663176840c4eac99a807e7880f2e77', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:01.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:15.693' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'e3eb5dd919c4477a857a478764daaa78', N'巨幕', NULL, 1, N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'ZONE-0', N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, N'full style="color:#fff;height:500px;background-image:url(/themes/blog/images/top-background.jpg);background-position:50% 50%;background-size:cover;"', N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:56:37.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:37:16.157' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'ecdd746ec2bd49bca3e6b13321eb9ae1', N'文章内容', NULL, 1, NULL, N'0b799e73255b44b3994befc95ba243a2', N'ZONE-1', N'Widget.ArticleDetail', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleDetailWidgetService', N'ZKEACMS.Article.Models.ArticleDetailWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.310' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.310' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'ed837392097f4e60b812bc57111dd762', N'图例三', NULL, 16, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:18:22.983' AS DateTime), NULL, NULL, 1, N'~/images/template%20(11).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f3a7879104fb4e229e78a94751b3878a', N'文章列表', NULL, 1, NULL, N'3c7307f174074203a108f3f6253b3aba', N'ZONE-1', N'Widget.ArticleList-Snippet', N'ZKEACMS.Article', N'ZKEACMS.Article.Service.ArticleListWidgetService', N'ZKEACMS.Article.Models.ArticleListWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.250' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.250' AS DateTime), NULL, NULL, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f41174cfa4d247f4974c47f4d2b000fd', N'文字二列', NULL, 7, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:21:37.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:11:06.067' AS DateTime), NULL, NULL, 1, N'~/images/template (14).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f6de0d62d3974ee2bf2ded3fbbc82c2b', N'间距', NULL, 6, NULL, NULL, NULL, N'Widget.HTML', N'ZKEACMS', N'ZKEACMS.Common.Service.HtmlWidgetService', N'ZKEACMS.Common.Models.HtmlWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:00:46.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:08:21.673' AS DateTime), NULL, NULL, 1, N'~/images/template%20(4).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'f6f11ba2fec844de883acf0a1fe3eb89', N'图片右（圆）', NULL, 10, NULL, NULL, NULL, N'Widget.Section', N'ZKEACMS.SectionWidget', N'ZKEACMS.SectionWidget.Service.SectionWidgetService', N'ZKEACMS.SectionWidget.Models.SectionWidget', N'SectionWidgetForm', N'image-circle', N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-06-29T14:13:44.223' AS DateTime), NULL, NULL, 1, N'~/images/template%20(8).png', 1, NULL, NULL)
INSERT [dbo].[CMS_WidgetBase] ([ID], [WidgetName], [Title], [Position], [LayoutId], [PageId], [ZoneId], [PartialView], [AssemblyName], [ServiceTypeName], [ViewModelTypeName], [FormView], [StyleClass], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [IsTemplate], [Thumbnail], [IsSystem], [ExtendData], [RuleID]) VALUES (N'fee7f4d7d7e641b0bfa74491a543d245', N'图片', NULL, 3, NULL, NULL, NULL, N'Widget.Image', N'ZKEACMS', N'ZKEACMS.Common.Service.ImageWidgetService', N'ZKEACMS.Common.Models.ImageWidget', NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:14:46.133' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:14:46.133' AS DateTime), NULL, NULL, 1, N'~/images/template (13).png', 1, NULL, NULL)
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'01de893a6dc343d99000d67c29f97c90', N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.257' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'08c2e54c2e14459c8aa0b3e55513a114', N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.470' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'0a3dc97cbbbc4ecbab78f6aa3d9c9498', N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.707' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.707' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'111e6863e7814d7b98e0e318ff3db484', N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.257' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.257' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'132cc12aefa5422e99fe401837557ba4', N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.703' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.703' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'13b2f0ef613d4bffb51c5fbf023107a1', N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.197' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.197' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'17c51c47b4294102a886cd8c025aeeb5', N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.937' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1bdc7bccc7424cb7b8a73e8a630879ca', N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.763' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.763' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1dd65140490b4ae68d2d781ed03b794c', N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.477' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.477' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'1f0b1eb10b7b4f7294f360aeb94f2d2e', N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.930' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.930' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'256b226d34734e41b132b0cac2a49389', N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.233' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.233' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'25c0367de7754fb99f7285585ea20ed0', N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.693' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.693' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'2807ca0ad6d143bca06591ac4856705d', N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.480' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.480' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'2d058a3f0cda4581ab9369a34b3b236d', N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:51:47.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.040' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'2f6608b15dff41348b30f26dd1b5547d', N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.590' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.590' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'32b93f9b4b1943e1abcff9346d535655', N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:51:47.867' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.053' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3d57ade9ee534e63942b7d3359b9f0f7', N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.193' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.193' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3e90a10a209d47aa9c4d59c8a05baa47', N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.227' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'3f28c7e1d08046ae92193c539844c888', N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.587' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'47618a6ca9214d4abcafbd70cd23d254', N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.570' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.570' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'48fdbafb54624a7e8e8c9fe465dd22da', N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.800' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'4d33a568f9a44fca8c88649654144217', N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.407' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.407' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'4e0debb4f68a456e9e1bd19d24ee202d', N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.767' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.767' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'4ffef0c89f02452e852202314a5737c5', N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.647' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'5376d1b4577c4949a4e370f6fa8156b8', N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.827' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.827' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'56aca6bd93fd4879b98e17c8f35d4cfa', N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.573' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.573' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'5980ed8c0bfa4cd48db31225ef24bf4d', N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.643' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.643' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'5f1168c2d2b64986811a900468272425', N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.813' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.813' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'60dd46a58c4446b89147f3a2128a47f8', N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.807' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.807' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'631bb06c18bd4f1a9588c9c2c09733a1', N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:51:47.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.053' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'6a22e6256ddc488993af7605821e78f6', N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.400' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7370a4990c8143939d9bd8332a25c59b', N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.663' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7443adbc43b44c958d5ef80511049e80', N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.203' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.203' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'74b7eb2b96ae4173a0920239ef5d9459', N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.830' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'79e74602a80942ebb4d68edc5d1214e1', N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.760' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.760' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'7d63305b941b4f879d3d8490137a7667', N'ca16c7482fc3405ea8cc53f5d4990937', N'3c7307f174074203a108f3f6253b3aba', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.197' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:23.197' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'881b4c18a6584af395b89120f3a7b020', N'ca16c7482fc3405ea8cc53f5d4990937', N'6328cdbf6a7c4dacbfa84688ab0bf47a', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:46.803' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'88362e55328b438b87afe1ddf0b24005', N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.010' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.010' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9488b105174343f2a51894d55bcc5d7d', N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.390' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.390' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9a96e35ad3b745b6a1338068960049dc', N'ca16c7482fc3405ea8cc53f5d4990937', N'207ca2a6d2824accb05f70911ebf8fc6', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.443' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:20:04.443' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9bcf490e2a3f4c8485bff004741e6adb', N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.003' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.003' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9be158c04ac5476f948e51ef0e4ce46d', N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.807' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.807' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'9e802557ad4246979d618319f2c6301a', N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.830' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a3282e8ac8534b9faf2b0f3e3a661fee', N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.587' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a6e467a0530b402ca7d08969e0fe554b', N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.600' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a7ff57858b7f41c980f9f50a7ba0f1ce', N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.660' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'a83c8b94a5f04258822d521bdb9be7ba', N'ca16c7482fc3405ea8cc53f5d4990937', N'35f86f8ae0e24ee7a9a82ff447931ca9', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:56.397' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'afa6b2f43cc2492eaedbded6550d5706', N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.577' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.577' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'b0a1cc72416345faa3afffe688d2458a', N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.597' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.597' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'b263b6461a884fa2a060edb508f3ff52', N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.587' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'b4d20794f99c4a70912db458c527c21c', N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.590' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.590' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'bab53c95960646518a4839aca62451da', N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.000' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'bbd899e660aa4a17b3f25bcd9ba6842c', N'ca16c7482fc3405ea8cc53f5d4990937', N'8f52621c5bcf400ca5cacdd5b426942c', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.007' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:35.007' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c8b78f8381764c399ec4833c328861f3', N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.657' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.657' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'c96d3f87d9ed49a6b3d42e3db1449e06', N'ca16c7482fc3405ea8cc53f5d4990937', N'ea91caaa7263400ea516fabcc9cc8d53', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.757' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:48.757' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'cce78ce8accd4587900c04bc57a8b89c', N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.607' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.607' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd5838d6adba54d40bef7488e31553724', N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.810' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.810' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd585c17a90e9449b96680f25ca025af8', N'ca16c7482fc3405ea8cc53f5d4990937', N'30f2d6fc620d4cd28cefcdf06c4016fa', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.700' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:22:36.700' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd68338ca27f4403bbc2e85381a90f40d', N'ca16c7482fc3405ea8cc53f5d4990937', N'5f6ee2692eea45fe925ff8cfec298620', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:15.820' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd844457af35744ffa3e653e5de6b3b20', N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.650' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'd8564eb6dbf847a5b3c434c3a5cbdf62', N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.580' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'dbf120ac1d4944878e4160167c073edf', N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.800' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.800' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'dc4088fce2234e32a330642caa06f5f7', N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.253' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.253' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'dc9d023147294165866e98954c64a854', N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.927' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.927' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'dcaf2ec6a8224cea95a94bc4045e857b', N'ca16c7482fc3405ea8cc53f5d4990937', N'da663176840c4eac99a807e7880f2e77', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.650' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:59.650' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'dd6cba951d7047fdbcd3caf7bfd4b27a', N'ca16c7482fc3405ea8cc53f5d4990937', NULL, N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T09:51:47.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:46:28.057' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'de3a6f64c64046cdbf83b08024f86516', N'ca16c7482fc3405ea8cc53f5d4990937', N'7d3619f621014ee6b9a9327a60e32221', N'主内容', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.667' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:47.667' AS DateTime), NULL, NULL, N'ZONE-1')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'e6bf874e0fe24080b7c7a7ec6cb1713d', N'ca16c7482fc3405ea8cc53f5d4990937', N'b8b17e2ea98345d1a13fb0370639ad27', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:21.567' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'e72da0e984b44c42ae4a8982459b7f9c', N'ca16c7482fc3405ea8cc53f5d4990937', N'5fb68bdbbf9341eba937580f2a6e18e2', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:08.593' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ea716e272d004755b276d258157d1312', N'ca16c7482fc3405ea8cc53f5d4990937', N'c569d6abb1e749b7b339ce1ae9e3e19c', N'底部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.930' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:00.930' AS DateTime), NULL, NULL, N'ZONE-3')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'ec57dda133344d2783ecaac79530b575', N'ca16c7482fc3405ea8cc53f5d4990937', N'0b799e73255b44b3994befc95ba243a2', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.250' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:27:42.250' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'efd60787bece495d9b48b21acd225b75', N'ca16c7482fc3405ea8cc53f5d4990937', N'711bbff5416942dbbb23f996081fb961', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:28:46.593' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f10dd16ebde1421d9054c7756dcf3f14', N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.227' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.227' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f5f510746cf6425892211775937c906c', N'ca16c7482fc3405ea8cc53f5d4990937', N'77d542abda5f4ad49565187d3416e765', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.220' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:26:23.220' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f62da2ed53da431f9ab6c9a945e122c8', N'ca16c7482fc3405ea8cc53f5d4990937', N'dfc244751ee0488f9269cf7caff7dcb2', N'边栏', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.593' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:25:13.593' AS DateTime), NULL, NULL, N'ZONE-2')
INSERT [dbo].[CMS_Zone] ([ID], [LayoutId], [PageId], [ZoneName], [Title], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Description], [Status], [HeadingCode]) VALUES (N'f85d597070564d2094aec5211f345966', N'ca16c7482fc3405ea8cc53f5d4990937', N'1b80523a21f54c6cbc5a681e9834048d', N'顶部', NULL, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.803' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:00.803' AS DateTime), NULL, NULL, N'ZONE-0')
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.LiveChatScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-07T21:19:17.490' AS DateTime), NULL, NULL, CAST(N'2019-05-07T21:19:17.490' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.GlobalScripts.Models.StatisticsScript', N'{"Location":0,"Script":null}', NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-07T21:19:17.603' AS DateTime), NULL, NULL, CAST(N'2019-05-07T21:19:17.603' AS DateTime))
INSERT [dbo].[DataArchived] ([ID], [Data], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ZKEACMS.Shop.AliPayConfigOptions', N'{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-03T09:48:09.593' AS DateTime), NULL, NULL, CAST(N'2018-04-03T09:48:09.593' AS DateTime))
SET IDENTITY_INSERT [dbo].[DataDictionary] ON 

INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'RecordStatus', N'有效', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'RecordStatus', N'无效', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'ArticleCategory', N'新闻', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, N'ArticleCategory', N'公司新闻', N'2', 2, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, N'ArticleCategory', N'行业新闻', N'3', 3, 3, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, N'UserEntity@Sex', N'男', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, N'UserEntity@Sex', N'女', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (8, N'UserEntity@MaritalStatus', N'未婚', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (9, N'UserEntity@MaritalStatus', N'已婚', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (11, N'UserEntity@UserTypeCD', N'后台管理员', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (12, N'ArticleTopWidget@PartialView', N'默认', N'Widget.ArticleTops', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (13, N'ArticleListWidget@PartialView', N'默认', N'Widget.ArticleList', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (14, N'ArticleListWidget@PartialView', N'横幅', N'Widget.ArticleList-Snippet', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (15, N'ProductListWidget@PartialView', N'默认', N'Widget.ProductList', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (16, N'ProductListWidget@Columns', N'3 列', N'col-xs-12 col-sm-6 col-md-4', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (17, N'ProductListWidget@Columns', N'4 列', N'col-xs-12 col-sm-6 col-md-4 col-lg-3', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (18, N'CarouselWidget@PartialView', N'默认', N'Widget.Carousel', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (19, N'ArticleSummaryWidget@Style', N'默认', N'bs-callout-default', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (20, N'ArticleSummaryWidget@Style', N'危险', N'bs-callout-danger', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (21, N'ArticleSummaryWidget@Style', N'警告', N'bs-callout-warning', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (22, N'ArticleSummaryWidget@Style', N'信息', N'bs-callout-info', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (23, N'ArticleSummaryWidget@Style', N'成功', N'bs-callout-success', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (24, N'ArticleSummaryWidget@PartialView', N'默认', N'Widget.ArticleSummary', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (25, N'ProductCategoryWidget@PartialView', N'默认', N'Widget.ProductCategory', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (26, N'ArticleTypeWidget@PartialView', N'默认', N'Widget.ArticleType', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (27, N'UserEntity@UserTypeCD', N'前端用户', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (28, N'Order@OrderStatus', N'未支付', N'1', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (29, N'Order@OrderStatus', N'取消', N'2', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (30, N'Order@OrderStatus', N'已支付', N'3', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (31, N'Order@OrderStatus', N'已发货', N'4', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (32, N'Order@OrderStatus', N'交易完成', N'5', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (33, N'Order@OrderStatus', N'已退款', N'6', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (34, N'Order@OrderStatus', N'退款中', N'7', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (35, N'ProductListWidget@PartialView', N'列表', N'Widget.ProductList.A', 2, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (36, N'RuleItem@Condition', N'并且', N'and', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (37, N'RuleItem@Condition', N'或者', N'or', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (38, N'RuleItem@FunctionName', N'等于', N'Equals', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (39, N'RuleItem@FunctionName', N'不等于', N'NotEquals', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (40, N'RuleItem@FunctionName', N'大于', N'GreaterThan', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (41, N'RuleItem@FunctionName', N'大于等于', N'GreaterThanOrEquals', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (42, N'RuleItem@FunctionName', N'小于', N'LessThan', 5, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (43, N'RuleItem@FunctionName', N'小于等于', N'LessThanOrEquals', 6, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (44, N'RuleItem@FunctionName', N'以…开头', N'StartsWith', 7, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (45, N'RuleItem@FunctionName', N'以...结尾', N'EndsWith', 8, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (46, N'RuleItem@FunctionName', N'不以…开头', N'NotStartsWith', 9, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (47, N'RuleItem@FunctionName', N'不以...结尾', N'NotEndsWith', 10, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (48, N'RuleItem@FunctionName', N'包含', N'Contains', 11, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (49, N'RuleItem@FunctionName', N'不包含', N'NotContains', 12, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (50, N'RuleItem@FunctionName', N'在...里', N'In', 13, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (51, N'RuleItem@FunctionName', N'不在...里', N'NotIn', 14, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (52, N'RuleItem@Property', N'Url', N'ValueOf(''Url'')', 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (53, N'RuleItem@Property', N'Url参数', N'ValueOf(''QueryString'')', 2, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (54, N'RuleItem@Property', N'User-Agent', N'ValueOf(''UserAgent'')', 3, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DataDictionary] ([ID], [DicName], [Title], [DicValue], [Order], [Pid], [IsSystem], [ImageUrl], [ImageThumbUrl], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (55, N'RuleItem@Property', N'当前日期', N'ValueOf(''Now'')', 4, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DataDictionary] OFF
INSERT [dbo].[Forms] ([ID], [Title], [FieldsData], [NotificationReceiver], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'5ed56d90ac154e73befa6fbc981ae3ae', N'问卷调查', N'[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"一个简单的问卷调查","Value":null,"Description":"欢迎您使用ZKEACMS，这是一个自定义表单","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"姓名","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"电话","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"邮箱地址","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"微信","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"省份地址","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"详细地址","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"您从哪里了解到ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"搜索引擎","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"博客园","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"朋友介绍","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"其它论坛","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"您一般使用ZKEACMS做什么","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"网站","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"博客","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"其它","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"您觉得ZKEACMS怎么样","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"很不错","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"还可以","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"有待提高","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"不怎么样","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"您的意见或建议","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]', NULL, NULL, N'', NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:07:58.013' AS DateTime))
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'09617f6142934daaadee6cfb9df6d66f', N'<p>这是文本段落，你可以在段里面加入标题，文字，图片，表格，列表，链接等等。例如：</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'0cbd1f8be3b44fd0a2729fe941b9dfdd', N'<p>A developer, podcast producer, book author, and open source evangelist. On his personal blog C#, .NET, IIS, SNMP, and many other topics are covered. The opinions expressed herein are his own personal opinions and do not represent his employer&rsquo;s view in any way.</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'2d71120b7f464f46ba26beb19d3120ea', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'3d8b565424ef44b99ceb6d95c3ac9f9a', N'<div id="footer">ZKEACMS是开源软件，提供免费下载学习使用
<p>Copyright @&nbsp;2018 ZKEASOFT. All Rights Reserved | <a href="http://www.zkea.net/" target="_blank" rel="noopener">www.zkea.net</a></p>
</div>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'50f810582d28440eb3bdff9ee5b1ef24', N'<div>
<div class="row">
<div class="col-sm-6"><img src="/Images/28.jpg" alt="" /></div>
<div class="col-sm-6">
<h3>为什么选择我们？</h3>
<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>
<p>&nbsp;</p>
<p><a class="btn btn-info" href="#">Read More</a></p>
</div>
</div>
</div>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'56991d0ff59d4c1db27aff3a50fcb382', N'<div class="page-header">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'8cc061c2e2514ef9b85bbecdec3f84ab', N'<hr />')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'bb7dab4f077745ef8b5b425eaabb423c', N'<h1 style="text-align: center; font-size: 3em;">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style="text-align: center;">ZKEASOFT 提供优质的软件服务，我们坚持开源，开放原则，把软件服务做得更好</p>
<p style="text-align: center;"><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p style="text-align: center;">ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p style="text-align: center;">ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p style="text-align: center;">ZKEACMS采用插件式设计，支持扩展新插件。</p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-info" href="#">Read More</a></p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'e3eb5dd919c4477a857a478764daaa78', N'<h2 style="text-align: center; padding-top: 200px; font-size: 3em; font-weight: bold; margin-top: 0;">The Half-Blood Programmer</h2>
<p style="text-align: center;">About C#, JavaScript, Html, CSS</p>')
INSERT [dbo].[HtmlWidget] ([ID], [HTML]) VALUES (N'f6de0d62d3974ee2bf2ded3fbbc82c2b', N'<div class="space">&nbsp;</div>')
INSERT [dbo].[ImageWidget] ([ID], [ImageUrl], [Width], [Height], [AltText], [Link]) VALUES (N'fee7f4d7d7e641b0bfa74491a543d245', N'~/images/30.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@ActionType', N'zh-CN', N'ActionType', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreateBy', N'zh-CN', N'CreateBy', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreatebyName', N'zh-CN', N'创建人', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@CreateDate', N'zh-CN', N'创建日期', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Description', N'zh-CN', N'描述', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateByName', N'zh-CN', N'更新人', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@LastUpdateDate', N'zh-CN', N'更新日期', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@SettingKey', N'zh-CN', N'键', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Status', N'zh-CN', N'状态', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Title', N'zh-CN', N'标题', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ApplicationSetting@Value', N'zh-CN', N'值', N'ApplicationSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomerClass', N'zh-CN', N'CustomerClass', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Description', N'zh-CN', N'描述', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@FormView', N'zh-CN', N'FormView', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ID', N'zh-CN', N'ID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@PageID', N'zh-CN', N'PageID', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Position', N'zh-CN', N'排序', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Status', N'zh-CN', N'状态', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@Title', N'zh-CN', N'标题', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleDetailWidget@ZoneID', N'zh-CN', N'区域', N'ArticleDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ActionType', N'zh-CN', N'ActionType', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleContent', N'zh-CN', N'文章内容', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Counter', N'zh-CN', N'阅读次数', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateBy', N'zh-CN', N'CreateBy', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreatebyName', N'zh-CN', N'创建人', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@CreateDate', N'zh-CN', N'创建日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Description', N'zh-CN', N'描述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ID', N'zh-CN', N'ID', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ImageUrl', N'zh-CN', N'图片', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@IsPublish', N'zh-CN', N'已发布?', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@MetaDescription', N'zh-CN', N'SEO描述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@MetaKeyWords', N'zh-CN', N'SEO关键字', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@PublishDate', N'zh-CN', N'发布日期', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@ReturnUrl', N'zh-CN', N'ReturnUrl', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Status', N'zh-CN', N'状态', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Summary', N'zh-CN', N'概述', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Title', N'zh-CN', N'标题', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleEntity@Url', N'zh-CN', N'Url', N'ArticleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ArticleCategoryID', N'zh-CN', N'ArticleCategoryID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Description', N'zh-CN', N'描述', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@FormView', N'zh-CN', N'FormView', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ID', N'zh-CN', N'ID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsPageable', N'zh-CN', N'分页?', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PageID', N'zh-CN', N'PageID', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PageSize', N'zh-CN', N'分页大小', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Position', N'zh-CN', N'排序', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Status', N'zh-CN', N'状态', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@Title', N'zh-CN', N'标题', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleListWidget@ZoneID', N'zh-CN', N'区域', N'ArticleListWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Description', N'zh-CN', N'描述', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@DetailLink', N'zh-CN', N'详细页面', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@FormView', N'zh-CN', N'FormView', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ID', N'zh-CN', N'ID', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@LayoutID', N'zh-CN', N'布局', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PageID', N'zh-CN', N'页面', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PartDriver', N'zh-CN', N'PartDriver', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Position', N'zh-CN', N'排序', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Status', N'zh-CN', N'状态', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Style', N'zh-CN', N'样式', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@SubTitle', N'zh-CN', N'子标题', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Summary', N'zh-CN', N'概述', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@Title', N'zh-CN', N'标题', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleSummaryWidget@ZoneID', N'zh-CN', N'区域', N'ArticleSummaryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Description', N'zh-CN', N'描述', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ExtendData', N'zh-CN', N'ExtendData', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@FormView', N'zh-CN', N'FormView', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ID', N'zh-CN', N'ID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@MoreLink', N'zh-CN', N'更多页面', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PageID', N'zh-CN', N'PageID', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PartDriver', N'zh-CN', N'PartDriver', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Position', N'zh-CN', N'排序', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Status', N'zh-CN', N'状态', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@SubTitle', N'zh-CN', N'子标题', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Title', N'zh-CN', N'标题', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@Tops', N'zh-CN', N'置顶数', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTopWidget@ZoneID', N'zh-CN', N'区域', N'ArticleTopWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ActionType', N'zh-CN', N'ActionType', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreateBy', N'zh-CN', N'CreateBy', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreatebyName', N'zh-CN', N'创建人', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@CreateDate', N'zh-CN', N'创建日期', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Description', N'zh-CN', N'描述', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ID', N'zh-CN', N'ID', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@ParentID', N'zh-CN', N'ParentID', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Status', N'zh-CN', N'状态', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleType@Title', N'zh-CN', N'标题', N'ArticleType', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ActionType', N'zh-CN', N'ActionType', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ArticleTypeID', N'zh-CN', N'文章类别', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreateBy', N'zh-CN', N'CreateBy', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreatebyName', N'zh-CN', N'创建人', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CreateDate', N'zh-CN', N'创建日期', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CustomClass', N'zh-CN', N'CustomClass', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Description', N'zh-CN', N'描述', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@FormView', N'zh-CN', N'FormView', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ID', N'zh-CN', N'ID', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@IsSystem', N'zh-CN', N'IsSystem', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@LayoutID', N'zh-CN', N'LayoutID', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@PageID', N'zh-CN', N'PageID', N'ArticleTypeWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@PartialView', N'zh-CN', N'显示模板', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Position', N'zh-CN', N'排序', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Status', N'zh-CN', N'状态', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@StyleClass', N'zh-CN', N'自定义样式', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@TargetPage', N'zh-CN', N'详细页面', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@Title', N'zh-CN', N'标题', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@WidgetName', N'zh-CN', N'组件名称', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ArticleTypeWidget@ZoneID', N'zh-CN', N'区域', N'ArticleTypeWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ActionType', N'zh-CN', N'ActionType', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreateBy', N'zh-CN', N'CreateBy', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreatebyName', N'zh-CN', N'创建人', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CreateDate', N'zh-CN', N'创建日期', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CustomClass', N'zh-CN', N'CustomClass', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Description', N'zh-CN', N'描述', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ExtendData', N'zh-CN', N'ExtendData', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ExtendFields', N'zh-CN', N'扩展属性', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@FormView', N'zh-CN', N'FormView', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ID', N'zh-CN', N'ID', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsLinkAble', N'zh-CN', N'IsLinkAble', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsSystem', N'zh-CN', N'IsSystem', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@IsTemplate', N'zh-CN', N'保存为模板', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateByName', N'zh-CN', N'更新人', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@LayoutID', N'zh-CN', N'布局', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@PageID', N'zh-CN', N'页面', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@PartialView', N'zh-CN', N'显示模板', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Position', N'zh-CN', N'排序', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Status', N'zh-CN', N'状态', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@StyleClass', N'zh-CN', N'自定义样式', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@Title', N'zh-CN', N'标题', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@WidgetName', N'zh-CN', N'组件名称', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'BreadcrumbWidget@ZoneID', N'zh-CN', N'区域', N'BreadcrumbWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@ActionType', N'zh-CN', N'ActionType', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CarouselItems', N'zh-CN', N'滚动图', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateBy', N'zh-CN', N'CreateBy', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreatebyName', N'zh-CN', N'创建人', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@CreateDate', N'zh-CN', N'创建日期', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Description', N'zh-CN', N'描述', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Height', N'zh-CN', N'高度(px)', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@ID', N'zh-CN', N'ID', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Status', N'zh-CN', N'状态', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselEntity@Title', N'zh-CN', N'标题', N'CarouselEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ActionType', N'zh-CN', N'ActionType', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselID', N'zh-CN', N'焦点图', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CarouselWidgetID', N'zh-CN', N'CarouselWidgetID', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreateBy', N'zh-CN', N'CreateBy', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreatebyName', N'zh-CN', N'创建人', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@CreateDate', N'zh-CN', N'创建日期', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Description', N'zh-CN', N'描述', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ID', N'zh-CN', N'ID', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@ImageUrl', N'zh-CN', N'图片', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Status', N'zh-CN', N'状态', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@TargetLink', N'zh-CN', N'链接', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselItemEntity@Title', N'zh-CN', N'标题', N'CarouselItemEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ActionType', N'zh-CN', N'ActionType', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CarouselID', N'zh-CN', N'共享焦点图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CarouselItems', N'zh-CN', N'滚动图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreateBy', N'zh-CN', N'CreateBy', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreatebyName', N'zh-CN', N'创建人', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CreateDate', N'zh-CN', N'创建日期', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CustomClass', N'zh-CN', N'CustomClass', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Description', N'zh-CN', N'描述', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ExtendFields', N'zh-CN', N'扩展属性', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@FormView', N'zh-CN', N'FormView', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ID', N'zh-CN', N'ID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@IsSystem', N'zh-CN', N'IsSystem', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@IsTemplate', N'zh-CN', N'保存为模板', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateByName', N'zh-CN', N'更新人', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@LayoutID', N'zh-CN', N'LayoutID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@PageID', N'zh-CN', N'PageID', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@PartialView', N'zh-CN', N'显示模板', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Position', N'zh-CN', N'排序', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Status', N'zh-CN', N'状态', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@StyleClass', N'zh-CN', N'自定义样式', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@Title', N'zh-CN', N'标题', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@WidgetName', N'zh-CN', N'组件名称', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CarouselWidget@ZoneID', N'zh-CN', N'区域', N'CarouselWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@ActionType', N'zh-CN', N'ActionType', N'Comments', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Agrees', N'zh-CN', N'赞同数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CommentContent', N'zh-CN', N'评论内容', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateBy', N'zh-CN', N'CreateBy', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreatebyName', N'zh-CN', N'创建人', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CreateDate', N'zh-CN', N'创建日期', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Description', N'zh-CN', N'描述', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Disagrees', N'zh-CN', N'反对数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@ID', N'zh-CN', N'ID', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateByName', N'zh-CN', N'更新人', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@LastUpdateDate', N'zh-CN', N'更新日期', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@PagePath', N'zh-CN', N'页面地址', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Picture', N'zh-CN', N'Picture', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Status', N'zh-CN', N'状态', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Title', N'zh-CN', N'标题', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserId', N'zh-CN', N'登录名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserName', N'zh-CN', N'用户名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ActionType', N'zh-CN', N'ActionType', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreateBy', N'zh-CN', N'CreateBy', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreatebyName', N'zh-CN', N'创建人', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CreateDate', N'zh-CN', N'创建日期', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CustomClass', N'zh-CN', N'CustomClass', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Description', N'zh-CN', N'描述', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ExtendData', N'zh-CN', N'ExtendData', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@FormView', N'zh-CN', N'FormView', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ID', N'zh-CN', N'ID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@IsSystem', N'zh-CN', N'IsSystem', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@IsTemplate', N'zh-CN', N'保存为模板', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateByName', N'zh-CN', N'更新人', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@LayoutID', N'zh-CN', N'LayoutID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@PageID', N'zh-CN', N'PageID', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@PartialView', N'zh-CN', N'显示模板', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Position', N'zh-CN', N'排序', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Status', N'zh-CN', N'状态', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@StyleClass', N'zh-CN', N'自定义样式', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@Title', N'zh-CN', N'标题', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@WidgetName', N'zh-CN', N'组件名称', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'CommentsWidget@ZoneID', N'zh-CN', N'区域', N'CommentsWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreateBy', N'zh-CN', N'CreateBy', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreatebyName', N'zh-CN', N'创建人', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@CreateDate', N'zh-CN', N'创建日期', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Description', N'zh-CN', N'描述', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@DicName', N'zh-CN', N'DicName', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@DicValue', N'zh-CN', N'DicValue', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ID', N'zh-CN', N'ID', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@ImageUrl', N'zh-CN', N'图片', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@IsSystem', N'zh-CN', N'IsSystem', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateByName', N'zh-CN', N'更新人', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Order', N'zh-CN', N'排序', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Pid', N'zh-CN', N'Pid', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Status', N'zh-CN', N'状态', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'DataDictionaryEntity@Title', N'zh-CN', N'标题', N'DataDictionaryEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@ActionType', N'zh-CN', N'ActionType', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreateBy', N'zh-CN', N'CreateBy', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreatebyName', N'zh-CN', N'创建人', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@CreateDate', N'zh-CN', N'创建日期', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Description', N'zh-CN', N'描述', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@ID', N'zh-CN', N'ID', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@OwnerID', N'zh-CN', N'OwnerID', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@OwnerModule', N'zh-CN', N'OwnerModule', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Status', N'zh-CN', N'状态', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Title', N'zh-CN', N'名称', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ExtendFieldEntity@Value', N'zh-CN', N'值', N'ExtendFieldEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@ActionType', N'zh-CN', N'ActionType', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateBy', N'zh-CN', N'CreateBy', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreatebyName', N'zh-CN', N'创建人', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@CreateDate', N'zh-CN', N'创建日期', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Description', N'zh-CN', N'描述', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@FieldsData', N'zh-CN', N'FieldsData', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@FormFields', N'zh-CN', N'FormFields', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@ID', N'zh-CN', N'ID', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateByName', N'zh-CN', N'更新人', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@LastUpdateDate', N'zh-CN', N'更新日期', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Status', N'zh-CN', N'状态', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Form@Title', N'zh-CN', N'标题', N'Form', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@ActionType', N'zh-CN', N'ActionType', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateBy', N'zh-CN', N'CreateBy', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreatebyName', N'zh-CN', N'创建人', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@CreateDate', N'zh-CN', N'创建日期', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Datas', N'zh-CN', N'Datas', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Description', N'zh-CN', N'描述', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Form', N'zh-CN', N'Form', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@FormId', N'zh-CN', N'表单', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@ID', N'zh-CN', N'ID', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateByName', N'zh-CN', N'更新人', N'FormData', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@LastUpdateDate', N'zh-CN', N'更新日期', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Status', N'zh-CN', N'状态', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormData@Title', N'zh-CN', N'标题', N'FormData', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ActionType', N'zh-CN', N'ActionType', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreateBy', N'zh-CN', N'CreateBy', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreatebyName', N'zh-CN', N'创建人', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CreateDate', N'zh-CN', N'创建日期', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CustomClass', N'zh-CN', N'CustomClass', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Description', N'zh-CN', N'描述', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ExtendData', N'zh-CN', N'ExtendData', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@FormID', N'zh-CN', N'表单', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@FormView', N'zh-CN', N'FormView', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ID', N'zh-CN', N'ID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@IsSystem', N'zh-CN', N'IsSystem', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@IsTemplate', N'zh-CN', N'保存为模板', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateByName', N'zh-CN', N'更新人', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@LayoutID', N'zh-CN', N'LayoutID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@PageID', N'zh-CN', N'PageID', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@PartialView', N'zh-CN', N'显示模板', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Position', N'zh-CN', N'排序', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Status', N'zh-CN', N'状态', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@StyleClass', N'zh-CN', N'自定义样式', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@Title', N'zh-CN', N'标题', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@WidgetName', N'zh-CN', N'组件名称', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'FormWidget@ZoneID', N'zh-CN', N'区域', N'FormWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ActionType', N'zh-CN', N'ActionType', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreateBy', N'zh-CN', N'CreateBy', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreatebyName', N'zh-CN', N'创建人', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CreateDate', N'zh-CN', N'创建日期', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CustomClass', N'zh-CN', N'CustomClass', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Description', N'zh-CN', N'描述', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ExtendData', N'zh-CN', N'ExtendData', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ExtendFields', N'zh-CN', N'扩展属性', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@FormView', N'zh-CN', N'FormView', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@HTML', N'zh-CN', N'内容', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ID', N'zh-CN', N'ID', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@IsSystem', N'zh-CN', N'IsSystem', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@IsTemplate', N'zh-CN', N'保存为模板', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateByName', N'zh-CN', N'更新人', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@LayoutID', N'zh-CN', N'布局', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PageID', N'zh-CN', N'页面', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PartDriver', N'zh-CN', N'PartDriver', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@PartialView', N'zh-CN', N'显示模板', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Position', N'zh-CN', N'排序', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Status', N'zh-CN', N'状态', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@StyleClass', N'zh-CN', N'自定义样式', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@Title', N'zh-CN', N'标题', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@WidgetName', N'zh-CN', N'组件名称', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'HtmlWidget@ZoneID', N'zh-CN', N'区域', N'HtmlWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ActionType', N'zh-CN', N'ActionType', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@AltText', N'zh-CN', N'说明', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreateBy', N'zh-CN', N'CreateBy', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreatebyName', N'zh-CN', N'创建人', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CreateDate', N'zh-CN', N'创建日期', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CustomClass', N'zh-CN', N'CustomClass', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Description', N'zh-CN', N'描述', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@FormView', N'zh-CN', N'FormView', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Height', N'zh-CN', N'高度(px)', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ID', N'zh-CN', N'ID', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ImageUrl', N'zh-CN', N'图片', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@IsSystem', N'zh-CN', N'IsSystem', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@LayoutID', N'zh-CN', N'布局', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Link', N'zh-CN', N'链接', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PageID', N'zh-CN', N'页面', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PartDriver', N'zh-CN', N'PartDriver', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@PartialView', N'zh-CN', N'显示模板', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Position', N'zh-CN', N'排序', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Status', N'zh-CN', N'状态', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@StyleClass', N'zh-CN', N'自定义样式', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Title', N'zh-CN', N'标题', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@WidgetName', N'zh-CN', N'组件名称', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@Width', N'zh-CN', N'宽度(px)', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ImageWidget@ZoneID', N'zh-CN', N'区域', N'ImageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@CultureName', N'zh-CN', N'语言缩写', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanKey', N'zh-CN', N'翻译键', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanType', N'zh-CN', N'对象', N'LanguageEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanValue', N'zh-CN', N'翻译值', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@Module', N'zh-CN', N'模块', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ActionType', N'zh-CN', N'ActionType', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ContainerClass', N'zh-CN', N'ContainerClass', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreateBy', N'zh-CN', N'CreateBy', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreatebyName', N'zh-CN', N'创建人', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CreateDate', N'zh-CN', N'创建日期', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@CurrentTheme', N'zh-CN', N'CurrentTheme', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Description', N'zh-CN', N'描述', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Html', N'zh-CN', N'内容', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ID', N'zh-CN', N'ID', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ImageUrl', N'zh-CN', N'图片', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateByName', N'zh-CN', N'更新人', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Layout', N'zh-CN', N'Layout', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@LayoutName', N'zh-CN', N'名称', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Page', N'zh-CN', N'Page', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@PreViewPage', N'zh-CN', N'PreViewPage', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Script', N'zh-CN', N'脚本', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Status', N'zh-CN', N'状态', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Style', N'zh-CN', N'样式', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Templates', N'zh-CN', N'Templates', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Theme', N'zh-CN', N'主题', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Title', N'zh-CN', N'标题', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@Zones', N'zh-CN', N'Zones', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutEntity@ZoneWidgets', N'zh-CN', N'ZoneWidgets', N'LayoutEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@ActionType', N'zh-CN', N'ActionType', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreateBy', N'zh-CN', N'CreateBy', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreatebyName', N'zh-CN', N'创建人', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@CreateDate', N'zh-CN', N'创建日期', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Description', N'zh-CN', N'描述', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Html', N'zh-CN', N'内容', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateByName', N'zh-CN', N'更新人', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LastUpdateDate', N'zh-CN', N'更新日期', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LayoutHtmlId', N'zh-CN', N'LayoutHtmlId', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@LayoutId', N'zh-CN', N'布局', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Status', N'zh-CN', N'状态', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LayoutHtml@Title', N'zh-CN', N'标题', N'LayoutHtml', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LiveChatScript@Location', N'zh-CN', N'位置', N'GlobalScripts', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ActionType', N'zh-CN', N'ActionType', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreateBy', N'zh-CN', N'CreateBy', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreatebyName', N'zh-CN', N'CreatebyName', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@CreateDate', N'zh-CN', N'CreateDate', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Description', N'zh-CN', N'描述', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ID', N'zh-CN', N'ID', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@MediaType', N'zh-CN', N'MediaType', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@MediaTypeImage', N'zh-CN', N'MediaTypeImage', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@ParentID', N'zh-CN', N'ParentID', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Status', N'zh-CN', N'状态', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Title', N'zh-CN', N'标题', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MediaEntity@Url', N'zh-CN', N'Url', N'MediaEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@ActionType', N'zh-CN', N'ActionType', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateBy', N'zh-CN', N'CreateBy', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreatebyName', N'zh-CN', N'创建人', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@CreateDate', N'zh-CN', N'创建日期', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Description', N'zh-CN', N'描述', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Email', N'zh-CN', N'邮箱', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@ID', N'zh-CN', N'ID', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateByName', N'zh-CN', N'更新人', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@PostMessage', N'zh-CN', N'留言内容', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Reply', N'zh-CN', N'回复', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Status', N'zh-CN', N'状态', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageEntity@Title', N'zh-CN', N'姓名', N'MessageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@CommentNotifyEmails', N'zh-CN', N'新评论通知邮箱', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageNotificationConfig@MessageNotifyEmails', N'zh-CN', N'新留言通知邮箱', N'MessageNotificationConfig', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ActionType', N'zh-CN', N'ActionType', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreateBy', N'zh-CN', N'CreateBy', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreatebyName', N'zh-CN', N'创建人', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CreateDate', N'zh-CN', N'创建日期', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CustomClass', N'zh-CN', N'CustomClass', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Description', N'zh-CN', N'描述', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ExtendData', N'zh-CN', N'ExtendData', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ExtendFields', N'zh-CN', N'扩展属性', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@FormView', N'zh-CN', N'FormView', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ID', N'zh-CN', N'ID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@IsSystem', N'zh-CN', N'IsSystem', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@IsTemplate', N'zh-CN', N'保存为模板', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateByName', N'zh-CN', N'更新人', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@LayoutID', N'zh-CN', N'LayoutID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@PageID', N'zh-CN', N'PageID', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@PartialView', N'zh-CN', N'显示模板', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Position', N'zh-CN', N'排序', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Status', N'zh-CN', N'状态', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@StyleClass', N'zh-CN', N'自定义样式', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@Title', N'zh-CN', N'标题', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'MessageWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@WidgetName', N'zh-CN', N'组件名称', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'MessageWidget@ZoneID', N'zh-CN', N'区域', N'MessageWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ActionType', N'zh-CN', N'ActionType', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreateBy', N'zh-CN', N'CreateBy', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreatebyName', N'zh-CN', N'创建人', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@CreateDate', N'zh-CN', N'创建日期', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Description', N'zh-CN', N'描述', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@DisplayOrder', N'zh-CN', N'排序', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'zh-CN', N'HTML内容', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ID', N'zh-CN', N'ID', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsCurrent', N'zh-CN', N'IsCurrent', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@IsMobile', N'zh-CN', N'手机导航', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateByName', N'zh-CN', N'更新人', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@ParentId', N'zh-CN', N'ParentId', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Status', N'zh-CN', N'状态', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Title', N'zh-CN', N'标题', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Url', N'zh-CN', N'Url', N'NavigationEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ActionType', N'zh-CN', N'ActionType', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AlignClass', N'zh-CN', N'对齐', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreateBy', N'zh-CN', N'CreateBy', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreatebyName', N'zh-CN', N'创建人', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CreateDate', N'zh-CN', N'创建日期', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomClass', N'zh-CN', N'CustomClass', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomerClass', N'zh-CN', N'契合度', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@CustomStyle', N'zh-CN', N'契合度', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Description', N'zh-CN', N'描述', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ExtendData', N'zh-CN', N'ExtendData', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ExtendFields', N'zh-CN', N'扩展属性', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@FormView', N'zh-CN', N'FormView', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ID', N'zh-CN', N'ID', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsSystem', N'zh-CN', N'IsSystem', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTemplate', N'zh-CN', N'保存为模板', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@IsTopFix', N'zh-CN', N'顶部固定', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateByName', N'zh-CN', N'更新人', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@LayoutID', N'zh-CN', N'布局', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Logo', N'zh-CN', N'Logo', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PageID', N'zh-CN', N'页面', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartDriver', N'zh-CN', N'PartDriver', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@PartialView', N'zh-CN', N'显示模板', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Position', N'zh-CN', N'排序', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@RootID', N'zh-CN', N'根结点', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ShowBasket', N'zh-CN', N'显示购物车？', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Status', N'zh-CN', N'状态', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@StyleClass', N'zh-CN', N'自定义样式', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@Title', N'zh-CN', N'标题', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@WidgetName', N'zh-CN', N'组件名称', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ZoneID', N'zh-CN', N'区域', N'NavigationWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ActionType', N'zh-CN', N'ActionType', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CompletePayTime', N'zh-CN', N'完成支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Contact', N'zh-CN', N'联系人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateBy', N'zh-CN', N'CreateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreatebyName', N'zh-CN', N'创建人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateDate', N'zh-CN', N'创建日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Description', N'zh-CN', N'描述', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ID', N'zh-CN', N'订单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateByName', N'zh-CN', N'更新人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateDate', N'zh-CN', N'更新日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LogisticsCompany', N'zh-CN', N'快递公司', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@OrderStatus', N'zh-CN', N'订单状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentGateway', N'zh-CN', N'支付方式', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentID', N'zh-CN', N'支付ID', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PayTime', N'zh-CN', N'发起支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PhoneNumber', N'zh-CN', N'电话', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Refund', N'zh-CN', N'退款金额', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundDate', N'zh-CN', N'退款日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundID', N'zh-CN', N'退款流水号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@RefundReason', N'zh-CN', N'退款原因', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ShippingAddress', N'zh-CN', N'收货地址', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Status', N'zh-CN', N'状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Title', N'zh-CN', N'标题', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Total', N'zh-CN', N'总价', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@TrackingNumber', N'zh-CN', N'快递单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@UserId', N'zh-CN', N'登录名', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ActionType', N'zh-CN', N'ActionType', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Content', N'zh-CN', N'Content', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreateBy', N'zh-CN', N'CreateBy', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreatebyName', N'zh-CN', N'创建人', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@CreateDate', N'zh-CN', N'创建日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Description', N'zh-CN', N'描述', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@DisplayOrder', N'zh-CN', N'排序', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ExtendFields', N'zh-CN', N'扩展属性', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Favicon', N'zh-CN', N'Favicon', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ID', N'zh-CN', N'ID', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsHomePage', N'zh-CN', N'首页?', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublish', N'zh-CN', N'已发布?', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@IsPublishedPage', N'zh-CN', N'IsPublishedPage', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateByName', N'zh-CN', N'更新人', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@LayoutId', N'zh-CN', N'布局', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaDescription', N'zh-CN', N'SEO描述', N'PageEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@MetaKeyWorlds', N'zh-CN', N'SEO关键字', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageName', N'zh-CN', N'名称', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PageUrl', N'zh-CN', N'页面地址', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ParentId', N'zh-CN', N'ParentId', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@PublishDate', N'zh-CN', N'发布日期', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@ReferencePageID', N'zh-CN', N'ReferencePageID', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Script', N'zh-CN', N'脚本', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Status', N'zh-CN', N'状态', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Style', N'zh-CN', N'样式', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Title', N'zh-CN', N'标题', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'PageEntity@Url', N'zh-CN', N'Url', N'PageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ActionType', N'zh-CN', N'ActionType', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreateBy', N'zh-CN', N'CreateBy', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreatebyName', N'zh-CN', N'创建人', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@CreateDate', N'zh-CN', N'创建日期', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Description', N'zh-CN', N'描述', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ID', N'zh-CN', N'ID', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateByName', N'zh-CN', N'更新人', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@ParentID', N'zh-CN', N'ParentID', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Status', N'zh-CN', N'状态', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategory@Title', N'zh-CN', N'标题', N'ProductCategory', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ActionType', N'zh-CN', N'ActionType', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Description', N'zh-CN', N'描述', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@FormView', N'zh-CN', N'FormView', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ID', N'zh-CN', N'ID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@PageID', N'zh-CN', N'PageID', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@PartialView', N'zh-CN', N'显示模板', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Position', N'zh-CN', N'排序', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Status', N'zh-CN', N'状态', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@TargetPage', N'zh-CN', N'详细页面', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@Title', N'zh-CN', N'标题', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductCategoryWidget@ZoneID', N'zh-CN', N'区域', N'ProductCategoryWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ActionType', N'zh-CN', N'ActionType', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomerClass', N'zh-CN', N'CustomerClass', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Description', N'zh-CN', N'描述', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@FormView', N'zh-CN', N'FormView', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ID', N'zh-CN', N'ID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@PageID', N'zh-CN', N'PageID', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@PartialView', N'zh-CN', N'显示模板', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Position', N'zh-CN', N'排序', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Status', N'zh-CN', N'状态', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@Title', N'zh-CN', N'标题', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductDetailWidget@ZoneID', N'zh-CN', N'区域', N'ProductDetailWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ActionType', N'zh-CN', N'ActionType', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@BrandCD', N'zh-CN', N'BrandCD', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Color', N'zh-CN', N'颜色', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateBy', N'zh-CN', N'CreateBy', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreatebyName', N'zh-CN', N'创建人', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@CreateDate', N'zh-CN', N'创建日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Description', N'zh-CN', N'描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ExtendFields', N'zh-CN', N'扩展属性', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ID', N'zh-CN', N'ID', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ImageThumbUrl', N'zh-CN', N'缩略图', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ImageUrl', N'zh-CN', N'图片', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@IsPublish', N'zh-CN', N'已发布?', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Norm', N'zh-CN', N'规格', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@OrderIndex', N'zh-CN', N'排序', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PartNumber', N'zh-CN', N'型号', N'ProductEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Price', N'zh-CN', N'价格', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductContent', N'zh-CN', N'详细内容', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityCategory', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityCategoryID', N'zh-CN', N'产品类别', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductEntityContent', N'zh-CN', N'描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductImages', N'zh-CN', N'展示图', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductTags', N'zh-CN', N'标签', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PublishDate', N'zh-CN', N'发布日期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@PurchasePrice', N'zh-CN', N'成本价', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@RebatePrice', N'zh-CN', N'折扣价', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEODescription', N'zh-CN', N'SEO描述', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEOKeyWord', N'zh-CN', N'SEO关键字', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SEOTitle', N'zh-CN', N'SEO标题', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ShelfLife', N'zh-CN', N'保质期', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@SourceFrom', N'zh-CN', N'来源', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Status', N'zh-CN', N'状态', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@TargetFrom', N'zh-CN', N'其它网站', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@TargetUrl', N'zh-CN', N'网站网址', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Title', N'zh-CN', N'标题', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@Url', N'zh-CN', N'Url', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ActionType', N'zh-CN', N'ActionType', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreateBy', N'zh-CN', N'CreateBy', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreatebyName', N'zh-CN', N'创建人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreateDate', N'zh-CN', N'创建日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Description', N'zh-CN', N'描述', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ID', N'zh-CN', N'ID', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ImageUrl', N'zh-CN', N'图片', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateByName', N'zh-CN', N'更新人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ProductId', N'zh-CN', N'ProductId', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Status', N'zh-CN', N'状态', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Title', N'zh-CN', N'标题', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ActionType', N'zh-CN', N'ActionType', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Columns', N'zh-CN', N'显示列', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreateBy', N'zh-CN', N'CreateBy', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreatebyName', N'zh-CN', N'创建人', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CreateDate', N'zh-CN', N'创建日期', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CustomClass', N'zh-CN', N'CustomClass', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Description', N'zh-CN', N'描述', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@DetailPageUrl', N'zh-CN', N'详细页面', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ExtendData', N'zh-CN', N'ExtendData', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@FormView', N'zh-CN', N'FormView', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ID', N'zh-CN', N'ID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsPageable', N'zh-CN', N'分页?', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsSystem', N'zh-CN', N'IsSystem', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@LayoutID', N'zh-CN', N'LayoutID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PageID', N'zh-CN', N'PageID', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PageSize', N'zh-CN', N'分页大小', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@PartialView', N'zh-CN', N'显示模板', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Position', N'zh-CN', N'排序', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ProductCategoryID', N'zh-CN', N'产品类别', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Status', N'zh-CN', N'状态', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@StyleClass', N'zh-CN', N'自定义样式', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@Title', N'zh-CN', N'标题', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@WidgetName', N'zh-CN', N'组件名称', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductListWidget@ZoneID', N'zh-CN', N'区域', N'ProductListWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Robots@Content', N'zh-CN', N'内容', N'Robots', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@ActionType', N'zh-CN', N'ActionType', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateBy', N'zh-CN', N'CreateBy', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreatebyName', N'zh-CN', N'创建人', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@CreateDate', N'zh-CN', N'创建日期', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Description', N'zh-CN', N'描述', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@ID', N'zh-CN', N'ID', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateByName', N'zh-CN', N'更新人', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Permissions', N'zh-CN', N'Permissions', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Status', N'zh-CN', N'状态', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RoleEntity@Title', N'zh-CN', N'标题', N'RoleEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Description', N'zh-CN', N'描述', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleID', N'zh-CN', N'RuleID', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@RuleItemList', N'zh-CN', N'条件组', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Status', N'zh-CN', N'状态', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@Title', N'zh-CN', N'标题', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Rule@ZoneName', N'zh-CN', N'显示区域', N'Rule', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Condition', N'zh-CN', N'条件', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@FunctionName', N'zh-CN', N'运算方式', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Property', N'zh-CN', N'属性', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'RuleItem@Value', N'zh-CN', N'值', N'RuleItem', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ActionType', N'zh-CN', N'ActionType', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreateBy', N'zh-CN', N'CreateBy', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreatebyName', N'zh-CN', N'创建人', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CreateDate', N'zh-CN', N'创建日期', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CustomClass', N'zh-CN', N'CustomClass', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Description', N'zh-CN', N'描述', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ExtendFields', N'zh-CN', N'扩展属性', N'ScriptWidget', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@FormView', N'zh-CN', N'FormView', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ID', N'zh-CN', N'ID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@IsSystem', N'zh-CN', N'IsSystem', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@IsTemplate', N'zh-CN', N'保存为模板', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateByName', N'zh-CN', N'更新人', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@LayoutID', N'zh-CN', N'LayoutID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@PageID', N'zh-CN', N'PageID', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@PartialView', N'zh-CN', N'显示模板', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Position', N'zh-CN', N'排序', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Script', N'zh-CN', N'脚本', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Status', N'zh-CN', N'状态', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@StyleClass', N'zh-CN', N'自定义样式', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@Title', N'zh-CN', N'标题', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@WidgetName', N'zh-CN', N'组件名称', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ScriptWidget@ZoneID', N'zh-CN', N'区域', N'ScriptWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@ActionType', N'zh-CN', N'ActionType', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreateBy', N'zh-CN', N'CreateBy', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreatebyName', N'zh-CN', N'创建人', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@CreateDate', N'zh-CN', N'创建日期', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Description', N'zh-CN', N'描述', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@ID', N'zh-CN', N'ID', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Order', N'zh-CN', N'排序', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Status', N'zh-CN', N'状态', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContent@Title', N'zh-CN', N'标题', N'SectionContent', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@ActionType', N'zh-CN', N'ActionType', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreatebyName', N'zh-CN', N'创建人', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@CreateDate', N'zh-CN', N'创建日期', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Description', N'zh-CN', N'描述', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Href', N'zh-CN', N'链接', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@ID', N'zh-CN', N'ID', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@InnerText', N'zh-CN', N'标题', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Order', N'zh-CN', N'排序', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Status', N'zh-CN', N'状态', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentCallToAction@Title', N'zh-CN', N'标题', N'SectionContentCallToAction', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ActionType', N'zh-CN', N'ActionType', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreatebyName', N'zh-CN', N'创建人', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@CreateDate', N'zh-CN', N'创建日期', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Description', N'zh-CN', N'描述', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Height', N'zh-CN', N'高度(px)', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Href', N'zh-CN', N'链接', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ID', N'zh-CN', N'ID', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageAlt', N'zh-CN', N'说明', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageSrc', N'zh-CN', N'图片', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@ImageTitle', N'zh-CN', N'标题', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Order', N'zh-CN', N'排序', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Status', N'zh-CN', N'状态', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Title', N'zh-CN', N'标题', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentImage@Width', N'zh-CN', N'宽度(px)', N'SectionContentImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@ActionType', N'zh-CN', N'ActionType', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreatebyName', N'zh-CN', N'创建人', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@CreateDate', N'zh-CN', N'创建日期', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Description', N'zh-CN', N'描述', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@HtmlContent', N'zh-CN', N'内容', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@ID', N'zh-CN', N'ID', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Order', N'zh-CN', N'排序', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Status', N'zh-CN', N'状态', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentParagraph@Title', N'zh-CN', N'标题', N'SectionContentParagraph', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@ActionType', N'zh-CN', N'ActionType', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreatebyName', N'zh-CN', N'创建人', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@CreateDate', N'zh-CN', N'创建日期', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Description', N'zh-CN', N'描述', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Href', N'zh-CN', N'链接', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@ID', N'zh-CN', N'ID', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@InnerText', N'zh-CN', N'标题', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateByName', N'zh-CN', N'更新人', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionContentTitle', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Order', N'zh-CN', N'排序', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Status', N'zh-CN', N'状态', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@Title', N'zh-CN', N'标题', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentTitle@TitleLevel', N'zh-CN', N'等级', N'SectionContentTitle', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@ActionType', N'zh-CN', N'ActionType', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Code', N'zh-CN', N'视频代码', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreateBy', N'zh-CN', N'CreateBy', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreatebyName', N'zh-CN', N'CreatebyName', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@CreateDate', N'zh-CN', N'CreateDate', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Description', N'zh-CN', N'描述', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Height', N'zh-CN', N'高度(px)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@ID', N'zh-CN', N'ID', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Order', N'zh-CN', N'Order', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionContentType', N'zh-CN', N'SectionContentType', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionGroupId', N'zh-CN', N'SectionGroupId', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Status', N'zh-CN', N'状态', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Thumbnail', N'zh-CN', N'缩略图', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Title', N'zh-CN', N'Title', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Url', N'zh-CN', N'视频地址(MP4)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@VideoTitle', N'zh-CN', N'标题', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionContentVideo@Width', N'zh-CN', N'宽度(px)', N'SectionContentVideo', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@ActionType', N'zh-CN', N'ActionType', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CallToAction', N'zh-CN', N'CallToAction', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CallToActions', N'zh-CN', N'CallToActions', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreateBy', N'zh-CN', N'CreateBy', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreatebyName', N'zh-CN', N'创建人', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@CreateDate', N'zh-CN', N'创建日期', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Description', N'zh-CN', N'描述', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@GroupName', N'zh-CN', N'组名', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@ID', N'zh-CN', N'ID', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@IsLoadDefaultData', N'zh-CN', N'IsLoadDefaultData', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateByName', N'zh-CN', N'更新人', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Order', N'zh-CN', N'排序', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Paragraph', N'zh-CN', N'Paragraph', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Paragraphs', N'zh-CN', N'Paragraphs', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@PartialView', N'zh-CN', N'显示模板', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@PercentWidth', N'zh-CN', N'栅格列', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionContents', N'zh-CN', N'SectionContents', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionImage', N'zh-CN', N'SectionImage', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionImages', N'zh-CN', N'SectionImages', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionTitle', N'zh-CN', N'SectionTitle', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionTitles', N'zh-CN', N'SectionTitles', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@SectionWidgetId', N'zh-CN', N'SectionWidgetId', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Status', N'zh-CN', N'状态', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionGroup@Title', N'zh-CN', N'标题', N'SectionGroup', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ActionType', N'zh-CN', N'ActionType', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreateBy', N'zh-CN', N'CreateBy', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreatebyName', N'zh-CN', N'创建人', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CreateDate', N'zh-CN', N'创建日期', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CustomClass', N'zh-CN', N'CustomClass', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Description', N'zh-CN', N'描述', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ExtendData', N'zh-CN', N'ExtendData', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ExtendFields', N'zh-CN', N'扩展属性', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@FormView', N'zh-CN', N'FormView', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Groups', N'zh-CN', N'Groups', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ID', N'zh-CN', N'ID', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsHorizontal', N'zh-CN', N'水平分组', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsSystem', N'zh-CN', N'IsSystem', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@IsTemplate', N'zh-CN', N'保存为模板', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateByName', N'zh-CN', N'更新人', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@LayoutID', N'zh-CN', N'布局', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PageID', N'zh-CN', N'页面', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PartDriver', N'zh-CN', N'PartDriver', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@PartialView', N'zh-CN', N'显示模板', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Position', N'zh-CN', N'排序', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@SectionTitle', N'zh-CN', N'标题', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Status', N'zh-CN', N'状态', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@StyleClass', N'zh-CN', N'自定义样式', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Template', N'zh-CN', N'Template', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@Title', N'zh-CN', N'标题', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@WidgetName', N'zh-CN', N'组件名称', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SectionWidget@ZoneID', N'zh-CN', N'区域', N'SectionWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SiteSearchWidget@SearchEngine', N'zh-CN', N'搜索引擎', NULL, N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Email', N'zh-CN', N'邮箱', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@EnableSsl', N'zh-CN', N'启用SSL', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Host', N'zh-CN', N'服务器', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@PassWord', N'zh-CN', N'密码', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'SmtpSetting@Port', N'zh-CN', N'端口', N'SmtpSetting', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@ActionType', N'zh-CN', N'ActionType', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@ContactName', N'zh-CN', N'ContactName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreateBy', N'zh-CN', N'CreateBy', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreatebyName', N'zh-CN', N'CreatebyName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@CreateDate', N'zh-CN', N'CreateDate', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Description', N'zh-CN', N'描述', N'Statistics', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Host', N'zh-CN', N'Host', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@IpAddress', N'zh-CN', N'IpAddress', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@StatisticsId', N'zh-CN', N'StatisticsId', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Status', N'zh-CN', N'状态', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Tel', N'zh-CN', N'Tel', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Statistics@Title', N'zh-CN', N'标题', N'Statistics', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StatisticsScript@Location', N'zh-CN', N'位置', N'GlobalScripts', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ActionType', N'zh-CN', N'ActionType', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreateBy', N'zh-CN', N'CreateBy', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreatebyName', N'zh-CN', N'创建人', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CreateDate', N'zh-CN', N'创建日期', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CustomClass', N'zh-CN', N'CustomClass', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Description', N'zh-CN', N'描述', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ExtendFields', N'zh-CN', N'扩展属性', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@FormView', N'zh-CN', N'FormView', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ID', N'zh-CN', N'ID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@IsSystem', N'zh-CN', N'IsSystem', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@IsTemplate', N'zh-CN', N'保存为模板', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateByName', N'zh-CN', N'更新人', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LastUpdateDate', N'zh-CN', N'更新日期', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@LayoutID', N'zh-CN', N'LayoutID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PageID', N'zh-CN', N'PageID', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PartDriver', N'zh-CN', N'PartDriver', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@PartialView', N'zh-CN', N'显示模板', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Position', N'zh-CN', N'排序', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Status', N'zh-CN', N'状态', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@StyleClass', N'zh-CN', N'自定义样式', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@StyleSheet', N'zh-CN', N'样式', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@Title', N'zh-CN', N'标题', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@WidgetName', N'zh-CN', N'组件名称', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'StyleSheetWidget@ZoneID', N'zh-CN', N'区域', N'StyleSheetWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@ActionType', N'zh-CN', N'ActionType', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreateBy', N'zh-CN', N'CreateBy', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreatebyName', N'zh-CN', N'CreatebyName', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@CreateDate', N'zh-CN', N'CreateDate', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Description', N'zh-CN', N'描述', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@ID', N'zh-CN', N'ID', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@IsActived', N'zh-CN', N'IsActived', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@IsPreView', N'zh-CN', N'IsPreView', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Status', N'zh-CN', N'状态', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Thumbnail', N'zh-CN', N'Thumbnail', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Title', N'zh-CN', N'标题', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@Url', N'zh-CN', N'Url', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ThemeEntity@UrlDebugger', N'zh-CN', N'UrlDebugger', N'ThemeEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@ActionType', N'zh-CN', N'ActionType', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateBy', N'zh-CN', N'CreateBy', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreatebyName', N'zh-CN', N'创建人', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@CreateDate', N'zh-CN', N'创建日期', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Description', N'zh-CN', N'描述', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@DestinationURL', N'zh-CN', N'跳转地址', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@ID', N'zh-CN', N'ID', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@InComingUrl', N'zh-CN', N'访问地址', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@IsPermanent', N'zh-CN', N'永久？', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateByName', N'zh-CN', N'更新人', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@LastUpdateDate', N'zh-CN', N'更新日期', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Status', N'zh-CN', N'状态', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UrlRedirect@Title', N'zh-CN', N'标题', N'UrlRedirect', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ActionType', N'zh-CN', N'ActionType', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Address', N'zh-CN', N'地址', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Age', N'zh-CN', N'年龄', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ApiLoginToken', N'zh-CN', N'ApiLoginToken', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@AuthenticationType', N'zh-CN', N'AuthenticationType', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthday', N'zh-CN', N'出生日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Birthplace', N'zh-CN', N'出生地', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateBy', N'zh-CN', N'CreateBy', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreatebyName', N'zh-CN', N'创建人', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@CreateDate', N'zh-CN', N'创建日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Description', N'zh-CN', N'描述', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Email', N'zh-CN', N'邮箱', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@EnglishName', N'zh-CN', N'英文名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@FirstName', N'zh-CN', N'名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Hobby', N'zh-CN', N'爱好', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ID', N'zh-CN', N'ID', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@IsAuthenticated', N'zh-CN', N'IsAuthenticated', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastLoginDate', N'zh-CN', N'最后登录时间', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastName', N'zh-CN', N'姓', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateByName', N'zh-CN', N'更新人', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@LoginIP', N'zh-CN', N'LoginIP', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MaritalStatus', N'zh-CN', N'婚姻情况', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@MobilePhone', N'zh-CN', N'手机号码', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Name', N'zh-CN', N'Name', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@NickName', N'zh-CN', N'昵称', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWord', N'zh-CN', N'PassWord', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PassWordNew', N'zh-CN', N'密码', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@PhotoUrl', N'zh-CN', N'头像', N'UserEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Profession', N'zh-CN', N'专业技能', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@QQ', N'zh-CN', N'QQ', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ResetToken', N'zh-CN', N'ResetToken', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ResetTokenDate', N'zh-CN', N'ResetTokenDate', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Roles', N'zh-CN', N'角色', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@School', N'zh-CN', N'学校', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Sex', N'zh-CN', N'性别', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Status', N'zh-CN', N'状态', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Telephone', N'zh-CN', N'联系电话', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Timestamp', N'zh-CN', N'Timestamp', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@Title', N'zh-CN', N'标题', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserID', N'zh-CN', N'登录名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserName', N'zh-CN', N'用户名', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@UserTypeCD', N'zh-CN', N'用户类别', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserEntity@ZipCode', N'zh-CN', N'邮编', N'UserEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@ActionType', N'zh-CN', N'ActionType', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreateBy', N'zh-CN', N'CreateBy', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreatebyName', N'zh-CN', N'创建人', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@CreateDate', N'zh-CN', N'创建日期', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Description', N'zh-CN', N'描述', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@ID', N'zh-CN', N'ID', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateByName', N'zh-CN', N'更新人', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@LastUpdateDate', N'zh-CN', N'更新日期', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@RoleID', N'zh-CN', N'角色', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Status', N'zh-CN', N'状态', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@Title', N'zh-CN', N'标题', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'UserRoleRelation@UserID', N'zh-CN', N'登录名', N'UserRoleRelation', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ActionType', N'zh-CN', N'ActionType', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@AssemblyName', N'zh-CN', N'AssemblyName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Code', N'zh-CN', N'视频代码', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreateBy', N'zh-CN', N'CreateBy', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreatebyName', N'zh-CN', N'CreatebyName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CreateDate', N'zh-CN', N'CreateDate', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CustomClass', N'zh-CN', N'CustomClass', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@CustomStyle', N'zh-CN', N'CustomStyle', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Description', N'zh-CN', N'描述', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ExtendFields', N'zh-CN', N'扩展属性', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@FormView', N'zh-CN', N'FormView', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Height', N'zh-CN', N'高度(px)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ID', N'zh-CN', N'ID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@IsSystem', N'zh-CN', N'IsSystem', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@IsTemplate', N'zh-CN', N'保存为模板', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateByName', N'zh-CN', N'LastUpdateByName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LastUpdateDate', N'zh-CN', N'LastUpdateDate', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@LayoutID', N'zh-CN', N'LayoutID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@PageID', N'zh-CN', N'PageID', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@PartialView', N'zh-CN', N'显示模板', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Position', N'zh-CN', N'排序', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Status', N'zh-CN', N'状态', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@StyleClass', N'zh-CN', N'自定义样式', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Thumbnail', N'zh-CN', N'模板缩略图', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Title', N'zh-CN', N'标题', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Url', N'zh-CN', N'视频地址(MP4)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@WidgetName', N'zh-CN', N'组件名称', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@Width', N'zh-CN', N'宽度(px)', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'VideoWidget@ZoneID', N'zh-CN', N'区域', N'VideoWidget', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ActionType', N'zh-CN', N'ActionType', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@AssemblyName', N'zh-CN', N'AssemblyName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreateBy', N'zh-CN', N'CreateBy', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreatebyName', N'zh-CN', N'创建人', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CreateDate', N'zh-CN', N'创建日期', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CustomClass', N'zh-CN', N'CustomClass', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@CustomStyle', N'zh-CN', N'CustomStyle', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Description', N'zh-CN', N'描述', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ExtendFields', N'zh-CN', N'扩展属性', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@FormView', N'zh-CN', N'FormView', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ID', N'zh-CN', N'ID', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@IsSystem', N'zh-CN', N'IsSystem', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@IsTemplate', N'zh-CN', N'保存为模板', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateByName', N'zh-CN', N'更新人', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LastUpdateDate', N'zh-CN', N'更新日期', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@LayoutID', N'zh-CN', N'布局', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PageID', N'zh-CN', N'页面', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PartDriver', N'zh-CN', N'PartDriver', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@PartialView', N'zh-CN', N'显示模板', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Position', N'zh-CN', N'排序', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Status', N'zh-CN', N'状态', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@StyleClass', N'zh-CN', N'自定义样式', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Thumbnail', N'zh-CN', N'模板缩略图', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@Title', N'zh-CN', N'标题', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@WidgetName', N'zh-CN', N'组件名称', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetBase@ZoneID', N'zh-CN', N'区域', N'WidgetBase', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ActionType', N'zh-CN', N'ActionType', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@AssemblyName', N'zh-CN', N'AssemblyName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreateBy', N'zh-CN', N'CreateBy', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreatebyName', N'zh-CN', N'创建人', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@CreateDate', N'zh-CN', N'创建日期', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Description', N'zh-CN', N'描述', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@FormView', N'zh-CN', N'FormView', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@GroupName', N'zh-CN', N'组名', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ID', N'zh-CN', N'ID', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateByName', N'zh-CN', N'更新人', N'WidgetTemplateEntity', N'EntityProperty')
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Order', N'zh-CN', N'排序', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@PartialView', N'zh-CN', N'显示模板', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ServiceTypeName', N'zh-CN', N'ServiceTypeName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Status', N'zh-CN', N'状态', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Thumbnail', N'zh-CN', N'Thumbnail', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@Title', N'zh-CN', N'标题', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'WidgetTemplateEntity@ViewModelTypeName', N'zh-CN', N'ViewModelTypeName', N'WidgetTemplateEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ActionType', N'zh-CN', N'ActionType', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreateBy', N'zh-CN', N'CreateBy', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreatebyName', N'zh-CN', N'创建人', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@CreateDate', N'zh-CN', N'创建日期', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Description', N'zh-CN', N'描述', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@HeadingCode', N'zh-CN', N'HeadingCode', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ID', N'zh-CN', N'ID', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateByName', N'zh-CN', N'更新人', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LastUpdateDate', N'zh-CN', N'更新日期', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@LayoutId', N'zh-CN', N'布局', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Status', N'zh-CN', N'状态', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@Title', N'zh-CN', N'标题', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ZoneEntity@ZoneName', N'zh-CN', N'ZoneName', N'ZoneEntity', N'EntityProperty')
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'1061019b1bcd4bf3aeb3df647c74c309', N'#', N'~/javascript', N'JavaScript', 0, NULL, NULL, 1, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:33:03.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:52.267' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'20149bec32e54e3ea966d7c021d5c9f2', N'#', N'~/linux', N'Linux', 0, NULL, NULL, 1, 6, N'admin', N'ZKEASOFT', CAST(N'2018-04-03T10:41:51.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:15.107' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'6beb1a2a54b947179ec20dd331e375a2', N'#', N'~/index', N'首页', 0, NULL, NULL, 1, 1, N'admin', NULL, CAST(N'2015-09-01T09:55:20.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:28.820' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'7b5bb24dea6d47618ed027190b4e5d94', N'#', N'~/sql', N'SQL', 0, NULL, NULL, 1, 5, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:06:21.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:09.250' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'd122a50356bf46c8a8c8349612145e24', N'#', N'~/html-css', N'HTML / CSS', 0, NULL, NULL, 1, 4, N'admin', N'ZKEASOFT', CAST(N'2017-10-15T18:05:25.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:24:03.937' AS DateTime))
INSERT [dbo].[Navigation] ([ID], [ParentId], [Url], [Title], [IsMobile], [Html], [Description], [Status], [DisplayOrder], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'e4658e8af8434a05b773b666c6c67cd5', N'#', N'~/csharp', N'C#', 0, NULL, NULL, 1, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T23:32:53.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:23:36.907' AS DateTime))
INSERT [dbo].[NavigationWidget] ([ID], [CustomerClass], [Title], [Logo], [AlignClass], [IsTopFix], [RootID], [ShowBasket]) VALUES (N'a8259ee60a274b61834ff820f2299843', N'container', NULL, NULL, N'navbar-left', NULL, N'#', 0)
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_Manage', 1, N'管理系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ApplicationSetting_View', 1, N'查看系统设置', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Manage', 1, N'管理文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:18:40.493' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_Publish', 1, N'发布文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-05-25T12:36:10.820' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Article_View', 1, N'查看文章', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:17:59.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_Manage', 1, N'管理文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:22:24.887' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ArticleType_View', 1, N'查看文章类别', NULL, N'文章', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:19:54.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_Manage', 1, N'管理焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:45:46.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Carousel_View', 1, N'查看焦点图', NULL, N'焦点图', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.097' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_Manage', 1, N'管理回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.053' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Comments_View', 1, N'查看回复', NULL, N'留言评论', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:48.050' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'EventViewer_Manage', 1, N'查看错误日志', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-07-11T15:43:52.147' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_Manage', 1, N'管理表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Form_View', 1, N'查看表单', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.830' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Export', 1, N'导出表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_Manage', 1, N'管理表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'FormData_View', 1, N'查看表单数据', NULL, N'自定义表单', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-10-12T15:11:51.843' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Language_Manage', 1, N'翻译', NULL, N'设置', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T11:47:13.093' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_Manage', 1, N'管理布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:43:52.697' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Layout_View', 1, N'查看布局', NULL, N'布局', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.690' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_Manage', 1, N'管理媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.553' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Media_View', 1, N'查看媒体库', NULL, N'媒体库', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.090' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_Manage', 1, N'管理留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.980' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Message_View', 1, N'查看留言', NULL, N'留言板', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-03-19T21:01:14.960' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_Manage', 1, N'管理导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:40:38.230' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Navigation_View', 1, N'查看导航', NULL, N'导航', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:38:21.943' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Manage', 1, N'管理订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T10:49:53.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Refund', 1, N'退款', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.903' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_View', 1, N'查看订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T10:49:53.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderPayment', 1, N'查看支付平台支付信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_ViewOrderRefund', 1, N'查看支付平台退款信息', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-01-19T15:26:24.850' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_Manage', 1, N'管理页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:41:08.463' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.657' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Page_View', 1, N'查看页面', NULL, N'页面', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T12:37:56.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Payment_Config_Manage', 1, N'支付集成设置', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.663' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.663' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Manage', 1, N'管理产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:27:58.400' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_Publish', 1, N'发布产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-05-25T12:36:10.853' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Product_View', 1, N'查看产品', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:27:41.483' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_Manage', 1, N'管理产品类别', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:28:21.047' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategory_View', 1, N'查看产品类别', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:28:08.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_Manage', 1, N'管理产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_View', 1, N'查看产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_Manage', 1, N'管理角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Role_View', 1, N'查看角色', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.660' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_Manage', 1, N'管理主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:42:48.600' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Theme_View', 1, N'查看主题', NULL, N'主题', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:56.083' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_Manage', 1, N'管理URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.170' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'UrlRedirect_View', 1, N'查看URL 重定向', NULL, N'URL 重定向', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-08-14T14:55:58.120' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_Manage', 1, N'管理用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T14:12:07.567' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'User_View', 1, N'查看用户', NULL, N'用户/安全', NULL, N'admin', N'ZKEASOFT', CAST(N'2016-08-01T13:37:46.647' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2018-03-22T15:33:03.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'Cloud Revolver 游戏耳机', N'http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg', N'http://wx2.sinaimg.cn/mw690/005zTNGqgy1fn25uz5f9gj30bk0bkwek.jpg', NULL, 2, NULL, 500.0000, 399.0000, NULL, NULL, NULL, N'<h1>HyperX Cloud Revolver</h1>
<p>如果您热爱游戏，那么一款可为您带来极大优势的耳机就是必不可少的装备。HyperX Cloud Revolver&trade; 是一款优质耳机，工艺精湛，可充分满足高级OC或家用机游戏玩家的需求。新一代驱动器可将低音、中音和高音明确区分开来，形成精准定位的优质音效。Revolver 系列具备立体声和即插即用的 Dolby&reg; 7.1 环绕立体声模式，可提供工作室级别的音场和新一代驱动器，在 FPS 和开放式环境下表现优异。两款耳机均采用结实耐用的实心钢质框架和标志性的 HyperX 记忆海绵，带来屡获殊荣的舒适度。如果您希望拥有无与伦比的舒适度、绝佳的音质和清晰顺畅的沟通，Cloud Revolver 耳机将是您的不二之选。</p>
<h3>即插即用 Dolby&reg; 环绕立体声 7.1&nbsp;</h3>
<p>模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效，无需安装软件或任何设置，即可将音频娱乐变成电影般的体验。<br />可在 Cloud Revolver S 上使用。</p>
<h3>先进的 USB 音频控制盒与 DSP 声卡&nbsp;</h3>
<p>USB 数字处理信号声卡可在任何机器上输出一致的优质音频。卡夹式音频控制盒设计有背光按钮，因此可以即时静音、启用 Dolby 音频，还可在三种预先设置的均衡器之间切换并调整麦克风和音量水平。<br />可在 Cloud Revolver S 上使用。</p>
<h3>新一代 50 毫米驱动器&nbsp;</h3>
<p>与双耳平行的 50mm 定向驱动器精准定位，超强低音效果让声音更加清脆动听。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>
<h3>HyperX 标志性记忆海绵&nbsp;</h3>
<p>屡获殊荣的 HyperX 记忆海绵，带来无与伦比的舒适度，让您更加舒适，更加尽兴地游戏。<br />可在 Cloud Revolver 和 Cloud Revolver S 上使用。</p>', N'模拟的 7 个定位扬声器，按照距离和深度制作出精准的音效', 1, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'HX-HSCR-BK/AS', N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:25:05.127' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [ImageUrl], [ImageThumbUrl], [BrandCD], [ProductCategoryID], [Color], [Price], [RebatePrice], [PurchasePrice], [Norm], [ShelfLife], [ProductContent], [Description], [IsPublish], [PublishDate], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [OrderIndex], [SourceFrom], [Url], [TargetFrom], [TargetUrl], [PartNumber], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'Alloy FPS 机械游戏键盘', N'http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg', N'http://wx4.sinaimg.cn/mw690/005zTNGqgy1fn25wb061cj30bk0bkjsr.jpg', NULL, 3, N'黑色', 500.0000, 499.0000, NULL, NULL, NULL, N'<h1>小巧便携，随时随地开始 FPS 游戏。</h1>
<p>HyperX&trade; Alloy FPS 键盘结实耐用，性能可靠，给玩家带来卓越的游戏体验。如果您需要一个全尺寸键盘，Alloy FPS 会满足您的所有需求。如果您喜欢 Tenkeyless (TKL) 模式，以便使用大多数基本按键，则 Alloy FPS Pro 键盘可充分满足您的需要。1每个键盘都能满足每位严肃的 FPS 游戏玩家对键盘的所有要求：可靠的 CHERRY&reg; MX 按键开关、实心钢架、可拆卸的线缆、游戏模式、100% 防按键冲突和全键无冲突功能无论您是专业的 FPS 玩家，又或者只是随便玩玩，HyperX Alloy FPS 键盘都可充分满足您的需求。</p>
<h3>极简设计小巧紧凑，是 FPS 游戏的完美搭档&nbsp;</h3>
<p>最大程度节省桌面空间，方便鼠标快速移动</p>
<h3>实心钢架&nbsp;</h3>
<p>可实现耐用性和稳定性。</p>
<h3>CHERRY&reg; MX 机械按键开关可靠耐用&nbsp;</h3>
<p>适用于 CHERRY MX Blue、Brown 或 Red 按键开关，带给您有口皆碑的可靠性和适合您的开关风格。</p>
<h3>超便携设计，带有可拆卸的线缆&nbsp;</h3>
<p>节省存储空间并减少可能的线缆损坏。</p>
<h3>HyperX 红色背光按键，实现动态的灯光效果</h3>
<p>让璀璨的背光彰显您的风格</p>', N'实心钢架,CHERRY® MX 机械按键开关,带有可拆卸的线缆', 1, CAST(N'2017-11-17T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'HX-KB4RD1-US/R1', N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:32:14.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'产品', NULL, 0, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:49:32.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:08.193' AS DateTime))
INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, N'耳机', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:49:50.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:14.940' AS DateTime))
INSERT [dbo].[ProductCategory] ([ID], [Title], [Description], [ParentID], [Url], [Status], [SEOTitle], [SEOKeyWord], [SEODescription], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, N'键盘', NULL, 1, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2016-03-10T13:50:07.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:19.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductCategoryTag] ON 

INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, 2, N'颜色', NULL, NULL, 0, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:45.550' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, 2, N'黑色', NULL, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:10:50.530' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, 2, N'黑古银色', NULL, NULL, 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:11:03.657' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (4, 3, N'操作风格', NULL, NULL, 0, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:07.707' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, 3, N'点击', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:14.870' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, 3, N'触觉', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:20.713' AS DateTime))
INSERT [dbo].[ProductCategoryTag] ([ID], [ProductCategoryId], [Title], [Description], [Status], [ParentId], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, 3, N'线性', NULL, NULL, 4, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:12:28.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCategoryTag] OFF
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, 1, N'https://user-images.githubusercontent.com/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png', N'HX-HSCR-BK/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.747' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (2, 1, N'https://user-images.githubusercontent.com/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png', N'HX-HSCRS-GM/AS', NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:18:54.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T19:58:48.750' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (3, 2, N'https://user-images.githubusercontent.com/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (5, 2, N'https://user-images.githubusercontent.com/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (6, 2, N'https://user-images.githubusercontent.com/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
INSERT [dbo].[ProductImage] ([ID], [ProductId], [ImageUrl], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (7, 2, N'https://user-images.githubusercontent.com/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png', NULL, NULL, 1, N'admin', N'ZKEASOFT', CAST(N'2017-11-17T15:30:22.000' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-04-24T20:00:41.010' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
SET IDENTITY_INSERT [dbo].[ProductTag] ON 

INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (9, 1, 2, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (10, 1, 3, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (20, 2, 5, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (21, 2, 6, NULL)
INSERT [dbo].[ProductTag] ([ID], [ProductId], [TagId], [Title]) VALUES (22, 2, 7, NULL)
SET IDENTITY_INSERT [dbo].[ProductTag] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Title], [Description], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (1, N'超级管理员', N'超级管理员', 1, NULL, NULL, NULL, N'admin', N'ZKEASOFT', CAST(N'2017-12-03T17:09:47.907' AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'105', N'f41174cfa4d247f4974c47f4d2b000fd', N'40', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:05.273' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:05.273' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'106', N'f41174cfa4d247f4974c47f4d2b000fd', N'40', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:14.723' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:14.723' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'107', N'f41174cfa4d247f4974c47f4d2b000fd', N'41', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:39.543' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:39.543' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'108', N'f41174cfa4d247f4974c47f4d2b000fd', N'41', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:46.500' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:22:46.500' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'109', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'42', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.287' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.287' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'110', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'42', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.290' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.290' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'111', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'43', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'112', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'43', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:23:51.293' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'113', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'44', 4, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:36.340' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:36.340' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'114', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'44', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:43.533' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T21:24:43.533' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'13', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:06.270' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:06.270' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'14', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:14.397' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:14.397' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'15', N'2b3eb61307d24c50a6b3aaa75db3810e', N'5', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:22.330' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:07:22.330' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'16', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:25.737' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:25.737' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'17', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:33.683' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:33.683' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'18', N'00f62c5acfe840e0bee3ca2979f0f025', N'6', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:50.897' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:14:50.897' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'19', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.233' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.233' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'20', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.237' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.237' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'21', N'f6f11ba2fec844de883acf0a1fe3eb89', N'7', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.240' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:44.240' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'22', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'23', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.877' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'24', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'8', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.880' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:15:48.880' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'25', N'b568ff7f4a894870adaf9afadf787bf9', N'9', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:44.433' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:44.433' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'26', N'b568ff7f4a894870adaf9afadf787bf9', N'9', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:53.837' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:21:53.837' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'27', N'b568ff7f4a894870adaf9afadf787bf9', N'10', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:22:35.620' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:22:35.620' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'28', N'b568ff7f4a894870adaf9afadf787bf9', N'10', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:24:34.193' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:24:34.193' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'29', N'55b73e54fd054de4847960bdac350c6d', N'11', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'30', N'55b73e54fd054de4847960bdac350c6d', N'11', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.580' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'31', N'55b73e54fd054de4847960bdac350c6d', N'12', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'32', N'55b73e54fd054de4847960bdac350c6d', N'12', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:33:40.587' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'33', N'55b73e54fd054de4847960bdac350c6d', N'11', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:38.457' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:38.457' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'34', N'55b73e54fd054de4847960bdac350c6d', N'12', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:51.847' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:34:51.847' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'35', N'ed837392097f4e60b812bc57111dd762', N'13', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'36', N'ed837392097f4e60b812bc57111dd762', N'13', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.470' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'37', N'ed837392097f4e60b812bc57111dd762', N'14', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.490' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.490' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'38', N'ed837392097f4e60b812bc57111dd762', N'14', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.493' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:36:24.493' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'39', N'ed837392097f4e60b812bc57111dd762', N'15', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:16.067' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:16.067' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'40', N'ed837392097f4e60b812bc57111dd762', N'15', 3, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:27.630' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:38:27.630' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'41', N'1fb967867e3b440e86336bc5a51e8719', N'16', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.777' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.777' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'42', N'1fb967867e3b440e86336bc5a51e8719', N'16', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.780' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.780' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'43', N'1fb967867e3b440e86336bc5a51e8719', N'17', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'44', N'1fb967867e3b440e86336bc5a51e8719', N'17', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.783' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'45', N'1fb967867e3b440e86336bc5a51e8719', N'18', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'46', N'1fb967867e3b440e86336bc5a51e8719', N'18', 3, 3, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:40:26.787' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'47', N'1fb967867e3b440e86336bc5a51e8719', N'16', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:41:13.710' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:41:13.710' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'48', N'1fb967867e3b440e86336bc5a51e8719', N'17', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:01.137' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:01.137' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'49', N'1fb967867e3b440e86336bc5a51e8719', N'18', 4, 2, N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:20.190' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2016-03-09T14:42:20.190' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'4bcbb5fa151c442aad313b61bf28f4bf', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'2dd968aa41a44774b7aee6423ff7f837', 2, 1, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.067' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.067' AS DateTime))
INSERT [dbo].[SectionContent] ([ID], [SectionWidgetId], [SectionGroupId], [SectionContentType], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'583046a2039e458db87180b2e6d109cb', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'f0baed3ec02145769a972e4d874f7842', 3, 1, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.103' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.103' AS DateTime))
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'13', N'2b3eb61307d24c50a6b3aaa75db3810e', N'~/images/01.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'16', N'00f62c5acfe840e0bee3ca2979f0f025', N'~/images/02.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'19', N'f6f11ba2fec844de883acf0a1fe3eb89', N'~/images/04.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'22', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'~/images/03.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'25', N'b568ff7f4a894870adaf9afadf787bf9', N'~/images/05.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'27', N'b568ff7f4a894870adaf9afadf787bf9', N'~/images/06.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'29', N'55b73e54fd054de4847960bdac350c6d', N'~/images/07.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'31', N'55b73e54fd054de4847960bdac350c6d', N'~/images/08.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'35', N'ed837392097f4e60b812bc57111dd762', N'~/images/09.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'37', N'ed837392097f4e60b812bc57111dd762', N'~/images/10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'39', N'ed837392097f4e60b812bc57111dd762', N'~/images/11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'41', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'43', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'45', N'1fb967867e3b440e86336bc5a51e8719', N'~/images/14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentImage] ([ID], [SectionWidgetId], [ImageSrc], [ImageAlt], [ImageTitle], [Href], [Width], [Height]) VALUES (N'4bcbb5fa151c442aad313b61bf28f4bf', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'/themes/blog/images/head.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'106', N'f41174cfa4d247f4974c47f4d2b000fd', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'108', N'f41174cfa4d247f4974c47f4d2b000fd', N'<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>是基于<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>，使用ASP.NET MVC4开发的开源CMS。</p>
<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>
<p>ZKEACMS采用插件式设计，支持扩展新插件。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'110', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'112', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'114', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'15', N'2b3eb61307d24c50a6b3aaa75db3810e', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'18', N'00f62c5acfe840e0bee3ca2979f0f025', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'21', N'f6f11ba2fec844de883acf0a1fe3eb89', N'<p>ZKEACMS一个内容管理软件（网站）。ZKEACMS不仅只是管理内容，更是重新定义了布局、页面和组件，让用户可以自由规划页面的布局，页面和内容。</p>
<p>ZKEACMS使用可视化编辑设计，真正做到所见即所得，可直接在预览页面上设计页面。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'24', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'<p>主要集中在已进入中国市场的跨国公司、行业领先的外企、知名的中国大中企业和更多成长迅速的新兴企业。</p>
<p>尤其擅长为中外企业推荐中、高层管理职位和关键技术职位，帮助其迅速搭建及完善起一支高适配性的专业化管理团队。</p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'26', N'b568ff7f4a894870adaf9afadf787bf9', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'28', N'b568ff7f4a894870adaf9afadf787bf9', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'30', N'55b73e54fd054de4847960bdac350c6d', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'32', N'55b73e54fd054de4847960bdac350c6d', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'36', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'38', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'40', N'ed837392097f4e60b812bc57111dd762', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'42', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>在建筑设计市场向国际化接轨的过程中，</span><span>建筑工程结构设计必将占据越来越重要的位置。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'44', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>由石油炼制获得的汽油、</span><span>喷气燃料、柴油，重油等液体燃料。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'46', N'1fb967867e3b440e86336bc5a51e8719', N'<p><span>我国汽车工业的现状喜忧参半，</span><span>展望我国汽车工业的未来风险与机遇并存。</span></p>')
INSERT [dbo].[SectionContentParagraph] ([ID], [SectionWidgetId], [HtmlContent]) VALUES (N'583046a2039e458db87180b2e6d109cb', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'<h4>Half-Blood Programmer</h4>
<p class="small text-muted">Life is easy to chronicle, but bewildering to practice.</p>')
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'105', N'f41174cfa4d247f4974c47f4d2b000fd', N'ZKEACMS', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'107', N'f41174cfa4d247f4974c47f4d2b000fd', N'ZKEACMS', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'109', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'111', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'113', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'14', N'2b3eb61307d24c50a6b3aaa75db3810e', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'17', N'00f62c5acfe840e0bee3ca2979f0f025', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'20', N'f6f11ba2fec844de883acf0a1fe3eb89', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'23', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'WHY CHOOSE US?', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'33', N'55b73e54fd054de4847960bdac350c6d', N'建筑业', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'34', N'55b73e54fd054de4847960bdac350c6d', N'能源化工', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'47', N'1fb967867e3b440e86336bc5a51e8719', N'建筑业', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'48', N'1fb967867e3b440e86336bc5a51e8719', N'能源化工', NULL, NULL)
INSERT [dbo].[SectionContentTitle] ([ID], [SectionWidgetId], [InnerText], [Href], [TitleLevel]) VALUES (N'49', N'1fb967867e3b440e86336bc5a51e8719', N'汽车业', NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'10', N'右', N'b568ff7f4a894870adaf9afadf787bf9', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'11', N'左', N'55b73e54fd054de4847960bdac350c6d', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'12', N'右', N'55b73e54fd054de4847960bdac350c6d', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'13', N'左', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'14', N'中', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'15', N'右', N'ed837392097f4e60b812bc57111dd762', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'16', N'左', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'17', N'中', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'18', N'右', N'1fb967867e3b440e86336bc5a51e8719', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'2dd968aa41a44774b7aee6423ff7f837', N'组1', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'SectionTemplate.Default', 1, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.040' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.040' AS DateTime), N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'40', N'左', N'f41174cfa4d247f4974c47f4d2b000fd', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'41', N'右', N'f41174cfa4d247f4974c47f4d2b000fd', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'42', N'左', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'43', N'右', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 3, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'44', N'中', N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', N'SectionTemplate.Default', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-4')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'5', N'G1', N'2b3eb61307d24c50a6b3aaa75db3810e', N'SectionTemplate.ListView', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'6', N'G1', N'00f62c5acfe840e0bee3ca2979f0f025', N'SectionTemplate.ImageRight', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'7', N'G1', N'f6f11ba2fec844de883acf0a1fe3eb89', N'SectionTemplate.ImageRight', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'8', N'G1', N'481574ebc98b4cdf9a07e3f20c1ab78d', N'SectionTemplate.ListView', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'9', N'左', N'b568ff7f4a894870adaf9afadf787bf9', N'SectionTemplate.Default', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'col-sm-6')
INSERT [dbo].[SectionGroup] ([ID], [GroupName], [SectionWidgetId], [PartialView], [Order], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [PercentWidth]) VALUES (N'f0baed3ec02145769a972e4d874f7842', N'组2', N'16a0f1e9a8294a05a7b988fb54e03f1d', N'SectionTemplate.Default', 2, N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.100' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2019-05-07T21:21:00.100' AS DateTime), N'col-sm-8')
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Column', N'左右', N'Thumbnail\SectionTemplate.Column.png', N'Thumbnail\SectionTemplate.Column.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Default', N'默认', N'Thumbnail\SectionTemplate.Default.png', N'Thumbnail\SectionTemplate.Default.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ImageRight', N'图片右', N'Thumbnail\SectionTemplate.ImageRight.png', N'Thumbnail\SectionTemplate.ImageRight.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.LinkGroup', N'链接组', N'Thumbnail\SectionTemplate.LinkGroup.png', N'Thumbnail\SectionTemplate.LinkGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListGroup', N'列表组', N'Thumbnail\SectionTemplate.ListGroup.png', N'Thumbnail\SectionTemplate.ListGroup.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.ListView', N'媒体列表', N'Thumbnail\SectionTemplate.ListView.png', N'Thumbnail\SectionTemplate.ListView.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionTemplate] ([TemplateName], [Title], [Thumbnail], [ExampleData], [Status], [Description], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'SectionTemplate.Thumbnail', N'缩略图', N'Thumbnail\SectionTemplate.Thumbnail.png', N'Thumbnail\SectionTemplate.Thumbnail.xml', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'00f62c5acfe840e0bee3ca2979f0f025', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'0f66ab8ff0df44e2b5e57fd8d8c5d8ff', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'16a0f1e9a8294a05a7b988fb54e03f1d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'1fb967867e3b440e86336bc5a51e8719', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'2b3eb61307d24c50a6b3aaa75db3810e', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'481574ebc98b4cdf9a07e3f20c1ab78d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'55b73e54fd054de4847960bdac350c6d', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'b568ff7f4a894870adaf9afadf787bf9', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'ed837392097f4e60b812bc57111dd762', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'f41174cfa4d247f4974c47f4d2b000fd', NULL, NULL)
INSERT [dbo].[SectionWidget] ([ID], [SectionTitle], [IsHorizontal]) VALUES (N'f6f11ba2fec844de883acf0a1fe3eb89', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserRoleRelation] ON 

INSERT [dbo].[UserRoleRelation] ([ID], [RoleID], [UserID]) VALUES (5, 1, N'admin')
SET IDENTITY_INSERT [dbo].[UserRoleRelation] OFF
INSERT [dbo].[Users] ([UserID], [PassWord], [ApiLoginToken], [LastLoginDate], [LoginIP], [PhotoUrl], [Timestamp], [UserName], [UserTypeCD], [Address], [Age], [Birthday], [Birthplace], [Email], [EnglishName], [FirstName], [Hobby], [LastName], [MaritalStatus], [MobilePhone], [NickName], [Profession], [QQ], [School], [Sex], [Telephone], [ZipCode], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate], [Status], [Description], [ResetToken], [ResetTokenDate]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, CAST(N'2019-05-07T21:20:00.577' AS DateTime), N'::1', N'~/images/head.png', 0, N'ZKEASOFT', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, N'Admin', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, N'admin', N'Admin', CAST(N'2019-05-07T21:20:00.593' AS DateTime), 1, NULL, NULL, NULL)
ALTER TABLE [dbo].[CMS_WidgetBase] ADD  CONSTRAINT [DF_CMS_WidgetBase_IsTemplate]  DEFAULT ((0)) FOR [IsTemplate]
GO
ALTER TABLE [dbo].[CMS_WidgetBase] ADD  CONSTRAINT [DF_CMS_WidgetBase_IsSystem]  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategory] FOREIGN KEY([ArticleTypeID])
REFERENCES [dbo].[ArticleType] ([ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategory]
GO
ALTER TABLE [dbo].[ArticleDetailWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleDetailWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleDetailWidget] CHECK CONSTRAINT [FK_ArticleDetailWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleListWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleListWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleListWidget] CHECK CONSTRAINT [FK_ArticleListWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleSummaryWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleSummaryWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleSummaryWidget] CHECK CONSTRAINT [FK_ArticleSummaryWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleTopWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTopWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleTopWidget] CHECK CONSTRAINT [FK_ArticleTopWidget_Widget]
GO
ALTER TABLE [dbo].[ArticleTypeWidget]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTypeWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ArticleTypeWidget] CHECK CONSTRAINT [FK_ArticleTypeWidget_Widget]
GO
ALTER TABLE [dbo].[CarouselItem]  WITH CHECK ADD  CONSTRAINT [FK_CarouselItem_CarouselWidget] FOREIGN KEY([CarouselWidgetID])
REFERENCES [dbo].[CarouselWidget] ([ID])
GO
ALTER TABLE [dbo].[CarouselItem] CHECK CONSTRAINT [FK_CarouselItem_CarouselWidget]
GO
ALTER TABLE [dbo].[CarouselWidget]  WITH CHECK ADD  CONSTRAINT [FK_CarouselWidget_Carousel] FOREIGN KEY([CarouselID])
REFERENCES [dbo].[Carousel] ([ID])
GO
ALTER TABLE [dbo].[CarouselWidget] CHECK CONSTRAINT [FK_CarouselWidget_Carousel]
GO
ALTER TABLE [dbo].[CarouselWidget]  WITH CHECK ADD  CONSTRAINT [FK_CarouselWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[CarouselWidget] CHECK CONSTRAINT [FK_CarouselWidget_Widget]
GO
ALTER TABLE [dbo].[CMS_LayoutHtml]  WITH CHECK ADD  CONSTRAINT [FK_CMS_LayoutHtml_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_LayoutHtml] CHECK CONSTRAINT [FK_CMS_LayoutHtml_CMS_Layout]
GO
ALTER TABLE [dbo].[CMS_Page]  WITH CHECK ADD  CONSTRAINT [FK_CMS_Page_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_Page] CHECK CONSTRAINT [FK_CMS_Page_CMS_Layout]
GO
ALTER TABLE [dbo].[CMS_Zone]  WITH CHECK ADD  CONSTRAINT [FK_CMS_Zone_CMS_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[CMS_Layout] ([ID])
GO
ALTER TABLE [dbo].[CMS_Zone] CHECK CONSTRAINT [FK_CMS_Zone_CMS_Layout]
GO
ALTER TABLE [dbo].[HtmlWidget]  WITH CHECK ADD  CONSTRAINT [FK_HtmlWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[HtmlWidget] CHECK CONSTRAINT [FK_HtmlWidget_Widget]
GO
ALTER TABLE [dbo].[ImageWidget]  WITH CHECK ADD  CONSTRAINT [FK_ImageWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ImageWidget] CHECK CONSTRAINT [FK_ImageWidget_Widget]
GO
ALTER TABLE [dbo].[NavigationWidget]  WITH CHECK ADD  CONSTRAINT [FK_NavigationWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[NavigationWidget] CHECK CONSTRAINT [FK_NavigationWidget_Widget]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Permission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Permission_Role]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductCategoryWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductCategoryWidget] CHECK CONSTRAINT [FK_ProductCategoryWidget_Widget]
GO
ALTER TABLE [dbo].[ProductDetailWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetailWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductDetailWidget] CHECK CONSTRAINT [FK_ProductDetailWidget_Widget]
GO
ALTER TABLE [dbo].[ProductListWidget]  WITH CHECK ADD  CONSTRAINT [FK_ProductListWidget_Widget] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ProductListWidget] CHECK CONSTRAINT [FK_ProductListWidget_Widget]
GO
ALTER TABLE [dbo].[ScriptWidget]  WITH CHECK ADD  CONSTRAINT [FK_ScriptWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[ScriptWidget] CHECK CONSTRAINT [FK_ScriptWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[SectionContent]  WITH CHECK ADD  CONSTRAINT [FK_SectionContent_Widget] FOREIGN KEY([SectionWidgetId])
REFERENCES [dbo].[SectionWidget] ([ID])
GO
ALTER TABLE [dbo].[SectionContent] CHECK CONSTRAINT [FK_SectionContent_Widget]
GO
ALTER TABLE [dbo].[SectionGroup]  WITH CHECK ADD  CONSTRAINT [FK_SectionGroup_SectionGroup_Template] FOREIGN KEY([PartialView])
REFERENCES [dbo].[SectionTemplate] ([TemplateName])
GO
ALTER TABLE [dbo].[SectionGroup] CHECK CONSTRAINT [FK_SectionGroup_SectionGroup_Template]
GO
ALTER TABLE [dbo].[SectionGroup]  WITH CHECK ADD  CONSTRAINT [FK_SectionGroup_SectionWidget] FOREIGN KEY([SectionWidgetId])
REFERENCES [dbo].[SectionWidget] ([ID])
GO
ALTER TABLE [dbo].[SectionGroup] CHECK CONSTRAINT [FK_SectionGroup_SectionWidget]
GO
ALTER TABLE [dbo].[SectionWidget]  WITH CHECK ADD  CONSTRAINT [FK_SectionWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[SectionWidget] CHECK CONSTRAINT [FK_SectionWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[StyleSheetWidget]  WITH CHECK ADD  CONSTRAINT [FK_StyleSheetWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[StyleSheetWidget] CHECK CONSTRAINT [FK_StyleSheetWidget_CMS_WidgetBase]
GO
ALTER TABLE [dbo].[UserRoleRelation]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleRelation_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoleRelation] CHECK CONSTRAINT [FK_UserRoleRelation_Roles]
GO
ALTER TABLE [dbo].[UserRoleRelation]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleRelation_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRoleRelation] CHECK CONSTRAINT [FK_UserRoleRelation_Users]
GO
ALTER TABLE [dbo].[VideoWidget]  WITH CHECK ADD  CONSTRAINT [FK_VideoWidget_CMS_WidgetBase] FOREIGN KEY([ID])
REFERENCES [dbo].[CMS_WidgetBase] ([ID])
GO
ALTER TABLE [dbo].[VideoWidget] CHECK CONSTRAINT [FK_VideoWidget_CMS_WidgetBase]
GO
ALTER DATABASE [ZKEACMS_Blog2] SET  READ_WRITE 
GO
