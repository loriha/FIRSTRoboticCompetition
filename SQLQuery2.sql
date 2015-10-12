CREATE TABLE [dbo].[Event]
(
	[Id] INT NOT NULL PRIMARY KEY  IDENTITY, 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [StartTime] TEXT NOT NULL, 
    [EndTime] TEXT NOT NULL, 
    [EventDate] DATE NOT NULL
)