CREATE TABLE Doctor(
  clave  	     text,
  nombre 	     text,
  direccion    text,
  especialidad text ,
  telefono	 text ,
  PRIMARY KEY(clave)
);

CREATE TABLE Atiende(
  claveDoctor   text ,
  clavePaciente text ,
  fecha 	      text ,
  tratamiento   text ,
  diagnostico   text ,
  PRIMARY KEY(claveDoctor,clavePaciente,fecha)
);

CREATE TABLE Paciente(
  clave 	  text ,
  nombre 	  text ,
  direccion text ,
  telefono  text ,
  PRIMARY KEY(clave)
);

CREATE TABLE SeRealiza(
  claveAnalisis text ,
  clavePaciente text ,
  fechaAplic    text ,
  fechaEntrega  text ,
  PRIMARY KEY(clavePaciente,claveAnalisis,fechaAplic)
);

CREATE TABLE AnalisisClinico(
  clave 		text ,
  tipo  		text ,
  descripcion text ,
  PRIMARY KEY(clave)
);