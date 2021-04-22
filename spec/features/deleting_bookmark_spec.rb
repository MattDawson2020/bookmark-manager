feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.new_bookmark(title: 'Test article', url: 'http://testarticle.com')
    visit '/bookmarks'
    expect(page).to have_link('Test article', href: 'http://testarticle.com')

    first('.bookmark').click_button('Delete')

    expect(page).not_to have_content('ditty')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test article', href: 'http://testarticle.com')
  end
end