CREATE TABLE [dbo].[ProductMaster]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [ProductCode] NVARCHAR(50) NULL, 
    [ProductDescription] NVARCHAR(MAX) NULL, 
    [CategoryID] INT NULL, 
    [RecomPrice] NUMERIC(18, 2) NULL, 
    CONSTRAINT [FK_ProductMaster_ToTable] FOREIGN KEY (CategoryID) REFERENCES [dbo].[Category](CategoryID)
)

GO

CREATE UNIQUE INDEX [IX_ProductMaster_Column] ON [dbo].[ProductMaster] ([ProductCode])
