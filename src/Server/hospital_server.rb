require 'thrift'
require_relative '../DB/transaction_manager'
require_relative '../Thrift/actions'

handler           = TransactionManager.new
processor         = Actions::Processor.new handler
transport         = Thrift::ServerSocket.new 7911
transport_factory = Thrift::BufferedTransportFactory.new
server            = Thrift::SimpleServer.new processor, transport, transport_factory

# # Testing Singleton pattern
# some_instance = Db.instance
#
# p handler
# p some_instance

puts 'Hospital Manager.'
puts "by Roberto Antelo\n   Alfonso Ríos\n   Marcelo Gómez\n   Alejandro Cárdenas\n\n"
puts "Thrift Ruby RPC Server started.\n\n"
#puts handler.consultarDoctores

server.serve()

puts 'Goodbye!'