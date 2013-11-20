CREATE TABLE Doctor(
  clave  	     varchar(10),
  nombre 	     varchar(30),
  direccion    varchar(50),
  especialidad varchar(20),
  telefono	 varchar(10),
  PRIMARY KEY(clave)
);

CREATE TABLE Atiende(
  claveDoctor   varchar(10),
  clavePaciente varchar(10),
  fecha 	      varchar(10),
  tratamiento   varchar(50),
  diagnostico   varchar(30),
  PRIMARY KEY(claveDoctor,clavePaciente,fecha)
);

CREATE TABLE Paciente(
  clave 	  varchar(10),
  nombre 	  varchar(30),
  direccion varchar(50),
  telefono  varchar(10),
  PRIMARY KEY(clave)
);

CREATE TABLE SeRealiza(
  claveAnalisis varchar(10),
  clavePaciente varchar(10),
  fechaAplic    varchar(20),
  fechaEntrega  varchar(30),
  PRIMARY KEY(clavePaciente,claveAnalisis,fechaAplic)
);

CREATE TABLE AnalisisClinico(
  clave 		varchar(10),
  tipo  		varchar(20),
  descripcion varchar(50),
  PRIMARY KEY(clave)
);

INSERT INTO Doctor VALUES ('D01', 'Jorge Ramirez'       , 'Chichonal #76'        , 'Cardiología'      , '7221236445' );
INSERT INTO Doctor VALUES ('D02', 'Juan Gomez'          , 'Chichonal #80'        , 'Pediatría'        , '7226543562' );
INSERT INTO Doctor VALUES ('D03', 'Mario Mendez'        , 'Jesus del Monte #85'  , 'Cardiologia'      , '7223413553' );
INSERT INTO Doctor VALUES ('D04', 'Jorge Ramirez'       , 'Pico de Orizaba #76'  , 'Endocrinologia'   , '7222341643' );
INSERT INTO Doctor VALUES ('D05', 'Antonio Gonzalez'    , 'Morelos #123'         , 'Pediatria'        , '7221341543' );
INSERT INTO Doctor VALUES ('D06', 'Manuel Suarez'       , 'V. Carranza #765'     , 'Cardiología'      , '7224326798' );
INSERT INTO Doctor VALUES ('D07', 'Milton Lopez'        , 'Los Cusis #2181'	     , 'Endocrinologia'   , '7226544564' );
INSERT INTO Doctor VALUES ('D08', 'Pedro Gutierrez'     , 'Tollocan #32'  		 , 'Traumatología'    , '7228363456' );
INSERT INTO Doctor VALUES ('D09', 'Fernanda Lopez'      , 'Pensador Mexicano #85', 'Pediatria'        , '7226254453' );
INSERT INTO Doctor VALUES ('D10', 'Ana Carbajal'        , 'Reforma #123'         , 'Oncología'        , '7222244355' );
INSERT INTO Doctor VALUES ('D11', 'Ignacio Aguirre'     , 'Chichonal #76'        , 'Cardiología'      , '7226543445' );
INSERT INTO Doctor VALUES ('D12', 'Manuel Clemente'     , 'Chichonal #80'        , 'Endocrinologia'   , '7226545452' );
INSERT INTO Doctor VALUES ('D13', 'María Infante'       , 'Jesus del Monte #85'  , 'Cardiología'      , '7223413713' );
INSERT INTO Doctor VALUES ('D14', 'Francisco González'  , 'Pico de Orizaba #76'  , 'Endocrinologia'   , '7222341345' );
INSERT INTO Doctor VALUES ('D15', 'Ramón Sánchez'       , 'Morelos #123'         , 'Medicina General' , '7221341433' );
INSERT INTO Doctor VALUES ('D16', 'Raúl Grande'         , 'V. Carranza #765'     , 'Cardiología'      , '7224326438' );
INSERT INTO Doctor VALUES ('D17', 'Luis Placencia'      , 'Los Cusis #2181'	     , 'Endocrinologia'   , '7221234508' );
INSERT INTO Doctor VALUES ('D18', 'Felisa Trujillo'     , 'Tollocan #32'  		 , 'Ginecología'      , '7221234553' );
INSERT INTO Doctor VALUES ('D19', 'Julio Loret'         , 'Pensador Mexicano #85', 'Pediatria'        , '7221234568' );
INSERT INTO Doctor VALUES ('D20', 'Concepción Santiago' , 'Reforma #123'         , 'Cardiología'      , '7221234565' );
INSERT INTO Doctor VALUES ('D21', 'Yolanda Reina'       , 'Chichonal #76'        , 'Cardiología'      , '7221234596' );
INSERT INTO Doctor VALUES ('D22', 'Paula Lópexz'        , 'Chichonal #80'        , 'Endocrinologia'   , '7226543285' );
INSERT INTO Doctor VALUES ('D23', 'Sergio Villar'       , 'Jesus del Monte #85'  , 'Oncología'        , '7223413572' );
INSERT INTO Doctor VALUES ('D24', 'Teresa Gregori'      , 'Pico de Orizaba #76'  , 'Endocrinologia'   , '7222341568' );
INSERT INTO Doctor VALUES ('D25', 'José Sáez'           , 'Morelos #123'         , 'Pediatria'        , '7223413564' );
INSERT INTO Doctor VALUES ('D26', 'Natalia Osuna'       , 'V. Carranza #765'     , 'Medicina General' , '7224326678' );
INSERT INTO Doctor VALUES ('D27', 'Jesús Gutierrez'     , 'Los Cusis #2181'	     , 'Endocrinologia'   , '7223447655' );
INSERT INTO Doctor VALUES ('D28', 'Adrian Soto'         , 'Tollocan #32'  		 , 'Pediatria'        , '7224645765' );
INSERT INTO Doctor VALUES ('D29', 'Laura del Valle'     , 'Pensador Mexicano #85', 'Traumatología'    , '7224635345' );
INSERT INTO Doctor VALUES ('D30', 'Pablo Quesada'       , 'Reforma #123'         , 'Ginecología'      , '7226537675' );

