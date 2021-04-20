require 'pg'

class Bookmark
  attr_reader :bookmarks
  
  def initialize
    @bookmarks = Bookmark.all
  end

  def self.all 
    connection = PG.connect(dbname: 'bookmark_manager')
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
