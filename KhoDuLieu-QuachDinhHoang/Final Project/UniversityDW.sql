USE [master]
GO
/****** Object:  Database [UniversityDW]    Script Date: 27-Jun-20 1:41:31 PM ******/
CREATE DATABASE [UniversityDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UniversityDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UniversityDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UniversityDW] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDW] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversityDW] SET QUERY_STORE = OFF
GO
USE [UniversityDW]
GO
/****** Object:  Schema [MDWT]    Script Date: 27-Jun-20 1:41:31 PM ******/
CREATE SCHEMA [MDWT]
GO
/****** Object:  Table [dbo].[DimClassroom]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimClassroom](
	[ClassroomKey] [int] IDENTITY(1,1) NOT NULL,
	[Building] [varchar](15) NOT NULL,
	[RoomNumber] [varchar](7) NOT NULL,
	[Capacity] [numeric](4, 0) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimClassroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCourse]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCourse](
	[CourseKey] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [varchar](8) NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
	[Credits] [numeric](2, 0) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimCourse] PRIMARY KEY CLUSTERED 
(
	[CourseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDepartment]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDepartment](
	[DeptKey] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](20) NOT NULL,
	[Building] [varchar](15) NOT NULL,
	[Budget] [numeric](12, 2) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimDepartment] PRIMARY KEY CLUSTERED 
(
	[DeptKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimInstructor]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimInstructor](
	[InstructorKey] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [varchar](5) NOT NULL,
	[InstructorName] [varchar](20) NULL,
	[DeptName] [varchar](20) NOT NULL,
	[Salary] [numeric](8, 2) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimInstructor] PRIMARY KEY CLUSTERED 
(
	[InstructorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPrereq]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPrereq](
	[PrereqKey] [int] IDENTITY(1,1) NOT NULL,
	[CourseTitle] [varchar](50) NOT NULL,
	[PrereqTitle] [varchar](50) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimPrereq] PRIMARY KEY CLUSTERED 
(
	[PrereqKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSection]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSection](
	[SectionKey] [int] IDENTITY(1,1) NOT NULL,
	[CourseTitle] [varchar](50) NULL,
	[SectionID] [varchar](8) NOT NULL,
	[Year] [numeric](4, 0) NULL,
	[Semester] [varchar](6) NOT NULL,
	[Building] [varchar](15) NULL,
	[RoomNumber] [varchar](7) NULL,
	[TimeSlotID] [varchar](4) NULL,
	[InstructorName] [varchar](20) NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimSection] PRIMARY KEY CLUSTERED 
(
	[SectionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStudent]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStudent](
	[StudentKey] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](5) NOT NULL,
	[StudentName] [varchar](20) NOT NULL,
	[DeptName] [varchar](20) NOT NULL,
	[TotalCredit] [int] NOT NULL,
	[AdvisorName] [varchar](20) NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimStudent] PRIMARY KEY CLUSTERED 
(
	[StudentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTakes]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTakes](
	[TakesKey] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](20) NOT NULL,
	[CourseTitle] [varchar](50) NULL,
	[SectionID] [varchar](8) NOT NULL,
	[Year] [numeric](4, 0) NULL,
	[Grade] [varchar](2) NULL,
	[Semester] [varchar](6) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimTakes] PRIMARY KEY CLUSTERED 
(
	[TakesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTimeSlot]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTimeSlot](
	[TimeSlotKey] [int] IDENTITY(1,1) NOT NULL,
	[TimeSlotID] [varchar](4) NOT NULL,
	[Day] [varchar](1) NOT NULL,
	[Start_hr] [numeric](2, 0) NOT NULL,
	[Start_min] [numeric](2, 0) NOT NULL,
	[End_hr] [numeric](2, 0) NULL,
	[End_min] [numeric](2, 0) NOT NULL,
	[RowIsCurrent] [nchar](1) NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.DimTimeSlot] PRIMARY KEY CLUSTERED 
(
	[TimeSlotKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSection]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSection](
	[ClassroomKey] [int] NOT NULL,
	[RoomNumber] [varchar](7) NOT NULL,
	[CourseKey] [int] NOT NULL,
	[Credits] [numeric](2, 0) NOT NULL,
	[InstructorKey] [int] NOT NULL,
	[InstructorName] [varchar](20) NULL,
	[SectionKey] [int] NOT NULL,
	[CourseTitle] [varchar](50) NULL,
	[SectionID] [varchar](8) NOT NULL,
	[Year] [numeric](4, 0) NULL,
	[TimeSlotID] [varchar](4) NULL,
	[StudentKey] [int] NOT NULL,
	[StudentName] [varchar](20) NOT NULL,
	[TakesKey] [int] NOT NULL,
	[Grade] [varchar](2) NULL,
	[TimeSlotKey] [int] NOT NULL,
 CONSTRAINT [PK_FactSectionReporting] PRIMARY KEY CLUSTERED 
(
	[ClassroomKey] ASC,
	[CourseKey] ASC,
	[InstructorKey] ASC,
	[SectionKey] ASC,
	[StudentKey] ASC,
	[TakesKey] ASC,
	[TimeSlotKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStudent]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStudent](
	[StudentKey] [int] NOT NULL,
	[StudentName] [varchar](20) NOT NULL,
	[DeptName] [varchar](20) NOT NULL,
	[TotalCredit] [int] NOT NULL,
	[InstructorKey] [int] NOT NULL,
	[InstructorName] [varchar](20) NULL,
	[TakesKey] [int] NOT NULL,
	[CourseTitle] [varchar](50) NULL,
	[SectionID] [varchar](8) NOT NULL,
	[Year] [numeric](4, 0) NULL,
	[Grade] [varchar](2) NULL,
	[Semester] [varchar](6) NOT NULL,
	[SectionKey] [int] NOT NULL,
	[Building] [varchar](15) NULL,
	[RoomNumber] [varchar](7) NULL,
 CONSTRAINT [PK_FactStudentManagement] PRIMARY KEY CLUSTERED 
(
	[StudentKey] ASC,
	[InstructorKey] ASC,
	[TakesKey] ASC,
	[SectionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTeaching]    Script Date: 27-Jun-20 1:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTeaching](
	[InstructorKey] [int] IDENTITY(1,1) NOT NULL,
	[InstructorName] [varchar](20) NULL,
	[DeptName] [varchar](20) NOT NULL,
	[Salary] [numeric](8, 2) NOT NULL,
	[TakesKey] [int] NOT NULL,
	[StudentName] [varchar](20) NOT NULL,
	[SectionID] [varchar](8) NOT NULL,
	[Year] [numeric](4, 0) NULL,
	[Grade] [varchar](2) NULL,
	[Semester] [varchar](6) NOT NULL,
	[CourseKey] [int] NOT NULL,
	[CourseTitle] [varchar](50) NULL,
	[TimeSlotKey] [int] NOT NULL,
	[TimeSlotID] [varchar](4) NOT NULL,
	[SectionKey] [int] NOT NULL,
	[Building] [varchar](15) NULL,
	[RoomNumber] [varchar](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimClassroom] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimCourse] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimDepartment] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimInstructor] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimPrereq] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimSection] ADD  DEFAULT ('0') FOR [CourseTitle]
GO
ALTER TABLE [dbo].[DimSection] ADD  DEFAULT ('0') FOR [SectionID]
GO
ALTER TABLE [dbo].[DimSection] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[DimSection] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimTakes] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[DimTimeSlot] ADD  DEFAULT ('31-Dec-9999') FOR [RowEndDate]
GO
ALTER TABLE [dbo].[FactSection] ADD  DEFAULT ('0') FOR [CourseTitle]
GO
ALTER TABLE [dbo].[FactSection] ADD  DEFAULT ('0') FOR [SectionID]
GO
ALTER TABLE [dbo].[FactSection] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimClassroom] FOREIGN KEY([ClassroomKey])
REFERENCES [dbo].[DimClassroom] ([ClassroomKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimClassroom]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimCourse] FOREIGN KEY([CourseKey])
REFERENCES [dbo].[DimCourse] ([CourseKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimCourse]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimInstructor] FOREIGN KEY([InstructorKey])
REFERENCES [dbo].[DimInstructor] ([InstructorKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimInstructor]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimSection] FOREIGN KEY([SectionKey])
REFERENCES [dbo].[DimSection] ([SectionKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimSection]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimStudent] FOREIGN KEY([StudentKey])
REFERENCES [dbo].[DimStudent] ([StudentKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimStudent]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimTakes] FOREIGN KEY([TakesKey])
REFERENCES [dbo].[DimTakes] ([TakesKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimTakes]
GO
ALTER TABLE [dbo].[FactSection]  WITH CHECK ADD  CONSTRAINT [FK_FactSectionReporting_DimTimeSlot] FOREIGN KEY([TimeSlotKey])
REFERENCES [dbo].[DimTimeSlot] ([TimeSlotKey])
GO
ALTER TABLE [dbo].[FactSection] CHECK CONSTRAINT [FK_FactSectionReporting_DimTimeSlot]
GO
ALTER TABLE [dbo].[FactStudent]  WITH CHECK ADD  CONSTRAINT [FK_FactStudentManagement_DimInstructor] FOREIGN KEY([InstructorKey])
REFERENCES [dbo].[DimInstructor] ([InstructorKey])
GO
ALTER TABLE [dbo].[FactStudent] CHECK CONSTRAINT [FK_FactStudentManagement_DimInstructor]
GO
ALTER TABLE [dbo].[FactStudent]  WITH CHECK ADD  CONSTRAINT [FK_FactStudentManagement_DimSection] FOREIGN KEY([SectionKey])
REFERENCES [dbo].[DimSection] ([SectionKey])
GO
ALTER TABLE [dbo].[FactStudent] CHECK CONSTRAINT [FK_FactStudentManagement_DimSection]
GO
ALTER TABLE [dbo].[FactStudent]  WITH CHECK ADD  CONSTRAINT [FK_FactStudentManagement_DimStudent] FOREIGN KEY([StudentKey])
REFERENCES [dbo].[DimStudent] ([StudentKey])
GO
ALTER TABLE [dbo].[FactStudent] CHECK CONSTRAINT [FK_FactStudentManagement_DimStudent]
GO
ALTER TABLE [dbo].[FactStudent]  WITH CHECK ADD  CONSTRAINT [FK_FactStudentManagement_DimTakes] FOREIGN KEY([TakesKey])
REFERENCES [dbo].[DimTakes] ([TakesKey])
GO
ALTER TABLE [dbo].[FactStudent] CHECK CONSTRAINT [FK_FactStudentManagement_DimTakes]
GO
ALTER TABLE [dbo].[FactTeaching]  WITH CHECK ADD  CONSTRAINT [FK_FactTeaching_DimCourse] FOREIGN KEY([CourseKey])
REFERENCES [dbo].[DimCourse] ([CourseKey])
GO
ALTER TABLE [dbo].[FactTeaching] CHECK CONSTRAINT [FK_FactTeaching_DimCourse]
GO
ALTER TABLE [dbo].[FactTeaching]  WITH CHECK ADD  CONSTRAINT [FK_FactTeaching_DimInstructor] FOREIGN KEY([InstructorKey])
REFERENCES [dbo].[DimInstructor] ([InstructorKey])
GO
ALTER TABLE [dbo].[FactTeaching] CHECK CONSTRAINT [FK_FactTeaching_DimInstructor]
GO
ALTER TABLE [dbo].[FactTeaching]  WITH CHECK ADD  CONSTRAINT [FK_FactTeaching_DimSection] FOREIGN KEY([SectionKey])
REFERENCES [dbo].[DimSection] ([SectionKey])
GO
ALTER TABLE [dbo].[FactTeaching] CHECK CONSTRAINT [FK_FactTeaching_DimSection]
GO
ALTER TABLE [dbo].[FactTeaching]  WITH CHECK ADD  CONSTRAINT [FK_FactTeaching_DimTakes] FOREIGN KEY([TakesKey])
REFERENCES [dbo].[DimTakes] ([TakesKey])
GO
ALTER TABLE [dbo].[FactTeaching] CHECK CONSTRAINT [FK_FactTeaching_DimTakes]
GO
ALTER TABLE [dbo].[FactTeaching]  WITH CHECK ADD  CONSTRAINT [FK_FactTeaching_DimTimeSlot] FOREIGN KEY([TimeSlotKey])
REFERENCES [dbo].[DimTimeSlot] ([TimeSlotKey])
GO
ALTER TABLE [dbo].[FactTeaching] CHECK CONSTRAINT [FK_FactTeaching_DimTimeSlot]
GO
EXEC [UniversityDW].sys.sp_addextendedproperty @name=N'Description', @value=N'Default description - you should change this.' 
GO
USE [master]
GO
ALTER DATABASE [UniversityDW] SET  READ_WRITE 
GO
