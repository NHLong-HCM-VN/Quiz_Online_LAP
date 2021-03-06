USE [master]
GO
/****** Object:  Database [QUIZONLINE_LAB]    Script Date: 3/5/2021 9:38:49 PM ******/
CREATE DATABASE [QUIZONLINE_LAB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUIZONLINE_LAB_TIEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QUIZONLINE_LAB_TIEN.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QUIZONLINE_LAB_TIEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QUIZONLINE_LAB_TIEN_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QUIZONLINE_LAB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUIZONLINE_LAB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET RECOVERY FULL 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET  MULTI_USER 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUIZONLINE_LAB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QUIZONLINE_LAB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QUIZONLINE_LAB', N'ON'
GO
USE [QUIZONLINE_LAB]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionID] [int] NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[subjectID] [nvarchar](10) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question_Choice]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Choice](
	[choiceID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[choice] [nvarchar](500) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[choiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizID] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[dateTakeQuiz] [datetime] NOT NULL,
	[timeTakeQuiz] [time](7) NOT NULL,
	[questionAmount] [int] NOT NULL,
	[point] [float] NOT NULL,
	[subjectID] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectID] [nvarchar](10) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[timeTakeQuiz] [time](7) NOT NULL,
	[questionAmount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Question_Answer]    Script Date: 3/5/2021 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Question_Answer](
	[quizID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[choice] [nvarchar](500) NOT NULL,
	[isCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC,
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (1, N'Giai cấp công nhân hình thành và phát triển mạnh trong xã hội nào:', CAST(N'2021-03-02 18:22:39.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (2, N'Yếu tố nào giữ vai trò quyết định nhất đối với tính cách mạng triệt để nhất của giai cấp công nhân:', CAST(N'2021-03-02 18:22:31.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (3, N'Giai cấp công nhân ở các nước tư bản chủ nghĩa:', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (4, N'Trong thời kỳ quá độ đi lên chủ nghĩa xã hội, giai cấp công nhân...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (5, N'Trong tác phẩm tuyên ngôn của Đảng Cộng sản, C.Mác và Ph. Ăngghen đã khẳng định: " tất cả các giai cấp khác đều suy tàn, tiêu vong cùng với sự phát triển của đại công nghiệp, còn giai cấp vô sản lại là... của bản thân nền đại công nghiệp"', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (6, N'Sứ mệnh lịch sử thế giới của giai cấp công nhân là...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (7, N'Sứ mệnh lịch sử của giai cấp công nhân vừa mang tính...vừa mang tính...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (8, N'Phong trào đấu tranh của giai cấp công nhân chuyển từ tự phát sang tự giác khi...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (9, N'Đảng cộng sản mang bản chất của giai cấp nào...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (10, N'Quy luật kinh tế cho sự ra đời của Đảng Cộng sản ở tất cả các nước là sự kết hợp...?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (11, N'Đảng Cộng sản đại biểu cho lợi ích của giai cấp nào?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (12, N'Đảng cộng sản tổ chức sinh hoạt theo nguyên tắc:', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (13, N'Nguyên nhân sâu xa của cuộc cách mạng xã hội chủ nghĩa là do:', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (14, N'Mục tiêu của cuộc cách mạng xã hội chủ nghĩa là?', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (15, N'Động lực của cuộc cách mạng xã hội chủ nghĩa:', CAST(N'2000-02-19 00:00:00.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (16, N'Nội dung của cuộc cách mạng xã hội chủ nghĩa trên các lĩnh vực:', CAST(N'2021-03-02 21:56:45.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (17, N'Thực chất của cách mạng xã hội chủ nghĩa có tính chất', CAST(N'2021-03-02 21:57:13.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (18, N'Cuộc cách mạng xã hội chủ nghĩa kết thúc khi:', CAST(N'2021-03-02 21:58:03.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (19, N'Nội dung nào quan trọng nhất trong xây dựng khối liên minh giữa giai cấp công nhân và giai cấp nông dân và các tầng lớp nhân dân lao động khác?', CAST(N'2021-03-02 21:58:31.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (20, N'Những nguyên tắc xây dựng khối liên minh giữa giai cấp công nhân và giai cấp nông dân và các tầng lớp nhân dân lao động khác?', CAST(N'2021-03-02 21:59:06.000' AS DateTime), N'HIS001', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (21, N'What is the name of the operating system that is rarely found on personal computers or laptops but is used in servers and high-end workstations?', CAST(N'2021-03-02 22:05:19.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (22, N'A set of computer instructions designed to solve a specific problem is referred to as a', CAST(N'2021-03-02 22:05:51.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (23, N'________ is what allows a computer to function as a word processor, then a browser, and then a spreadsheet.', CAST(N'2021-03-02 22:06:21.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (24, N'Compilers and translators are one form of', CAST(N'2021-03-02 22:08:05.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (25, N'Errors in a software program are referred to as', CAST(N'2021-03-02 22:08:42.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (26, N'A set of step-by-step procedures for accomplishing a task is known as a(n)', CAST(N'2021-03-02 22:09:13.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (27, N'When a programmer checks to see if a program functions correctly and then corrects errors, it is known as', CAST(N'2021-03-02 22:09:44.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (28, N'For a program to be read by the CPU, it must be loaded into', CAST(N'2021-03-02 22:10:13.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (29, N'When reading a program, the CPU ________ instructions from the program.', CAST(N'2021-03-02 22:10:42.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question] ([questionID], [question], [createDate], [subjectID], [status]) VALUES (30, N'Machine language uses', CAST(N'2021-03-02 22:11:20.000' AS DateTime), N'PRJ311', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (1, 1, 0, N'Xã hội chiếm hữu nô lệ', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (2, 1, 0, N'Xã hội phong kiến', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (3, 1, 1, N'Xã hội tư bản chủ nghĩa', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (4, 1, 0, N'Xã hội xã hội chủ nghĩa', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (5, 2, 0, N'Bị bóc lột nặng nề nhất trong chủ nghĩa tư bản', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (6, 2, 0, N'Bị áp bức nặng nề nhất', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (7, 2, 0, N'Nghèo khổ nhất trong chủ nghĩa tư bản', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (8, 2, 1, N'Đại diện cho xã hội tương lai', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (9, 3, 0, N'Không bị bóc lột', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (10, 3, 0, N'Vẫn bị bóc lột như trước đây', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (11, 3, 0, N'Bị bóc lột ít hơn trước đây', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (12, 3, 1, N'Bị bóc lột nặng nề hơn trước đây', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (13, 4, 0, N'Không còn bị bóc lột', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (14, 4, 1, N'Còn một phần bị bóc lột', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (15, 4, 0, N'Còn bị bóc lột', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (16, 4, 0, N'Còn bị bóc lột nhưng mức độ ít hơn trước đây', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (17, 5, 1, N'Sản phẩm', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (18, 5, 0, N'Thành tựu', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (19, 5, 0, N'Kết quả', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (20, 5, 0, N'Con đẻ', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (21, 6, 0, N'Xóa bỏ chế độ tư hữu', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (22, 6, 0, N'Xóa bỏ chế độ tư hữu về tư liệu sản xuất', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (23, 6, 0, N'Xóa bỏ chế độ tư bản chủ nghĩa', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (24, 6, 1, N'Xóa bỏ nhà nước của giai cấp tư sản, xây dựng thành công chủ nghĩa xã hội và chủ nghĩa cộng sản', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (25, 7, 0, N'Giai cấp...dân tộc', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (26, 7, 0, N'Giai cấp...nhân dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (27, 7, 1, N'Dân tộc...quốc tế', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (28, 7, 0, N'Dân tộc...nhân loại', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (29, 8, 0, N'Có biểu tình, bãi công của công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (30, 8, 0, N'Có tổ chức công đoàn', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (31, 8, 0, N'Có lý luận chủ nghĩa xã hội khoa học', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (32, 8, 1, N'Có Đảng Cộng sản lãnh đạo', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (33, 9, 1, N'Giai cấp công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (34, 9, 0, N'Giai cấp công nhân và giai cấp nông dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (35, 9, 0, N'Giai cấp công nhân và nhân dân lao động', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (36, 9, 0, N'Giai cấp công nhân và dân tộc', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (37, 10, 1, N'Chủ nghĩa Mác - Lênin với phong trào công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (38, 10, 0, N'Chủ nghĩa Mác - Lênin với phong trào công nhân và phong trào yêu nước', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (39, 10, 0, N'Chủ nghĩa Mác - Lênin với phong trào công nhân và phong trào nông dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (40, 10, 0, N'Chủ nghĩa Mác - Lênin với phong trào công nhân và phong trào dân tộc', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (41, 11, 0, N'Giai cấp công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (42, 11, 0, N'Giai cấp công nhân và giai cấp nông dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (43, 11, 1, N'Giai cấp công nhân và nhân dân lao động', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (44, 11, 0, N'Tất cả các giai cấp, và các tầng lớp nhân dân trong xã hội', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (45, 12, 0, N'Tự nguyện + tự quản', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (46, 12, 0, N'Tự nguyện + bình đẳng + cùng có lợi', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (47, 12, 1, N'Tập trung dân chủ + đấu tranh phê và tự phê + tập thể lãnh đạo, cá nhân phụ trách', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (48, 12, 0, N'Hiệp thương dân chủ + tôn trọng lẫn nhau', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (49, 13, 0, N'Sự nghèo khổ của giai cấp công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (50, 13, 0, N'Chiến tranh thế giới', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (51, 13, 0, N'Nội chiến', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (52, 13, 1, N'Tính chất xã hội hóa của lực lượng sản xuất', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (53, 14, 0, N'Giai cấp công nhân đòi tăng lương, giảm giờ làm, đòi dân chủ mở rộng', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (54, 14, 0, N'Giai cấp công nhân đòi mở rộng dân chủ, giành lấy chính quyền về tay của giai cấp mình', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (55, 14, 0, N'Giai cấp công nhân giành lấy chính quyền và trở thành giai cấp dân tộc', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (56, 14, 1, N'Giai cấp công nhân giành lấy chính quyền, tập hợp quần chúng nhân dân xây dựng thành công xã hội mới - xã hội chủ nghĩa về mọi mặt', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (57, 15, 0, N'Giai cấp tư sản, giai cấp công nhân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (58, 15, 0, N'Giai cấp tư sản, giai cấp công nhân, giai cấp nông dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (59, 15, 0, N'Giai cấp công nhân, giai cấp nông dân', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (60, 15, 1, N'Giai cấp công nhân, giai cấp nông dân, những người lao động khác', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (61, 16, 0, N'Kinh tế, khoa học kỹ thuật, công nghệ.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (62, 16, 1, N'Kinh tế, chính trị - văn hóa tư tưởng.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (63, 16, 0, N'Kinh tế, khoa học kỹ thuật, công nghệ.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (64, 16, 0, N'Kinh tế, chính trị, văn học nghệ thuật.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (65, 17, 0, N'Chính trị', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (66, 17, 1, N'Kinh tế', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (67, 17, 0, N'Văn hóa', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (68, 17, 0, N'Tư tưởng', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (69, 18, 0, N'Xóa bỏ chính quyền của giai cấp tư sản.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (70, 18, 0, N'Xây dựng được nhà nước của giai cấp công nhân và nhân dân lao động.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (71, 18, 0, N'Xóa bỏ được giai cấp bóc lột.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (72, 18, 1, N'Xã hội không còn giai cấp, không còn nhà nước.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (73, 19, 1, N'Liên minh về kinh tế', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (74, 19, 0, N'Liên minh về chính trị', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (75, 19, 0, N'Liên minh về văn hóa', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (76, 19, 0, N'Liên minh về xã hội', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (77, 20, 0, N'Đảm bảo sự lãnh đạo của giai cấp công nhân và giai cấp nông dân.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (78, 20, 0, N'Đảm bảo sự lãnh đạo của giai cấp công nhân và nhân dân lao động.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (79, 20, 1, N'Đảm bảo sự lãnh đạo của giai cấp công nhân , tự nguyện của các giai cấp tầng lớp, kết hợp đúng đắn các lợi ích.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (80, 20, 0, N'Đảm bảo sự lãnh đạo của giai cấp công nhân, thực hiện sự bình đẳng giai cấp.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (81, 21, 1, N'UNIX', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (82, 21, 0, N'Windows', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (83, 21, 0, N'MS-DOS', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (84, 21, 0, N'Mac OS', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (85, 22, 0, N'solution.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (86, 22, 0, N'device.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (87, 22, 1, N'program.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (88, 22, 0, N'hardware concept.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (89, 23, 0, N'Hardware', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (90, 23, 0, N'Firmware', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (91, 23, 1, N'Software', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (92, 23, 0, N'Drivers', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (93, 24, 1, N'software.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (94, 24, 0, N'ROM.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (95, 24, 0, N'RAM.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (96, 24, 0, N'hardware.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (97, 25, 0, N'software omissions.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (98, 25, 1, N'bugs.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (99, 25, 0, N'viruses.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (100, 25, 0, N'bad recipe.', 1)
GO
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (101, 26, 0, N'hardware program.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (102, 26, 1, N'algorithm.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (103, 26, 0, N'software bug.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (104, 26, 0, N'firmware program.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (105, 27, 1, N'debugging.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (106, 27, 0, N'de-erroring.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (107, 27, 0, N'default-error checking.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (108, 27, 0, N'error-proofing a program.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (109, 28, 1, N'memory or random access memory (RAM).', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (110, 28, 0, N'the hard disk.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (111, 28, 0, N'read-only memory (ROM).', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (112, 28, 0, N'the BIOS.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (113, 29, 0, N'runs and operates', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (114, 29, 0, N'opens and reads', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (115, 29, 1, N'fetches and executes', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (116, 29, 0, N'executes and opens', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (117, 30, 1, N'numeric codes.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (118, 30, 0, N'English language codes.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (119, 30, 0, N'Java language.', 1)
INSERT [dbo].[Question_Choice] ([choiceID], [questionID], [isCorrect], [choice], [status]) VALUES (120, 30, 0, N'human instructions.', 1)
INSERT [dbo].[Quiz] ([quizID], [email], [dateTakeQuiz], [timeTakeQuiz], [questionAmount], [point], [subjectID]) VALUES (1, N'Damage1345', CAST(N'2021-03-05 10:29:00.000' AS DateTime), CAST(N'00:30:00' AS Time), 20, 2, N'HIS001')
INSERT [dbo].[Quiz] ([quizID], [email], [dateTakeQuiz], [timeTakeQuiz], [questionAmount], [point], [subjectID]) VALUES (2, N'Damage1345', CAST(N'2021-03-05 12:49:34.000' AS DateTime), CAST(N'00:15:00' AS Time), 5, 0, N'PRJ311')
INSERT [dbo].[Quiz] ([quizID], [email], [dateTakeQuiz], [timeTakeQuiz], [questionAmount], [point], [subjectID]) VALUES (3, N'Damage1345', CAST(N'2021-03-05 15:07:58.000' AS DateTime), CAST(N'00:15:00' AS Time), 5, 4, N'PRJ311')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [status], [timeTakeQuiz], [questionAmount]) VALUES (N'HIS001', N'History', 1, CAST(N'00:30:00' AS Time), 15)
INSERT [dbo].[Subject] ([subjectID], [subjectName], [status], [timeTakeQuiz], [questionAmount]) VALUES (N'JPD113', N'Japanese', 1, CAST(N'00:10:00' AS Time), 10)
INSERT [dbo].[Subject] ([subjectID], [subjectName], [status], [timeTakeQuiz], [questionAmount]) VALUES (N'PRJ311', N'Java Desktop', 1, CAST(N'00:15:00' AS Time), 5)
INSERT [dbo].[Subject] ([subjectID], [subjectName], [status], [timeTakeQuiz], [questionAmount]) VALUES (N'PRJ321', N'Java Web', 1, CAST(N'00:15:00' AS Time), 10)
INSERT [dbo].[User] ([email], [name], [password], [isAdmin], [status]) VALUES (N'Admin', N'Admin', N'c371f5f827d2dcdcae9a42279248bac6860fe9eb549cdc19e83e69370e797794', 1, 1)
INSERT [dbo].[User] ([email], [name], [password], [isAdmin], [status]) VALUES (N'Damage1345', N'Nguyen Long', N'c371f5f827d2dcdcae9a42279248bac6860fe9eb549cdc19e83e69370e797794', 0, 1)
INSERT [dbo].[User] ([email], [name], [password], [isAdmin], [status]) VALUES (N'long@gmail.com', N'Nguyen Hoang Long', N'long123', 0, 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 1, N'Xã hội phong kiến', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 2, N'Bị áp bức nặng nề nhất', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 3, N'Không bị bóc lột', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 4, N'Còn một phần bị bóc lột', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 5, N'Kết quả', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 6, N'Xóa bỏ chế độ tư hữu về tư liệu sản xuất', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 7, N'Giai cấp...nhân dân', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 8, N'Có lý luận chủ nghĩa xã hội khoa học', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 9, N'Giai cấp công nhân và giai cấp nông dân', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 10, N'Chủ nghĩa Mác - Lênin với phong trào công nhân và phong trào yêu nước', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 11, N'Giai cấp công nhân và giai cấp nông dân', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 12, N'Tự nguyện + bình đẳng + cùng có lợi', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 13, N'Chiến tranh thế giới', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 14, N'Giai cấp công nhân đòi mở rộng dân chủ, giành lấy chính quyền về tay của giai cấp mình', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 15, N'Giai cấp tư sản, giai cấp công nhân, giai cấp nông dân', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 16, N'Kinh tế, chính trị - văn hóa tư tưởng.', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 17, N'Kinh tế', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 18, N'Xây dựng được nhà nước của giai cấp công nhân và nhân dân lao động.', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 19, N'Liên minh về chính trị', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (1, 20, N'Đảm bảo sự lãnh đạo của giai cấp công nhân , tự nguyện của các giai cấp tầng lớp, kết hợp đúng đắn các lợi ích.', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (2, 21, N'NOT ANSWER', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (2, 22, N'device.', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (2, 23, N'NOT ANSWER', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (2, 27, N'NOT ANSWER', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (2, 30, N'NOT ANSWER', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (3, 21, N'UNIX', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (3, 25, N'viruses.', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (3, 26, N'hardware program.', 0)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (3, 28, N'memory or random access memory (RAM).', 1)
INSERT [dbo].[User_Question_Answer] ([quizID], [questionID], [choice], [isCorrect]) VALUES (3, 29, N'runs and operates', 0)
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Question_Choice]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([questionID])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[User] ([email])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[User_Question_Answer]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([questionID])
GO
ALTER TABLE [dbo].[User_Question_Answer]  WITH CHECK ADD FOREIGN KEY([quizID])
REFERENCES [dbo].[Quiz] ([quizID])
GO
USE [master]
GO
ALTER DATABASE [QUIZONLINE_LAB] SET  READ_WRITE 
GO
