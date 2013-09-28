require 'socket'

# This client will talk to a server at this location - localhost:3000
hostname = 'localhost'
port = 3000 # Just like Rails :)

s = TCPSocket.open(hostname, port)
s.puts "hello world!"

while line = s.gets   # Read lines from the socket
  puts line
end

s.close               # Close the socket when done
