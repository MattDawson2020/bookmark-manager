require 'comment'
require 'bookmark'

describe Bookmark do
  context '.create' do
    it 'can create a new comment' do
      bookmark = Bookmark.new_bookmark(title: 'Google', url: 'http://www.google.com')
      comment = Comment.create(bookmark_id: bookmark.id, text: 'This is a test comment')

      expect(comment.text).to eq('This is a test comment')
      expect(comment.bookmark_id).to eq(bookmark.id)
    end
  end


  context '.show' do
    it 'can show comments from the database' do
      bookmark = Bookmark.new_bookmark(title: 'Google', url: 'http://www.google.com')
      comment = Comment.create(bookmark_id: bookmark.id, text: 'This is a test comment')
      comment_2 = Comment.create(bookmark_id: bookmark.id, text: 'Suprise!')

      comments = Comment.show(bookmark_id: bookmark.id)

      expect(comments.size).to be(2)
      expect(comment.text). to eq 'This is a test comment'
      expect(comment_2.text). to eq 'Suprise!'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end