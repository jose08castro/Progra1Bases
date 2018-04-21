Use [BD_sistemaEscolar]
-- =============================================
-- Author:		Eduard Torres
-- Create date: 17/11/2017
-- Description:	Pregunta 1, b.
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

SELECT *FROM Evaluacion

Select Distinct(CE.IdGrupo) from Evaluacion E inner join Config_Evaluacion CE on E.IdConfig_Evaluacion=CE.IdConfig_Evaluacion 
where CE.IdConfig_Evaluacion=6

Select EG.Id, 2 'idEvaluacion',0 'obtenido' from EstudiantesXGrupo EG where EG.IdGrupo=2

Select * from NotasXGrupo NG inner join EstudiantesXGrupo EG On Ng.IdEstudiantesXGrupo=Eg.Id
WHERE EG.IdGrupo=2 AND NG.IdEvaluacion=18

