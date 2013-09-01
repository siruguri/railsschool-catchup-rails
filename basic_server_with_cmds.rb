# This code runs a slightly advanced server that listens in at a given socket and returns
# the size of a file with the given name

require 'socket'
require 'logger'

logger=Logger.new(STDOUT)

server = TCPServer.new 3000 # Server bound to port 3000, just like Rails

loop do
  client = server.accept

  cmd=""
  while line = client.gets
    cmd += line
  end

  client.puts("Thanks for your message of #{cmd}")
  logger.info("Sent mesg #{Time.now}.")
  client.close
end
