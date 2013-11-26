class DBManager
  require 'pg'
  require './actions'
  require 'openssl'

  def initialize
    @connection = PG::Connection.open dbname: 'hospital', host: 'localhost'
    @password = (OpenSSL::Digest.new 'SHA256').digest 'password'
    @iv = (OpenSSL::Digest.new 'SHA256').digest 'iv'
    self
  end

#Data encryption and decryption
  def encrypt(data)
    cipher = OpenSSL::Cipher.new 'AES-256-CBC'
    cipher.encrypt
    cipher.key, cipher.iv = @password, @iv
    (cipher.update(data) + cipher.final).unpack('H*')[0]
  end

  def decrypt(data)
    data_to_decrypt, decipher = [data].pack('H*'), OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.iv, decipher.key = @iv, @password
    (decipher.update(data_to_decrypt) + decipher.final).force_encoding 'UTF-8'
  end

#Actualizar
  def actualizarAnalisis(analisis) #Returns boolean indicating success or failure
    puts "Actualizar Análisis: #{analisis}"
    @connection.exec "UPDATE analisisclinico SET "+
                         "clave='#{encrypt analisis.clave}', "+
                         "tipo='#{encrypt analisis.tipo}', "+
                         "descripcion='#{encrypt analisis.descripcion}' "+
                         "WHERE clave='#{encrypt analisis.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

  def actualizarDoctor(doctor) #Returns boolean indicating success of failure
    puts "Actualizar Doctor: #{doctor}"
    @connection.exec "UPDATE doctor SET "+
                         "clave='#{encrypt doctor.clave}', "+
                         "nombre='#{encrypt doctor.nombre}', "+
                         "especialidad='#{encrypt doctor.especialidad}', "+
                         "direccion='#{encrypt doctor.direccion}', "+
                         "telefono='#{encrypt doctor.telefono}' "+
                         "WHERE clave='#{encrypt doctor.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

  def actualizarPaciente(paciente)
    puts "Actualizar Paciente: #{paciente}"
    @connection.exec "UPDATE paciente SET "+
                         "clave='#{encrypt paciente.clave}', "+
                         "nombre='#{encrypt paciente.nombre}', "+
                         "direccion='#{encrypt paciente.direccion}', "+
                         "telefono='#{encrypt paciente.telefono}' "+
                         "WHERE clave='#{encrypt paciente.clave}'"
    true
  rescue PG::Error => e
    puts "Hubo un error al actualizar la base de datos: #{e.message}"
    false
  end

#Borrar
  def borrarAnalisis(clave) #Returns a boolean indicating success or failure
    puts "Borrar Análisis: #{clave}"
    @connection.exec "DELETE FROM serealiza WHERE claveanalisis='#{encrypt clave}'"
    res = @connection.exec "DELETE FROM analisisclinico WHERE clave='#{encrypt clave}'"
    res.cmd_tuples == 1 ? true:false
    true
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

  def borrarDoctor(clave) #Returns a boolean indicating success or failure
    puts "Borrar Doctor: #{clave}"
    @connection.exec "DELETE FROM atiende WHERE clavedoctor='#{encrypt clave}'"
    res = @connection.exec "DELETE FROM doctor WHERE clave='#{encrypt clave}'"
    res.cmd_tuples == 1 ? true : false
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

  def borrarPaciente(clave) #Returns a boolean indicating success or failure
    puts "Borrar Paciente: #{clave}"
    @connection.exec "DELETE FROM serealiza WHERE clavePaciente='#{encrypt clave}'"
    @connection.exec "DELETE FROM atiende WHERE clavePaciente='#{encrypt clave}'"
    res = @connection.exec "DELETE FROM paciente WHERE clave='#{encrypt clave}'"
    res.cmd_tuples == 1 ? true:false
    true
  rescue PG::Error => e
    puts "Hubo un error al borrar de la base de datos: #{e.message}"
    false
  end

