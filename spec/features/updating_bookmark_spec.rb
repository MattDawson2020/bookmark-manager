feature 'Updating a bookmark' do
  scenario 'A user can update' do
    bookmark = Bookmark.new_bookmark(title: 'Test article', url: 'http://testarticle.com')
    visit '/bookmarks'
    expect(page).to have_link('Test article', href: 'http://testarticle.com')

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('url', with: 'http://SecondTestArticle.com')
    fill_in('title', with: 'Second test article')
    click_button('Submit')

    expect(page).not_to have_content('ditty')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test article', href: 'http://testarticle.com')
    expect(page).to have_link('Second test article', href: 'http://SecondTestArticle.com')
  end
end