feature 'Listing bookmarks' do
  scenario 'we can see our bookmarks index' do
    visit '/'
    click_button('Bookmarks')

    expect(page).to have_content('Your saved bookmarks')
  end

  scenario 'we can see our list' do
    fill_database
    visit '/list'

    expect(page).to have_content('Google')
    expect(page).to have_content('YouTube')
    expect(page).to have_content('Netflix')
  end
end
