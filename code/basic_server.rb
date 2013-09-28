# This code runs a basic server that listens in at a given socket and responds with a simple mesage

require 'socket'
require 'logger'

logger=Logger.new(STDOUT)

server = TCPServer.new 3000 # Server bound to port 3000, just like Rails

loop do
  incoming = server.accept
  line = client.gets
  logger.info("Received mesg #{line}")

  incoming.write "Happy #{Time.now}!"

  logger.info("Sent mesg #{Time.now}.")
  incoming.close
end