INSERT INTO Paciente VALUES('P01', 'Juan Cardenas'    , 'Av. Alemana #23'     , '7226543285' );
INSERT INTO Paciente VALUES('P02', 'Roberto Rios'     , 'Calle Los Pinos #52' , '7226545423' );
INSERT INTO Paciente VALUES('P03', 'Nicolas Jimenez'  , 'Miraflores #123'     , '7229473423' );
INSERT INTO Paciente VALUES('P04', 'Ruddy Rojo'       , 'Av. V. Carranza #54' , '7224132234' );
INSERT INTO Paciente VALUES('P05', 'Samuel Medina'    , 'Real del bosque #323', '7223124234' );
INSERT INTO Paciente VALUES('P06', 'Roberto Suarez'   , 'Calle Los Cedros #65', '7224365422' );
INSERT INTO Paciente VALUES('P07', 'Jorge Ramirez'    , 'Calacoto #234'       , '7226542457' );
INSERT INTO Paciente VALUES('P08', 'Patricia Mendez'  , 'Calle Beni #22'      , '7226735322' );
INSERT INTO Paciente VALUES('P09', 'Cristina Medina'  , 'Av. Banzer #443'     , '7222036535' );
INSERT INTO Paciente VALUES('P10', 'Guido Nayar'      , 'Av. Landivar #55'    , '7223456234' );
INSERT INTO Paciente VALUES('P11', 'Martha Rodríguez' , 'Av. Alemana #23'     , '7224036512' );
INSERT INTO Paciente VALUES('P12', 'Julia Rios'       , 'Calle Los Pinos #52' , '7222452342' );
INSERT INTO Paciente VALUES('P13', 'Maria Ballesteros', 'Miraflores #123'     , '7222034234' );
INSERT INTO Paciente VALUES('P14', 'Roberto Gomez'    , 'Av. V. Carranza #54' , '7227652342' );
INSERT INTO Paciente VALUES('P15', 'Samuel Medina'    , 'Real del bosque #323', '7229182342' );
INSERT INTO Paciente VALUES('P16', 'Marcelo Robles'   , 'Calle Los Cedros #65', '7222046542' );
INSERT INTO Paciente VALUES('P17', 'Laura Cardenas'   , 'Calacoto #234'       , '7221042457' );
INSERT INTO Paciente VALUES('P18', 'Alejandro Arias'  , 'Calle Beni #22'      , '7228487532' );
INSERT INTO Paciente VALUES('P19', 'Horacio Perez'    , 'Av. Banzer #443'     , '7221032356' );
INSERT INTO Paciente VALUES('P20', 'Alejandro Justiniano', 'Av. Landivar #55' , '7221038234' );
INSERT INTO Paciente VALUES('P21', 'Ernesto Coimbra'  , 'Av. Alemana #23'     , '7221352624' );
INSERT INTO Paciente VALUES('P22', 'Miguel Angeles'   , 'Calle Los Pinos #52' , '7227217323' );
INSERT INTO Paciente VALUES('P23', 'Nicolas Jimenez'  , 'Miraflores #123'     , '7221852334' );
INSERT INTO Paciente VALUES('P24', 'Ramiro Plaza'     , 'Av. V. Carranza #54' , '7227323234' );
INSERT INTO Paciente VALUES('P25', 'Andrea Ramos'     , 'Real del bosque #323', '7221250312' );
INSERT INTO Paciente VALUES('P26', 'Carolina Herrera' , 'Calle Los Cedros #65', '7225461234' );
INSERT INTO Paciente VALUES('P27', 'Martha Herrera'   , 'Calacoto #234'       , '7228464578' );
INSERT INTO Paciente VALUES('P28', 'Alejandro Arias'  , 'Calle Beni #22'      , '7222436522' );
INSERT INTO Paciente VALUES('P29', 'Adriana Perez'    , 'Av. Banzer #443'     , '7222534287' );
INSERT INTO Paciente VALUES('P30', 'Petrona Dorado'    , 'Av. Landivar #55'   , '7225342334' );

