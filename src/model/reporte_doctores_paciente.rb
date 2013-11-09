class ReporteDoctoresPaciente

  attr_accessor :diagnostico, :fecha, :foto_paciente, :foto_doctor, :tratamiento, :nombre_doctor, :nombre_paciente, :clave_doctor, :clave_paciente

  def initialize
    @clave_paciente  = ''
    @clave_doctor    = ''
    @nombre_doctor   = ''
    @nombre_paciente = ''
    @tratamiento     = ''
    @diagnostico     = ''
    @fecha           = ''
    @foto_doctor     = ''
    @foto_paciente   = ''
  end

  def to_s
    "Clave del Paciente: #{clave_paciente}\nClave del Doctor: #{clave_doctor}\nNombre del Doctor: #{nombre_doctor}\nNombre del Paciente: #{nombre_paciente}\nTratamiento: #{tratamiento}\nDiagnostico: #{diagnostico}\nFecha: #{fecha}\nFoto del Doctor: #{foto_doctor}\nFoto del Paciente: #{foto_paciente}"
  end
end