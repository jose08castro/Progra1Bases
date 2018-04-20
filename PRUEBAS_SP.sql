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

--4

Use [BD_sistemaEscolar]

declare @Idprofe int
set @Idprofe = 1
declare @type int
set @type =0
declare @Result table (IdGrupo int,IdPerido int,Codigo nvarchar(50),Nombre nvarchar(200),Activo nvarchar(5))

insert into @Result
EXEC Obtener_GruposPorProfesor @Idprofe , @type;

Select * from @Result



--prueba insertar estudiante
Use [BD_sistemaEscolar]

go 
declare @resultado int

EXec Insertar_Estudiante 'juan','solano','juanjose.com','12345',2016086099,88867215,@Result=@resultado OUTPUT;

select @resultado

--select * from Estudiante


--prueba insertar status 
Use [BD_sistemaEscolar]

go 
declare @resultado int

EXec Insertar_Status 'corriendo',1, @Result=@resultado OUTPUT;

select @resultado

select * from Status_Grupo