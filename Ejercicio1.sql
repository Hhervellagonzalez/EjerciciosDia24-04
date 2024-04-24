
CREATE TABLE CLIENTE (
    DNI SERIAL PRIMARY KEY, 
    Nombre VARCHAR(30),       
    Direccion VARCHAR(30) 
);

CREATE TABLE ASUNTO (
    N_Expediente SERIAL PRIMARY KEY,
    Inicio DATE,
    Fin DATE,
    Estado_Actual VARCHAR(50),      
    DNI_Cliente SERIAL REFERENCES CLIENTE(DNI)
);

CREATE TABLE PROCURADOR (
    DNI_Procurador SERIAL PRIMARY KEY,
    Nombre VARCHAR(30),
    Direccion VARCHAR(30)
);

CREATE TABLE ASUNTO_PROCURADOR (
    N_Expediente SERIAL REFERENCES asunto(N_Expediente),
    DNI_Procurador SERIAL REFERENCES procurador(DNI_Procurador),
    CONSTRAINT PK_AsuntoProcurador PRIMARY KEY (N_Expediente, DNI_Procurador),
    FOREIGN KEY (N_Expediente) REFERENCES asunto(N_Expediente),
	FOREIGN KEY (DNI_Procurador) REFERENCES procurador(DNI_Procurador)
);
