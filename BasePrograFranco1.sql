USE [master]
GO
--CREATE DATABASE [BD_sistemaEscolar]

USE [BD_sistemaEscolar]

--Drop table dbo.EstudianteXGrupo

CREATE TABLE [dbo].[Estudiante](
    [IdEstudiante] [int] identity (1,1) NOT NULL PRIMARY KEY,--carne
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NULL,
	[Telefono][int] NULL,
    [Estado] [nvarchar](10) NOT NULL)--Acti=activo, RetJ=retiro justificado, RetI= retiro injustificado


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Profesor](
    [IdProfesor] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NULL,
	[Telefono][int] NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[PeriodoLectivo](
    [IdPeriodo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[FechaIni][DATETIME] NOT NULL,
    [FechaFin] [datetime] NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Curso](
    [IdCurso] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdPeriodo][int]  FOREIGN KEY REFERENCES PeriodoLectivo(IdPeriodo),
    [Estado] [nvarchar](10) NOT NULL)--cre=creado,eje=ejecución, anu=anulado y fin=finalizado


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Rubro](
    [IdRubro] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
    [Instancia] [nvarchar](10) NOT NULL)--fijo, vari= variable


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Evaluacion](
    [IdEvaluacion] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdRubro][int]  FOREIGN KEY REFERENCES Rubro(IdRubro),
    [Estado] [tinyint] NOT NULL,
	[Porcentaje] [tinyint] NOT NULL)

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Grupo](
    [IdGrupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdEvaluacion] [int] FOREIGN KEY REFERENCES Evaluacion(IdEvaluacion),
	[Nombre][nvarchar](150) NOT NULL,
	[HoraIni][time] NOT NULL,
	[HoraFin][time] NOT NULL,
    [Aula] [nvarchar](50) NULL)


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[GrupoXCurso](
    [IdCurso] [int]  FOREIGN KEY REFERENCES Curso(IdCurso),
	[IdPeriodo][int]  FOREIGN KEY REFERENCES PeriodoLectivo(IdPeriodo),
    [IdGrupo] [int] FOREIGN KEY REFERENCES Grupo(IdGrupo))


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[EstudianteXGrupo](
    [IdGrupo] [int]  FOREIGN KEY REFERENCES Grupo(IdGrupo) PRIMARY KEY,
	[CarneEstudiante][int]  FOREIGN KEY REFERENCES Estudiante(IdEstudiante))

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[ProfesorXGrupo](
    [IdGrupo] [int]  FOREIGN KEY REFERENCES Grupo(IdGrupo),
	[CarneProfesor][int]  FOREIGN KEY REFERENCES Profesor(IdProfesor))


USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[NotasXGrupo](
    [Id] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdGrupo] [int] FOREIGN KEY REFERENCES EstudianteXGrupo(IdGrupo),
	[IdEstudiante][nvarchar](150) NOT NULL,
	[Rubro][int] NOT NULL,
	[Numero][tinyint] NOT NULL,
    [Valor] [tinyint] NOT NULL,
	[Obtenido] [tinyint] NULL)