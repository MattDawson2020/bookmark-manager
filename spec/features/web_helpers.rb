def fill_database  ####
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("INSERT INTO bookmarks (title, url) VALUES('Netflix', 'http://www.netflix.com');")
  connection.exec("INSERT INTO bookmarks (title, url) VALUES('YouTube', 'http://www.youtube.com');")
  connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")
    
  bookmarks = Bookmark.all
end

def set_test_article
  Bookmark.new_bookmark(title: 'Test article', url: 'http://testarticle.com')
end