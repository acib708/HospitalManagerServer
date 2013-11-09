class Atiende
  attr_accessor :clave_doctor, :clave_paciente, :fecha, :tratamiento, :diagnostico, :foto_doctor, :foto_paciente

  def initialize
    @clave_doctor   = ''
    @clave_paciente = ''
    @fecha          = ''
    @tratamiento    = ''
    @diagnostico    = ''
    @foto_doctor    = ''
    @foto_paciente  = ''
  end

  def to_s
    "Clave Doctor: #{clave_doctor}\nClave Paciente: #{clave_paciente}\nFecha: #{fecha}\nTratamiento: #{tratamiento}\nDiagnostico: #{diagnostico}"
  end

  def to_sql
    "'#{clave_doctor}','#{clave_paciente}','#{fecha}','#{tratamiento}','#{diagnostico}','#{foto_doctor}','#{foto_paciente}'"
  end

end