INSERT INTO AnalisisClinico VALUES('A01', 'Sangre'			       , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A02', 'Colesterol'		     , 'Análisis de colesterol del paciente'			);
INSERT INTO AnalisisClinico VALUES('A03', 'Electrocardiograma' , 'El paciente se somete a un electrocardiograma');
INSERT INTO AnalisisClinico VALUES('A04', 'Consulta General'   , 'Consulta anual del paciente'										);
INSERT INTO AnalisisClinico VALUES('A05', 'Rayos X'		         , 'Pruebas para doctor externo'					);
INSERT INTO AnalisisClinico VALUES('A06', 'Antidoping'  	     , 'Análisis de uso de drogas'					);
INSERT INTO AnalisisClinico VALUES('A07', 'Sangre'			       , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A08', 'Colesterol'         , 'Chequeo de niveles altos decolesterol alto'   );
INSERT INTO AnalisisClinico VALUES('A09', 'Electrocardiograma' , 'Segundo electrocardiograma del paciente'      );
INSERT INTO AnalisisClinico VALUES('A10', 'Consulta General'   , 'Dolores seguidos del paciente'				);
INSERT INTO AnalisisClinico VALUES('A11', 'Rayos X'		         , 'Toma de Rayos X de columna'					);
INSERT INTO AnalisisClinico VALUES('A12', 'Antidoping'         , 'Análisis estándar de uso de drogas'           );
INSERT INTO AnalisisClinico VALUES('A13', 'Radiografía'	       , 'Radiografía para doctor externo'				);
INSERT INTO AnalisisClinico VALUES('A14', 'Colesterol'		     , 'Analisis de niveles decolesterol'				);
INSERT INTO AnalisisClinico VALUES('A15', 'Electrocardiograma' , 'Electrocardiograma para análisis de cáncer'	);
INSERT INTO AnalisisClinico VALUES('A16', 'Consulta General'   , 'Paciente sufre de espasmos'					);
INSERT INTO AnalisisClinico VALUES('A17', 'Rayos X'            , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A18', 'Angiograma'         , 'El paciente se somete a un angiograma'        );
INSERT INTO AnalisisClinico VALUES('A19', 'Sangre'			       , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A20', 'Colesterol'		     , 'Niveles muy bajos en paciente.'			    );
INSERT INTO AnalisisClinico VALUES('A21', 'Electrocardiograma' , 'El paciente se somete a un electrocardiograma');
INSERT INTO AnalisisClinico VALUES('A22', 'Radiografia'	       , 'Dolores en huesos del paciente'				);
INSERT INTO AnalisisClinico VALUES('A23', 'Colesterol'		     , 'Análisis de colesterol'						);
INSERT INTO AnalisisClinico VALUES('A24', 'Radiografia'  	     , 'Radiografía de columna vertebral'		     	);
INSERT INTO AnalisisClinico VALUES('A25', 'Embarazo'           , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A26', 'Sangre'			       , 'Toma de muestra de sangre'					);
INSERT INTO AnalisisClinico VALUES('A27', 'Electrocardiograma' , 'El paciente se somete a un electrocardiograma');
INSERT INTO AnalisisClinico VALUES('A28', 'Colesterol'         , 'Analisis de niveles de colesterol alto'       );
INSERT INTO AnalisisClinico VALUES('A29', 'Radiografia'        , 'Huesos rotos'                                 );
INSERT INTO AnalisisClinico VALUES('A30', 'Rayos X'            , 'Toma genérica de Rayos X'                     );

INSERT INTO Atiende VALUES('D01', 'P01', '01/03/2011', 'Chequeo de rutina', 'Resfriado'        );
INSERT INTO Atiende VALUES('D01', 'P02', '02/10/2012', 'Fisioterapia'     , 'Infección'        );
INSERT INTO Atiende VALUES('D01', 'P03', '11/10/2003', 'Chequeo de rutina', 'Leucemia'         );
INSERT INTO Atiende VALUES('D02', 'P04', '12/12/2011', 'Fisioterapia'     , 'VIH+'             );
INSERT INTO Atiende VALUES('D02', 'P05', '30/05/2012', 'Visita rutinaria' , 'Influenza'        );
INSERT INTO Atiende VALUES('D02', 'P06', '12/08/2003', 'Visita rutinaria' , 'Malaria'          );
INSERT INTO Atiende VALUES('D03', 'P07', '10/01/2014', 'Fisioterapia'     , 'Dengue'           );
INSERT INTO Atiende VALUES('D03', 'P08', '20/02/2013', 'Chequeo de rutina', 'Fiebre'           );
INSERT INTO Atiende VALUES('D03', 'P09', '17/01/2013', 'Visita rutinaria' , 'Resfriado'        );
INSERT INTO Atiende VALUES('D04', 'P10', '15/11/2012', 'Fisioterapia'     , 'Cáncer pulmonar'  );
INSERT INTO Atiende VALUES('D04', 'P11', '17/11/2012', 'Fisioterapia'     , 'Infección'        );
INSERT INTO Atiende VALUES('D04', 'P12', '15/09/2010', 'Visita rutinaria' , 'Hérpes'           );
INSERT INTO Atiende VALUES('D05', 'P13', '21/09/2009', 'Chequeo de rutina', 'Fractura Pélvica' );
INSERT INTO Atiende VALUES('D05', 'P14', '11/11/2011', 'Chequeo de rutina', 'Resfrio'          );
INSERT INTO Atiende VALUES('D05', 'P15', '14/11/2010', 'Visita rutinaria' , 'Infección'        );
INSERT INTO Atiende VALUES('D06', 'P16', '11/10/2012', 'Chequeo de rutina', 'Infeccion'        );
INSERT INTO Atiende VALUES('D06', 'P17', '14/02/2011', 'Visita rutinaria' , 'Resfriado'        );
INSERT INTO Atiende VALUES('D06', 'P18', '17/01/2013', 'Visita rutinaria' , 'Infección'        );
INSERT INTO Atiende VALUES('D07', 'P19', '23/03/2010', 'Visita rutinaria' , 'Leucemia'         );
INSERT INTO Atiende VALUES('D07', 'P20', '21/09/2009', 'Chequeo de rutina', 'VIH+'             );
INSERT INTO Atiende VALUES('D07', 'P21', '15/10/2012', 'Fisioterapia'     , 'Influenza'        );
INSERT INTO Atiende VALUES('D08', 'P22', '10/10/2010', 'Visita rutinaria' , 'Malaria'          );
INSERT INTO Atiende VALUES('D08', 'P23', '10/10/2010', 'Chequeo de rutina', 'Dengue'           );
INSERT INTO Atiende VALUES('D08', 'P24', '11/11/2011', 'Visita rutinaria' , 'Fiebre'           );
INSERT INTO Atiende VALUES('D09', 'P25', '19/05/2009', 'Fisioterapia'     , 'Resfriado'        );
INSERT INTO Atiende VALUES('D09', 'P26', '16/04/2012', 'Visita rutinaria' , 'Cáncer pulmonar'  );
INSERT INTO Atiende VALUES('D09', 'P27', '21/12/2012', 'Fisioterapia'	  , 'Neurosífilis'     );
INSERT INTO Atiende VALUES('D10', 'P28', '15/10/2009', 'Vitita rutinaria' , 'Hérpes'           );
INSERT INTO Atiende VALUES('D10', 'P29', '12/03/2013', 'Visita rutinaria' , 'Fractura Pélvica' );
INSERT INTO Atiende VALUES('D10', 'P30', '12/03/2013', 'Chequeo de rutina', 'Fiebre'           );
INSERT INTO Atiende VALUES('D11', 'P01', '01/03/2010', 'Chequeo de rutina', 'Dolor de Cabeza'  );
INSERT INTO Atiende VALUES('D11', 'P02', '02/10/2012', 'Fisioterapia'     , 'Cáncer'           );
INSERT INTO Atiende VALUES('D11', 'P03', '11/10/2009', 'Chequeo de rutina', 'Fractura'         );
INSERT INTO Atiende VALUES('D12', 'P01', '12/12/2012', 'Fisioterapia'     , 'Dengue'           );
INSERT INTO Atiende VALUES('D12', 'P02', '30/05/2011', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D12', 'P03', '12/08/2008', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D13', 'P01', '10/01/2013', 'Fisioterapia'     , 'Fractura'    );
INSERT INTO Atiende VALUES('D13', 'P02', '20/02/2013', 'Chequeo de rutina', 'Malaria'     );
INSERT INTO Atiende VALUES('D13', 'P03', '17/01/2013', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D14', 'P04', '15/11/2012', 'Fisioterapia'     , 'Resfrio'     );
INSERT INTO Atiende VALUES('D14', 'P05', '17/11/2012', 'Fisioterapia'     , 'Lepra'       );
INSERT INTO Atiende VALUES('D14', 'P06', '15/09/2010', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D15', 'P04', '21/09/2009', 'Chequeo de rutina', 'Resfrio'     );
INSERT INTO Atiende VALUES('D15', 'P05', '11/11/2011', 'Chequeo de rutina', 'Resfrio'  	  );
INSERT INTO Atiende VALUES('D15', 'P06', '14/11/2010', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D16', 'P04', '11/10/2012', 'Chequeo de rutina', 'Infeccion'   );
INSERT INTO Atiende VALUES('D16', 'P05', '14/02/2011', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D16', 'P06', '17/01/2013', 'Visita rutinaria' , 'Mal de Ojo'  );
INSERT INTO Atiende VALUES('D17', 'P23', '23/03/2010', 'Visita rutinaria' , 'Resfrio'     );
INSERT INTO Atiende VALUES('D17', 'P30', '21/09/2009', 'Chequeo de rutina', 'Inflamacion' );
INSERT INTO Atiende VALUES('D17', 'P30', '15/10/2012', 'Fisioterapia'     , 'Fractura'    );
INSERT INTO Atiende VALUES('D18', 'P21', '10/10/2010', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D18', 'P12', '10/10/2010', 'Chequeo de rutina', 'Inflamacion' );
INSERT INTO Atiende VALUES('D18', 'P23', '11/11/2011', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D19', 'P24', '19/05/2009', 'Fisioterapia'     , 'Infeccion'   );
INSERT INTO Atiende VALUES('D19', 'P15', '16/04/2012', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D19', 'P16', '21/12/2012', 'Fisioterapia'	  , 'Resfrio'     );
INSERT INTO Atiende VALUES('D20', 'P17', '15/10/2009', 'Visita rutinaria' , 'Polio'       );
INSERT INTO Atiende VALUES('D20', 'P18', '12/03/2013', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D20', 'P19', '12/03/2013', 'Chequeo de rutina', 'Fractura'    );
INSERT INTO Atiende VALUES('D21', 'P10', '01/03/2010', 'Chequeo de rutina', 'Resfrio'     );
INSERT INTO Atiende VALUES('D21', 'P21', '02/10/2012', 'Fisioterapia'     , 'Infeccion'   );
INSERT INTO Atiende VALUES('D21', 'P30', '11/10/2009', 'Chequeo de rutina', 'Fractura'    );
INSERT INTO Atiende VALUES('D22', 'P22', '12/12/2012', 'Fisioterapia'     , 'Resfrio'     );
INSERT INTO Atiende VALUES('D22', 'P13', '30/05/2011', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D22', 'P24', '12/08/2008', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D23', 'P25', '10/01/2013', 'Fisioterapia'     , 'Fractura'    );
INSERT INTO Atiende VALUES('D23', 'P06', '20/02/2013', 'Chequeo de rutina', 'Resfrio'     );
INSERT INTO Atiende VALUES('D23', 'P07', '17/01/2013', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D24', 'P08', '15/11/2012', 'Fisioterapia'     , 'Resfrio'     );
INSERT INTO Atiende VALUES('D24', 'P19', '17/11/2012', 'Fisioterapia'     , 'Resfrio'     );
INSERT INTO Atiende VALUES('D24', 'P10', '15/09/2010', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D25', 'P01', '21/09/2009', 'Chequeo de rutina', 'Resfrio'     );
INSERT INTO Atiende VALUES('D25', 'P22', '11/11/2011', 'Chequeo de rutina', 'Resfrio'  	  );
INSERT INTO Atiende VALUES('D25', 'P23', '14/11/2010', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D26', 'P14', '11/10/2012', 'Chequeo de rutina', 'Infeccion'   );
INSERT INTO Atiende VALUES('D26', 'P25', '14/02/2011', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D26', 'P16', '17/01/2013', 'Visita rutinaria' , 'Fractura'    );
INSERT INTO Atiende VALUES('D27', 'P27', '23/03/2010', 'Visita rutinaria' , 'Resfrio'     );
INSERT INTO Atiende VALUES('D27', 'P08', '21/09/2009', 'Chequeo de rutina', 'Inflamacion' );
INSERT INTO Atiende VALUES('D27', 'P09', '15/10/2012', 'Fisioterapia'     , 'Fractura'    );
INSERT INTO Atiende VALUES('D28', 'P07', '10/10/2010', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D28', 'P01', '10/10/2010', 'Chequeo de rutina', 'VIH+'        );
INSERT INTO Atiende VALUES('D28', 'P02', '11/11/2011', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D29', 'P03', '19/05/2009', 'Fisioterapia'     , 'Infeccion'   );
INSERT INTO Atiende VALUES('D29', 'P24', '16/04/2012', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D29', 'P05', '21/12/2012', 'Fisioterapia'	  , 'Resfrio'     );
INSERT INTO Atiende VALUES('D30', 'P26', '15/10/2009', 'Visita rutinaria' , 'Inflamacion' );
INSERT INTO Atiende VALUES('D30', 'P27', '12/03/2013', 'Visita rutinaria' , 'Infeccion'   );
INSERT INTO Atiende VALUES('D30', 'P28', '12/03/2013', 'Chequeo de rutina', 'Fractura'    );

INSERT INTO SeRealiza VALUES ('A07','P19','08/07/2010','15/07/2010');
INSERT INTO SeRealiza VALUES ('A20','P22','05/07/2010','21/07/2010');
INSERT INTO SeRealiza VALUES ('A17','P04','08/07/2010','20/07/2010');
INSERT INTO SeRealiza VALUES ('A17','P08','08/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A11','P23','14/07/2010','18/07/2010');
INSERT INTO SeRealiza VALUES ('A28','P20','05/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A02','P11','14/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A17','P05','06/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A27','P30','11/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A28','P17','07/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A20','P23','14/07/2010','18/07/2010');
INSERT INTO SeRealiza VALUES ('A29','P09','14/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A25','P06','13/07/2010','16/07/2010');
INSERT INTO SeRealiza VALUES ('A18','P03','12/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A30','P20','07/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A06','P25','05/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A30','P11','06/07/2010','15/07/2010');
INSERT INTO SeRealiza VALUES ('A24','P24','08/07/2010','19/07/2010');
INSERT INTO SeRealiza VALUES ('A26','P28','12/07/2010','20/07/2010');
INSERT INTO SeRealiza VALUES ('A09','P07','10/07/2010','21/07/2010');
INSERT INTO SeRealiza VALUES ('A08','P08','11/07/2010','20/07/2010');
INSERT INTO SeRealiza VALUES ('A11','P28','09/07/2010','16/07/2010');
INSERT INTO SeRealiza VALUES ('A06','P05','10/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A03','P08','10/07/2010','18/07/2010');
INSERT INTO SeRealiza VALUES ('A15','P08','12/07/2010','20/07/2010');
INSERT INTO SeRealiza VALUES ('A06','P04','11/07/2010','16/07/2010');
INSERT INTO SeRealiza VALUES ('A03','P27','06/07/2010','20/07/2010');
INSERT INTO SeRealiza VALUES ('A14','P20','06/07/2010','15/07/2010');
INSERT INTO SeRealiza VALUES ('A03','P07','06/07/2010','17/07/2010');
INSERT INTO SeRealiza VALUES ('A16','P24','04/07/2010','21/07/2010');
INSERT INTO SeRealiza VALUES ('A16','P18','11/09/2012','04/11/2012');
INSERT INTO SeRealiza VALUES ('A29','P29','22/09/2012','05/11/2012');
INSERT INTO SeRealiza VALUES ('A09','P14','19/09/2012','23/10/2012');
INSERT INTO SeRealiza VALUES ('A25','P18','23/09/2012','25/10/2012');
INSERT INTO SeRealiza VALUES ('A17','P06','04/10/2012','06/11/2012');
INSERT INTO SeRealiza VALUES ('A23','P08','29/09/2012','13/11/2012');
INSERT INTO SeRealiza VALUES ('A27','P13','15/09/2012','09/11/2012');
INSERT INTO SeRealiza VALUES ('A14','P03','30/09/2012','28/10/2012');
INSERT INTO SeRealiza VALUES ('A26','P18','07/10/2012','12/11/2012');
INSERT INTO SeRealiza VALUES ('A01','P02','27/09/2012','13/11/2012');
INSERT INTO SeRealiza VALUES ('A30','P27','25/09/2012','26/10/2012');
INSERT INTO SeRealiza VALUES ('A03','P15','16/09/2012','02/11/2012');
INSERT INTO SeRealiza VALUES ('A28','P17','11/10/2012','29/10/2012');
INSERT INTO SeRealiza VALUES ('A08','P06','09/10/2012','28/10/2012');
INSERT INTO SeRealiza VALUES ('A21','P25','16/09/2012','16/10/2012');
INSERT INTO SeRealiza VALUES ('A02','P10','21/09/2012','05/11/2012');
INSERT INTO SeRealiza VALUES ('A05','P13','02/10/2012','20/10/2012');
INSERT INTO SeRealiza VALUES ('A24','P14','14/10/2012','11/11/2012');
INSERT INTO SeRealiza VALUES ('A25','P28','26/09/2012','12/11/2012');
INSERT INTO SeRealiza VALUES ('A14','P25','27/09/2012','17/10/2012');
INSERT INTO SeRealiza VALUES ('A06','P12','20/09/2012','09/11/2012');
INSERT INTO SeRealiza VALUES ('A23','P01','05/10/2012','29/10/2012');
INSERT INTO SeRealiza VALUES ('A29','P12','11/09/2012','03/11/2012');
INSERT INTO SeRealiza VALUES ('A01','P27','02/10/2012','23/10/2012');
INSERT INTO SeRealiza VALUES ('A03','P28','11/09/2012','20/10/2012');
INSERT INTO SeRealiza VALUES ('A30','P19','22/09/2012','03/11/2012');
INSERT INTO SeRealiza VALUES ('A18','P10','22/09/2012','26/10/2012');
INSERT INTO SeRealiza VALUES ('A11','P29','20/09/2012','02/11/2012');
INSERT INTO SeRealiza VALUES ('A20','P17','24/09/2012','03/11/2012');
INSERT INTO SeRealiza VALUES ('A02','P26','02/10/2012','19/10/2012');
INSERT INTO SeRealiza VALUES ('A20','P05','08/01/2013','14/08/2013');
INSERT INTO SeRealiza VALUES ('A22','P11','23/04/2013','03/10/2013');
INSERT INTO SeRealiza VALUES ('A17','P12','09/09/2012','18/08/2013');
INSERT INTO SeRealiza VALUES ('A10','P26','21/05/2013','18/06/2013');
INSERT INTO SeRealiza VALUES ('A05','P06','27/12/2012','16/09/2013');
INSERT INTO SeRealiza VALUES ('A09','P04','16/02/2013','24/06/2013');
INSERT INTO SeRealiza VALUES ('A03','P30','08/04/2013','28/07/2013');
INSERT INTO SeRealiza VALUES ('A18','P24','01/09/2012','27/06/2013');
INSERT INTO SeRealiza VALUES ('A06','P08','12/02/2013','28/08/2013');
INSERT INTO SeRealiza VALUES ('A27','P21','23/01/2013','19/06/2013');
INSERT INTO SeRealiza VALUES ('A09','P01','29/12/2012','19/08/2013');
INSERT INTO SeRealiza VALUES ('A16','P26','23/03/2013','27/09/2013');
INSERT INTO SeRealiza VALUES ('A25','P05','18/08/2012','10/07/2013');
INSERT INTO SeRealiza VALUES ('A22','P19','25/01/2013','12/09/2013');
INSERT INTO SeRealiza VALUES ('A21','P28','07/04/2013','09/07/2013');
INSERT INTO SeRealiza VALUES ('A12','P21','31/10/2012','17/08/2013');
INSERT INTO SeRealiza VALUES ('A21','P19','09/03/2013','29/06/2013');
INSERT INTO SeRealiza VALUES ('A13','P20','08/11/2012','07/07/2013');
INSERT INTO SeRealiza VALUES ('A24','P18','07/10/2012','10/08/2013');
INSERT INTO SeRealiza VALUES ('A11','P05','30/01/2013','04/08/2013');
INSERT INTO SeRealiza VALUES ('A14','P17','27/04/2013','12/07/2013');
INSERT INTO SeRealiza VALUES ('A03','P09','19/07/2012','18/09/2013');
INSERT INTO SeRealiza VALUES ('A10','P27','25/12/2012','16/07/2013');
INSERT INTO SeRealiza VALUES ('A11','P16','13/10/2012','30/09/2013');
INSERT INTO SeRealiza VALUES ('A16','P06','20/07/2012','19/07/2013');
INSERT INTO SeRealiza VALUES ('A29','P12','07/12/2012','29/07/2013');
INSERT INTO SeRealiza VALUES ('A09','P12','01/06/2013','21/07/2013');
INSERT INTO SeRealiza VALUES ('A01','P01','23/04/2013','10/06/2013');
INSERT INTO SeRealiza VALUES ('A08','P27','13/02/2013','21/09/2013');
INSERT INTO SeRealiza VALUES ('A12','P09','09/08/2012','19/08/2013');


ALTER TABLE Atiende   ADD FOREIGN KEY(clavePaciente) REFERENCES Paciente(clave);
ALTER TABLE Atiende   ADD FOREIGN KEY(claveDoctor)   REFERENCES Doctor(clave);
ALTER TABLE SeRealiza ADD FOREIGN KEY(clavePaciente) REFERENCES Paciente(clave);
ALTER TABLE SeRealiza ADD FOREIGN KEY(claveAnalisis) REFERENCES AnalisisClinico(clave);