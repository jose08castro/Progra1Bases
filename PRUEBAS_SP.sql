Use [BD_sistemaEscolar]

go 
declare @resultado int
DECLARE @Ema nvarchar(150)
DECLARE @Con nvarchar(150)
set @Ema='TauoheAruokego56@ic-itcr.ac.cr'
set @Con='2015153972'

EXEC Obtner_Id_Estudiante @Ema,@Con,@Resultado=@resultado OUTPUT;

select @resultado