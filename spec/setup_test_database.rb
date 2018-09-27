require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'test_bookmark_manager')

  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
end
