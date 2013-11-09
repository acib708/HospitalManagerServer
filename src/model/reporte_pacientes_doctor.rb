class ReportePacientesDoctor
  attr_accessor :diagnostico, :fecha, :foto_paciente, :foto_doctor, :tratamiento, :nombre_doctor, :nombre_paciente, :clave_paciente, :clave_doctor

  def initialize
    @clave_doctor    = ''
    @clave_paciente  = ''
    @nombre_doctor   = ''
    @nombre_paciente = ''
    @nombre_doctor   = ''
    @tratamiento     = ''
    @diagnostico     = ''
    @fecha           = ''
    @foto_doctor     = ''
    @foto_paciente   = ''
  end

  def to_s
    "Clave Doctor   : #{clave_doctor}\nClave Paciente : #{clave_paciente}\nNombre Doctor  : #{nombre_doctor}\nNombre Paciente: #{nombre_paciente}\nTratamiento    : #{tratamiento}\nDiagnostico    : #{diagnostico}\nFecha          : #{fecha}\nFoto Doctor    : #{foto_doctor}\nFoto Paciente  : #{foto_paciente}"
  end
end

reporte = ReportePacientesDoctor.new

puts reporte