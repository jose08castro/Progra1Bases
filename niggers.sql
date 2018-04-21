Use [BD_sistemaEscolar]
-- =============================================
-- Author:		Juan Jose Solano
-- Create date: 17/4/2018
-- Description:	insertar notas iniciales 
-- =============================================
IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'InsertarNotasXEstudiante'
     AND parent_class_desc = 'Evaluacion'
)
	DROP TRIGGER InsertarNotasXEstudiante ON DATABASE
GO

CREATE TRIGGER InsertarNotasXEstudiante ON dbo.Evaluacion
	FOR INSERT, DELETE, UPDATE 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @idEvaluacion AS int
	DECLARE @idEstudiantesXGrupo AS int
	DECLARE @idGrupo AS int
	Declare @idConfig AS int 
	IF EXISTS (SELECT * FROM inserted) -- Es insert u update
	BEGIN
	   SET @idEvaluacion =
	   (SELECT i.IdEvaluacion
	   FROM inserted i)
	   SET @idConfig =
	   (SELECT i.IdConfig_Evaluacion
	   FROM inserted i)
	END
	ELSE
	BEGIN
		SET @idEvaluacion =
	   (SELECT d.IdEvaluacion
	   FROM deleted d)
	   SET @idConfig =
	   (SELECT i.IdConfig_Evaluacion
	   FROM deleted i)
	END
	SET @idGrupo = ( Select Distinct(CE.IdGrupo) from Evaluacion E inner join Config_Evaluacion CE 
					on E.IdConfig_Evaluacion=CE.IdConfig_Evaluacion 
					where CE.IdConfig_Evaluacion=@idConfig)

	IF NOT EXISTS (Select * from NotasXGrupo NG inner join EstudiantesXGrupo EG On Ng.IdEstudiantesXGrupo=Eg.Id
					WHERE EG.IdGrupo=@idGrupo AND NG.IdEvaluacion=@idEvaluacion)
	BEGIN
		declare @temp table (Id int, IdEvaluacion int, Obtenido int)
		insert into @temp
		Select EG.Id,@idEvaluacion,0 from EstudiantesXGrupo EG where EG.IdGrupo=@idGrupo;
		
		INSERT INTO NotasXGrupo
		select * from @temp
	END
END
GO


--Calculo notas totales 

Use [BD_sistemaEscolar]
-- =============================================
-- Author:		Juan Jose Solano Morera
-- Create date: 17/4/2018
-- Description:	calcular nota 
-- =============================================
IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'CalcularNota'
     AND parent_class_desc = 'NotasXGrupos'
)
	DROP TRIGGER CalcularNota ON DATABASE
GO

CREATE TRIGGER CalcularNota ON NotasXGrupo
	FOR INSERT, DELETE, UPDATE 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @idEstudinateXGrupo AS int
	IF EXISTS (SELECT * FROM inserted) -- Es insert u update
	BEGIN
	   SET @idEstudinateXGrupo =
	   (SELECT i.IdEstudiantesXGrupo
	   FROM inserted i)
	END
	ELSE
	BEGIN
		SET @idEstudinateXGrupo =
	   (SELECT i.IdEstudiantesXGrupo
	   FROM inserted i)
	END
	DECLARE @iDEstudiante int 
	DECLARE @iDGrupo int
	SET @iDEstudiante = (SELECT EG.IdEstudiante FROM EstudiantesXGrupo EG WHERE EG.Id=@idEstudinateXGrupo)
	SET @iDGrupo = (SELECT EG.IdGrupo FROM EstudiantesXGrupo EG WHERE EG.IdGrupo=@iDGrupo)
	IF NOT EXISTS (SELECT * FROM NotasXGrupo NG INNER JOIN EstudiantesXGrupo EG ON NG.IdEstudiantesXGrupo=EG.Id 
					INNER JOIN Evaluacion E ON E.IdEvaluacion=NG.IdEvaluacion WHERE EG.IdEstudiante=@iDEstudiante 
					AND EG.IdGrupo=@iDGrupo )
	BEGIN
		declare @NuevoTotal float 
		SET @NuevoTotal = (SELECT SUM(NG.Obtenido/100*E.Porcentaje) 'LA SUMA DE LAS NOTAS ' FROM NotasXGrupo NG INNER JOIN EstudiantesXGrupo EG ON NG.IdEstudiantesXGrupo=EG.Id 
							INNER JOIN Evaluacion E ON E.IdEvaluacion=NG.IdEvaluacion WHERE EG.IdEstudiante=@iDEstudiante AND EG.IdGrupo=@iDGrupo )
		UPDATE EstudiantesXGrupo
		SET NotaTotal=@NuevoTotal
		WHERE Id=@idEstudinateXGrupo
	END
END
GO



--Calculo bitacora cambios 

Use [BD_sistemaEscolar]
-- =============================================
-- Author:		Juan Jose Solano Morera
-- Create date: 17/4/2018
-- Description:	bitacora cambios nota 
-- =============================================
IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'BitacoraCambios'
     AND parent_class_desc = 'NotasXGrupos'
)
	DROP TRIGGER BitacoraCambios ON DATABASE
GO

CREATE TRIGGER BitacoraCambios ON NotasXGrupo
	FOR UPDATE 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @idEstudinateXGrupo AS int
	DECLARE @iDNota AS INT 
	IF EXISTS (SELECT * FROM inserted) -- Es insert u update
	BEGIN
	   SET @idEstudinateXGrupo =
	   (SELECT i.IdEstudiantesXGrupo
	   FROM inserted i)
	   SET @iDNota =
	   (SELECT i.IdNotas
	   FROM inserted i)
	END
	DECLARE @iDEstudiante int
	DECLARE @NombreEvaluacion nvarchar(200)
	DECLARE @Email nvarchar(200)
	DECLARE @Fecha datetime
	SET @iDEstudiante = (SELECT EG.IdEstudiante FROM EstudiantesXGrupo EG WHERE EG.Id=@idEstudinateXGrupo)
	SET @Email = (SELECT E.Email FROM Estudiante E INNER JOIN EstudiantesXGrupo  EG ON E.IdEstudiante=EG.IdEstudiante WHERE EG.Id=@idEstudinateXGrupo)
	SET @NombreEvaluacion = (SELECT E.Nombre FROM NotasXGrupo NG INNER JOIN Evaluacion E ON NG.IdEvaluacion=E.IdEvaluacion WHERE NG.IdEstudiantesXGrupo=@iDNota)
	set @Fecha = GETDATE();
	BEGIN
		declare @Monto float 
		SET @Monto = (SELECT NG.Obtenido FROM NotasXGrupo NG WHERE NG.IdNotas=@iDNota)
		INSERT INTO dbo.Cambios_En_Nota
		values(@iDNota,@NombreEvaluacion,@Email,@Monto,@Fecha)
	END
END
GO

