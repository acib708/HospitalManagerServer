require './db_manager'
require 'thrift'
require './actions'

db = DBManager.new
doctor = Doctor.new
doctor.clave = 'doococd'
puts "Hello Dante! #{db.consultarEspecialidades}"