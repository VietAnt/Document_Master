USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 27-Jun-20 1:38:46 PM ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UniversityDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversityDB] SET QUERY_STORE = OFF
GO
USE [UniversityDB]
GO
/****** Object:  Table [dbo].[classroom]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classroom](
	[building] [varchar](15) NOT NULL,
	[room_number] [varchar](7) NOT NULL,
	[capacity] [numeric](4, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[building] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[course_id] [varchar](8) NOT NULL,
	[title] [varchar](50) NULL,
	[dept_name] [varchar](20) NULL,
	[credits] [numeric](2, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[dept_name] [varchar](20) NOT NULL,
	[building] [varchar](15) NULL,
	[budget] [numeric](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[ID] [varchar](5) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[dept_name] [varchar](20) NULL,
	[salary] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prereq]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prereq](
	[course_id] [varchar](8) NOT NULL,
	[prereq_id] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[prereq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[section]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[section](
	[course_id] [varchar](8) NOT NULL,
	[sec_id] [varchar](8) NOT NULL,
	[semester] [varchar](6) NOT NULL,
	[year] [numeric](4, 0) NOT NULL,
	[building] [varchar](15) NULL,
	[room_number] [varchar](7) NULL,
	[time_slot_id] [varchar](4) NULL,
	[instructor_id] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[sec_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[ID] [varchar](5) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[dept_name] [varchar](20) NULL,
	[tot_cred] [numeric](3, 0) NULL,
	[advisor] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[takes]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[takes](
	[ID] [varchar](5) NOT NULL,
	[course_id] [varchar](8) NOT NULL,
	[sec_id] [varchar](8) NOT NULL,
	[semester] [varchar](6) NOT NULL,
	[year] [numeric](4, 0) NOT NULL,
	[grade] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[course_id] ASC,
	[sec_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_slot]    Script Date: 27-Jun-20 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_slot](
	[time_slot_id] [varchar](4) NOT NULL,
	[day] [varchar](1) NOT NULL,
	[start_hr] [numeric](2, 0) NOT NULL,
	[start_min] [numeric](2, 0) NOT NULL,
	[end_hr] [numeric](2, 0) NULL,
	[end_min] [numeric](2, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[time_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[classroom] ([building], [room_number], [capacity]) VALUES (N'Packard', N'101', CAST(500 AS Numeric(4, 0)))
INSERT [dbo].[classroom] ([building], [room_number], [capacity]) VALUES (N'Painter', N'514', CAST(10 AS Numeric(4, 0)))
INSERT [dbo].[classroom] ([building], [room_number], [capacity]) VALUES (N'Taylor', N'3128', CAST(70 AS Numeric(4, 0)))
INSERT [dbo].[classroom] ([building], [room_number], [capacity]) VALUES (N'Watson', N'100', CAST(30 AS Numeric(4, 0)))
INSERT [dbo].[classroom] ([building], [room_number], [capacity]) VALUES (N'Watson', N'120', CAST(50 AS Numeric(4, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'BIO-101', N'Intro. to Biology', N'Biology', CAST(4 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'BIO-301', N'Genetics', N'Biology', CAST(4 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'BIO-399', N'Computational Biology', N'Biology', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'CS-101', N'Intro. to Computer Science', N'Comp. Sci.', CAST(4 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'CS-190', N'Game Design', N'Comp. Sci.', CAST(4 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'CS-315', N'Robotics', N'Comp. Sci.', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'CS-319', N'Image Processing', N'Comp. Sci.', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'CS-347', N'Database System Concepts', N'Comp. Sci.', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'EE-181', N'Intro. to Digital Systems', N'Elec. Eng.', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'FIN-201', N'Investment Banking', N'Finance', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'HIS-351', N'World History', N'History', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'MU-199', N'Music Video Production', N'Music', CAST(3 AS Numeric(2, 0)))
INSERT [dbo].[course] ([course_id], [title], [dept_name], [credits]) VALUES (N'PHY-101', N'Physical Principles', N'Physics', CAST(4 AS Numeric(2, 0)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Biology', N'Watson', CAST(90000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Comp. Sci.', N'Taylor', CAST(100000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Elec. Eng.', N'Taylor', CAST(85000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Finance', N'Painter', CAST(120000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'History', N'Painter', CAST(50000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Music', N'Packard', CAST(80000.00 AS Numeric(12, 2)))
INSERT [dbo].[department] ([dept_name], [building], [budget]) VALUES (N'Physics', N'Watson', CAST(70000.00 AS Numeric(12, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'10101', N'Srinivasan', N'Comp. Sci.', CAST(65000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'12121', N'Wu', N'Finance', CAST(90000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'15151', N'Mozart', N'Music', CAST(40000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'22222', N'Einstein', N'Physics', CAST(95000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'32343', N'El Said', N'History', CAST(60000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'33456', N'Gold', N'Physics', CAST(87000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'45565', N'Katz', N'Comp. Sci.', CAST(75000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'58583', N'Califieri', N'History', CAST(62000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'76543', N'Singh', N'Finance', CAST(80000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'76766', N'Crick', N'Biology', CAST(72000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'83821', N'Brandt', N'Comp. Sci.', CAST(92000.00 AS Numeric(8, 2)))
INSERT [dbo].[instructor] ([ID], [name], [dept_name], [salary]) VALUES (N'98345', N'Kim', N'Elec. Eng.', CAST(80000.00 AS Numeric(8, 2)))
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'BIO-301', N'BIO-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'BIO-399', N'BIO-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'CS-190', N'CS-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'CS-315', N'CS-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'CS-319', N'CS-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'CS-347', N'CS-101')
INSERT [dbo].[prereq] ([course_id], [prereq_id]) VALUES (N'EE-181', N'PHY-101')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'BIO-101', N'1', N'Summer', CAST(2017 AS Numeric(4, 0)), N'Painter', N'514', N'B_W', N'76766')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'BIO-301', N'1', N'Summer', CAST(2018 AS Numeric(4, 0)), N'Painter', N'514', N'A_F', N'76766')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'Packard', N'101', N'F_T', N'10101')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-101', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Packard', N'101', N'F_R', N'45565')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-190', N'1', N'Spring', CAST(2017 AS Numeric(4, 0)), N'Taylor', N'3128', N'A_M', N'83821')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-190', N'2', N'Spring', CAST(2017 AS Numeric(4, 0)), N'Taylor', N'3128', N'A_M', N'83821')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-315', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Watson', N'120', N'D_F', N'10101')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-319', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Watson', N'100', N'B_M', N'45565')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-319', N'2', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Taylor', N'3128', N'C_W', N'83821')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'CS-347', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'Taylor', N'3128', N'A_W', N'10101')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'EE-181', N'1', N'Spring', CAST(2017 AS Numeric(4, 0)), N'Taylor', N'3128', N'C_M', N'98345')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'FIN-201', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Packard', N'101', N'B_F', N'12121')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'HIS-351', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Painter', N'514', N'C_F', N'32343')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'MU-199', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'Packard', N'101', N'D_W', N'15151')
INSERT [dbo].[section] ([course_id], [sec_id], [semester], [year], [building], [room_number], [time_slot_id], [instructor_id]) VALUES (N'PHY-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'Watson', N'100', N'A_F', N'22222')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'00128', N'Zhang', N'Comp. Sci.', CAST(102 AS Numeric(3, 0)), N'45565')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'12345', N'Shankar', N'Comp. Sci.', CAST(32 AS Numeric(3, 0)), N'10101')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'19991', N'Brandt', N'History', CAST(80 AS Numeric(3, 0)), NULL)
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'23121', N'Chavez', N'Finance', CAST(110 AS Numeric(3, 0)), N'76543')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'44553', N'Peltier', N'Physics', CAST(56 AS Numeric(3, 0)), N'22222')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'45678', N'Levy', N'Physics', CAST(46 AS Numeric(3, 0)), N'22222')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'54321', N'Williams', N'Comp. Sci.', CAST(54 AS Numeric(3, 0)), NULL)
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'55739', N'Sanchez', N'Music', CAST(38 AS Numeric(3, 0)), NULL)
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'70557', N'Snow', N'Physics', CAST(0 AS Numeric(3, 0)), NULL)
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'76543', N'Brown', N'Comp. Sci.', CAST(58 AS Numeric(3, 0)), N'45565')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'76653', N'Aoi', N'Elec. Eng.', CAST(60 AS Numeric(3, 0)), N'98345')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'98765', N'Bourikas', N'Elec. Eng.', CAST(98 AS Numeric(3, 0)), N'98345')
INSERT [dbo].[student] ([ID], [name], [dept_name], [tot_cred], [advisor]) VALUES (N'98988', N'Tanaka', N'Biology', CAST(120 AS Numeric(3, 0)), N'76766')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'00128', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'00128', N'CS-347', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'A-')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'12345', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'C')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'12345', N'CS-190', N'2', N'Spring', CAST(2017 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'12345', N'CS-315', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'12345', N'CS-347', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'19991', N'HIS-351', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'B')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'23121', N'FIN-201', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'C+')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'44553', N'PHY-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'B-')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'45678', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'F')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'45678', N'CS-101', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'B+')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'45678', N'CS-319', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'B')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'54321', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'A-')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'54321', N'CS-190', N'2', N'Spring', CAST(2017 AS Numeric(4, 0)), N'B+')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'55739', N'MU-199', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'A-')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'76543', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'76543', N'CS-319', N'2', N'Spring', CAST(2018 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'76653', N'EE-181', N'1', N'Spring', CAST(2017 AS Numeric(4, 0)), N'C')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'98765', N'CS-101', N'1', N'Fall', CAST(2017 AS Numeric(4, 0)), N'C-')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'98765', N'CS-315', N'1', N'Spring', CAST(2018 AS Numeric(4, 0)), N'B')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'98988', N'BIO-101', N'1', N'Summer', CAST(2017 AS Numeric(4, 0)), N'A')
INSERT [dbo].[takes] ([ID], [course_id], [sec_id], [semester], [year], [grade]) VALUES (N'98988', N'BIO-301', N'1', N'Summer', CAST(2018 AS Numeric(4, 0)), NULL)
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'A_F', N'F', CAST(8 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(8 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'A_M', N'M', CAST(8 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(8 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'A_W', N'W', CAST(8 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(8 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'B_F', N'F', CAST(9 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(9 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'B_M', N'M', CAST(9 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(9 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'B_W', N'W', CAST(9 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(9 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'C_F', N'F', CAST(11 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(11 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'C_M', N'M', CAST(11 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(11 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'C_W', N'W', CAST(11 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(11 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'D_F', N'F', CAST(13 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(13 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'D_M', N'M', CAST(13 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(13 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'D_W', N'W', CAST(13 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(13 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'E_R', N'R', CAST(10 AS Numeric(2, 0)), CAST(30 AS Numeric(2, 0)), CAST(11 AS Numeric(2, 0)), CAST(45 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'E_T', N'T', CAST(10 AS Numeric(2, 0)), CAST(30 AS Numeric(2, 0)), CAST(11 AS Numeric(2, 0)), CAST(45 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'F_R', N'R', CAST(14 AS Numeric(2, 0)), CAST(30 AS Numeric(2, 0)), CAST(15 AS Numeric(2, 0)), CAST(45 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'F_T', N'T', CAST(14 AS Numeric(2, 0)), CAST(30 AS Numeric(2, 0)), CAST(15 AS Numeric(2, 0)), CAST(45 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'G_F', N'F', CAST(16 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(16 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'G_M', N'M', CAST(16 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(16 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'G_W', N'W', CAST(16 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(16 AS Numeric(2, 0)), CAST(50 AS Numeric(2, 0)))
INSERT [dbo].[time_slot] ([time_slot_id], [day], [start_hr], [start_min], [end_hr], [end_min]) VALUES (N'H_W', N'W', CAST(10 AS Numeric(2, 0)), CAST(0 AS Numeric(2, 0)), CAST(12 AS Numeric(2, 0)), CAST(30 AS Numeric(2, 0)))
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([dept_name])
REFERENCES [dbo].[department] ([dept_name])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD FOREIGN KEY([dept_name])
REFERENCES [dbo].[department] ([dept_name])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[prereq]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([building], [room_number])
REFERENCES [dbo].[classroom] ([building], [room_number])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([instructor_id])
REFERENCES [dbo].[instructor] ([ID])
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([time_slot_id])
REFERENCES [dbo].[time_slot] ([time_slot_id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([advisor])
REFERENCES [dbo].[instructor] ([ID])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([dept_name])
REFERENCES [dbo].[department] ([dept_name])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[takes]  WITH CHECK ADD FOREIGN KEY([course_id], [sec_id], [semester], [year])
REFERENCES [dbo].[section] ([course_id], [sec_id], [semester], [year])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[takes]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD CHECK  (([credits]>(0)))
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD CHECK  (([budget]>(0)))
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD CHECK  (([salary]>(29000)))
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD CHECK  (([semester]='Summer' OR [semester]='Spring' OR [semester]='Winter' OR [semester]='Fall'))
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD CHECK  (([year]>(1701) AND [year]<(2100)))
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  (([tot_cred]>=(0)))
GO
ALTER TABLE [dbo].[time_slot]  WITH CHECK ADD CHECK  (([end_hr]>=(0) AND [end_hr]<(24)))
GO
ALTER TABLE [dbo].[time_slot]  WITH CHECK ADD CHECK  (([end_min]>=(0) AND [end_min]<(60)))
GO
ALTER TABLE [dbo].[time_slot]  WITH CHECK ADD CHECK  (([start_hr]>=(0) AND [start_hr]<(24)))
GO
ALTER TABLE [dbo].[time_slot]  WITH CHECK ADD CHECK  (([start_min]>=(0) AND [start_min]<(60)))
GO
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
