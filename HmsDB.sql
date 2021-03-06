USE [master]
GO
/****** Object:  Database [HmsDb]    Script Date: 8/12/2018 11:18:09 PM ******/
CREATE DATABASE [HmsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HmsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HmsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HmsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HmsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HmsDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HmsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HmsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HmsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HmsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HmsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HmsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HmsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HmsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HmsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HmsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HmsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HmsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HmsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HmsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HmsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HmsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HmsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HmsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HmsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HmsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HmsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HmsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HmsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HmsDb] SET RECOVERY FULL 
GO
ALTER DATABASE [HmsDb] SET  MULTI_USER 
GO
ALTER DATABASE [HmsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HmsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HmsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HmsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HmsDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HmsDb', N'ON'
GO
ALTER DATABASE [HmsDb] SET QUERY_STORE = OFF
GO
USE [HmsDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HmsDb]
GO
/****** Object:  UserDefinedFunction [dbo].[CustomerNumber]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CustomerNumber] (@id int) 
returns char(5) 
as 
begin 
return 'C' + right('0000' + convert(varchar(10), @id), 4) 
end

GO
/****** Object:  UserDefinedFunction [dbo].[PlanNumber]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[PlanNumber] (@id int) 
returns char(5) 
as 
begin 
return 'C' + right('0000' + convert(varchar(10), @id), 4) 
end

GO
/****** Object:  Table [dbo].[Billing]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillId] [int] NOT NULL,
	[BillAmount] [float] NULL,
	[CardNumber] [varchar](50) NULL,
	[ModeOfPayment] [varchar](10) NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillingMode]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingMode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModeName] [varchar](50) NULL,
 CONSTRAINT [PK_BillingMode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[dbID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerNumber]  AS ([dbo].[CustomerNumber]([dbID])),
PRIMARY KEY CLUSTERED 
(
	[dbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientDetals]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDetals](
	[PatientId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Email] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Plan] [varchar](50) NULL,
 CONSTRAINT [PK_PatientDetals] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnosis](
	[DiagnosisId] [int] NOT NULL,
	[Symptoms] [varchar](5000) NULL,
	[DiagnosisProvided] [varchar](50) NULL,
	[AdministeredBy] [varchar](50) NULL,
	[DateOfDiagnosis] [varchar](50) NULL,
	[FollowUpRequired] [varchar](2) NULL,
	[DateOfFollowUp] [varchar](50) NULL,
	[BillId] [int] NULL,
 CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Physician]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physician](
	[PhysicianId] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DepartmentId] [varchar](50) NULL,
	[EducationalQualification] [varchar](500) NULL,
	[YearsOfExperience] [float] NULL,
	[StateId] [varchar](50) NULL,
	[PlanId] [int] NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plan]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [varchar](50) NOT NULL,
	[PlanName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Plan_1] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PatientDetals]  WITH CHECK ADD  CONSTRAINT [FK_PatientDetals_Plan] FOREIGN KEY([Plan])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[PatientDetals] CHECK CONSTRAINT [FK_PatientDetals_Plan]
GO
ALTER TABLE [dbo].[PatientDetals]  WITH CHECK ADD  CONSTRAINT [FK_PatientDetals_State] FOREIGN KEY([State])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[PatientDetals] CHECK CONSTRAINT [FK_PatientDetals_State]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Billing] FOREIGN KEY([BillId])
REFERENCES [dbo].[Billing] ([BillId])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Billing]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Physician] FOREIGN KEY([AdministeredBy])
REFERENCES [dbo].[Physician] ([PhysicianId])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Physician]
GO
ALTER TABLE [dbo].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physician_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Physician] CHECK CONSTRAINT [FK_Physician_Department]
GO
ALTER TABLE [dbo].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physician_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Physician] CHECK CONSTRAINT [FK_Physician_State]
GO
/****** Object:  StoredProcedure [dbo].[spBillInfo]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBillInfo]
(
	@BillId int,
	@BillAmount float,
	@CardNumber varchar(50),
	@ModeOfPayment varchar(50)
	
)
as 
insert into Billing (BillId,BillAmount , CardNumber , ModeOfPayment) 
values (@BillId,@BillAmount , @CardNumber ,@ModeOfPayment)

GO
/****** Object:  StoredProcedure [dbo].[spGetBillingMode]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetBillingMode]
as 
select * from BillingMode

GO
/****** Object:  StoredProcedure [dbo].[spGetPhysicianIdName]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetPhysicianIdName]
as 
select PhysicianId , FirstName , LastName from Physician

GO
/****** Object:  StoredProcedure [dbo].[spPatientDiagnosis]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPatientDiagnosis]
(
	@DiagnosisId int,
	@Symptoms varchar(5000),
	@DiagnosisProvided varchar(50),
	@AdministeredBy varchar(50),
	@DateOfDiagnosis varchar(50),
	@FollowUpRequired varchar(2),
	@DateOfFollowUp varchar(50),
	@BillId int
)
as 
insert into PatientDiagnosis (DiagnosisId,Symptoms , DiagnosisProvided , AdministeredBy,DateOfDiagnosis,FollowUpRequired ,DateOfFollowUp ,BillId) 
values (@DiagnosisId,@Symptoms , @DiagnosisProvided ,@AdministeredBy,@DateOfDiagnosis,@FollowUpRequired,@DateOfFollowUp ,@BillId)

GO
/****** Object:  StoredProcedure [dbo].[spSearchPhysician]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spSearchPhysician]

@DepartmentId varchar(50),
@StateId varchar(10),
@PlanId varchar(10)

as

begin

select * from Physician where DepartmentId like @DepartmentId
intersect
select * from Physician where StateId like @StateId
intersect
select * from Physician where PlanId like @PlanId

end

GO
/****** Object:  StoredProcedure [dbo].[spViewPatientHistory]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spViewPatientHistory]

@PatientId int,
@FirstName varchar(50),
@LastName varchar(50)
as
begin
select Ptd.PatientId , Ptd.FirstName , Ptd.LastName, Pd.DateOfDiagnosis , Pd.AdministeredBy ,Symptoms ,
Pd.DiagnosisProvided ,Pd.DateOfFollowUp,Bl.BillAmount

from PatientDetals as Ptd 
INNER JOIN Physician as Ph
on ptd.[Plan] = Ph.PlanId   and ptd.PatientId = @PatientId and Ptd.FirstName = @FirstName and Ptd.LastName = @LastName

INNER JOIN PatientDiagnosis as Pd
on Ph.PhysicianId = Pd.AdministeredBy

INNER JOIN Billing as Bl 

on Pd.BillId = Bl.BillId

end


GO
/****** Object:  StoredProcedure [dbo].[USPDepartment]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USPDepartment]
as 
select * from Department

GO
/****** Object:  StoredProcedure [dbo].[USPPatientDetals]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USPPatientDetals]
(
	@PatientId int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@DateOfBirth varchar(50),
	@PhoneNumber int,
	@Email varchar(50),
	@State varchar(10),
	@Plan varchar(10)
)
as 
insert into PatientDetals (PatientId,FirstName , LastName , DateOfBirth,PhoneNumber,Email ,[State] ,[Plan]) 
values (@PatientId ,@FirstName,@LastName , @DateOfBirth ,@PhoneNumber,@Email,@State,@Plan )

GO
/****** Object:  StoredProcedure [dbo].[USPPhysicianDetails]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USPPhysicianDetails]
(
	@PhysicianId varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@DepartmentId varchar(50),
	@EducationalQualification varchar(500),
	@YearsOfExperience float,
	@StateId varchar(10),
	@PlanId varchar(10)
)
as 
insert into Physician (PhysicianId,FirstName , LastName , DepartmentId,EducationalQualification,YearsOfExperience ,StateId ,PlanId) 
values (@PhysicianId ,@FirstName,@LastName , @DepartmentId ,@EducationalQualification,@YearsOfExperience,@StateId,@PlanId )

GO
/****** Object:  StoredProcedure [dbo].[USPPlan]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USPPlan]
as 
select * from [Plan]

GO
/****** Object:  StoredProcedure [dbo].[USPState]    Script Date: 8/12/2018 11:18:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USPState]
as 
select * from State

GO
USE [master]
GO
ALTER DATABASE [HmsDb] SET  READ_WRITE 
GO
