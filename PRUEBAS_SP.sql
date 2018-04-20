--1
Use [BD_sistemaEscolar]

go 
declare @resultado int
DECLARE @Ema nvarchar(150)
DECLARE @Con nvarchar(150)
set @Ema='TauoheAruokego56@ic-itcr.ac.cr'
set @Con='2015153972'

EXEC Obtener_Id_Estudiante @Ema,@Con,@Resultado=@resultado OUTPUT;

select @resultado


--2
Use [BD_sistemaEscolar]

go 
declare @resultado int
DECLARE @Ema nvarchar(150)
DECLARE @Con nvarchar(150)
set @Ema='FonogukaRaalupi62@yahoo.com'
set @Con='9397571861'

EXEC Obtener_Id_Profesor @Ema,@Con,@Resultado=@resultado OUTPUT;

select @resultado


--3
Use [BD_sistemaEscolar]

go 
declare @Grupo int
set @Grupo=4
declare @Result table (IdGrupo int,IdEstudiante int, Nombre nvarchar(200))

insert into @Result
EXEC Obtener_Estudiantes_Grupo @grupo;

Select * from @Result
