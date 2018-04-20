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

-- 

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
