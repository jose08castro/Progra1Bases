
--para estudiantes 
USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(150), email nvarchar(150), password nvarchar(150), telefono int, estado nvarchar(150))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML


--Insert into dbo.Estudiante(Nombre,Email,Password,Telefono,Estado)
insert into @tempo
SELECT  StudentName,StudentEmail,StudentPassword,Studentphone,'Acti'
FROM OPENXML(@hDoc, 'XML/studentData/student')
WITH 
(
StudentName [nvarchar](150) '@name',
StudentEmail [nvarchar](150) '@email' ,
StudentPassword [nvarchar](150) '@carnet',
Studentphone [int] '@phone'
);

USE  [BD_sistemaEscolar]

--insert into dbo.Estudiante(Nombre,Email,Password,Telefono,Estado)
--select * from @tempo
select * from dbo.Estudiante
EXEC sp_xml_removedocument @hDoc
GO

--para los profesores 
USE  OPENXMLTesting
GO

declare @tempo as table(nombre nvarchar(150), email nvarchar(150), password nvarchar(150))

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM  XMLwithOpenXML

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

insert into @tempo
SELECT  TeacherName,TeacherEmail,TeacherPassword
FROM OPENXML(@hDoc, 'XML/teacherData/teacher')
WITH 
(
TeacherName [nvarchar](150) '@name',
TeacherEmail [nvarchar](150) '@email' ,
TeacherPassword [nvarchar](150) '@password'
);

USE  [BD_sistemaEscolar]

--insert into dbo.Profesor(Nombre,Email,Password)
--select * from @tempo

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

--insert into dbo.Status_Estudiante(Nombre)
--select * from @tempo

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
--insert into dbo.Status_Grupo(Nombre)
--select * from @tempo

select * from dbo.Status_Grupo

EXEC sp_xml_removedocument @hDoc
GO