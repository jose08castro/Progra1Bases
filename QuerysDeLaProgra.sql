-- 1

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener id de los estudiantes>
-- =============================================
CREATE PROCEDURE Obtener_Id_Estudiante(
	-- Add the parameters for the stored procedure here
	@Email nvarchar(150),
	@Contrasenna nvarchar(150), 
	@Resultado int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result int
	SET NOCOUNT ON;
	Set @Result = (select E.IdEstudiante from Estudiante E where E.Email=@Email and E.Password=@Contrasenna)
	set @Resultado = ISNULL(@Result, -1)
	RETURN @Resultado
END
GO

-- 2

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener id de los profesores>
-- =============================================
CREATE PROCEDURE Obtener_Id_Profesor(
	-- Add the parameters for the stored procedure here
	@Email nvarchar(150),
	@Contrasenna nvarchar(150), 
	@Resultado int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result int
	SET NOCOUNT ON;
	Set @Result = (select P.IdProfesor from Profesor P where P.Email=@Email and P.Password=@Contrasenna)
	set @Resultado = ISNULL(@Result, -1)
	RETURN @Resultado
END
GO

-- 3

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener Estudiantes por grupo >
-- =============================================
CREATE PROCEDURE Obtener_Estudiantes_Grupo(
	-- Add the parameters for the stored procedure here
	@IdGrupo int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result table (IdGrupo int,IdEstudiante int, Nombre nvarchar(200) )
	SET NOCOUNT ON;
	insert into @Result
	Select E.IdGrupo,E.IdEstudiante, RTRIM(ES.Nombre) from EstudiantesXGrupo E inner join Estudiante ES on E.IdEstudiante=ES.IdEstudiante where E.IdGrupo=@IdGrupo

	Select * from @Result 
END
GO

-- 4

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener grupos por profesor >
-- =============================================
CREATE PROCEDURE Obtener_GruposPorProfesor(
	-- Add the parameters for the stored procedure here
	@IdProfesor int,
	@Class INT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result table (IdGrupo int,IdPerido int,Codigo nvarchar(50),Nombre nvarchar(200),Activo nvarchar(5))
	SET NOCOUNT ON;
	IF(@Class = 1)--para grupos activos
	BEGIN
		insert into @Result
		Select G.IdGrupo,G.IdPeriodo,G.Codigo,G.Nombre,P.Activo FROM Grupo G INNER JOIN Periodo_Lectivo P ON G.IdPeriodo=P.IdPeriodo WHERE P.Activo='True' AND G.IdProfesor=@IdProfesor
	END
	ELSE--para grupos incativos 
	BEGIN
		insert into @Result
		Select G.IdGrupo,G.IdPeriodo,G.Codigo,G.Nombre,P.Activo FROM Grupo G INNER JOIN Periodo_Lectivo P ON G.IdPeriodo=P.IdPeriodo WHERE P.Activo='False' AND G.IdProfesor=@IdProfesor
	
	END 
	Select * from @Result 
END
GO


-- 5
Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener Info  Profe >
-- =============================================
CREATE PROCEDURE Obtener_Info_Profe(
	-- Add the parameters for the stored procedure here
	@IdProfe int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result table (Nombre nvarchar(200),Apellido nvarchar(200))
	SET NOCOUNT ON;
	insert into @Result
	Select RTRIM(P.Nombre),RTRIM(P.Apellido) from Profesor P where P.IdProfesor=@IdProfe

	Select * from @Result 
END
GO

-- 6
Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener Rubro o StatusEstudiante o StatusGrupo >
-- =============================================
CREATE PROCEDURE Obtener_Rubro_Sestu_SGru(
	-- Add the parameters for the stored procedure here
	@Type int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result table (Id int, Nombre nvarchar(200))
	SET NOCOUNT ON;
	IF(@Type = 1)
		BEGIN 
			INSERT INTO @Result
			SELECT * FROM dbo.Rubro
		END
	ELSE 
		BEGIN
			IF(@Type = 2)
				BEGIN
					INSERT INTO @Result
					SELECT * FROM dbo.Status_Estudiante
				END
			ELSE
				BEGIN
					INSERT INTO @Result
					SELECT * FROM dbo.Status_Grupo
				END
		END
	Select * from @Result 
END
GO


-- 7
Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <10/4/18>
-- Description:	<Obtener notas por estudiante del grupo>
-- =============================================
CREATE PROCEDURE Obtener_Notas_Estu(
	-- Add the parameters for the stored procedure here
	@IdGrupo int,
	@IdEstudiante int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result table (IdEstu int, Nombre nvarchar(200),Porcentaje float,Obtenido float,PorcObte float, NotaFinal float)
	SET NOCOUNT ON;
	INSERT INTO @Result
	SELECT EG.IdEstudiante,E.Nombre,E.Porcentaje,NG.Obtenido, (NG.Obtenido/100*E.Porcentaje),EG.NotaTotal
		FROM EstudiantesXGrupo EG INNER JOIN NotasXGrupo NG 
		ON NG.IdEstudiantesXGrupo = EG.Id INNER JOIN Evaluacion E ON NG.IdEvaluacion=E.IdEvaluacion
		WHERE EG.IdGrupo=@IdGrupo AND EG.IdEstudiante=@IdEstudiante

	Select * from @Result 
END
GO




