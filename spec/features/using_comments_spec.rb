feature 'Using comments' do
  scenario 'a user can add a comment and then see it' do
    bookmark = Bookmark.new_bookmark(title: 'Test article', url: 'http://testarticle.com')
    visit '/bookmarks'

    first('.bookmark').click_button 'Add comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in('comment', with: "Test comment")
    click_button("Submit")

    expect(current_path).to eq "/bookmarks"
    expect(page).to have_content 'Test comment'
    expect(page).not_to have_content 'error'
  end

  
end