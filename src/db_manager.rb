class DBManager
  require 'pg'
  require './actions'

  def initialize
    @connection = PG::Connection.open dbname: 'hospital', host: 'localhost'
    self
  end

  #Actualizar
  def actualizarAnalisis(analisis) #Returns boolean indicating success or failure
    @connection.exec "UPDATE analisisclinico SET "+
        "clave='#{analisis.clave}', "+
        "tipo='#{analisis.tipo}', "+
        "descripcion='#{analisis.descripcion}' "+
        "WHERE clave='#{analisis.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

  def actualizarDoctor(doctor) #Returns boolean indicating success of failure
    @connection.exec "UPDATE doctor SET "+
        "clave='#{doctor.clave}', "+
        "nombre='#{doctor.nombre}', "+
        "especialidad='#{doctor.especialidad}', "+
        "direccion='#{doctor.direccion}', "+
        "telefono='#{doctor.telefono}', "+
        "foto='#{doctor.foto}' "+
        "WHERE clave='#{doctor.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

  def actualizarPaciente(paciente)
    @connection.exec "UPDATE paciente SET "+
        "clave='#{paciente.clave}', "+
        "nombre='#{paciente.nombre}', "+
        "direccion='#{paciente.direccion}', "+
        "telefono='#{paciente.telefono}', "+
        "foto='#{paciente.foto}' "+
        "WHERE clave='#{paciente.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

  #Borrar
  def borrarAnalisis(clave) #Returns a boolean indicating success or failure
    @connection.exec "DELETE FROM serealiza WHERE claveanalisis='#{clave}'"
    res = @connection.exec "DELETE FROM analisisclinico WHERE clave='#{clave}'"
    res.cmd_tuples == 1 ? true:false
    true
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

  def borrarDoctor(clave) #Returns a boolean indicating success or failure
    @connection.exec "DELETE FROM atiende WHERE clavedoctor='#{clave}'"
    res = @connection.exec "DELETE FROM doctor WHERE clave='#{clave}'"
    res.cmd_tuples == 1 ? true:false
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

  def borrarPaciente(clave) #Returns a boolean indicating success or failure
    @connection.exec "DELETE FROM serealiza WHERE clavePaciente='#{clave}'"
    @connection.exec "DELETE FROM atiende WHERE clavePaciente='#{clave}'"
    res = @connection.exec "DELETE FROM paciente WHERE clave='#{clave}'"
    res.cmd_tuples == 1 ? true:false
    true
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

  #Capturar
  def capturarAnalisis(analisis) #Returns a boolean indicating success or failure
    @connection.exec "INSERT INTO analisisclinico VALUES('#{analisis.clave}','#{analisis.tipo}','#{analisis.descripcion}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarAtiende(atiende) #Returns a boolean indicating success or failure
    @connection.exec "INSERT INTO atiende VALUES('#{atiende.claveDoctor}', '#{atiende.clavePaciente}', '#{atiende.fecha}', '#{atiende.tratamiento}', '#{atiende.diagnostico}', '#{atiende.fotoDoctor}', '#{atiende.fotoPaciente}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarDoctor(doctor) #Returns a boolean indicating success or failure
    @connection.exec "INSERT INTO doctor VALUES('#{doctor.clave}', '#{doctor.nombre}', '#{doctor.direccion}', '#{doctor.especialidad}', '#{doctor.telefono}', '#{doctor.foto}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarPaciente(paciente) #Returns a boolean indicating success or failure
    @connection.exec "INSERT INTO paciente VALUES('#{paciente.clave}', '#{paciente.nombre}', '#{paciente.direccion}', '#{paciente.telefono}', '#{paciente.foto}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarSeRealiza(seRealiza) #Returns a boolean indicating success or failure
    @connection.exec "INSERT INTO serealiza VALUES('#{seRealiza.claveAnalisis}', '#{seRealiza.clavePaciente}', '#{seRealiza.fechaAplic}', '#{seRealiza.fechaEntrega}', '#{seRealiza.fotoPaciente}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  #Consultas Generales
  def consultarAnalisis #Returns AnalisisClinico array
    analisis = []
    res = @connection.exec 'SELECT * FROM analisisclinico'
    res.each do |tuple|
      current = AnalisisClinico.new
      current.clave       = tuple['clave']
      current.descripcion = tuple['descripcion']
      current.tipo        = tuple['tipo']
      analisis << current
    end
    analisis
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarDoctores #Returns Doctor array
    doctores = []
    res = @connection.exec 'SELECT * FROM doctor'
    res.each do |tuple|
      current = Doctor.new
      current.clave        = tuple['clave']
      current.nombre       = tuple['nombre']
      current.especialidad = tuple['especialidad']
      current.direccion    = tuple['direccion']
      current.telefono     = tuple['telefono']
      current.foto         = tuple['foto']
      doctores << current
    end
    doctores
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarAtiende #Returns Atiende array
    atiendes = []
    res = @connection.exec 'SELECT * FROM atiende'
    res.each do |tuple|
      current = Atiende.new
      current.claveDoctor   = tuple['clavedoctor']
      current.clavePaciente = tuple['clavepaciente']
      current.diagnostico   = tuple['diagnostico']
      current.tratamiento   = tuple['tratamiento']
      current.fecha         = tuple['fecha']
      current.fotoDoctor    = tuple['fotodoctor']
      current.fotoPaciente  = tuple['fotopaciente']
      atiendes << current
    end
    atiendes
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarPacientes #Returns Paciente array
    pacientes = []
    res = @connection.exec 'SELECT * FROM paciente'
    res.each do |tuple|
      current = Paciente.new
      current.clave        = tuple['clave']
      current.nombre       = tuple['nombre']
      current.direccion    = tuple['direccion']
      current.telefono     = tuple['telefono']
      current.foto         = tuple['foto']
      pacientes << current
    end
    pacientes
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarSeRealiza #Returns SeRealiza array
    serealizas = []
    res = @connection.exec 'SELECT * FROM serealiza'
    res.each do |tuple|
      current = SeRealiza.new
      current.claveAnalisis = tuple['claveanalisis']
      current.clavePaciente = tuple['clavepaciente']
      current.fechaAplic    = tuple['fechaaplic']
      current.fechaEntrega  = tuple['fechaentrega']
      current.fotoPaciente  = tuple['fotopaciente']
      serealizas << current
    end
    serealizas
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  #Consultas por clave

  def consultarAnalisisClave(clave) #Returns an AnalisisClinico object or nil if it fails
    res = @connection.exec  "SELECT * FROM analisisclinico WHERE clave='#{clave}'"
    if res.ntuples == 0
      puts "No se encontro ningun analisis con la clave #{clave}"
      nil
    else
      analisis = AnalisisClinico.new
      analisis.clave       = res[0]['clave']
      analisis.tipo        = res[0]['tipo']
      analisis.descripcion = res[0]['descripcion']
      analisis
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

  def consultarDoctorClave(clave) #Returns an Doctor object or nil if it fails
    res = @connection.exec  "SELECT * FROM doctor WHERE clave='#{clave}'"
    if res.ntuples == 0
      puts "No se encontro ningun doctor con la clave #{clave}"
      nil
    else
      doctor = Doctor.new
      doctor.clave        = res[0]['clave']
      doctor.nombre       = res[0]['nombre']
      doctor.direccion    = res[0]['direccion']
      doctor.especialidad = res[0]['especialidad']
      doctor.telefono     = res[0]['telefono']
      doctor.foto         = res[0]['foto']
      doctor
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

  def consultarPacienteClave(clave) #Returns an Paciente object or nil if it fails
    res = @connection.exec  "SELECT * FROM paciente WHERE clave='#{clave}'"
    if res.ntuples == 0
      puts "No se encontro ningun paciente con la clave #{clave}"
      nil
    else
      paciente = Paciente.new
      paciente.clave        = res[0]['clave']
      paciente.nombre       = res[0]['nombre']
      paciente.direccion    = res[0]['direccion']
      paciente.telefono     = res[0]['telefono']
      paciente.foto         = res[0]['foto']
      paciente
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

  #Consultas por tipo/especialidad
  def consultarAnalisisTipo(tipo) #Returns an array of AnalisisClinico objects, on failure returns nil
    analisis = []
    res      = @connection.exec "SELECT * FROM analisisclinico WHERE tipo='#{tipo}'"
    res. each do |tuple|
      current = AnalisisClinico.new
      current.clave = tuple['clave']
      current.tipo  = tuple['tipo']
      current.descripcion = tuple['descripcion']
      analisis << current
    end
    analisis
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  #Consultas por tipo/especialidad
  def consultarDoctoresEspecialidad(especialidad) #Returns an array of Doctor objects, on failure returns nil
    doctores = []
    res      = @connection.exec "SELECT * FROM doctor WHERE especialidad='#{especialidad}'"
    res. each do |tuple|
      current = AnalisisClinico.new
      current.clave        = tuple['clave']
      current.nombre       = tuple['nombre']
      current.direccion    = tuple['direccion']
      current.especialidad = tuple['especialidad']
      current.telefono     = tuple['telefono']
      current.foto         = tuple['foto']
      doctores << current
    end
    doctores
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  #Reportes
  #TODO: Arreglar queries de reportes
  def generarReporteAnalisisPaciente(clavePaciente) #Returns an array of ReporteAnalisisPaciente objects, nil on failure
    reportes = []
    res = @connection.exec "SELECT * FROM (paciente INNER JOIN serealiza ON paciente.clave = '#{clavePaciente}' AND paciente.clave = serealiza.clavepaciente) INNER JOIN analisisclinico ON analisisclinico.clave = serealiza.claveanalisis"
    res.each do |tuple|
      current = ReporteAnalisisPaciente.new
      current.claveAnalisis  = tuple['claveanalisis']
      current.clavePaciente  = tuple['clavepaciente']
      current.tipo           = tuple['tipo']
      current.nombrePaciente = tuple['nombre']
      current.fechaAplic     = tuple['fechaaplic']
      current.fechaEntrega   = tuple['fechaentrega']
      current.descripcion    = tuple['descripcion']
      current.fotoPaciente   = tuple['foto']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReportePacientesAnalisis(claveAnalisis) #Returns an array of ReportePacientesAnalisis objects, nil on failure
    reportes = []
    res = @connection.exec "SELECT * FROM (analisisclinico INNER JOIN serealiza ON analisisclinico.clave = '#{claveAnalisis}' AND analisisclinico.clave = serealiza.claveanalisis) INNER JOIN paciente ON paciente.clave = serealiza.clavepaciente"
    res.each do |tuple|
      current = ReportePacientesAnalisis.new
      current.claveAnalisis  = tuple['claveanalisis']
      current.clavePaciente  = tuple['clavepaciente']
      current.tipo           = tuple['tipo']
      current.nombrePaciente = tuple['nombre']
      current.fechaAplic     = tuple['fechaaplic']
      current.fechaEntrega   = tuple['fechaentrega']
      current.descripcion    = tuple['descripcion']
      current.fotoPaciente   = tuple['foto']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReporteDoctoresPaciente(clavePaciente) #Returns an array of ReporteDoctoresPaciente objects, nil on failure
    reportes = []
    res = @connection.exec "SELECT * FROM (paciente INNER JOIN atiende ON paciente.clave = '#{clavePaciente}' AND paciente.clave = atiende.clavepaciente) INNER JOIN doctor ON doctor.clave = atiende.clavedoctor"
    res.each do |tuple|
      puts tuple
      current = ReporteDoctoresPaciente.new
      current.claveDoctor    = tuple['clavedoctor']
      current.nombreDoctor   = tuple['nombre']
      current.clavePaciente  = tuple['clavepaciente']
      current.nombrePaciente = tuple['nombrepaciente']
      current.fecha          = tuple['fecha']
      current.diagnostico    = tuple['diagnostico']
      current.tratamiento    = tuple['tratamiento']
      current.fotoDoctor     = tuple['fotodoctor']
      current.fotoPaciente   = tuple['fotopaciente']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReportePacientesDoctor(claveDoctor) #Returns an array of ReportePacientesDoctor objects, nil on failure
    reportes = []
    res = @connection.exec "SELECT * FROM (doctor INNER JOIN atiende ON doctor.clave = '#{claveDoctor}' AND doctor.clave = atiende.clavedoctor) INNER JOIN paciente ON paciente.clave = atiende.clavepaciente"
    res.each do |tuple|
      current = ReportePacientesDoctor.new
      current.claveDoctor    = tuple['clavedoctor']
      current.nombreDoctor   = tuple['nombredoctor']
      current.clavePaciente  = tuple['clavepaciente']
      current.nombrePaciente = tuple['nombrepaciente']
      current.fecha          = tuple['fecha']
      current.diagnostico    = tuple['diagnostico']
      current.tratamiento    = tuple['tratamiento']
      current.fotoDoctor     = tuple['fotodoctor']
      current.fotoPaciente   = tuple['fotopaciente']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end
end