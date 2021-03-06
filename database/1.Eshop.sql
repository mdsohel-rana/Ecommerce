USE [Eshop]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[CurrentUserRoles] DROP CONSTRAINT IF EXISTS [FK_CurrentUserRoles_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[CurrentUserRoles] DROP CONSTRAINT IF EXISTS [FK_CurrentUserRoles_UserRoles]
GO
/****** Object:  Index [Username_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
DROP INDEX IF EXISTS [Username_Users] ON [dbo].[Users]
GO
/****** Object:  Index [Slug_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [Slug_Users]
GO
/****** Object:  Index [Email_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [Email_Users]
GO
/****** Object:  Index [Slug_UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT IF EXISTS [Slug_UserRoles]
GO
/****** Object:  Index [Code_UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT IF EXISTS [Code_UserRoles]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/20/2020 4:35:24 PM ******/
DROP TABLE IF EXISTS [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
DROP TABLE IF EXISTS [dbo].[UserRoles]
GO
/****** Object:  Table [dbo].[CurrentUserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
DROP TABLE IF EXISTS [dbo].[CurrentUserRoles]
GO
/****** Object:  Table [dbo].[CurrentUserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentUserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[TrashAt] [datetime] NULL,
 CONSTRAINT [PK_CurrentUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Code] [varchar](200) NULL,
	[Slug] [varchar](255) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/20/2020 4:35:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[Username] [varchar](200) NULL,
	[Email] [varchar](255) NULL,
	[Slug] [varchar](200) NULL,
	[Password] [varchar](200) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[TrashAt] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Code_UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [Code_UserRoles] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Slug_UserRoles]    Script Date: 3/20/2020 4:35:24 PM ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [Slug_UserRoles] UNIQUE NONCLUSTERED 
(
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Email_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Email_Users] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Slug_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Slug_Users] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Username_Users]    Script Date: 3/20/2020 4:35:24 PM ******/
CREATE NONCLUSTERED INDEX [Username_Users] ON [dbo].[Users]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CurrentUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_CurrentUserRoles_UserRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CurrentUserRoles] CHECK CONSTRAINT [FK_CurrentUserRoles_UserRoles]
GO
ALTER TABLE [dbo].[CurrentUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_CurrentUserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CurrentUserRoles] CHECK CONSTRAINT [FK_CurrentUserRoles_Users]
GO
