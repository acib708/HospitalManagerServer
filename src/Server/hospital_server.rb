require 'thrift'
require_relative '../DB/transaction_manager'
require_relative '../Thrift/actions'

processor         = Actions::Processor.new TransactionManager.new
transport         = Thrift::ServerSocket.new 7911
transport_factory = Thrift::BufferedTransportFactory.new
server            = Thrift::SimpleServer.new processor, transport, transport_factory

puts 'Hospital Manager.'
puts "by Roberto Antelo\n   Alfonso Ríos\n   Marcelo Gómez\n   Alejandro Cárdenas\n\n"
puts "Thrift Ruby RPC Server started.\n\n"

server.serve()

puts 'Goodbye!'