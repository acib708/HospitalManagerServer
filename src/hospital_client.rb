require 'thrift'
require './actions'

begin
  transport = Thrift::BufferedTransport.new Thrift::Socket.new '192.168.0.100',9090
  protocol  = Thrift::BinaryProtocol.new transport
  client    = Actions::Client.new protocol

  #Start connection
  transport.open

  #Test client
  doctor = Doctor.new
  doctor.clave     = 'D65'
  doctor.nombre    = 'PruebaDocActualizado'
  doctor.direccion = 'PruebaDirec'
  doctor.telefono  = 'PruebaTel'
  doctor.especialidad   = 'PruebaEsp'
  doctor.foto      = '5.jpg'
  ans = client.borrarDoctor doctor.clave

  puts ans
  #client.actualizarDoctor doctor
  client.consultarDoctores.each { |current| puts current.nombre }

  #Close connection
  transport.close

rescue Thrift::Exception => tx
  puts 'TException: ', tx.message, "\n"

end