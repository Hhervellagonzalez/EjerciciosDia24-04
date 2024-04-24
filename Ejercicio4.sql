
CREATE TABLE Provincias (
    IdProvincia SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    extension DECIMAL
);
CREATE TABLE Colecciones(
	idColeccion SERIAL PRIMARY KEY,
	volumen INT
);

CREATE TABLE Poblaciones (
    IdPoblacion SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
	IdProvincia INT,
     FOREIGN KEY (IdProvincia) REFERENCES Provincias(IdProvincia)
);

CREATE TABLE Almacenes (
    IdAlmacen SERIAL PRIMARY KEY,
    direccion VARCHAR(255),
    apertura DATE,
	IdProvincia INT,
     FOREIGN KEY (IdProvincia) REFERENCES Provincias(IdProvincia)
);


CREATE TABLE Libros (
    ISBN varchar(13) PRIMARY KEY,
	Editorial varchar(30),
	Autor varchar(30),
	Titulo varchar(30),
	IdColeccion INT,
    Stock INT,
    FOREIGN KEY (IdColeccion) REFERENCES Colecciones(IdColeccion)
    
);


CREATE TABLE Socios (
    IdSocio SERIAL PRIMARY KEY,
    dni VARCHAR(9),
    Nombre VARCHAR(50),
    apellidos VARCHAR(50),
    telefono VARCHAR(10),
	IdPoblacion INT,
    FOREIGN KEY (socioAvalador) REFERENCES socio(IdSocio),
    FOREIGN KEY (IdPoblacion) REFERENCES Poblaciones(IdPoblacion)
);

CREATE TABLE Pedidos (
    IdPedido SERIAL PRIMARY KEY,
	IdSocio INT,
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio),
    forma_envio VARCHAR(50),
    forma_pago VARCHAR(50)
);

CREATE TABLE Detalle_de_Pedidos (
    IdPedido INT,
    ISBN VARCHAR(13),
    Cantidad INT,
    CONSTRAINT PK_pedido_ISBN PRIMARY KEY (IdPedido, ISBN),
    FOREIGN KEY (IdPedido) REFERENCES Pedidos(IdPedido),
    FOREIGN KEY (ISBN) REFERENCES Libros(ISBN)
);

CREATE TABLE Almacen_Libros (
    IdAlmacen INT,
    ISBN VARCHAR(13),
    Cantidad INT,
    CONSTRAINT PK_almacen_ISBN PRIMARY KEY (IdAlmacen, ISBN),
    FOREIGN KEY (IdAlmacen) REFERENCES Almacenes(IdAlmacen),
    FOREIGN KEY (ISBN) REFERENCES Libros(ISBN)
);
