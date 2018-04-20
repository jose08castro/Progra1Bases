USE [master]
GO
--CREATE DATABASE [BD_sistemaEscolar]

USE [BD_sistemaEscolar]

--Drop table dbo.Grupo

CREATE TABLE [dbo].[Estudiante](
    [IdEstudiante] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
	[Apellido][nvarchar](150) NULL,
	[Email][nvarchar](150)  NOT NULL,
	[Password][nvarchar](150) NOT NULL,
	[Carnet][int] NULL,
	[Telefono][int] NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Profesor](
    [IdProfesor] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NULL,
	[Password][nvarchar](150) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Periodo_Lectivo](
    [IdPeriodo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Inicio] [datetime] NOT NULL,
	[Fin] [datetime] NOT NULL,
    [Activo] [nvarchar](5) NOT NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Rubro](
    [IdRubro] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Status_Grupo](
    [IdStatus_Grupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre] [nvarchar](50) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Grupo](
    [IdGrupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdPeriodo] [int] FOREIGN KEY REFERENCES Periodo_Lectivo(IdPeriodo),
	[Codigo] [nvarchar](50) NOT NULL,
	[IdProfesor][int] FOREIGN KEY REFERENCES Profesor(IdProfesor),
	[Nombre][nvarchar](150) NOT NULL,
	[Status][int]  FOREIGN KEY REFERENCES Status_Grupo(IdStatus_Grupo))


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Config_Evaluacion](
    [IdConfig_Evaluacion] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdRubro][int]  FOREIGN KEY REFERENCES Rubro(IdRubro),
	[IdGrupo][int]  FOREIGN KEY REFERENCES Grupo(IdGrupo),
    [Numero] [tinyint] NOT NULL,
	[Porcentaje] [float] NOT NULL,
	[Constante] [nvarchar](5) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Evaluacion](
    [IdEvaluacion] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdConfig_Evaluacion][int]  FOREIGN KEY REFERENCES Config_Evaluacion(IdConfig_Evaluacion),
	[Nombre][nvarchar](25) NOT NULL ,
    [Fecha] [datetime] NOT NULL,
	[Porcentaje] [float] NOT NULL,
	[Descripcion] [nvarchar](200) NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Status_Estudiante](
    [IdStatus_Estudiante] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre] [nvarchar](50) NOT NULL)

USE [BD_sistemaEscolar]
CREATE TABLE [dbo].[EstudiantesXGrupo](
	[Id] [int] identity (1,1) NOT NULL PRIMARY KEY,
    [IdGrupo] [int]  FOREIGN KEY REFERENCES Grupo(IdGrupo),
	[IdEstudiante][int]  FOREIGN KEY REFERENCES Estudiante(IdEstudiante),
	[NotaTotal] [float] NOT NULL,
	[Status][int]FOREIGN KEY REFERENCES Status_Estudiante(IdStatus_Estudiante))

CREATE TABLE [dbo].[NotasXGrupo](
	[IdNotas] [int] identity (1,1) NOT NULL PRIMARY KEY,
    [IdEstudiantesXGrupo] [int]  FOREIGN KEY REFERENCES EstudiantesXGrupo(Id),
	[IdEvaluacion][int]  FOREIGN KEY REFERENCES Evaluacion(IdEvaluacion),
	[Obtenido] [float] NOT NULL)

