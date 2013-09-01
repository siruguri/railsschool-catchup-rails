require 'socket'

hostname = 'localhost'
port = 3000 # Just like Rails :)

s = TCPSocket.open(hostname, port)
s.puts('a.txt')

# Use a command line argument instead of a hard-coded value

# Use a format like '/<filename>' and make it work

while line = s.gets   # Read lines from the socket
  puts line
end

s.close               # Close the socket when done
