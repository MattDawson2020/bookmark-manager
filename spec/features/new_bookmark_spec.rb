feature 'creating bookmarks' do
  scenario 'we can add bookmarks to the database' do
    visit '/'
    click_button('Create new bookmark')

    fill_in('bookmark_url', with: 'http://makersacademy.com')
    click_button('Submit')

    expect(page).to have_content('http://makersacademy.com')
  end

  scenario 'we can create bookmark using the bookmark method' do
    visit '/'
    Bookmark.new_bookmark('http://amazon.com')
    visit '/list'

    expect(page).not_to have_content('error')
    expect(page).to have_content(('http://amazon.com'))
  end
end
