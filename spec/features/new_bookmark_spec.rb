feature 'creating bookmarks' do
  scenario 'we can add bookmarks to the database' do
    visit '/'
    click_button('Create new bookmark')

    fill_in('bookmark_url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    click_button('Submit')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end

