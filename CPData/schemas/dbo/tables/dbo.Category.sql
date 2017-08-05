CREATE TABLE [dbo].[Category]
(
	[CategoryId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CategoryName] NVARCHAR(50) NULL
)

GO

CREATE UNIQUE INDEX [IX_Category_Column] ON [dbo].[Category] ([CategoryName])
