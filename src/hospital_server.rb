require './db_manager'
require 'thrift'
require './actions'

handler           = DBManager.new
processor         = Actions::Processor.new handler
transport         = Thrift::ServerSocket.new 9090
transport_factory = Thrift::BufferedTransportFactory.new
server            = Thrift::SimpleServer.new processor, transport, transport_factory

puts "Starting the server..."
server.serve()
puts "Done"