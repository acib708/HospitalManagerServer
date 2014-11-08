require_relative './pgdb'

class TransactionManager

  def initialize
    @db = PGDB.instance # Sigleton Pattern
  end

  #Actualizar
  def actualizarAnalisis(analisis) #Returns boolean indicating success or failure
    @db.actualizarAnalisis(analisis)
  end

  def actualizarDoctor(doctor) #Returns boolean indicating success of failure
    @db.actualizarDoctor(doctor)
  end

  def actualizarPaciente(paciente)
    @db.actualizarPaciente(paciente)
  end

#Borrar
  def borrarAnalisis(clave) #Returns a boolean indicating success or failure
    @db.borrarAnalisis(clave)
  end

  def borrarDoctor(clave) #Returns a boolean indicating success or failure
    @db.borrarDoctor(clave)
  end

  def borrarPaciente(clave) #Returns a boolean indicating success or failure
    @db.borrarPaciente(clave)
  end

#Capturar
  def capturarAnalisis(analisis) #Returns a boolean indicating success or failure
    @db.capturarAnalisis(analisis)
  end

  def capturarAtiende(atiende) #Returns a boolean indicating success or failure
    @db.capturarAtiende(atiende)
  end

  def capturarDoctor(doctor) #Returns a boolean indicating success or failure
    @db.capturarDoctor(doctor)
  end

  def capturarPaciente(paciente) #Returns a boolean indicating success or failure
    @db.capturarPaciente(paciente)
  end

  def capturarSeRealiza(seRealiza) #Returns a boolean indicating success or failure
    @db.capturarSeRealiza(seRealiza)
  end

#Consultas Generales
  def consultarAnalisis #Returns AnalisisClinico array
    @db.consultarAnalisis
  end

  def consultarDoctores #Returns Doctor array
    @db.consultarDoctores
  end

  def consultarAtiende #Returns Atiende array
    @db.consultarAtiende
  end

  def consultarPacientes #Returns Paciente array
    @db.consultarPacientes
  end

  def consultarSeRealiza #Returns SeRealiza array
    @db.consultarSeRealiza
  end

#Consultas por clave

  def consultarAnalisisClave(clave) #Returns an AnalisisClinico object or nil if it fails
    @db.consultarAnalisisClave(clave)
  end

  def consultarDoctorClave(clave) #Returns an Doctor object or nil if it fails
    @db.consultarDoctorClave(clave)
  end

  def consultarPacienteClave(clave) #Returns an Paciente object or nil if it fails
    @db.consultarPacienteClave(clave)
  end

#Consultas por tipo/especialidad
  def consultarAnalisisTipo(tipo) #Returns an array of AnalisisClinico objects, on failure returns nil
    @db.consultarAnalisisTipo(tipo)
  end

#Consultas por tipo/especialidad
  def consultarDoctoresEspecialidad(especialidad) #Returns an array of Doctor objects, on failure returns nil
    @db.consultarDoctoresEspecialidad(especialidad)
  end

#Reportes
  def generarReporteAnalisisPaciente(clavePaciente) #Returns an array of ReporteAnalisisPaciente objects, nil on failure
    @db.generarReporteAnalisisPaciente(clavePaciente)
  end

  def generarReportePacientesAnalisis(claveAnalisis) #Returns an array of ReportePacientesAnalisis objects, nil on failure
    @db.generarReportePacientesAnalisis(claveAnalisis)
  end

  def generarReporteDoctoresPaciente(clavePaciente) #Returns an array of ReporteDoctoresPaciente objects, nil on failure
    @db.generarReporteDoctoresPaciente(clavePaciente)
  end

  def generarReportePacientesDoctor(claveDoctor) #Returns an array of ReportePacientesDoctor objects, nil on failure
    @db.generarReportePacientesDoctor(claveDoctor)
  end

  def consultarEspecialidades
    @db.consultarEspecialidades
  end

end