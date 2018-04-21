-- 1

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <14/4/17>
-- Description:	<Insert Estudiante>
-- =============================================
CREATE PROCEDURE Insertar_Estudiante(
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150),
	@Apellido nvarchar(150) ,
	@Email nvarchar(150),
	@Password nvarchar(150),
	@Carnet int,
	@Telefono int,
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Existe int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Existe = (Select E.IdEstudiante from Estudiante E where E.Email=@Email)
		IF @Existe IS NULL
			BEGIN
				Insert Into DBO.Estudiante(Nombre,Apellido,Email,Password,Carnet,Telefono)
				Values(@Nombre,@Apellido,@Email,@Password,@Carnet,@Telefono)
				set @Result = 1 --correcto
			END
		ELSE
			BEGIN 
				rollback TRAN insertar
				SET @Result = -2--ya existe estudiante con ese correo
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema 
		end catch	
	if(@Result !=-1 AND @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
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
-- Create date: <14/4/17>
-- Description:	<Insert Profesor>
-- =============================================
CREATE PROCEDURE Insertar_Profesor(
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150),
	@Apellido nvarchar(150) ,
	@Email nvarchar(150),
	@Password nvarchar(150),
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Existe int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Existe = (Select p.IdProfesor from Profesor P where P.Email=@Email)
		IF @Existe IS NULL
			BEGIN
				Insert Into DBO.Profesor(Nombre,Apellido,Email,Password)
				Values(@Nombre,@Apellido,@Email,@Password)
				set @Result = 1--correcto
			END
		ELSE
			BEGIN 
				rollback TRAN insertar
				SET @Result = -2--ya existe
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 AND @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
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
-- Create date: <14/4/17>
-- Description:	<Crear periodo lectivo>
-- =============================================
CREATE PROCEDURE Crear_Periodo(
	-- Add the parameters for the stored procedure here
	@Inicio datetime,
	@Fin datetime,
	@Activo nvarchar(5),
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		IF(@FIN>@Inicio) 
			BEGIN
			Insert Into dbo.Periodo_Lectivo(Inicio,Fin,Activo)
			Values(@Inicio,@Fin,@Activo)
			set @Result = 1--correcto
			END
		ELSE 
			BEGIN
			rollback TRAN insertar
			set @Result = -2--fin mayor que inicio 
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 AND  @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
END
GO

--4

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <14/4/17>
-- Description:	<insertar status>
-- =============================================
CREATE PROCEDURE Insertar_Status(
	-- Add the parameters for the stored procedure here
	@nombre nvarchar(150),
	@Type int,
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	declare @Existe int
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		IF(@Type = 1) 
			BEGIN
			set @Existe = (select SG.IdStatus_Grupo from Status_Grupo SG WHERE SG.Nombre=@nombre)
			IF @Existe IS NULL
				BEGIN
					Insert Into dbo.Status_Grupo(Nombre)
					Values(@nombre)
					set @Result = 1--correcto la insercion en status_grupo
				END
			ELSE
				BEGIN
				rollback TRAN insertar
			set @Result = -2--YA EXISTE STATUS CON ESE NOMBRE 
				END
			END
		ELSE 
			BEGIN
			set @Existe = (select SE.IdStatus_Estudiante from Status_Estudiante SE WHERE SE.Nombre=@nombre)
			IF @Existe IS NULL
				BEGIN
					Insert Into dbo.Status_Estudiante(Nombre)
					Values(@nombre)
					set @Result = 1--correcto la insercion en status_estudiante
				END
			ELSE
				BEGIN
				rollback TRAN insertar
			set @Result = -2--YA EXISTE STATUS CON ESE NOMBRE 
				END
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 AND  @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
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
-- Create date: <14/4/17>
-- Description:	<Insertar Rubro>
-- =============================================
CREATE PROCEDURE Insertar_Rubro(
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(50),
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	declare @Existe int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Existe = (Select R.IdRubro from Rubro R where R.Nombre=@Nombre )
		IF @Existe IS NULL
			BEGIN
			Insert Into dbo.Rubro(Nombre)
			Values(@Nombre)
			set @Result = 1--correcto
			END
		ELSE 
			BEGIN
			rollback TRAN insertar
			set @Result = -2--ya existe rubro con ese nombre 
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 AND  @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
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
-- Create date: <14/4/17>
-- Description:	<Insertar Grupo>
-- =============================================
CREATE PROCEDURE Insertar_Grupo(
	-- Add the parameters for the stored procedure here
	@IdPeriodo int,
	@Codigo nvarchar(150),
	@IdProfesor int,
	@Nombre nvarchar(150),
	@IdStatus int,
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Insert Into dbo.Grupo(IdPeriodo,Codigo,IdProfesor,Nombre,Status)
		Values(@IdPeriodo,@Codigo,@IdProfesor,@Nombre,@IdStatus)
		set @Result = 1--correcto
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1)
	begin
	commit tran insertar
	end
	return @Result
END
GO


--7

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <14/4/17>
-- Description:	<Insertar Estudiante en un grupo>
-- =============================================
CREATE PROCEDURE Insertar_EstudianteEnGrupo(
	-- Add the parameters for the stored procedure here
	@IdGrupo int,
	@IdEstudiante  int,
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	declare @Exist int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Exist = (Select EG.Id from EstudiantesXGrupo EG where EG.IdEstudiante=@IdEstudiante and EG.IdGrupo=@IdGrupo)
		IF @Exist IS NULL
		BEGIN
			Insert Into dbo.EstudiantesXGrupo(IdGrupo,IdEstudiante,NotaTotal,Status)
			Values(@IdGrupo,@IdEstudiante,0,2)
			set @Result = 1--correcto
		END
		ELSE 
			BEGIN
			rollback TRAN insertar
			set @Result = -2--ya existia 
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 and @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
END
GO

--8

Use [BD_sistemaEscolar]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<00776dc467f2b588b23350d2db96c58163ecbca282e7199a6d7746542d1b30ad>
-- Create date: <14/4/17>
-- Description:	<Insertar Estudiante en un grupo>
-- =============================================
CREATE PROCEDURE Insertar_ConfigEva(
	-- Add the parameters for the stored procedure here
	@IdRubro int,
	@IdGrupo  int,
	@Numero int,
	@Porcentaje float,
	@Constante nvarchar(5),
	@Result int OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. 
	declare @Exist int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Exist = (SELECT C.IdConfig_Evaluacion FROM Config_Evaluacion C where C.IdRubro=@IdRubro and C.IdGrupo=@IdGrupo)
		IF( (@Exist IS NULL )and @Numero >0)
		BEGIN
			Insert Into dbo.Config_Evaluacion(IdRubro,IdGrupo,Numero,Porcentaje,Constante)
			Values(@IdRubro,@IdGrupo,@Numero,@Porcentaje,@Constante)
			set @Result = 1--correcto
		END
		ELSE 
			BEGIN
			rollback TRAN insertar
			set @Result = -2--ya existia o numero igual a 0
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1--hubo un problema
		end catch	
	if(@Result !=-1 and @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
END
GO
