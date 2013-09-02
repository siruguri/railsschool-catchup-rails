# This code runs a server that tries to be RESTful

require 'uri'
require 'socket'
require 'logger'
require 'sqlite3'

logger=Logger.new(STDOUT)

server = TCPServer.new 3000 # Server bound to port 3000, just like Rails

# We'll assume this database exists
dbh=SQLite3::Database.open('test.db')
dbh.results_as_hash=true

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

  if line.length > 3
    action = path_components[3]
  end

  incoming.puts "Trying action #{action} on resource named #{resource_name} with ID #{resource_id}"

  begin
    rows=dbh.execute("select * from #{resource_name} where id=?", resource_id.to_i)
  rescue SQLite3::Exception => e
    logger.error("Oops, database error <#{e.message}>")
    incoming.puts("No resource found")
  else
    logger.info("Found resource in database")

# Fix this so we can't ask for a resource ID that doesn't exist
    rows.each do |row|
      incoming.puts("Title: #{row['title']}; Body: #{row['body']}")
    end
  end

  incoming.close
end
