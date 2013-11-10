require 'thrift'
require './actions'

begin
  transport = Thrift::BufferedTransport.new Thrift::Socket.new '127.0.0.1',9090
  protocol  = Thrift::BinaryProtocol.new transport
  client    = Actions::Client.new protocol

  #Start connection
  transport.open

  #Test client
  ans = client.consultarAnalisis
  ans.each {|x| puts x.descripcion}

  #Close connection
  transport.close

rescue Thrift::Exception => tx
  puts 'TException: ', tx.message, "\n"

end