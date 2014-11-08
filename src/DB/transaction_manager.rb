require_relative './pgdb'

class TransactionManager
  # Constructor
  def initialize() @db = PGDB.instance end # Singleton Pattern

  # Actualizar
  def actualizarAnalisis(analisis) @db.actualizarAnalisis(analisis) end  # Returns boolean indicating success or failure
  def actualizarDoctor(doctor)     @db.actualizarDoctor(doctor)     end  # Returns boolean indicating success of failure
  def actualizarPaciente(paciente) @db.actualizarPaciente(paciente) end  # Returns boolean indicating success of failure

  # Borrar
  def borrarAnalisis(clave) @db.borrarAnalisis(clave) end  # Returns a boolean indicating success or failure
  def borrarDoctor(clave)   @db.borrarDoctor(clave)   end  # Returns a boolean indicating success or failure
  def borrarPaciente(clave) @db.borrarPaciente(clave) end  # Returns a boolean indicating success or failure

  # Capturar
  def capturarAnalisis(analisis) @db.capturarAnalisis(analisis) end  # Returns a boolean indicating success or failure
  def capturarAtiende(atiende)   @db.capturarAtiende(atiende)   end  # Returns a boolean indicating success or failure
  def capturarDoctor(doctor)     @db.capturarDoctor(doctor)     end  # Returns a boolean indicating success or failure
  def capturarPaciente(paciente) @db.capturarPaciente(paciente) end  # Returns a boolean indicating success or failure
  def capturarSeRealiza(seRealiza) @db.capturarSeRealiza(seRealiza) end  # Returns a boolean indicating success or failure

  # Consultas Generales
  def consultarAnalisis()  @db.consultarAnalisis  end  # Returns AnalisisClinico array
  def consultarDoctores()  @db.consultarDoctores  end  # Returns Doctor array
  def consultarAtiende()   @db.consultarAtiende   end  # Returns Atiende array
  def consultarPacientes() @db.consultarPacientes end  # Returns Paciente array
  def consultarSeRealiza() @db.consultarSeRealiza end  # Returns SeRealiza array

  # Consultas por clave
  def consultarAnalisisClave(clave) @db.consultarAnalisisClave(clave) end  # Returns an AnalisisClinico object or nil if it fails
  def consultarDoctorClave(clave)   @db.consultarDoctorClave(clave)   end  # Returns an Doctor object or nil if it fails
  def consultarPacienteClave(clave) @db.consultarPacienteClave(clave) end  # Returns an Paciente object or nil if it fails

  # Consultas por tipo/especialidad
  def consultarAnalisisTipo(tipo) @db.consultarAnalisisTipo(tipo) end  # Returns an array of AnalisisClinico objects, on failure returns nil

  # Consultas por tipo/especialidad
  def consultarDoctoresEspecialidad(especialidad) @db.consultarDoctoresEspecialidad(especialidad) end  # Returns an array of Doctor objects, on failure returns nil

  # Reportes
  def generarReporteAnalisisPaciente(clavePaciente)  @db.generarReporteAnalisisPaciente(clavePaciente)  end  # Returns an array of ReporteAnalisisPaciente objects, nil on failure
  def generarReportePacientesAnalisis(claveAnalisis) @db.generarReportePacientesAnalisis(claveAnalisis) end  # Returns an array of ReportePacientesAnalisis objects, nil on failure
  def generarReporteDoctoresPaciente(clavePaciente)  @db.generarReporteDoctoresPaciente(clavePaciente)  end  # Returns an array of ReporteDoctoresPaciente objects, nil on failure
  def generarReportePacientesDoctor(claveDoctor)     @db.generarReportePacientesDoctor(claveDoctor)     end  # Returns an array of ReportePacientesDoctor objects, nil on failure
  def consultarEspecialidades() @db.consultarEspecialidades end

end