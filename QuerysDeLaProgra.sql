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

