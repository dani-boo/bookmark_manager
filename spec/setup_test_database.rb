require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: "bookmark_manager_test")

# Clear table 
connection.exec("TRUNCATE bookmarks;")