#Capturar
  def capturarAnalisis(analisis) #Returns a boolean indicating success or failure
    puts "Capturar Análisis: #{analisis}"
    @connection.exec "INSERT INTO analisisclinico VALUES('#{encrypt analisis.clave}','#{encrypt analisis.tipo}','#{encrypt analisis.descripcion}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarAtiende(atiende) #Returns a boolean indicating success or failure
    puts "Capturar Atiende: #{atiende}"
    @connection.exec "INSERT INTO atiende VALUES('#{encrypt atiende.claveDoctor}', '#{encrypt atiende.clavePaciente}', '#{encrypt atiende.fecha}', '#{encrypt atiende.tratamiento}', '#{encrypt atiende.diagnostico}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarDoctor(doctor) #Returns a boolean indicating success or failure
    puts "Capturar Doctor: #{doctor}"
    @connection.exec "INSERT INTO doctor VALUES('#{encrypt doctor.clave}', '#{encrypt doctor.nombre}', '#{encrypt doctor.direccion}', '#{encrypt doctor.especialidad}', '#{encrypt doctor.telefono}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarPaciente(paciente) #Returns a boolean indicating success or failure
    puts "Capturar Paciente: #{paciente}"
    @connection.exec "INSERT INTO paciente VALUES('#{encrypt paciente.clave}', '#{encrypt paciente.nombre}', '#{encrypt paciente.direccion}', '#{encrypt paciente.telefono}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

  def capturarSeRealiza(seRealiza) #Returns a boolean indicating success or failure
    puts "Capturar Se Realiza: #{seRealiza}"
    @connection.exec "INSERT INTO serealiza VALUES('#{encrypt seRealiza.claveAnalisis}', '#{encrypt seRealiza.clavePaciente}', '#{encrypt seRealiza.fechaAplic}', '#{encrypt seRealiza.fechaEntrega}')"
    true
  rescue PG::Error => e
    puts "Hubo un error al capturar en la base de datos: #{e.message}"
    false
  end

#Consultas Generales
  def consultarAnalisis #Returns AnalisisClinico array
    puts 'Consultar Análisis'
    analisis = []
    res = @connection.exec 'SELECT * FROM analisisclinico'
    res.each do |tuple|
      current = AnalisisClinico.new
      current.clave = decrypt tuple['clave']
      current.descripcion = decrypt tuple['descripcion']
      current.tipo = decrypt tuple['tipo']
      analisis << current
    end
    analisis
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarDoctores #Returns Doctor array
    puts 'Consultar Doctores'
    doctores = []
    res = @connection.exec 'SELECT * FROM doctor'
    res.each do |tuple|
      current = Doctor.new
      current.clave = decrypt tuple['clave']
      current.nombre = decrypt tuple['nombre']
      current.especialidad = decrypt tuple['especialidad']
      current.direccion = decrypt tuple['direccion']
      current.telefono = decrypt tuple['telefono']
      doctores << current
    end
    doctores
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarAtiende #Returns Atiende array
    puts 'Consultar Atiende'
    atiendes = []
    res = @connection.exec 'SELECT * FROM atiende'
    res.each do |tuple|
      current = Atiende.new
      current.claveDoctor = decrypt tuple['clavedoctor']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.diagnostico = decrypt tuple['diagnostico']
      current.tratamiento = decrypt tuple['tratamiento']
      current.fecha = decrypt tuple['fecha']
      atiendes << current
    end
    atiendes
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarPacientes #Returns Paciente array
    puts 'Consultar Pacientes'
    pacientes = []
    res = @connection.exec 'SELECT * FROM paciente'
    res.each do |tuple|
      current = Paciente.new
      current.clave = decrypt tuple['clave']
      current.nombre = decrypt tuple['nombre']
      current.direccion = decrypt tuple['direccion']
      current.telefono = decrypt tuple['telefono']
      pacientes << current
    end
    pacientes
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

  def consultarSeRealiza #Returns SeRealiza array
    puts 'Consultar Se Realiza'
    serealizas = []
    res = @connection.exec 'SELECT * FROM serealiza'
    res.each do |tuple|
      current = SeRealiza.new
      current.claveAnalisis = decrypt tuple['claveanalisis']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.fechaAplic = decrypt tuple['fechaaplic']
      current.fechaEntrega = decrypt tuple['fechaentrega']
      serealizas << current
    end
    serealizas
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

