CREATE TABLE Zoos (
    id_zoo SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    ciudad VARCHAR(255),
    pais VARCHAR(255),
    tamaño FLOAT,
    presupuesto_anual MONEY
);
CREATE TABLE especies (
	id_especie SERIAL PRIMARY KEY,
	n_cientifico VARCHAR(100),
	n_vulgar VARCHAR(100),
	peligro_extincion BOOLEAN,
	familia VARCHAR (100)
);
CREATE TABLE Animales (
    id_animal SERIAL PRIMARY KEY,
    sexo CHAR(10),
    fecha_nacimiento DATE,
    pais_origen VARCHAR(50),
    id_zoo INT REFERENCES Zoos(id_zoo),
    id_especie INT REFERENCES Especies(id_especie)
);