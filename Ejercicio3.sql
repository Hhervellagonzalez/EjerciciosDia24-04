CREATE TABLE socio (
    n_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100)
);
CREATE TABLE barco (
    matricula VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    n_socio_fk INT REFERENCES socio(n_socio),
    cuota INT,
    n_amarre INT
);
CREATE TABLE patron (
    dni SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100)
);
CREATE TABLE salida (
    fecha_sal DATE,
    hora_sal TIME,
    n_socio_fk INT,
    dni_patron INT REFERENCES patron(dni),
    destino VARCHAR(255),
    CONSTRAINT pk_salida PRIMARY KEY (fecha_sal, hora_sal, n_socio_fk),
    FOREIGN KEY (n_socio_fk) REFERENCES socio(n_socio)
);