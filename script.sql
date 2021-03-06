USE [master]
GO
/****** Object:  Database [MyForumAppDB]    Script Date: 6/19/2017 3:25:48 PM ******/
CREATE DATABASE [MyForumAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyForumAppDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyForumAppDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyForumAppDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyForumAppDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyForumAppDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyForumAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyForumAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyForumAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyForumAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyForumAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyForumAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyForumAppDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyForumAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyForumAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyForumAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyForumAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyForumAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyForumAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyForumAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyForumAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyForumAppDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyForumAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyForumAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyForumAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyForumAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyForumAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyForumAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyForumAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyForumAppDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyForumAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyForumAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyForumAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyForumAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyForumAppDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyForumAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyForumAppDB]
GO
/****** Object:  Table [dbo].[AnswerTbl]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AnswerTbl](
	[AnsID] [int] IDENTITY(1,1) NOT NULL,
	[FkQueID] [int] NULL,
	[FkUID] [int] NULL,
	[AnsDetails] [varchar](max) NULL,
	[AnsDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LikeAns]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeAns](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[FkAnsID] [int] NULL,
	[FkUID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionTbl]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionTbl](
	[QueID] [int] IDENTITY(1,1) NOT NULL,
	[FKUserID] [int] NULL,
	[fkTechID] [int] NULL,
	[QuestionDetails] [varchar](max) NULL,
	[QuestionImage] [varchar](max) NULL,
	[QuestionDate] [datetime] NULL,
	[IsSolved] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[QueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEssionTbl]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEssionTbl](
	[SessionID] [uniqueidentifier] NOT NULL,
	[FkUID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technologies]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Technologies](
	[TechID] [int] IDENTITY(1,1) NOT NULL,
	[TechName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TechID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userinfo](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[gender] [varchar](10) NULL,
	[dob] [date] NULL,
	[username] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[FkTechID] [int] NULL,
	[RegDate] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AnswerTbl] ON 

INSERT [dbo].[AnswerTbl] ([AnsID], [FkQueID], [FkUID], [AnsDetails], [AnsDate]) VALUES (1, 1, 5, N'Session mese', CAST(N'2017-06-12 14:02:16.210' AS DateTime))
INSERT [dbo].[AnswerTbl] ([AnsID], [FkQueID], [FkUID], [AnsDetails], [AnsDate]) VALUES (2, 1, 5, N'dfgdfgdfgdfg', CAST(N'2017-06-12 14:53:19.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[AnswerTbl] OFF
SET IDENTITY_INSERT [dbo].[LikeAns] ON 

INSERT [dbo].[LikeAns] ([LID], [FkAnsID], [FkUID]) VALUES (3, 1, 2)
INSERT [dbo].[LikeAns] ([LID], [FkAnsID], [FkUID]) VALUES (5, 2, 5)
SET IDENTITY_INSERT [dbo].[LikeAns] OFF
SET IDENTITY_INSERT [dbo].[QuestionTbl] ON 

INSERT [dbo].[QuestionTbl] ([QueID], [FKUserID], [fkTechID], [QuestionDetails], [QuestionImage], [QuestionDate], [IsSolved]) VALUES (1, 2, 4, N'Technology ID Kahase Laye???', N'', CAST(N'2017-06-09 14:52:31.810' AS DateTime), 0)
INSERT [dbo].[QuestionTbl] ([QueID], [FKUserID], [fkTechID], [QuestionDetails], [QuestionImage], [QuestionDate], [IsSolved]) VALUES (2, 2, 4, N'Getting Error While Updating', N'../QuestionImages/CF_2_9_6_2017_14_53_53.png', CAST(N'2017-06-09 14:54:05.903' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[QuestionTbl] OFF
INSERT [dbo].[SEssionTbl] ([SessionID], [FkUID]) VALUES (N'8d43cc6f-c8c0-454c-82f4-69c5435ba0f3', 2)
INSERT [dbo].[SEssionTbl] ([SessionID], [FkUID]) VALUES (N'666323df-3933-4d19-a466-d589c9e578a5', 2)
SET IDENTITY_INSERT [dbo].[Technologies] ON 

INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (2, N'Asp.Net')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (3, N'MVC.Net')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (4, N'PHP')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (5, N'Android')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (6, N'JAVA')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (7, N'Web Designing')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (8, N'Graphic Designing')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (9, N'Software Testing')
INSERT [dbo].[Technologies] ([TechID], [TechName]) VALUES (10, N'C,C++')
SET IDENTITY_INSERT [dbo].[Technologies] OFF
SET IDENTITY_INSERT [dbo].[userinfo] ON 

INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (1, N'Brijesh Patil', N'Male', CAST(N'2017-06-13' AS Date), N'brijesh.patil@tops-int.com', N'123', 2, CAST(N'2017-06-07' AS Date), 0)
INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (2, N'Pappu Regar', N'Male', CAST(N'2005-01-03' AS Date), N'pappu@gmail.com', N'123', 4, CAST(N'2017-06-09' AS Date), 1)
INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (3, N'Priya Barate', N'Female', CAST(N'1999-02-02' AS Date), N'priya@gmail.com', N'123', 5, CAST(N'2017-06-09' AS Date), 1)
INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (4, N'Chetasi', N'Female', CAST(N'1999-02-02' AS Date), N'chetasi@gmail.com', N'123', 2, CAST(N'2017-06-09' AS Date), 1)
INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (5, N'Nachiket', N'Male', CAST(N'1999-02-02' AS Date), N'nachiket@gmail.com', N'123', 4, CAST(N'2017-06-09' AS Date), 1)
INSERT [dbo].[userinfo] ([userid], [name], [gender], [dob], [username], [pass], [FkTechID], [RegDate], [IsActive]) VALUES (6, N'rahul', N'Male', CAST(N'1995-02-06' AS Date), N'Rahul', N'123', 9, CAST(N'2017-06-19' AS Date), 1)
SET IDENTITY_INSERT [dbo].[userinfo] OFF
ALTER TABLE [dbo].[AnswerTbl]  WITH CHECK ADD FOREIGN KEY([FkQueID])
REFERENCES [dbo].[QuestionTbl] ([QueID])
GO
ALTER TABLE [dbo].[AnswerTbl]  WITH CHECK ADD FOREIGN KEY([FkUID])
REFERENCES [dbo].[userinfo] ([userid])
GO
ALTER TABLE [dbo].[LikeAns]  WITH CHECK ADD FOREIGN KEY([FkAnsID])
REFERENCES [dbo].[AnswerTbl] ([AnsID])
GO
ALTER TABLE [dbo].[LikeAns]  WITH CHECK ADD FOREIGN KEY([FkUID])
REFERENCES [dbo].[userinfo] ([userid])
GO
ALTER TABLE [dbo].[QuestionTbl]  WITH CHECK ADD FOREIGN KEY([fkTechID])
REFERENCES [dbo].[Technologies] ([TechID])
GO
ALTER TABLE [dbo].[QuestionTbl]  WITH CHECK ADD FOREIGN KEY([FKUserID])
REFERENCES [dbo].[userinfo] ([userid])
GO
ALTER TABLE [dbo].[userinfo]  WITH CHECK ADD FOREIGN KEY([FkTechID])
REFERENCES [dbo].[Technologies] ([TechID])
GO
/****** Object:  StoredProcedure [dbo].[AddNewQuestion]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewQuestion]
@UID int,
@TID int,
@QDetails varchar(max),
@QImage varchar(max)
as
insert into QuestionTbl values(@UID,@TID,@QDetails,@QImage,GETDATE(),'False')
GO
/****** Object:  StoredProcedure [dbo].[AddNewTechnology]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewTechnology]
@TName varchar(50)
as
insert into Technologies values(@TName)
GO
/****** Object:  StoredProcedure [dbo].[DeleteTechnology]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTechnology]
@TID int
as
delete from Technologies where TechID=@TID
GO
/****** Object:  StoredProcedure [dbo].[GetAllQuestionsByTechnology]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllQuestionsByTechnology]
@TID int
as
select QuestionTbl.*,userinfo.name,userinfo.username,Technologies.TechName from QuestionTbl
inner join userinfo on userinfo.userid = QuestionTbl.FKUserID
inner join Technologies on Technologies.TechID = QuestionTbl.fkTechID
where QuestionTbl.fkTechID=@TID
GO
/****** Object:  StoredProcedure [dbo].[GetAllTechnologies]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTechnologies]
as
select * from Technologies
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers]
as
select userinfo.*,Technologies.TechName from userinfo
inner join Technologies on TechID = userinfo.FkTechID
GO
/****** Object:  StoredProcedure [dbo].[GetAnswersByQueID]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAnswersByQueID]
@QID int
as
select userinfo.name,AnswerTbl.* from AnswerTbl
inner join userinfo on userinfo.userid=AnswerTbl.FkUID
where AnswerTbl.FkQueID=@QID
GO
/****** Object:  StoredProcedure [dbo].[GetLikeCount]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLikeCount]
@AID int
as
select count(*) from LikeAns where FkAnsID=@AID
GO
/****** Object:  StoredProcedure [dbo].[GetUserProfile]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserProfile]
@UID int
As
select userinfo.*,Technologies.TechName from userinfo
inner join Technologies on Technologies.TechID = userinfo.FkTechID
where userid=@UID
GO
/****** Object:  StoredProcedure [dbo].[IsLiked]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsLiked]
@AID int,
@UID int
as
select count(*) from LikeAns where FkAnsID=@AID and FkUID=@UID
GO
/****** Object:  StoredProcedure [dbo].[LikeUnLikeAns]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LikeUnLikeAns]
@IsLike bit,
@AnsID int,
@UID int
as
if(@IsLike = 'True')
	insert into LikeAns values(@AnsID,@UID)
else
	delete from LikeAns where FkAnsID=@AnsID and FkUID=@UID
GO
/****** Object:  StoredProcedure [dbo].[ManageUser]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManageUser]
@UID int,
@Status bit
as
update userinfo set IsActive=@Status where userid=@UID
GO
/****** Object:  StoredProcedure [dbo].[RegNewUser]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegNewUser]
@Name varchar(50),
@Gender varchar(10),
@DOB date,
@UName varchar(50),
@Pass varchar(50),
@TID int
as
insert into userinfo values(
@Name,
@Gender,
@DOB,
@UName,
@Pass,
@TID,
GETDATE(),
'True'
)
GO
/****** Object:  StoredProcedure [dbo].[SignIn]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SignIn]
@UName varchar(50),
@Pass varchar(50)
as
--select count(*) from userinfo where username=@UName and pass=@Pass and IsActive='True'


select * from userinfo where username=@UName and pass=@Pass
GO
/****** Object:  StoredProcedure [dbo].[SubmitAnswer]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitAnswer]
@QID int,
@UID int,
@ADetails varchar(max)
as
insert into AnswerTbl values(@QID,@UID,@ADetails,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[UpdateTechnology]    Script Date: 6/19/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTechnology]
@TID int,
@TName varchar(50)
as
update Technologies set TechName=@TName where TechID=@TID
GO
USE [master]
GO
ALTER DATABASE [MyForumAppDB] SET  READ_WRITE 
GO
