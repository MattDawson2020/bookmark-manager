require 'bookmark'

describe Bookmark do

  context '#all' do
    it 'can list all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark_1 = Bookmark.new_bookmark(title: 'Google', url: 'http://www.google.com')
      bookmark_2 = Bookmark.new_bookmark(title: 'Netflix', url: 'http://www.netflix.com')
      
      bookmark_list = Bookmark.all

      expect(bookmark_list.first.id).to eq bookmark_1.id
      expect(bookmark_list.last.id).to eq bookmark_2.id
      expect(bookmark_list.first.title).to eq bookmark_1.title
      expect(bookmark_list.last.title).to eq bookmark_2.title
      expect(bookmark_list.first.url).to eq bookmark_1.url
      expect(bookmark_list.last.url).to eq bookmark_2.url
    end
  end

  context '.new_bookmark' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.new_bookmark(title: 'Google', url: 'http://www.google.com')

      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://www.google.com'
      expect(bookmark.id).not_to be_nil
      expect(bookmark).to be_instance_of Bookmark
    end
  end
end
