USE [master]
GO
--CREATE DATABASE [BD_sistemaEscolar]

USE [BD_sistemaEscolar]

CREATE TABLE [dbo].[Estudiante](
    [IdGrupo] [int] identity (1,1) NOT NULL PRIMARY KEY,
	[Nombre][nvarchar](150) NOT NULL,
    [CodigoGrupo] [nvarchar](100) NULL)