#Consultas por clave

  def consultarAnalisisClave(clave) #Returns an AnalisisClinico object or nil if it fails
    puts "Consultar Análisis Clave: #{clave}"
    res = @connection.exec "SELECT * FROM analisisclinico WHERE clave='#{encrypt clave}'"
    if res.ntuples == 0
      puts "No se encontró ningun analisis con la clave #{clave}"
      nil
    else
      analisis = AnalisisClinico.new
      analisis.clave = decrypt res[0]['clave']
      analisis.tipo = decrypt res[0]['tipo']
      analisis.descripcion = decrypt res[0]['descripcion']
      analisis
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

  def consultarDoctorClave(clave) #Returns an Doctor object or nil if it fails
    puts "Consultar Doctor Clave: #{clave}"
    res = @connection.exec "SELECT * FROM doctor WHERE clave='#{encrypt clave}'"
    if res.ntuples == 0
      puts "No se encontró ningun doctor con la clave #{clave}"
      nil
    else
      doctor = Doctor.new
      doctor.clave = decrypt res[0]['clave']
      doctor.nombre = decrypt res[0]['nombre']
      doctor.direccion = decrypt res[0]['direccion']
      doctor.especialidad = decrypt res[0]['especialidad']
      doctor.telefono = decrypt res[0]['telefono']
      doctor
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

  def consultarPacienteClave(clave) #Returns an Paciente object or nil if it fails
    puts "Consultar Paciente Clave: #{clave}"
    res = @connection.exec "SELECT * FROM paciente WHERE clave='#{encrypt clave}'"
    if res.ntuples == 0
      puts "No se encontró ningun paciente con la clave #{clave}"
      nil
    else
      paciente = Paciente.new
      paciente.clave = decrypt res[0]['clave']
      paciente.nombre = decrypt res[0]['nombre']
      paciente.direccion = decrypt res[0]['direccion']
      paciente.telefono = decrypt res[0]['telefono']
      paciente
    end
  rescue PG::Error => e
    puts "Hubo un error al consultar clave #{clave}: #{e.message}"
    nil
  end

#Consultas por tipo/especialidad
  def consultarAnalisisTipo(tipo) #Returns an array of AnalisisClinico objects, on failure returns nil
    puts "Consultar Análisis Tipo: #{tipo}"
    analisis = []
    res = @connection.exec "SELECT * FROM analisisclinico WHERE tipo='#{encrypt tipo}'"
    res. each do |tuple|
      current = AnalisisClinico.new
      current.clave = decrypt tuple['clave']
      current.tipo = decrypt tuple['tipo']
      current.descripcion = decrypt tuple['descripcion']
      analisis << current
    end
    analisis
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

#Consultas por tipo/especialidad
  def consultarDoctoresEspecialidad(especialidad) #Returns an array of Doctor objects, on failure returns nil
    puts "Consultar Doctores Especialidad: #{especialidad}"
    doctores = []
    res = @connection.exec "SELECT * FROM doctor WHERE especialidad='#{encrypt especialidad}'"
    res. each do |tuple|
      current = Doctor.new
      current.clave = decrypt tuple['clave']
      current.nombre = decrypt tuple['nombre']
      current.direccion = decrypt tuple['direccion']
      current.especialidad = decrypt tuple['especialidad']
      current.telefono = decrypt tuple['telefono']
      doctores << current
    end
    doctores
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

