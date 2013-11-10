class DBManager
  require 'pg'
  require './actions'

  def initialize
    @connection = PG::Connection.open dbname: 'biblioteca', host: 'localhost'
    self
  end

  def consultar
    libros = []
    res = @connection.exec 'SELECT * FROM Libros'
    res.each { |tuple| libros << Libro.new(tuple['clave'], tuple['titulo'], tuple['autor'], tuple['editorial'], tuple['existencia'], tuple['imagen']) }
    libros
  rescue PG::Error => e
    puts "Hubo un error al consultar la base de datos: #{e.message}"
    nil
  end

end