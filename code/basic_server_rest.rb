# This code runs a server that tries to be RESTful

require 'uri'
require 'socket'
require 'logger'

logger=Logger.new(STDOUT)

server = TCPServer.new 3000 # Server bound to port 3000, just like Rails

loop do
  incoming = server.accept
  line = incoming.gets
  line=line.chomp

  logger.info("Received mesg #{line} - assuming #{line} is a RESTful path")

  # We'll assume that the mesg is in the form "/<resourcename>/<resource-ID>"
  path_components = line.split "/"
  if line.length > 1
    resource_name = path_components[1]
  end

  if line.length > 2
    resource_id = path_components[2]
  end

  incoming.puts "Returning resource named #{resource_name} with ID #{resource_id}"
  incoming.close
end
