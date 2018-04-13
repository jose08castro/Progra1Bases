USE [master]
GO
--CREATE DATABASE [BD_sistemaEscolar]

USE [BD_sistemaEscolar]

--Drop table dbo.Grupo

CREATE TABLE [dbo].[Estudiante](
    [IdEstudiante] [int] identity (1,1) NOT NULL PRIMARY KEY,--carne
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NOT NULL,
	[Password][nvarchar](150) NOT NULL,
	[Telefono][int] NULL,
    [Estado] [nvarchar](10) NOT NULL)--Acti=activo, RetJ=retiro justificado, RetI= retiro injustificado


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Profesor](
    [IdProfesor] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NULL,
	[Password][nvarchar](150) NOT NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Rubro](
    [IdRubro] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
    [Instancia] [nvarchar](10) NOT NULL)--fijo, vari= variable


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Evaluacion](
    [IdEvaluacion] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdRubro][int]  FOREIGN KEY REFERENCES Rubro(IdRubro),
    [Numero] [tinyint] NOT NULL,
	[Porcentaje] [tinyint] NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Status_Grupo](
    [IdStatus_Grupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre] [nvarchar](50) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Grupo](
    [IdGrupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdEvaluacion] [int] FOREIGN KEY REFERENCES Evaluacion(IdEvaluacion),
	[Periodo] [int] NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[IdProfesor][int] FOREIGN KEY REFERENCES Profesor(IdProfesor),
	[Nombre][nvarchar](150) NOT NULL,
	[Status][int]  FOREIGN KEY REFERENCES Status_Grupo(IdStatus_Grupo))


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Status_Estudiante](
    [IdStatus_Estudiante] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre] [nvarchar](50) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[EstudianteXGrupo](
    [IdGrupo] [int]  FOREIGN KEY REFERENCES Grupo(IdGrupo) PRIMARY KEY,
	[IdEstudiante][int]  FOREIGN KEY REFERENCES Estudiante(IdEstudiante),
	[Status][int]  FOREIGN KEY REFERENCES Status_Estudiante(IdStatus_Estudiante))


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[NotasXGrupo](
    [Id] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdGrupo] [int] FOREIGN KEY REFERENCES EstudianteXGrupo(IdGrupo),
	[IdEvalucacion][int] FOREIGN KEY REFERENCES Evaluacion(IdEvaluacion),
	[IdEstudiante][nvarchar](150) NOT NULL,
	[Rubro][int] NOT NULL,
	[Numero][tinyint] NOT NULL,
    [Valor] [tinyint] NOT NULL,
	[Obtenido] [tinyint] NULL)