require 'sqlite3'

if File.exists?('test.db') then
  dbh=SQLite3::Database.open('test.db')
else
  # All the init code goes in here.
  dbh=SQLite3::Database.new('test.db')
  dbh.execute("create table articles (id integer, title string, body string)")
  dbh.execute("insert into articles (id, title, body) values (1, 'title1', 'body1')")
  dbh.execute("insert into articles (id, title, body) values (2, 'title2', 'body1')")
  dbh.execute("insert into articles (id, title, body) values (3, 'title3', 'body1')")
  dbh.execute("insert into articles (id, title, body) values (4, 'title4', 'body1')")
end

rows = dbh.execute("select * from articles")
rows.each do |row|
  puts row
end
