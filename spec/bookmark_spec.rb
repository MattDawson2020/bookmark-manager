require 'bookmark'

describe Bookmark do
  context '#initialize' do
    it 'can store bookmarks' do
      fill_database
      
      expect(subject.bookmarks).to include("http://www.google.com", "http://www.youtube.com", "http://www.netflix.com")
    end
  end

  context '#all' do
    it 'can list all bookmarks' do
      fill_database
      
      expect(Bookmark.all).to include "http://www.google.com"
      expect(Bookmark.all).to include "http://www.youtube.com"
      expect(Bookmark.all).to include "http://www.netflix.com"
    end
  end
end