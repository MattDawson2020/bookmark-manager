feature 'Validating a bookmark' do
  scenario 'the program prevents invalid urls being added' do
    visit '/'
    click_button('Create new bookmark')
    fill_in('bookmark_url', with: 'lolwut')
    fill_in('title', with: 'This should fail')
    click_button('Submit')

    expect(page).not_to have_content('error')
    expect(page).not_to have_link('This should fail', href: 'lolwut')
    expect(page).to have_content("Invalid url")
  end

  scenario 'it allows valid urls to be added' do
    visit '/'
    click_button('Create new bookmark')
    fill_in('bookmark_url', with: 'http://www.google.com')
    fill_in('title', with: 'Google')
    click_button('Submit')

    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end