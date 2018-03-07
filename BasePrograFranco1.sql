USE [master]
GO
--CREATE DATABASE [BD_sistemaEscolar]

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Estudiante](
    [IdGrupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
	[Email][nvarchar](150)  NULL,
	[Telefono][int] NULL,
    [Estado] [nvarchar](10) NOT NULL)--Acti=activo, RetJ=retiro justificado, RetI= retiro injustificado


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

CREATE TABLE [dbo].[Curso](
    [IdCurso] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[IdPeriodo][int]  FOREIGN KEY REFERENCES PeriodoLectivo(IdPeriodo),
    [Estado] [nvarchar](10) NOT NULL)--cre=creado,eje=ejecución, anu=anulado y fin=finalizado