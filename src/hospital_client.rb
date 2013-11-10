require 'thrift'
require './actions'
begin
  transport = Thrift::BufferedTransport.new Thrift::Socket.new 'localhost',9090
  protocol  = Thrift::BinaryProtocol.new transport
  client    = Actions::Client.new protocol

  #Start connection
  transport.open

  #Test client
  if(client.capturar_doctor Doctor.new)
    puts 'Hello World!'
  else
    puts 'Thrift zuckz!'
  end

  #Close connection
  transport.close

rescue Thrift::Exception => tx
  puts 'TException: ', tx.message, "\n"