

Use [BD_sistemaEscolar]

IF EXISTS(Select E.IdEstudiante from Estudiante E where E.Email='CadeqeDoapuofuvouko93@edger.ik') THEN SELECT 1


-- 1
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
	@Telefono int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @Result int
	declare @Existe int 
	SET NOCOUNT ON;
	BEGIN TRAN insertar
		begin try
		Set @Existe = (Select E.IdEstudiante from Estudiante E where E.Email=@Email)
		IF @Existe IS NULL
			BEGIN
				Insert Into DBO.Estudiante(Nombre,Apellido,Email,Password,Carnet,Telefono)
				Values(@Codigo,@Nombre,@Descripcion,@TipoFirma,@RolSeguridad,'I',@Tiempo,@Tipo)
				set @Result = 1
			END
		ELSE
			BEGIN 
				SET @Result = -2
			END
		end try 
		begin catch
		rollback TRAN insertar
		set @Result = -1
		end catch	
	if(@Result !=-1 AND @Result !=-2)
	begin
	commit tran insertar
	end
	return @Result
END
GO
