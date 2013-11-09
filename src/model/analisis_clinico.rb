class AnalisisClinico
  attr_accessor :clave, :tipo, :descripcion

  def to_s
    "Clave: #{clave}\nTipo: #{tipo}\nDescripcion: #{descripcion}"
  end

  def to_sql
    "'#{clave}','#{tipo}',#{descripcion}"
  end

  def to_sql_update
    "clave= '#{clave}', tipo= #{tipo}, descripcion= '#{descripcion}'"
  end

end