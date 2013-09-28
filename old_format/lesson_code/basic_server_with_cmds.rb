# This code runs a slightly advanced server that listens in at a given socket and returns
# the size of a file with the given name

require 'socket'
require 'logger'

logger=Logger.new(STDOUT)

server = TCPServer.new 3000 # Server bound to port 3000, just like Rails

loop do
  incoming = server.accept
  line = incoming.gets
  line=line.chomp

  logger.info("Received mesg #{line} - assuming #{line} is a file...")

  if File.exists? line
    logger.info("Found file!")
    incoming.puts File.size? line
  else
    logger.info("Didn't find file!")
    incoming.puts -1
  end

  incoming.close
end
