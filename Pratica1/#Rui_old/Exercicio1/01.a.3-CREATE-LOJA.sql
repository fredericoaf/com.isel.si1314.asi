USE [master]
GO

CREATE DATABASE [ASI]
GO

USE [ASI]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 17-10-2013 21:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[cod] [int] NOT NULL,
	[preco] [money] NULL,
	[qtStock] [int] NULL,
	[qtMinStock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
