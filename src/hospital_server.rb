require './db_manager'
require 'thrift'
require './actions'

handler           = DBManager.new
processor         = Actions::Processor.new handler
transport         = Thrift::ServerSocket.new 7911
transport_factory = Thrift::BufferedTransportFactory.new
server            = Thrift::SimpleServer.new processor, transport, transport_factory

puts 'Hospital Manager.'
puts "by Roberto Antelo\n   Alfonso Ríos\n   Marcelo Gómez\n   Alejandro Cárdenas\n\n"
puts "Thrift Ruby RPC Server started.\n\n"
#puts handler.consultarDoctores

server.serve()

puts 'Goodbye!'