class ReportePacientesAnalisis

  attr_accessor :descripcion, :foto_paciente, :tipo, :nombre_paciente, :clave_analisis, :clave_paciente, :fecha_entrega, :fecha_aplic

  def initialize
    @clave_paciente  = ''
    @clave_analisis  = ''
    @fecha_aplic     = ''
    @nombre_paciente = ''
    @fecha_entrega   = ''
    @tipo            = ''
    @descripcion     = ''
    @foto_paciente   = ''
  end

  def to_s
    "Clave Paciente: #{clave_paciente}\nClave Analisis: #{clave_analisis}\nFecha Aplicacion: #{fecha_aplic}\nNombre del Paciente: #{nombre_paciente}\nFecha de Entrega: #{fecha_entrega}\nTipo: #{tipo}\nDescripcion: #{descripcion}\nFoto del Paciente: #{foto_paciente}"
  end
end