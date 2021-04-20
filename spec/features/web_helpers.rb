def fill_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.netflix.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.youtube.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    
  bookmarks = Bookmark.all
end