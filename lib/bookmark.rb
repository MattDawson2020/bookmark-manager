require 'pg'

class Bookmark
  attr_reader :bookmarks
  
  def initialize
    @bookmarks = Bookmark.all
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  # def self.create 
  #   @bookmark = Bookmark.new
  # end

  # def self.instance
  #   @bookmark
  # end

end
