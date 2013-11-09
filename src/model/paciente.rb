class Paciente
  attr_accessor :clave, :nombre, :direccion, :foto, :telefono

  def initialize
    @clave     = ''
    @nombre    = ''
    @direccion = ''
    @telefono  = ''
    @foto      = ''
  end

  def to_s
    "Clave: #{clave}\nNombre: #{nombre}\nDireccion: #{direccion}\nTelefono: #{telefono}\nFoto: #{foto}"
  end

  def to_sql
    "'#{clave}','#{nombre}','#{direccion}','#{telefono}','#{foto}'"
  end

  def to_sql_update
    "clave= '#{clave}', nombre= '#{nombre}', direccion= '#{direccion}', telefono= '#{telefono}', foto= '#{foto}'"
  end

end