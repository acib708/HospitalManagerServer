struct Doctor{
	1: string clave,
	2: string nombre, 
	3: string direccion,
	4: string especialidad,
	5: string telefono,
	6: string foto
}

service DBManager {
    //Doctores
    bool capturarDoctor(1: Doctor doctor)
}