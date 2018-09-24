feature 'shows the list of bookmarks' do
  scenario 'shows available collection' do
    visit('/bookmarks')
    expect(page).to have_content("Bookmarks")
  end
end