#Reportes
  def generarReporteAnalisisPaciente(clavePaciente) #Returns an array of ReporteAnalisisPaciente objects, nil on failure
    puts "Generar Reporte Análisis Paciente: #{clavePaciente}"
    reportes = []
    res = @connection.exec "SELECT analisisclinico.clave AS claveanalisis, paciente.clave AS clavepaciente, tipo, paciente.nombre AS nombrepaciente, fechaaplic, fechaentrega, descripcion FROM (paciente INNER JOIN serealiza ON paciente.clave = '#{encrypt clavePaciente}' AND paciente.clave = serealiza.clavepaciente) INNER JOIN analisisclinico ON analisisclinico.clave = serealiza.claveanalisis"
    res.each do |tuple|
      current = ReporteAnalisisPaciente.new
      current.claveAnalisis = decrypt tuple['claveanalisis']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.tipo = decrypt tuple['tipo']
      current.nombrePaciente = decrypt tuple['nombrepaciente']
      current.fechaAplic = decrypt tuple['fechaaplic']
      current.fechaEntrega = decrypt tuple['fechaentrega']
      current.descripcion = decrypt tuple['descripcion']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReportePacientesAnalisis(claveAnalisis) #Returns an array of ReportePacientesAnalisis objects, nil on failure
    puts "Generar Reporte Pacientes Análisis: #{claveAnalisis}"
    reportes = []
    res = @connection.exec "SELECT analisisclinico.clave AS claveanalisis, paciente.clave AS clavepaciente, tipo, paciente.nombre AS nombrepaciente, fechaaplic, fechaentrega, descripcion FROM (analisisclinico INNER JOIN serealiza ON analisisclinico.clave = '#{encrypt claveAnalisis}' AND analisisclinico.clave = serealiza.claveanalisis) INNER JOIN paciente ON paciente.clave = serealiza.clavepaciente"
    res.each do |tuple|
      current = ReportePacientesAnalisis.new
      current.claveAnalisis = decrypt tuple['claveanalisis']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.tipo = decrypt tuple['tipo']
      current.nombrePaciente = decrypt tuple['nombrepaciente']
      current.fechaAplic = decrypt tuple['fechaaplic']
      current.fechaEntrega = decrypt tuple['fechaentrega']
      current.descripcion = decrypt tuple['descripcion']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReporteDoctoresPaciente(clavePaciente) #Returns an array of ReporteDoctoresPaciente objects, nil on failure
    puts "Generar Reporte Doctores Pacientes: #{clavePaciente}"
    reportes = []
    res = @connection.exec "SELECT doctor.clave AS clavedoctor, doctor.nombre AS nombredoctor, paciente.clave AS clavepaciente, paciente.nombre AS nombrepaciente, fecha, diagnostico, tratamiento FROM (paciente INNER JOIN atiende ON paciente.clave = '#{encrypt clavePaciente}' AND paciente.clave = atiende.clavepaciente) INNER JOIN doctor ON doctor.clave = atiende.clavedoctor"
    res.each do |tuple|
      current = ReporteDoctoresPaciente.new
      current.claveDoctor = decrypt tuple['clavedoctor']
      current.nombreDoctor = decrypt tuple['nombredoctor']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.nombrePaciente = decrypt tuple['nombrepaciente']
      current.fecha = decrypt tuple['fecha']
      current.diagnostico = decrypt tuple['diagnostico']
      current.tratamiento = decrypt tuple['tratamiento']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def generarReportePacientesDoctor(claveDoctor) #Returns an array of ReportePacientesDoctor objects, nil on failure
    puts "Generar Reporte Pacientes Doctor: #{claveDoctor}"
    reportes = []
    res = @connection.exec "SELECT doctor.clave AS clavedoctor, doctor.nombre AS nombredoctor, paciente.clave AS clavepaciente, paciente.nombre AS nombrepaciente, fecha, diagnostico, tratamiento FROM (doctor INNER JOIN atiende ON doctor.clave = '#{encrypt claveDoctor}' AND doctor.clave = atiende.clavedoctor) INNER JOIN paciente ON paciente.clave = atiende.clavepaciente"
    res.each do |tuple|
      current = ReportePacientesDoctor.new
      current.claveDoctor = decrypt tuple['clavedoctor']
      current.nombreDoctor = decrypt tuple['nombredoctor']
      current.clavePaciente = decrypt tuple['clavepaciente']
      current.nombrePaciente = decrypt tuple['nombrepaciente']
      current.fecha = decrypt tuple['fecha']
      current.diagnostico = decrypt tuple['diagnostico']
      current.tratamiento = decrypt tuple['tratamiento']
      reportes << current
    end
    reportes
  rescue PG::Error => e
    puts "Hubo un error al generar reporte: #{e.message}"
    nil
  end

  def consultarEspecialidades
    puts 'Generar especialidades'
    especialidades = []
    res = @connection.exec "SELECT DISTINCT especialidad FROM doctor"
    res.each do |tuple|
      especialidades << (decrypt tuple['especialidad'])
    end
    especialidades
  rescue PG::Error => e
    puts "Hubo un error al generar especialidades #{e.message}"
    nil
  end
end

#db = DBManager.new
#x = 'Alejandro está viendo mientras pruebo nuestros nuevos métodos de encripción y de decriptación de data'
#puts db.encrypt x
#puts db.decrypt db.encrypt x