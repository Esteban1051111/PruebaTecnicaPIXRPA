CREATE TABLE Productos (
    id INT PRIMARY KEY,
    title NVARCHAR(500),
    price DECIMAL(18,2),
    category NVARCHAR(100),
    description NVARCHAR(MAX),
    fecha_insercion DATETIME2 DEFAULT SYSDATETIME()
);




CREATE TABLE LogsArchivos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RutaArchivoLocal NVARCHAR(500) NOT NULL,
    RutaArchivoNube NVARCHAR(500) NOT NULL,
    Detalle nvarchar(200) not null,
    FechaInsercion DATETIME DEFAULT GETDATE()

);



USE [Prueba_tecnica]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_InsertarProductosDesdeJson]
    @cadena NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Productos (id, title, price, category, description, fecha_insercion)
    SELECT 
        p.id,
        p.title,
        p.price,
        p.category,
        p.description,
        SYSDATETIME()
    FROM OPENJSON(@cadena)
    WITH (
        id INT '$.id',
        title NVARCHAR(500) '$.title',
        price DECIMAL(18,2) '$.price',
        category NVARCHAR(100) '$.category',
        description NVARCHAR(MAX) '$.description'
    ) AS p
    WHERE NOT EXISTS (
        SELECT 1 FROM Productos WHERE Productos.id = p.id
    );
END;
GO





USE [Prueba_tecnica]
GO
/****** Object:  StoredProcedure [dbo].[InsertarLogArchivo]    Script Date: 4/09/2025 1:17:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertarLogArchivo]
    @RutaArchivoLocal NVARCHAR(500),
    @RutaArchivoNube NVARCHAR(500),
    @Detalle nvarchar(200)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LogsArchivos (RutaArchivoLocal, RutaArchivoNube,Detalle,FechaInsercion)
    VALUES (@RutaArchivoLocal, @RutaArchivoNube, @Detalle,GETDATE());
END

