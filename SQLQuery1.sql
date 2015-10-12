CREATE TABLE [dbo].[Event]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [StartDate] TEXT NOT NULL, 
    [EndDate] TEXT NOT NULL, 
    [EventDate] DATE NOT NULL
)