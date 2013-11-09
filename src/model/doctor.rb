class Doctor
  attr_accessor :clave, :nombre, :direccion, :especialidad, :telefono, :foto

  def initialize
    @clave        = ''
    @nombre       = ''
    @direccion    = ''
    @especialidad = ''
    @telefono     = ''
    @foto         = ''
  end

  def to_s
    "Clave: #{clave}\nNombre: #{nombre}\nDireccion: #{direccion}\nEspecialidad: #{especialidad}\nTelefono: #{telefono}\nFoto: #{foto}"
  end

  def to_sql
    "'#{clave}','#{nombre}','#{direccion}','#{especialidad}','#{telefono}','#{foto}'"
  end

  def to_sql_update
    "clave= '#{clave}', nombre= '#{nombre}', direccion= '#{direccion}', especialidad= '#{especialidad}', telefono= '#{telefono}', foto= '#{foto}'"
  end

end