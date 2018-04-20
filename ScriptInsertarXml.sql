
--para estudiantes 
USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(150),apellido nvarchar(150), email nvarchar(150), password nvarchar(150),Carnet int, telefono int)

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML


--Insert into dbo.Estudiante(Nombre,Email,Password,Telefono,Estado)
insert into @tempo
SELECT  StudentName,StudentLastName,StudentEmail,StudentPassword,StudentCarnet,Studentphone
FROM OPENXML(@hDoc, 'XML/studentData/student')
WITH 
(
StudentName [nvarchar](150) '@name',
StudentLastName [nvarchar](150) '@lastName',
StudentEmail [nvarchar](150) '@email' ,
StudentPassword [nvarchar](150) '@carnet',
StudentCarnet [nvarchar](150) '@carnet',
Studentphone [int] '@phone'
);

USE  [BD_sistemaEscolar]

insert into dbo.Estudiante(Nombre,Apellido,Email,Password,Carnet,Telefono)
select * from @tempo
select * from dbo.Estudiante
EXEC sp_xml_removedocument @hDoc
GO

--para los profesores 
USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(150),apellido nvarchar(150), email nvarchar(150), password nvarchar(150))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  TeacherName,TeacherLastName,TeacherEmail,TeacherPassword
FROM OPENXML(@hDoc, 'XML/teacherData/teacher')
WITH 
(
TeacherName [nvarchar](150) '@name',
TeacherLastName [nvarchar](150) '@lastName',
TeacherEmail [nvarchar](150) '@email' ,
TeacherPassword [nvarchar](150) '@password'
);

USE  [BD_sistemaEscolar]

insert into dbo.Profesor(Nombre,Apellido,Email,Password)
select * from @tempo

select * from dbo.Profesor

EXEC sp_xml_removedocument @hDoc
GO

--status estudiantes 

USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(50))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  StatusName
FROM OPENXML(@hDoc, 'XML/studentGroupStateData/studentGroupState')
WITH 
(
StatusName [nvarchar](50) '@name'
);

USE  [BD_sistemaEscolar]

insert into dbo.Status_Estudiante(Nombre)
select * from @tempo

select * from dbo.Status_Estudiante

EXEC sp_xml_removedocument @hDoc
GO

--para status grupo

USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(50))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  StatusName
FROM OPENXML(@hDoc, 'XML/groupStateData/groupState')
WITH 
(
StatusName [nvarchar](50) '@name'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Status_Grupo(Nombre)
select * from @tempo

select * from dbo.Status_Grupo

EXEC sp_xml_removedocument @hDoc
GO

--para periodo lectivo 

USE  OPENXMLTesting
GO

declare @tempo as table(Inicio datetime, Fin datetime, Activo nvarchar(5))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  Inicio,Fin,Activo
FROM OPENXML(@hDoc, 'XML/termData/term')
WITH 
(
Inicio [datetime] '@start',
Fin [datetime] '@end',
Activo [nvarchar](5) '@active'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Periodo_Lectivo(Inicio,Fin,Activo)
select * from @tempo

select * from dbo.Periodo_Lectivo

EXEC sp_xml_removedocument @hDoc
GO

--para rubro

USE  OPENXMLTesting
GO

declare @tempo as table(Nombre nvarchar(150))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  Nombre
FROM OPENXML(@hDoc, 'XML/itemData/item')
WITH 
(
Nombre [nvarchar](150) '@name'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Rubro(Nombre)
select * from @tempo

select * from dbo.Rubro

EXEC sp_xml_removedocument @hDoc
GO


--para Grupo

USE  OPENXMLTesting
GO

declare @tempo as table( IdPeriodo int, Codigo nvarchar(50), IdProfesor int, Nombre nvarchar(150), Status int)

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  IdPeriodo , Codigo , IdProfesor , Nombre , Status 
FROM OPENXML(@hDoc, 'XML/groupData/group')
WITH 
(
IdPeriodo [int] '@termID',
Codigo [nvarchar](50) '@code',
IdProfesor [int] '@teacherID',
Nombre [nvarchar](150) '@courseName',
Status [int] '@groupStateID'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Grupo( IdPeriodo,  Codigo , IdProfesor , Nombre , Status )
select * from @tempo

select * from dbo.Grupo

EXEC sp_xml_removedocument @hDoc
GO

--para Config_Evaluacion

USE  OPENXMLTesting
GO

declare @tempo as table(IdRubro int, IdGrupo int, Numero tinyint, Porcentaje float,Constante nvarchar(5))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  IdRubro, IdGrupo, Numero , Porcentaje ,Constante 
FROM OPENXML(@hDoc, 'XML/groupItemData/groupItem ')
WITH 
(
IdRubro [int] '@itemID',
IdGrupo [int] '@groupID',
Numero [tinyint] '@count',
Porcentaje [float] '@percentage',
Constante [nvarchar](5) '@constantCount'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Config_Evaluacion(IdRubro, IdGrupo , Numero , Porcentaje ,Constante )
select * from @tempo

select * from dbo.Config_Evaluacion

EXEC sp_xml_removedocument @hDoc
GO


--para Evaluacion

USE  OPENXMLTesting
GO

declare @tempo as table(IdConfig_Evaluacion int, Nombre nvarchar(25), Fecha datetime, Porcentaje float,Descripcion nvarchar(200))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  IdConfig_Evaluacion , Nombre , Fecha , Porcentaje ,Descripcion 
FROM OPENXML(@hDoc, 'XML/evaluationData/evaluation')
WITH 
(
IdConfig_Evaluacion [int] '@groupItemID',
Nombre [nvarchar](25) '@name',
Fecha [datetime] '@date',
Porcentaje [float] '@percentage',
Descripcion [nvarchar](200) '@description'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.Evaluacion(IdConfig_Evaluacion , Nombre , Fecha , Porcentaje ,Descripcion)
select * from @tempo

select * from dbo.Evaluacion

EXEC sp_xml_removedocument @hDoc
GO
--para EstudiantesXgrupo

USE  OPENXMLTesting
GO

declare @tempo as table(IdGrupo  int, IdEstudiante int, NotaTotal float, Status int)

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  IdGrupo  , IdEstudiante , NotaTotal , Status 
FROM OPENXML(@hDoc, 'XML/studentGroupData/studentGroup')
WITH 
(
IdGrupo [int] '@groupID',
IdEStudiante [int] '@studentID',
NotaTotal [float] '@totalGrade',
Status [int] '@studentGroupStateID'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.EstudiantesXGrupo(IdGrupo  , IdEstudiante , NotaTotal , Status)
select * from @tempo

select * from dbo.EstudiantesXGrupo

EXEC sp_xml_removedocument @hDoc
GO

--para notasxgrupo

USE  OPENXMLTesting
GO

declare @tempo as table(IdEstudintesXGrupo  int, IdEvaluacion int, Obtenido float)

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  IdEstudintesXGrupo , IdEvaluacion , Obtenido 
FROM OPENXML(@hDoc, 'XML/studentEvaluationData/studentEvaluation')
WITH 
(
IdEstudintesXGrupo [int] '@studentGroupID',
IdEvaluacion [int] '@evaluationID',
Obtenido [float] '@grade'
);

USE  [BD_sistemaEscolar]
--select * from @tempo
insert into dbo.NotasXGrupo(IdEstudiantesXGrupo, IdEvaluacion, Obtenido)
select * from @tempo

select * from dbo.NotasXGrupo

EXEC sp_xml_removedocument @hDoc
GO