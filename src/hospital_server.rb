require './db_manager'
require 'thrift'
require './actions'

handler           = DBManager.new
processor         = Actions::Processor.new handler
transport         = Thrift::ServerSocket.new 7911
transport_factory = Thrift::BufferedTransportFactory.new
server            = Thrift::SimpleServer.new processor, transport, transport_factory

puts "Starting the server..."

Thread.start(server.serve()) do
  puts 'New connection...'
end

puts "Done"