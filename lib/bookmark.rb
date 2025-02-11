require_relative 'database_connection'
require_relative 'comment'
require 'uri'

class Bookmark
  attr_reader :id, :title, :url
  
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def comments(comment = Comment)
    comment.show(bookmark_id: id)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.new_bookmark(title:, url:)
    return false unless valid_url?(url)

    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete_bookmark(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks where ID = '#{id}';")
  end

  def self.edit_bookmark(id:, title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec( "UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private 

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp}\z/
  end
end
