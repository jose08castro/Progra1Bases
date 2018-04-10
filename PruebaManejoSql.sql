CREATE DATABASE OPENXMLTesting
GO


USE OPENXMLTesting
GO


CREATE TABLE XMLwithOpenXML
(
Id INT IDENTITY PRIMARY KEY,
XMLData XML,
LoadedDateTime DATETIME
)


INSERT INTO XMLwithOpenXML(XMLData, LoadedDateTime)
SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Users\juanj\source\repos\Progra1Bases\randomData_utf8.xml', SINGLE_BLOB) AS x;


USE OPENXMLTesting
GO

Select * from XMLwithOpenXML


USE OPENXMLTesting
GO


DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)


SELECT @XML = XMLData FROM XMLwithOpenXML


EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML


SELECT StudentID, StudentName
FROM OPENXML(@hDoc, 'XML/studentData/student')
WITH 
(
StudentID [int] '@ID',
StudentName [varchar](100) '@name'
)


EXEC sp_xml_removedocument @hDoc
GO