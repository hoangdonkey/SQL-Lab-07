USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Aptech')
	DROP DATABASE Aptech
GO

CREATE DATABASE Aptech
GO

USE Aptech
GO

CREATE TABLE Classes (
	ClassName varchar(6),
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
)
GO

CREATE UNIQUE CLUSTERED INDEX IX_MyClusterredIndex ON Classes(ClassName)
WITH (Pad_index = on,FillFactor=70,Ignore_dup_key=on)
GO

CREATE NONCLUSTERED INDEX IX_TeacherIndex ON Classes(Teacher)
GO

DROP INDEX IX_TeacherIndex ON Classes
GO

CREATE INDEX IX_ClassLabIndex ON Classes(Class,Lab)
GO

SELECT * FROM sys.indexes
GO
