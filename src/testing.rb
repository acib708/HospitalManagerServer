require './db_manager'
require 'thrift'
require './actions'

db = DBManager.new
a_doctor = Doctor.new
a_doctor.clave = 'D100'
a_doctor.nombre = 'Marcelo Gómez'
a_doctor.direccion = 'Chichonal'
a_doctor.especialidad = 'Proctología'
a_doctor.telefono = '7272727'

db.capturarDoctor a_doctor
doctores = db.consultarDoctores
doctores.each do |doctor|
    puts doctor.nombre
end
