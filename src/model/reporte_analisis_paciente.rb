class ReporteAnalisisPaciente

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
    "Clave paciente: #{clave_paciente}\nClave analisis: #{clave_analisis}\nFecha Aplicacion: #{fecha_aplic}\nNombre paciente: #{nombre_paciente}\nFecha de Entrega: #{fecha_entrega}\nTipo Analisis: #{tipo}\nDescripcion: #{descripcion}\nFoto paciente "
  end
end